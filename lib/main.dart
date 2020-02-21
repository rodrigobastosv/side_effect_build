import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('YOU ARE ON PAGE'),
              SizedBox(height: 12),
              RaisedButton(
                onPressed: () => Navigator.of(context).push(
                  (MaterialPageRoute(
                    builder: (_) => Page(),
                  )),
                ),
                child: Text('Go to Another Page'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with AfterLayoutMixin<Page> {
  @override
  void afterFirstLayout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        title: Center(child: Text('I\'m happy!!!')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (_) => SimpleDialog(
          title: Center(child: Text('I\'m happy!!!')),
        ),
      );
    });*/
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('YOU ARE ON PAGE 2'),
              RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => SimpleDialog(
                      title: Center(child: Text('I\'m happy!!!')),
                    ),
                  );
                },
                child: Text('SHOW DIALOD'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
