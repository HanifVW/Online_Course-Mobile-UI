import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'dummy_data.dart';
import 'main2.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Online Course';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
               Container(
                 margin: const EdgeInsets.symmetric(vertical: 180, horizontal: 50),
                 height: 300,
                 width: 400,
                 child:Padding(
                   padding: EdgeInsets.all(20),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text(
                         "User ID : ",
                         style: TextStyle(
                             color: Colors.black, fontSize: 20),

                       ),
                       TextFormField(
                         decoration: const InputDecoration(
                           hintText: "Enter your User ID"
                         ),
                         validator: (String? value){
                           if ( value == null || value.isEmpty ) {
                             return "Please enter your User ID";
                           } return null;
                         },
                       ),
                       //PASSWORD
                       Text("Password : ",
                       style: TextStyle(
                         color: Colors.black, fontSize: 20),
                       ),
                       TextFormField(
                         decoration: const InputDecoration(
                             hintText: "Enter your Password"
                         ),
                         validator: (String? value){
                           if ( value == null || value.isEmpty ) {
                             return "Please enter your Password";
                           } return null;
                         },
                       ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 16.0),
                     child: ElevatedButton(
                       onPressed: () {
                           Navigator.of(context).push(
                           MaterialPageRoute(builder: (_) => PageOne()),
                         );
                         if (_formKey.currentState!.validate()) {
                           // Process data.
                           print("test");
                         }
                         ;
                       }, child:
                         const Text('Submit'),
                       )
                   ),
                     ],
                   ),
                 ),
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.all(Radius.circular(10))),
               )
              ],
            ),
          ),
      ),
    );

  }


}