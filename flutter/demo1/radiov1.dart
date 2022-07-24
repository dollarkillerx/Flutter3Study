import 'package:flutter/material.dart';

class RedioPage extends StatefulWidget {
  @override
  _RedioPageState createState() => _RedioPageState();
}

enum SingingCharacter { lafayette, jefferson }

// https://api.flutter.dev/flutter/material/Radio-class.html
class _RedioPageState extends State<RedioPage> {
  SingingCharacter? sex = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Man"),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.lafayette,
                groupValue: this.sex,
                onChanged: (SingingCharacter? e) {
                  setState(() {
                    this.sex = e;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Waman"),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.jefferson,
                groupValue: this.sex,
                onChanged: (SingingCharacter? e) {
                  setState(() {
                    this.sex = e;
                  });
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RadioListTile<SingingCharacter>(
              title: const Text("Man"),
              value: SingingCharacter.lafayette,
              groupValue: this.sex,
              onChanged: (SingingCharacter? e) {
                setState(() {
                  this.sex = e;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text("Wuman"),
              value: SingingCharacter.jefferson,
              groupValue: this.sex,
              onChanged: (SingingCharacter? e) {
                setState(() {
                  this.sex = e;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
