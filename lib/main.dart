import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(title: 'Flutter Sign-Up'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  String dropdownvalue = 'Male';
  final _formKey = GlobalKey<FormState>();
  var currentSelectedValue;

  var items = ['Male', 'Female', 'Others'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Image.network(
              'https://otsukai.com/public/item/41345/5f3e27993c0ce.png',
              height: 200,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter your username'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (value.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Please enter a valid email!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter your email'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'passsword',
                    hintText: 'Enter your password'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: DropdownButtonFormField<String>(
                validator: (value) =>
                    value == null ? 'Please select your gender' : null,
                isExpanded: true,
                hint: Text("Select your gender"),
                value: currentSelectedValue,
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                items: items.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    currentSelectedValue = newValue;
                  });
                },
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Signed Up and Welcome Aboard !'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                          ),
                        ));
                      }
                    },
                    child: Text('Sign Up')))
          ],
        ),
      ),
    );
  }
}
