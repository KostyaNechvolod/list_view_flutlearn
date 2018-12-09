import 'package:flutter/material.dart';

import 'list_view_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum FormMode { SIGNIN, SIGNUP }

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  FormMode _formMode = FormMode.SIGNIN;

  final formKey = new GlobalKey<FormState>();

  void _signUp() {
    formKey.currentState.reset();
    setState(() {
      _formMode = FormMode.SIGNIN;
    });
  }

  void _signIn() {
    formKey.currentState.reset();
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Form(
            key: formKey,
            child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _sizedBox(50.0),
            _logo(),
            _sizedBox(100.0),
            _emailInput(),
            _sizedBox(15.0),
            _passwordInput(),
            _sizedBox(30.0),
            _submitButton(),
            _label()
          ],
        )),
      ),
    );
  }

  Widget _logo() {
    return Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/flutter-icon.png'),
      ),
    );
  }

  Widget _sizedBox(_height) {
    return SizedBox(height: _height);
  }

  Widget _emailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Email',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      onSaved: (value) => _email = value,
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      validator: (value){
        if(value.isEmpty) {
          return 'Password can\'t be empty';
        }
      },
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Password', icon: Icon(Icons.lock, color: Colors.grey)),
      //validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (value) => _password = value,
    );
  }

  Widget _submitButton() {
    if (_formMode == FormMode.SIGNIN) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: Text('Login',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          onPressed: () {
            if (formKey.currentState.validate()) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewScreen()));
            }
          }
        ),
//        child: Material(
//          borderRadius: BorderRadius.circular(30.0),
//          shadowColor: Colors.blueAccent.shade100,
//          elevation: 5.0,
//          child: MaterialButton(
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(30.0),
//            ),
//            minWidth: 200.0,
//            height: 42.0,
//            color: Colors.blue,
//            child: Text(
//              'Login',
//              style: TextStyle(fontSize: 20.0, color: Colors.white),
//            ),
//            onPressed: () {
//              formKey.currentState.validate();
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => ListViewScreen()));},
//          ),
//        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: Text(
            ' Don\'t have an account? Sign up',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          onPressed: () {
            formKey.currentState.validate();
          },
        ),
//        child: Material(
//          borderRadius: BorderRadius.circular(30.0),
//          shadowColor: Colors.blueAccent.shade100,
//          elevation: 5.0,
//          child: MaterialButton(
//            minWidth: 200.0,
//            height: 42.0,
//            color: Colors.blue,
//            child: Text(
//              ' Don\'t have an account? Sign up',
//              style: TextStyle(fontSize: 20.0, color: Colors.white),
//            ),
//            onPressed: () {
//              formKey.currentState.validate();
//            },
//          ),
//        ),
      );
    }
  }

  Widget _label() {
    if (_formMode == FormMode.SIGNIN) {
      return FlatButton(
        child: Text('Create an account',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: _signIn,
      );
    } else {
      return FlatButton(
        child: Text('Have an account? Sign in',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: _signUp,
      );
    }
  }
}
