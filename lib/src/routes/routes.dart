import 'package:flutter/material.dart';
import 'package:multiwidgets/src/pages/animated_container.dart';

import 'package:multiwidgets/src/pages/card_page.dart';
import 'package:multiwidgets/src/pages/alert_page.dart';
import 'package:multiwidgets/src/pages/avatar_page.dart';
import 'package:multiwidgets/src/pages/home_page.dart';
import 'package:multiwidgets/src/pages/input_page.dart';
import 'package:multiwidgets/src/pages/slider_page.dart';
import 'package:multiwidgets/src/pages/listview_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'input': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListViewPage(),
  };
}
