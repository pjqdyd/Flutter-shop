import 'package:flutter/material.dart';
import 'count_bloc.dart';

//BlocProvider状态管理器
class BlocProvider extends InheritedWidget { 
  final CountBLoC bLoC = CountBLoC();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  //构建CountBLoC状态管理对象
  static CountBLoC of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bLoC;
}
