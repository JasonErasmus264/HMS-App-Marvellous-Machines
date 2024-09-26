import pool from '../db.js';  // Database connection
import XLSX from 'xlsx';
import  {parse}  from 'json2csv';  
//import { feedbackLogger } from '../logger.js'; // import feedback logger


// Add feedback
export const addFeedback = async (req, res) => {
  const { submissionID, userID, comment, mark } = req.body;

  // Ensure all required fields are provided
  if (!submissionID || !comment || mark === undefined) {
    return res.status(400).json({ message: 'Submission ID, comment, and mark are required' });
  }

  try {
    const result = await pool.execute(
      'INSERT INTO feedback (submissionID, userID, comment, mark) VALUES (?, ?, ?, ?)',
      [submissionID, userID || null, comment, mark]
    );

    res.status(201).json({ message: 'Feedback added successfully', feedbackID: result[0].insertId });
  } catch (error) {
    console.error('Error adding feedback:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

// Update feedback
export const updateFeedback = async (req, res) => {
  const { feedbackID } = req.params;
  const { comment, mark } = req.body;

  // Ensure both fields are provided
  if (!comment || mark === undefined) {
    return res.status(400).json({ message: 'Comment and mark are required' });
  }

  try {
    const [result] = await pool.execute(
      'UPDATE feedback SET comment = ?, mark = ? WHERE feedbackID = ?',
      [comment, mark, feedbackID]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Feedback not found' });
    }

    res.status(200).json({ message: 'Feedback updated successfully' });
  } catch (error) {
    console.error('Error updating feedback:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

// Delete feedback
export const deleteFeedback = async (req, res) => {
  const { feedbackID } = req.params;

  try {
    const [result] = await pool.execute(
      'DELETE FROM feedback WHERE feedbackID = ?',
      [feedbackID]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Feedback not found' });
    }

    res.status(200).json({ message: 'Feedback deleted successfully' });
  } catch (error) {
    console.error('Error deleting feedback:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
};









// Get student marks based on moduleID and student userID
export const getStudentMarksByUserAndModule = async (req, res) => {
  const { moduleID, userID } = req.params;  // Extract moduleID (for the module) and userID (for the student)

  try {
    // Query to get assignment name, student mark, comment, and total marks
    const [rows] = await pool.query(
      `SELECT 
         a.assignName,
         f.mark,
         f.comment,
         a.assignTotalMarks
       FROM 
         submission s
       INNER JOIN 
         feedback f ON s.submissionID = f.submissionID
       INNER JOIN 
         assignment a ON s.assignmentID = a.assignmentID
       WHERE 
         a.moduleID = ?
         AND s.userID = ?`,
      [moduleID, userID]
    );

    // If no data is found
    if (rows.length === 0) {
      return res.status(404).json({ message: 'No marks found for the specified moduleID and userID' });
    }

    // Map over the results and format the output
    const feedback = rows.map(row => {
      const percentage = ((row.mark / row.assignTotalMarks) * 100).toFixed(2);  // Calculate percentage
      return {
        assignName: row.assignName,
        markFormatted: `${row.mark}/${row.assignTotalMarks} (${percentage}%)`,  // Format mark/total and percentage
        comment: row.comment
      };
    });

    // Return the formatted data under the "feedback" key
    res.status(200).json({ feedback });

  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error fetching marks', error });
  }
};









export const downloadMarks = async (req, res) => {
  const { assignmentID, format } = req.params; // Get assignmentID and format (xlsx or csv)

  try {
    // SQL query to fetch student data for the specific assignment
    const [rows] = await pool.query(
      `SELECT 
          u.firstName AS StudentFirstName,
          u.lastName AS StudentLastName,
          u.username AS StudentUsername,
          f.comment AS FeedbackComment,
          f.mark AS Mark,
          a.assignTotalMarks AS TotalMarks,
          ROUND((f.mark / a.assignTotalMarks) * 100, 2) AS PercentageMark
      FROM 
          submission s
      JOIN 
          feedback f ON s.submissionID = f.submissionID
      JOIN 
          users u ON s.userID = u.userID
      JOIN 
          assignment a ON s.assignmentID = a.assignmentID
      WHERE 
          a.assignmentID = ?;`,
      [assignmentID]
    );

    // Check if no data is returned
    if (rows.length === 0) {
      return res.status(404).json({ message: 'No data found for the given assignment.' });

    }

    // Handle XLSX format
    if (format === 'xlsx') {
      const heading = [['First Name', 'Last Name', 'Username', 'Comment', 'Mark', 'Total Marks', 'Percentage']];
      const workbook = XLSX.utils.book_new();
      const worksheet = XLSX.utils.json_to_sheet(rows);
      XLSX.utils.sheet_add_aoa(worksheet, heading, { origin: 'A1' });
      XLSX.utils.book_append_sheet(workbook, worksheet, 'Student Marks');

      // Write the workbook to a buffer
      const buffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'buffer' });

      // Set response headers to download the XLSX file
      res.setHeader('Content-Disposition', 'attachment; filename=student_marks.xlsx');
      res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
      
      return res.send(buffer);
    }

    // Handle CSV format
    else if (format === 'csv') {
      // Define the CSV fields
      const csvFields = ['StudentFirstName', 'StudentLastName', 'StudentUsername', 'FeedbackComment', 'Mark', 'TotalMarks', 'PercentageMark'];
      const csv = parse(rows, { fields: csvFields });

      // Set response headers to download the CSV file
      res.setHeader('Content-Disposition', 'attachment; filename=student_marks.csv');
      res.setHeader('Content-Type', 'text/csv');

      return res.send(csv);
    } 

    // If the format is not supported
    else {
      return res.status(400).json({ message: 'Invalid format specified. Use either "xlsx" or "csv".' });

    }

  } catch (error) {
    console.error('Error exporting marks:', error);
    res.status(500).json({ message: 'Internal Server Error'});
  }
};