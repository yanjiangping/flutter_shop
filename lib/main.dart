import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/provider/theme_provider.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/routers/routers.dart';
import 'package:flutter_shop/util/log_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'moudles/home/splash_page.dart';

void main() {
  runApp(MyApp());
  // 添加透明的状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {

  MyApp(){
    Log.init();
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (_,provider,child){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: provider.getTheme(),
              darkTheme: provider.getTheme(isDarkMode: true),
              themeMode: provider.getThemeMode(),
              onGenerateRoute: Application.router.generator,
              home: SplashPage(),
            );
          }
          ),
        )
      );
  }
}