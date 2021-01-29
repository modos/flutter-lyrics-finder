import 'package:flutter/material.dart';
import '../model/custom_widgets/custom_input_field.dart';
import '../model/custom_widgets/custom_button.dart';
import '../controller/fetch_lyrics.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final artistController = TextEditingController();
  final songController = TextEditingController();

  final api = new FetchLyrics();

  String lyric = '';

  bool isFound = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Center(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomInputField(hint: "Artist Name", controller: artistController),
            SizedBox(
              height: 10,
            ),
            CustomInputField(hint: "Song Name", controller: songController),
            SizedBox(
              height: 10,
            ),
            CustomButton(
                text: "Find",
                onPressed: () {
                  setState(() {
                    isFound = false;
                  });
                  api
                      .fetchLyric(artistController.value.text,
                          songController.value.text)
                      .then((value) {
                    setState(() {
                      lyric = value;
                      isFound = true;
                    });
                  });
                }),
            SizedBox(
              height: 30,
            ),
          ],
        )),
        Flexible(
            child: Container(
          width: MediaQuery.of(context).size.width * 80 / 100,
          height: MediaQuery.of(context).size.height * 55 / 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: isFound
              ? Scrollbar(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(lyric),
                  ),
                )
              : Center(
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator()),
                ),
        ))
      ]),
    );
  }
}
