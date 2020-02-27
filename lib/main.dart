import 'package:flutter/material.dart';

import './screens/formula_list_screen.dart';
import './screens/casting_module_screen.dart';
import './screens/casting_weight_screen.dart';
import './screens/pouring_time_screen.dart';
import './screens/choke_area_screen.dart';
import './screens/sprue_diameter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        canvasColor: Color(0xfff9f9f9),
        fontFamily: 'Nunito',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoSlab',
                  fontWeight: FontWeight.bold,
                  color: Color(0xfffdecff)),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => FormulaListScreen(),
        CastingModuleScreen.routeName: (ctx) => CastingModuleScreen(),
        CastingWeightScreen.routeName: (ctx) => CastingWeightScreen(),
        PouringTimeScreen.routeName: (ctx) => PouringTimeScreen(),
        ChokeAreaScreen.routeName: (ctx) => ChokeAreaScreen(),
        SprueDiameterScreen.routeName: (ctx) => SprueDiameterScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
