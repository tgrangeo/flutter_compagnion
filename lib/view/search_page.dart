import 'package:flutter/material.dart';
import '../styles.dart' as s;
import 'package:http/http.dart' as http; //request api
import 'package:flutter_dotenv/flutter_dotenv.dart'; //environment variable
import 'dart:convert'; //convert json
import './second.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String? token;
  bool? exist;
  final textController = TextEditingController();
  @override
  void initState() {
    getToken().then((value) => {token = value});
    super.initState();
  }

  Future<String> getToken() async {
    final response =
        await http.post(Uri.parse("https://${dotenv.env['URL']}/oauth/token"), body: {
      "grant_type": "client_credentials",
      "client_id": dotenv.env['UID'],
      "client_secret": dotenv.env['SECRET']
    });
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      String token1 = jsonResponse["access_token"] as String;
     // print(token1);
      return token1;
    } else {
      return '';
    }
  }

  void goToProfile(json) async {
    textController.text = "";
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondRoute(json: json),
      ),
    );
  }

  void _request(String pseudo) async {
    if (pseudo == "") {
      return;
    }
    try {
      final response = await http.get(
          Uri.parse("https://${dotenv.env['URL']}/v2/users/$pseudo"),
          headers: {"Authorization": "Bearer $token"});
      switch (response.statusCode) {
        case 200:
          final dynamic jsonResponse = jsonDecode(response.body);
          goToProfile(jsonResponse);
          return;
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      //print(e);
      setState(() {
        exist = false;
      });
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }
  }

  void _requestButton() async {
    String pseudo = textController.text;
    if (pseudo == "") {
      return;
    }
    try {
      final response = await http.get(
          Uri.parse("https://${dotenv.env['URL']}/v2/users/$pseudo"),
          headers: {"Authorization": "Bearer $token"});
      switch (response.statusCode) {
        case 200:
          final dynamic jsonResponse = json.decode(response.body);
          //print(jsonResponse);
          goToProfile(jsonResponse);
          return;
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      //print(e);
      setState(() {
        exist = false;
      });
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    //double minHeight = AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
      decoration: s.Style.background,
      height: maxHeight + MediaQuery.of(context).padding.top,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: maxHeight * 0.08, bottom: maxHeight * 0.05),
              child:  Image(
                  width: maxWidth * 0.75,
                  image: const AssetImage('assets/logo.png'), fit: BoxFit.cover,),
            ), 
            TextField(
              autocorrect: false,
              controller: textController,
              onSubmitted: _request,
              decoration:  InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _requestButton,
                ),
                border: const OutlineInputBorder(),
                hintText: 'Enter a pseudo',
                //prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
          exist == false
          ? //display error message when pseudo don't exist
          const Text('pseudo not found, try again',
              style: s.Style.errorText)
          : const Text(''),
          ],
        ),
      ),
    ))));
  }
}
