enum AppRoutes { homeScreen, detailScreen }

extension AppRoutesExtension on AppRoutes {
  String get name {
    switch (this) {
      case AppRoutes.homeScreen:
        return '/';
      case AppRoutes.detailScreen:
        return '/detail';
      default:
        return '';
    }
  }
}
