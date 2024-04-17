import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency/src/config/res/app_sizes.dart';
import 'package:promina_agency/src/config/res/constans_manager.dart';
import 'package:promina_agency/src/core/navigation/Constants/imports_constants.dart';
import 'package:promina_agency/src/core/navigation/Transition/implementation/fade/Option/fade_animation_option.dart';
import 'package:promina_agency/src/core/navigation/named_routes.dart';
import 'package:promina_agency/src/core/navigation/navigator.dart';
import 'package:promina_agency/src/core/navigation/page_router/Implementation/imports_page_router.dart';
import 'package:promina_agency/src/core/navigation/page_router/imports_page_router_builder.dart';
import 'package:promina_agency/src/core/navigation/route_generator.dart';
import 'package:promina_agency/src/core/services/services_locator.dart';
import 'package:promina_agency/src/core/shared/bloc_observer.dart';
import 'package:promina_agency/src/core/shared/route_observer.dart';
import 'package:promina_agency/src/core/widgets/exeption_view.dart';
import 'package:promina_agency/src/core/widgets/offline_widget.dart';
import 'package:promina_agency/src/features/splash/presentation/pages/splash_screen.dart';

import 'src/core/helpers/cache_service.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  CacheStorage.init();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  PageRouterBuilder().initAppRouter(
    config: PlatformConfig(
      android: CustomPageRouterCreator(
        parentTransition: TransitionType.fade,
        parentOptions: const FadeAnimationOptions(
          duration: Duration(milliseconds: 300),
        ),
      ),
    ),
  );
  if (kReleaseMode) {
    ErrorWidget.builder =
        (FlutterErrorDetails details) => const ExceptionView();
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(ScreenSizes.width, ScreenSizes.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ConstantManager.projectName,
          navigatorKey: Go.navigatorKey,
          home: const SplashScreen(),
          // onGenerateRoute: RouterGenerator.getRoute,
          // initialRoute: NamedRoutes.splash.routeName,
          navigatorObservers: [AppNavigationObserver()],
          builder: (context, child) {
            return OfflineWidget(
              child: FlutterEasyLoading(child: child!),
            );
          },
        );
      },
    );
  }
}
