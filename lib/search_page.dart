import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCity = '';

  /* void birFonksiyon() {
    print('bu fonksiyon çalıştı');
  }

  @override
  void initState() {
    super.initState();
  }*/

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/search.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  onChanged: (value) {
                    selectedCity = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Şehir Seçiniz',
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  http.Response response = await http.get(Uri.parse(
                      'https://api.openweathermap.org/data/2.5/weather?q=$selectedCity&appid=494fe3131500c2575b4a29bd0bf64241&units=metric'));
                  if (response.statusCode == 200) {
                    Navigator.pop(context, selectedCity);
                    print(selectedCity);
                  } else {
                    _showMyDialog(context);
                  }
                },
                child: const Text('select City'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Location not found'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Please select a valid location.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
