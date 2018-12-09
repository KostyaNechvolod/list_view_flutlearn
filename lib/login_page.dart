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

  bool _obscureText = true;

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
        title: Text('Flutter Login', style: TextStyle(color: Colors.white,)),
      ),
      backgroundColor: Colors.deepPurpleAccent[100],
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

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  Widget _emailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        filled: true,
          fillColor: Colors.grey[400],
          hintText: 'Email',
          icon: Icon(
            Icons.mail,
            color: Colors.black87,
          )),
      validator: validateEmail,
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
      obscureText: _obscureText,
      autofocus: false,
      decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          filled: true,
          fillColor: Colors.grey[400],
          hintText: 'Password',
          suffixIcon: IconButton(
               icon: Icon(Icons.lightbulb_outline),
              color: Colors.black87,
            onPressed: () {
                 setState(() {
                   _obscureText = !_obscureText;
                 });
                 },
          ),
          icon: Icon(
              Icons.lock,
              color: Colors.black87
          )
      ),
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
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: Text(
            'Sign up',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          onPressed: () {
            formKey.currentState.validate();
          },
        ),
      );
    }
  }

  Widget _label() {
    if (_formMode == FormMode.SIGNIN) {
      return FlatButton(
        child: Text('Don\'t have an account? Sign up',
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
