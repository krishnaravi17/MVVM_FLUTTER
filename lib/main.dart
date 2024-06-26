// main.dart
import 'package:flutter/material.dart';
import 'package:mvvm_flutter_demo/view/userlistview.dart';
import 'package:provider/provider.dart';

import 'viewmodels/user_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: MaterialApp(
        title: 'MVVM Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: UserListView(),
      ),
    );
  }
}
