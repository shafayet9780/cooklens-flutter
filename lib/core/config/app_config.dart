import 'package:flutter/foundation.dart';

enum Environment { dev, staging, prod }

@immutable
class AppConfig {
  final Environment environment;
  final String apiBaseUrl;
  final String apiKey;
  final Duration timeoutDuration;
  final bool enableAnalytics;
  final int maxCacheAge;
  final String deepLinkScheme;

  const AppConfig._({
    required this.environment,
    required this.apiBaseUrl,
    required this.apiKey,
    this.timeoutDuration = const Duration(seconds: 30),
    this.enableAnalytics = false,
    this.maxCacheAge = 7, // days
    this.deepLinkScheme = 'cooklens',
  });

  static late final AppConfig _instance;

  static AppConfig get instance => _instance;

  static Future<void> initialize(Environment env) async {
    _instance = await _ConfigFactory.create(env);
  }

  bool get isDevelopment => environment == Environment.dev;
  bool get isProduction => environment == Environment.prod;
  bool get isStaging => environment == Environment.staging;
}

class _ConfigFactory {
  static Future<AppConfig> create(Environment env) async {
    switch (env) {
      case Environment.prod:
        return const AppConfig._(
          environment: Environment.prod,
          apiBaseUrl: 'https://api.cooklens.com',
          apiKey: String.fromEnvironment('PROD_API_KEY'),
          enableAnalytics: true,
        );
      case Environment.staging:
        return const AppConfig._(
          environment: Environment.staging,
          apiBaseUrl: 'https://staging-api.cooklens.com',
          apiKey: String.fromEnvironment('STAGING_API_KEY'),
          enableAnalytics: true,
        );
      case Environment.dev:
        return const AppConfig._(
          environment: Environment.dev,
          apiBaseUrl: 'https://dev-api.cooklens.com',
          apiKey: String.fromEnvironment('DEV_API_KEY'),
          timeoutDuration: Duration(seconds: 60),
        );
    }
  }
}
