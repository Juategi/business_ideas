import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/repositories/locale_repository.dart';
import 'package:get_it/get_it.dart';

class Translation {
  static String translateCategory(Category category) {
    LocaleRepository localeRepository = GetIt.I<LocaleRepository>();
    String langCode = localeRepository.getLangCode();
    switch (langCode) {
      case 'es':
        return _translateCategoryToSpanish(category);
      case 'en':
        return _translateCategoryToEnglish(category);
      case 'de':
        return _translateCategoryToGerman(category);
      case 'fr':
        return _translateCategoryToFrench(category);
      default:
        return '';
    }
  }

  static String translateText(String text) {
    LocaleRepository localeRepository = GetIt.I<LocaleRepository>();
    String langCode = localeRepository.getLangCode();
    switch (langCode) {
      case 'es':
        return _translateTextToSpanish(text);
      case 'en':
        return _translateTextToEnglish(text);
      case 'de':
        return _translateTextToGerman(text);
      case 'fr':
        return _translateTextToFrench(text);
      default:
        return '';
    }
  }

  static String _translateTextToSpanish(String text) {
    switch (text) {
      case "favorites":
        return "Favoritos";
      default:
        return '';
    }
  }

  static String _translateTextToEnglish(String text) {
    switch (text) {
      case "favorites":
        return "Favorites";
      default:
        return '';
    }
  }

  static String _translateTextToFrench(String text) {
    switch (text) {
      case "favorites":
        return "Favoris";
      default:
        return '';
    }
  }

  static String _translateTextToGerman(String text) {
    switch (text) {
      case "favorites":
        return "Favoriten";
      default:
        return '';
    }
  }

  static String _translateCategoryToSpanish(Category category) {
    switch (category) {
      case Category.tech:
        return 'Tecnología';
      case Category.webs:
        return 'Sitios web y apps';
      case Category.ecommerce:
        return 'Comercio electrónico';
      case Category.food:
        return 'Comida';
      case Category.health:
        return 'Salud';
      case Category.education:
        return 'Educación';
      case Category.music:
        return 'Música';
      case Category.art:
        return 'Arte';
      case Category.sports:
        return 'Deportes';
      case Category.videogames:
        return 'Videojuegos';
      case Category.ai:
        return 'Inteligencia artificial';
      case Category.vr:
        return 'Realidad virtual';
      case Category.professional:
        return 'Profesional';
      case Category.turism:
        return 'Turismo';
      case Category.fashion:
        return 'Moda';
      case Category.finances:
        return 'Finanzas';
      case Category.environment:
        return 'Medio ambiente';
      case Category.mobility:
        return 'Movilidad';
      case Category.realState:
        return 'Inmobiliaria';
      default:
        return '';
    }
  }

  static String _translateCategoryToEnglish(Category category) {
    switch (category) {
      case Category.tech:
        return 'Technology';
      case Category.webs:
        return 'Websites and apps';
      case Category.ecommerce:
        return 'Ecommerce';
      case Category.food:
        return 'Food';
      case Category.health:
        return 'Health';
      case Category.education:
        return 'Education';
      case Category.music:
        return 'Music';
      case Category.art:
        return 'Art';
      case Category.sports:
        return 'Sports';
      case Category.videogames:
        return 'Videogames';
      case Category.ai:
        return 'Artificial intelligence';
      case Category.vr:
        return 'Virtual reality';
      case Category.professional:
        return 'Professional';
      case Category.turism:
        return 'Turism';
      case Category.fashion:
        return 'Fashion';
      case Category.finances:
        return 'Finances';
      case Category.environment:
        return 'Environment';
      case Category.mobility:
        return 'Mobility';
      case Category.realState:
        return 'Real state';
      default:
        return '';
    }
  }

  static String _translateCategoryToFrench(Category category) {
    switch (category) {
      case Category.tech:
        return 'Technologie';
      case Category.webs:
        return 'Sites web et applications';
      case Category.ecommerce:
        return 'Commerce électronique';
      case Category.food:
        return 'Nourriture';
      case Category.health:
        return 'Santé';
      case Category.education:
        return 'Éducation';
      case Category.music:
        return 'Musique';
      case Category.art:
        return 'Art';
      case Category.sports:
        return 'Sports';
      case Category.videogames:
        return 'Jeux vidéo';
      case Category.ai:
        return 'Intelligence artificielle';
      case Category.vr:
        return 'Réalité virtuelle';
      case Category.professional:
        return 'Professionnel';
      case Category.turism:
        return 'Tourisme';
      case Category.fashion:
        return 'Mode';
      case Category.finances:
        return 'Finances';
      case Category.environment:
        return 'Environnement';
      case Category.mobility:
        return 'Mobilité';
      case Category.realState:
        return 'Immobilier';
      default:
        return '';
    }
  }

  static String _translateCategoryToGerman(Category category) {
    switch (category) {
      case Category.tech:
        return 'Technologie';
      case Category.webs:
        return 'Websites und Apps';
      case Category.ecommerce:
        return 'E-Commerce';
      case Category.food:
        return 'Essen';
      case Category.health:
        return 'Gesundheit';
      case Category.education:
        return 'Bildung';
      case Category.music:
        return 'Musik';
      case Category.art:
        return 'Kunst';
      case Category.sports:
        return 'Sport';
      case Category.videogames:
        return 'Videospiele';
      case Category.ai:
        return 'Künstliche Intelligenz';
      case Category.vr:
        return 'Virtuelle Realität';
      case Category.professional:
        return 'Beruflich';
      case Category.turism:
        return 'Tourismus';
      case Category.fashion:
        return 'Mode';
      case Category.finances:
        return 'Finanzen';
      case Category.environment:
        return 'Umwelt';
      case Category.mobility:
        return 'Mobilität';
      case Category.realState:
        return 'Immobilien';
      default:
        return '';
    }
  }
}
