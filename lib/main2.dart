import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Online Course';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  @override
  Course cloud =
      Course(course: 'Cloud Computing', courseClass: '7', lecturer: 'Rosalita');
  Course career =
      Course(course: 'Career Development', courseClass: '7', lecturer: 'Nanda');

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFFFFF),
              ),
              child: Text('Classroom'),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 35,
              child: Image.network(
                  'https://cdn.pixabay.com/photo/2019/08/11/18/59/icon-4399701_960_720.png'),
            ),
          ),
          Icon(Icons.more_vert),
        ],
        title: Text(
          'Google Classroom',
          style:
              TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.w400),
        ),
        iconTheme: IconThemeData(color: Color(0xFF000000)),
      ),

      //INI BODY
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              height: 200,
              width: 1500,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cloud.getCourse(),
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      cloud.getCourseClass(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                Text(
                                  cloud.getLecturer(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20, fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ))),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xFFFF9100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),

            //Next Container
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              height: 200,
              width: 1500,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      career.getCourse(),
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      career.getCourseClass(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                Text(
                                  career.getLecturer(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20, fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ))),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xFF42A5F5),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        child: const Icon(Icons.add),
      ),
    ));
  }
}
