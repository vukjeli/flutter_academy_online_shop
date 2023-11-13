import 'package:flutter/cupertino.dart';

import '../../auth/auth.dart';
import '../screens/login_screen.dart';
import '../screens/shop_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key }) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTree();
}

class _WidgetTree extends State<WidgetTree> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: Auth().authStateChanges, builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ShopScreen();
      }
      else {
        return const LoginScreen();
      }
    });
  }
}