import 'package:flutter/material.dart';

import 'count_bloc_copy.dart';
import 'count_bloc.dart';

//BlocProvider状态管理器
class BlocProvider extends InheritedWidget { 
  final CountBLoC bLoC = CountBLoC();
  final CountBLocCopy bLocCopy = CountBLocCopy();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static dynamic blocContextProvider(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider);
  }

  //构建CountBLoC状态管理对象
  static CountBLoC of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bLoC;

       //构建CountBLoCope状态管理对象
  static CountBLocCopy ofCope(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bLocCopy;

  static CountBLoC ofTest(BuildContext context){
    return blocContextProvider(context).bLoC;
  }
}
