// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:bora_rachar/components/quota_calc.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


void main() => runApp(
    EasyLocalization(child: MyApp(),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('pt', 'BR')],
        path: 'resorces/langs',
    saveLocale: true,)
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'title'.tr().toString(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          title: Text('title'.tr().toString()),
        ),

        body: Center(
          child: QuotaCalc(),
        ),

      ),
    );

  }
}
