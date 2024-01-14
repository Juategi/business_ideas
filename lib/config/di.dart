import 'package:business_ideas/repositories/locale_repository.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  static setup() {
    final getIt = GetIt.instance;
    getIt.registerSingleton<LocaleRepository>(LocaleRepository());
  }
}
