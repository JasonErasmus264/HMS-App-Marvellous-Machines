import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'add_user_model.dart';
export 'add_user_model.dart';

class AddUserWidget extends StatefulWidget {
  const AddUserWidget({super.key});

  @override
  State<AddUserWidget> createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  late AddUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddUserModel());

    _model.txtFirstNameTextController ??= TextEditingController();
    _model.txtFirstNameFocusNode ??= FocusNode();
    _model.txtFirstNameFocusNode!.addListener(() => safeSetState(() {}));
    _model.txtLastNameTextController ??= TextEditingController();
    _model.txtLastNameFocusNode ??= FocusNode();
    _model.txtLastNameFocusNode!.addListener(() => safeSetState(() {}));
    _model.txtPhoneNumTextController ??= TextEditingController();
    _model.txtPhoneNumFocusNode ??= FocusNode();
    _model.txtPhoneNumFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Add User',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).info,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 800.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Please fill in the information below.',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.txtFirstNameTextController,
                                      focusNode: _model.txtFirstNameFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'First Name',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              letterSpacing: 0.0,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                16.0, 20.0, 16.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: _model
                                          .txtFirstNameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.txtLastNameTextController,
                                      focusNode: _model.txtLastNameFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Last Name',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              letterSpacing: 0.0,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                16.0, 20.0, 16.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: _model
                                          .txtLastNameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.txtPhoneNumTextController,
                                      focusNode: _model.txtPhoneNumFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Phone Number',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              letterSpacing: 0.0,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                16.0, 20.0, 16.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      keyboardType: TextInputType.number,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: _model
                                          .txtPhoneNumTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(null),
                                      options: const ['Student', 'Lecturer', 'Admin'],
                                      onChanged: (val) => safeSetState(
                                          () => _model.dropDownValue = val),
                                      width: double.infinity,
                                      height: 60.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      hintText: 'Select a user type...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 12.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 4.0, 8.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                              .divide(const SizedBox(height: 12.0))
                              .addToEnd(const SizedBox(height: 32.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 500.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          if (_model.dropDownValue == null) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text('Select a user type'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            return;
                          }
                          _model.apiResult =
                              await AdminGroup.createUserCall.call(
                            firstName: _model.txtFirstNameTextController.text,
                            lastName: _model.txtLastNameTextController.text,
                            phoneNum: _model.txtPhoneNumTextController.text,
                            userType: _model.dropDownValue,
                            token: currentAuthenticationToken,
                          );

                          if ((_model.apiResult?.succeeded ?? true)) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Success'),
                                  content: Text(
                                      AdminGroup.createUserCall.errorMessage(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  )!),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            context.safePop();
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: Text(
                                      AdminGroup.createUserCall.errorMessage(
                                    (_model.apiResult?.jsonBody ?? ''),
                                  )!),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          safeSetState(() {});
                        },
                        text: 'Submit',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
