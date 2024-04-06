import 'package:flutter/foundation.dart';
import 'package:gespco/src/pages/event_list/events_controller.dart';
import 'package:gespco/src/shared/environment/environment.dart';
import 'package:googleapis/logging/v2.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:logger/logger.dart';

class GoogleCloudLoggingService {
  late LoggingApi _loggingApi;
  bool _isSetup = false;
  final controllerEvent = ControllerEvents();
  final _projectId = Environment.project;

  Future<void> setupLoggingApi() async {
    if (_isSetup) return;
    final json = await controllerEvent.readAccountJson();
    try {
      final credentials = ServiceAccountCredentials.fromJson(
        json,
      );
      final authClient = await clientViaServiceAccount(
        credentials,
        [LoggingApi.loggingWriteScope],
      );
      _loggingApi = LoggingApi(authClient);
      _isSetup = true;
    } catch (error) {
      debugPrint('Error setting up Cloud Logging API $error');
    }
  }

  void writeLog({required Level level, required String message}) {
    if (!_isSetup) {
      // If Logging API is not setup, return
      debugPrint('Cloud Logging API is not setup');
      return;
    }

    // Define environment and log name
    const env = 'dev';
    if (_projectId != "") {}
    final logName =
        'projects/$_projectId/logs/$env'; // It should in the format projects/[PROJECT_ID]/logs/[LOG_ID]

    // Create a monitored resource
    final resource = MonitoredResource()
      ..type =
          'global'; // A global resource type is used for logs that are not associated with a specific resource

    // Map log levels to severity levels
    final severityFromLevel = switch (level) {
      Level.fatal => 'CRITICAL',
      Level.error => 'ERROR',
      Level.warning => 'WARNING',
      Level.info => 'INFO',
      Level.debug => 'DEBUG',
      _ => 'NOTICE',
    };

    // Create a log entry
    final logEntry = LogEntry()
      ..logName = logName
      ..jsonPayload = {'message': message}
      ..resource = resource
      ..severity = severityFromLevel
      ..labels = {
        'project_id': Environment.project,
        'level': level.name.toUpperCase(),
        'environment': env,
      };

    // Create a write log entries request
    final request = WriteLogEntriesRequest()..entries = [logEntry];

    // Write the log entry using the Logging API and handle errors
    _loggingApi.entries.write(request).catchError((error) {
      debugPrint('Error writing log entry $error');
      return WriteLogEntriesResponse();
    });
  }
}
