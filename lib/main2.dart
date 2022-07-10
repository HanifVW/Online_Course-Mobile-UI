import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_course/model.dart';
import 'package:online_course/repository.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'data.dart';
import 'dummy_data.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart';
// Future<void> mainMain() async {
//   const apiKey = "de7jh2eqeubp";
//   const userToken = "uprdc9gfhkp83tdgntt7ystdnjtkv2c3gnax2pszpy9tkwwsvw2wxp6p2tbwt8hd";
//
//   final client = StreamChatClient(
//     apiKey,
//     logLevel: Level.INFO,
//   );
//   await client.connectUser(
//       User(
//         id: 'lecturer'
//       ),
//       userToken,);
//
//   final channel = client.channel(
//     'messagin',
//     id: 'student',
//     extraData: {
//       "name": "student"
//     }
//   );
//   channel.watch();
//
//   runApp(const MyApp(client, channel));
// }
Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Online Course';
  // final StreamChatClient client;
  // final Channel channel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: PageOne(),
    );
  }
}

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

class PageOne extends StatefulWidget {
  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  // int _count = 0;

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
        onPressed: () async { await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PageTwo()),
          );
        },
        child: const Icon(Icons.message),
      ),
    ));
  }
}

//PageTWO NEXT PAGE
class PageTwo extends StatefulWidget {

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}
class _StatefulWrapperState extends State<PageTwo> {
late WebViewController controller;

  List<Album> listAlbum = [];
  Repository repository = Repository();
  

  getData() async{
    listAlbum = await repository.getData();
    setState(() {});
  }
@override
  void initState() {
   getData();
    super.initState();
  }
   @override
  Widget build(BuildContext context){
    return Scaffold(
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
              onTap: () async { await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => PageOne()),
                );
              },
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
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
          'Google Classroom Discussion',
          style:
          TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.w400, fontSize:14),
        ),
        iconTheme: IconThemeData(color: Color(0xFF000000)),
      ),

      body:
      // WebView(
      //   javascriptMode: JavascriptMode.unrestricted,
      //   initialUrl:'https://www.facebook.com/' ,
      //   onWebViewCreated: (controller){
      //     this.controller = controller;
      //   },
      //   onPageStarted: (url){
      //     print('New website: $url')
      //   },
      //  ),
      ListView.separated(itemBuilder: (context, index) {
        return Container(child: Text(listAlbum[index].name),);
      }, separatorBuilder: (context, index) {
        return Divider();
      }, itemCount: listAlbum.length)
      );
  }
 
}




