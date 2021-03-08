import 'package:flutter/material.dart';
import 'package:flutter_app_views/image.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_screenutil/screenutil_init.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      allowFontScaling: false,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    _background(context),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(200)),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image.icon),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

Widget _background(context) {
  return Container(
    margin: EdgeInsets.fromLTRB(
        ScreenUtil().setHeight(20), 0,  ScreenUtil().setHeight(20),0),
    height: ScreenUtil().setHeight(200),
    width: ScreenUtil().setWidth(450),
    decoration: new BoxDecoration(
      color: Color(0x80000000),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(30), 0, 0),
        ),
        _Text('Title', 23.0),
        _Text('This is a long description with max 2 lines.', 23.0),
        _Button(context),
      ],
    ),
  );
}

Widget _Text(txt, sizes) {
  return Expanded(
    flex: 1,
    child: Container(
        margin: EdgeInsets.fromLTRB(
            ScreenUtil().setHeight(30), 0,  ScreenUtil().setHeight(30),0),
        child: Center(
      child: Text(
        txt,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: sizes,
          color: Colors.white,
        ),
      ),
    )),
  );
}

Widget _Button(context) {
  return Container(
    margin: EdgeInsets.fromLTRB(
        0, ScreenUtil().setHeight(20), 0, ScreenUtil().setHeight(20)),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width / 7, 0, 0, 0),
          child: RaisedButton(
            child: Text("Button 1"),
            onPressed: () {},
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            textColor: Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
              0, 0, MediaQuery.of(context).size.width / 7, 0),
          child: RaisedButton(
            child: Text("Button 2"),
            onPressed: () {},
            color: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            textColor: Colors.white,
          ),
        ),
      ],
    ),
  );
}
