import 'package:flutter/material.dart';
import 'firstpage.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation _iconAnimation;

   final _formKey = GlobalKey<FormState>();

  String validatePass(value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.length < 6) {
      return "Should be more than 6 charactres";
    } else if (value.length > 15) {
      return "Should be less than 15 charactres";
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeInOut);

    _iconAnimation.addListener(() {});
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.amber[200],
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/unnamed.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                    "assets/images/flutter-logo-5086DD11C5-seeklogo.com.png"),
                height: 120.0,
                width: 120.0,
              ),

              //FlutterLogo(
              //size: _iconAnimation.value*100 ,

              Form(
                key: _formKey,
                autovalidate: true,
                child: Theme(
                  data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.amber,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ))),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required*"),
                            EmailValidator(errorText: "Not a Valid Email"),
                          ]),
                          maxLength: 30,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(),
                              labelText: "Enter Email",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          validator: validatePass,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              border: OutlineInputBorder(),
                              labelText: "Enter Password",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("SIGN UP",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))
                          ],
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                        ),
                        new MaterialButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            child: new Text("Login"),
                            splashColor: Colors.greenAccent,
                            onPressed: () {
                            if(_formKey.currentState.validate()){
                               Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => firstscreen()));
                            }
                             
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
