import 'package:api/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'home.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _isHidden = false;
  bool _useInvalid = false;
  bool _passInvalid = false;
  var _usernameError = "Mã sinh viên không hợp lệ";
  var _passwordError = "Mật khẩu không hợp lệ";
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: 90,
                  height: 90,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image(
                    image: AssetImage("assets/images/phenikaaLogo.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  "Welcome Phenikaa!!!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Mã Sinh Viên",
                    errorText: _useInvalid ? _usernameError : null,
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                   keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    TextField(
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      controller: _passwordController,
                      obscureText: !_isHidden,
                      decoration: InputDecoration(
                        
                        errorText: _passInvalid ? _passwordError : null,
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    GestureDetector(
                      onTap: onShowHide,
                      child: Text(
                        _isHidden ? "HIDE" : "SHOW",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    onPressed: onSignIn,
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  void onShowHide() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void onSignIn() {
    setState(() {
      if (double.tryParse(_usernameController.text) == null &&
          _usernameController.text.length == 8 ) {
        _useInvalid = true;
      } else {
        _useInvalid = false;
      }

      if (_passwordController.text.length < 6) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }
      if (!_useInvalid && !_passInvalid) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => home( MSV: _usernameController.text,)),
        );
      }
    });
  }
}
