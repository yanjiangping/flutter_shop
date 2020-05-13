import 'package:flutter/material.dart';
import 'package:flutter_shop/moudles/login/login_router.dart';
import 'package:flutter_shop/provider/theme_provider.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import 'package:flutter_shop/util/theme_utils.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>{

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   Provider.of<ThemeProvider>(context, listen: false).syncTheme();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      //color: ThemeUtils.getBackgroundColor(context),
      child: Scaffold(
        appBar: AppBar(),
        body: Text('aaaa'),
        floatingActionButton: FloatingActionButton(
          child: Text('跳转'),
          onPressed: ((){
            NavigatorUtils.push(context, LoginRouter.loginPage, replace: false);
            })),
      ),
    );
  }
}