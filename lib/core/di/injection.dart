import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  await _initializeCore();
  await _initializeExternal();
  await _initializeRepositories();
  await _initializeBlocs();
}

Future<void> _initializeCore() async {
  // Core services initialization
}

Future<void> _initializeExternal() async {
  // Third-party services initialization
}

Future<void> _initializeRepositories() async {
  // Repository initialization
}

Future<void> _initializeBlocs() async {
  // BLoC initialization
}