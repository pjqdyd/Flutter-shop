import 'package:flutter/material.dart';
import '../../../blocs/bloc_provider.dart';

class Test extends StatelessWidget {
  const Test({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.ofTest(context); //获取状态处理对象

    return Column(
      children: <Widget>[
        StreamBuilder<int>(
          stream: bloc.stream,
          initialData: bloc.value,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text(
              'You hit me: ${snapshot.data} times',
            );
          }),

        FloatingActionButton(
          onPressed: () => bloc.increment(),
          child: Icon(Icons.add),
        ),
        
      ],
    );
  }
}