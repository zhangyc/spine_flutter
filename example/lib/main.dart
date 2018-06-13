import 'package:flutter/material.dart';
import 'package:spine_core/spine_core.dart' as core;
import 'package:spine_flutter/spine_flutter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: 'Flutter + Spine'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AnimationSettings _animationSettings = new AnimationSettings(0, 'walk', true);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(title: new Text(widget.title)),
        body: new Stack(children: <Widget>[
          new Positioned.fill(
              child: SkeletonRenderObjectWidget(
            animationSettings: _animationSettings,
            alignment: Alignment.center,
            fit: BoxFit.contain,
            onCompleteCallback: (core.TrackEntry trackEntry) {
              setState(() {
                _animationSettings = new AnimationSettings(0, 'walk', true);
              });
            },
          )),
          new Positioned.fill(
              child: new Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  margin: const EdgeInsets.all(5.0),
                  child: new FlatButton(
                      child: Text('Jump'),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          _animationSettings =
                              new AnimationSettings(0, 'jump', false);
                        });
                      })),
              new Container(
                  margin: const EdgeInsets.all(5.0),
                  child: new FlatButton(
                      child: new Text('Shoot'),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          _animationSettings =
                              new AnimationSettings(0, 'shoot', false);
                        });
                      })),
              new Container(
                  margin: const EdgeInsets.all(5.0),
                  child: new FlatButton(
                      child: new Text('Death'),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          _animationSettings =
                              new AnimationSettings(0, 'death', false);
                        });
                      })),
            ],
          ))
        ]));
  }

  // AssetManager _assetManager() {
  //   return new AssetManager(pathPrefix: 'assets/raptor/')
  //     ..add('raptor.png', new TextureLoader())
  //     ..add('raptor.atlas', new TextLoader())
  //     ..add('raptor.json', new JsonLoader());
  // }
}
