import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('icon.png'),
            fit: BoxFit.cover,
          ),
          gradient: UniversalPlatform.isAndroid
              ? LinearGradient(
                  colors: [Colors.blue, Color.fromARGB(255, 162, 210, 117)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (UniversalPlatform.isWeb)
                  WebLoginForm()
                else if (UniversalPlatform.isAndroid)
                  MobileLoginForm()
                else
                  Text('Unsupported Platform'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WebLoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Web Login',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          CupertinoTextField(
            padding: EdgeInsets.all(12),
            placeholder: 'Email',
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.lightBackgroundGray),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          SizedBox(height: 20),
          CupertinoTextField(
            padding: EdgeInsets.all(12),
            placeholder: 'Password',
            obscureText: true,
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.lightBackgroundGray),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          SizedBox(height: 20),
          CupertinoButton.filled(
            onPressed: () {},
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}

class MobileLoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255,216,95,63), Color.fromARGB(255,216,95,63)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Mobile Login',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 2, 2, 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.lock),
                SizedBox(width: 8),
                Text('Login', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
