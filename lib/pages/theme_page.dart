import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/custom_themes.dart';
import 'package:json_theme/json_theme.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    Key key,
  }) : super(key: key);

  static const _themes = [
    'theme1',
    'theme2',
    'theme3',
  ];

  Future<void> _onThemeSelected(BuildContext context, String themeId) async {
    var themeStr = await rootBundle.loadString('assets/files/$themeId.json');
    var themeJson = json.decode(themeStr);

    var theme = ThemeDecoder.decodeThemeData(themeJson) ?? ThemeData();

    Provider.of<ThemeManager>(context, listen:false)
        .themeData = theme;

    Navigator.pushNamed(context, MyRoutes.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Theme'),
      ),
      body: ListView.builder(
        itemCount: _themes.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(_themes[index]),
          onTap: () => _onThemeSelected(context, _themes[index]),
        ),
      ),
    );
  }
