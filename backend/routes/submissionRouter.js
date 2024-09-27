import express from 'express';
import verifyToken from '../middleware/verifyToken.js';
import { getSubmissionsByAssignment, getNotMarkedSubmissions, getMarkedSubmissions, uploadVideo, updateVideo } from '../controllers/submissionController.js';  // Import the controller function

const submissionRoute = express.Router();

// All routes should check for a valid token
submissionRoute.use(verifyToken);

// Route to get the submissions for a specific student
submissionRoute.get('/v1/assignment/:assignmentID/submissions', getSubmissionsByAssignment);

// Route for getting submissions "To be marked"
submissionRoute.get('/v1/submissions/not-marked/:assignmentID', getNotMarkedSubmissions);

// Route for getting "Marked" submissions
submissionRoute.get('/v1/submissions/marked/:assignmentID', getMarkedSubmissions);

// Add submission
submissionRoute.post('/v1/submissions', uploadVideo);

// Update submission
submissionRoute.put('/v1/submissions', updateVideo);

export default submissionRoute;