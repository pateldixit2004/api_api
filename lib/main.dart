import 'dart:js';

import 'package:api_api/api/provider/productProvider.dart';
import 'package:api_api/api/view/productScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductProvider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context)=>ProductScreen(),
          },
        ),
      ),
    )
  );
}