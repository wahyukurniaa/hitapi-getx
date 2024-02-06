import 'package:get/get.dart';
import 'package:hitapi/app/modules/articles/page/detail_screen.dart';
import 'package:hitapi/app/modules/main/page/main_screen.dart';
import 'package:hitapi/app/routes/app_routes.dart';

class AppRouter {
  static router() {
    return {
      AppRoutes.homeScreen.name: (context) => const MainScreen(),
      AppRoutes.detailScreen.name: (context) => const DetailScreen(),
    };
  }

  static getRouter() {
    return [
      GetPage(
        name: AppRoutes.homeScreen.name,
        page: () => const MainScreen(),
      ),
      GetPage(
        name: AppRoutes.detailScreen.name,
        page: () => const DetailScreen(),
      ),
    ];
  }
}
