import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class LoginData {
  String username = "";
  String password = "";
}

class _MyApp extends State {
  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<
      FormState>(); // GlobalKey – уникальный ключ, который не повторяется нигде в текущем приложении
  //такой ключ используется в качестве поля
  //key у виджета, что необходимо для замены одного виджета другим в дереве
  //виджетов. Если тип (runtimeType) и ключ (key) этих виджетов равны, то новый
  //виджет заменяет старый, обновляя родительский элемент. В противном случае старый элемент удаляется из дерева объектов, а вместо него создается новый и вставляется в дерево
  @override
  Widget build(BuildContext inContext) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50.0),
          child: Form(
            key: this._formKey,
            child: Column(children: [
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String inValue) {
                    if (inValue.length == 0) {
                      return "Please enter username";
                    }
                    return null;
                  },
                  onSaved: (String inValue) {
                    this._loginData.username = inValue;
                  },
                  decoration: InputDecoration(
                      hintText: "none@none.com",
                      labelText: "Username (eMail address)")),
              TextFormField(
                  obscureText: true,
                  validator: (String inValue) {
                    if (inValue.length < 10) {
                      return "Password must be >=10 in length";
                    }
                    return null;
                  },
                  onSaved: (String inValue) {
                    this._loginData.password = inValue;
                  },
                  decoration: InputDecoration(
                      hintText: "Password", labelText: "Password")),
              RaisedButton(
                  child: Text("Log In!"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print("Username: ${_loginData.username}");
                      print("Password: ${_loginData.password}");
                    }
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
