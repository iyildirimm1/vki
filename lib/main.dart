import 'package:flutter/material.dart';
import 'package:vki_hesaplama/card_widget.dart';
import 'package:vki_hesaplama/sabitler.dart';

void main() {
  runApp(const MyApp());
}

enum cinsiyet { male, female, notrs }

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter İlk Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color cardColor = rkPasifCardBackColor;
  cinsiyet seciliCinsiyet;
  int height = 180;
  int weight = 60;
  int age= 20;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: rkZeminArkaPlan,
      appBar: AppBar(
        backgroundColor: rkZeminArkaPlan,
        title: Center(
          child: Text(
            "VKİ Hesaplama",
            style: TextStyle(
              color: rkCardForeColor,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GuzelCard(
                  fonksiyon: () {
                    setState(() {
                      seciliCinsiyet = cinsiyet.male;
                    });
                  },
                  cardColor: seciliCinsiyet == cinsiyet.male
                      ? rkAktifCardBackColor
                      : rkPasifCardBackColor,
                  simge: Icons.male,
                  metin: "ERKEK",
                ),
                GuzelCard(
                  fonksiyon: () {
                    setState(() {
                      seciliCinsiyet = cinsiyet.female;
                    });
                  },
                  cardColor: seciliCinsiyet == cinsiyet.female
                      ? rkAktifCardBackColor
                      : rkPasifCardBackColor,
                  simge: Icons.female,
                  metin: "KADIN",
                ),
              ],
            ),
          ),
          Expanded(
            child: OrtakCard(
              () {},
              Colors.red,
              Column(
                children: [
                  Text(
                    "HEIGHT",
                    style: tsActivCardColor,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: tsHeightStyle,
                      ),
                      Text(
                        "cm",
                        style: tsCmStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: stSliderTheme,
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120,
                      max: 220,
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(child: OrtakCard(() {},
                Colors.red,
                Column(
                  children: [
                    Text(
                      "WEIGHT",
                      style: tsActivCardColor,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          weight.toString(),
                          style: tsHeightStyle,
                        ),

                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(style: bsStyle,onPressed: (){
                            setState(() {
                              weight--;
                            });
                          }, child:Text("-",style: tsButtonStyle,) ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(style: bsStyle,onPressed: (){
                            setState(() {
                              weight++;
                            });
                          }, child:Text("+",style: tsButtonStyle,) ),
                        )

                      ],
                    )
                  ],
                ),
              ),
              ),
              Expanded(child: OrtakCard(() {},
                Colors.red,
                Column(
                  children: [
                    Text(
                      "AGE",
                      style: tsActivCardColor,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          age.toString(),
                          style: tsHeightStyle,
                        ),

                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(style: bsStyle,onPressed: (){
                            setState(() {
                              age--;
                            });
                          }, child:Text("-",style: tsButtonStyle,) ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(style: bsStyle,onPressed: (){
                            setState(() {
                              age++;
                            });
                          }, child:Text("+",style: tsButtonStyle,) ),
                        )

                      ],
                    )
                  ],
                ),
              ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
