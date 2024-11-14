import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'core/config/app_config.dart';
import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/error_handler.dart';
import 'core/utils/logger.dart';
import 'presentation/pages/home/home_page.dart';

void main() {
  runZonedGuarded(() async {
    Logger.info('Starting application...');

    WidgetsFlutterBinding.ensureInitialized();
    Logger.debug('Flutter bindings initialized');

    // Set preferred orientations
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Logger.debug('Device orientation set');

    // Initialize app configuration
    await AppConfig.initialize(Environment.dev);
    Logger.info('App configuration initialized');

    // Initialize dependencies
    await configureDependencies();
    Logger.info('Dependencies initialized');

    // Run app
    runApp(const CookLensApp());
    Logger.info('App started successfully');
  }, (error, stack) {
    Logger.error(
      'Uncaught error in app',
      error: error,
      stackTrace: stack,
    );
    ErrorHandler.handleError(error, stack);
  });
}

class CookLensApp extends StatelessWidget {
  const CookLensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CookLens',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ErrorBoundary(
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}

class ErrorBoundary extends StatelessWidget {
  final Widget child;

  const ErrorBoundary({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 48,
              ),
              const SizedBox(height: 16),
              Text(
                'Something went wrong',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (kDebugMode) ...[
                const SizedBox(height: 8),
                Text(
                  details.exception.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      );
    };

    return child;
  }
}
