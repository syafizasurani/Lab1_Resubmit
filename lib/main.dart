import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int sex = 1, height = 1, weight = 1, waist = 1;
  TextEditingController sexTextEditingController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController waistController = new TextEditingController();
  double absi = 0, absizScore = 0, absiMean = 0, absiSD = 0;
  String result;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('OMNI Calculator',
            style: GoogleFonts.openSans(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22,
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.settings,
              color: Colors.white,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 350,
              child: Column(
                children: [
                  SizedBox(height: 13),
                  Row(
                    children: [
                      Text("Enter all details",
                        style: GoogleFonts.openSans(
                          fontSize: 20, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Sex",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                        )
                      ),
                      Container(
                        width: 222,
                      ),
                      DropdownButton(
                        underline: SizedBox(),
                        value: sex,
                        items: [
                          DropdownMenuItem(
                            child: Text("Male", 
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                              ),
                            ),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Female", 
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                              ),
                            ),
                            value: 2,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            sex = value;
                          });
                        }
                      ),
                    ],
                  ),
                  Container(
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Age",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        width: 230,
                        child: TextField(
                          controller: ageController,
                          decoration: new InputDecoration.collapsed(hintText: ""),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.end, keyboardType:TextInputType.number
                        )
                      ),
                      Text(" years",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Height",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextField(
                          controller: heightController,
                          decoration: InputDecoration.collapsed(
                            hintText: "",
                          ),
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.openSans(
                            fontSize: 20
                          ),
                          textAlign: TextAlign.end
                        ),
                      ),
                      DropdownButton(
                        underline: SizedBox(),
                        value: height,
                        items: [
                          DropdownMenuItem(
                            child: Text(" cm", 
                              style: GoogleFonts.openSans(
                                fontSize: 20
                              ),
                            ),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text(" m", 
                              style: GoogleFonts.openSans(
                                fontSize: 20
                              ),
                            ),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text(" in", 
                              style: GoogleFonts.openSans(
                                fontSize: 20
                              ),
                            ),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text(" ft", 
                              style: GoogleFonts.openSans(
                                fontSize: 20
                              ),
                            ),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text(" ft/in", 
                              style: GoogleFonts.openSans(
                                fontSize: 20
                              ),
                            ),
                            value: 5,
                          ),
                          DropdownMenuItem(
                            child: Text(" m/cm", 
                              style: GoogleFonts.openSans(
                                fontSize: 20
                              ),
                            ),
                            value: 6,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        }
                      ),
                    ],
                  ),
                  Container(
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Weight",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        width: 199,
                        child: TextField(
                          controller: weightController,
                          decoration: InputDecoration.collapsed(
                            hintText: "",
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 20
                          ),
                          textAlign: TextAlign.end
                        )
                      ),
                      DropdownButton(
                        underline: SizedBox(),
                        value: weight,
                        items: [
                          DropdownMenuItem(
                            child: Text(" kg", 
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                              ),
                            ),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text(" lb", 
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                              )
                            ),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text(" stone", 
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                              ),
                            ),
                            value: 3,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            weight = value;
                          });
                        }
                      ),
                    ],
                  ),
                  Container(
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Waist Circumference",
                        style: GoogleFonts.openSans(
                          fontSize: 20
                        ),
                      ),
                      Container(
                        width: 95,
                        child: TextField(
                          controller: waistController,
                          decoration: InputDecoration.collapsed(
                            hintText: "",
                          ),
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.openSans(
                            fontSize: 20
                          ),
                          textAlign: TextAlign.end
                        )
                      ),
                      DropdownButton(
                        underline: SizedBox(),
                        value: waist,
                        items: [
                          DropdownMenuItem(
                            child: Text(" cm", 
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                              ),
                            ),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text(" m", 
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                              ),
                            ),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text(" in", 
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                              ),
                            ),
                            value: 3,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            waist = value;
                          });
                        }
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                      onPressed: _calculateResults,
                      child: Text("GET RESULTS",
                        style: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
                      onPressed: _clearText,
                      child: Text("CLEAR",
                        style: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Container(
                    width: double.infinity,
                    child: Text("Your Results",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ABSI",
                                style: GoogleFonts.openSans(
                                  fontSize: 18, fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("" + absi.toStringAsFixed(4),
                                style: GoogleFonts.openSans(
                                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("   ABSI z-score",
                                style: GoogleFonts.openSans(
                                  fontSize: 18, fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("  " + absizScore.toStringAsFixed(4),
                                style: GoogleFonts.openSans(
                                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "According to your ABSI z-score, your premature \nmortality risk is ",
                                style: GoogleFonts.openSans(
                                  fontSize: 15, color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: result,
                                style: GoogleFonts.openSans(
                                  fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            )
          ),
        )
      ),
    );
  }

  void _calculateResults() {
    setState(() {
      double _height, _weight, _waist, _bmi;
      if(ageController.text.isNotEmpty && heightController.text.isNotEmpty && weightController.text.isNotEmpty && waistController.text.isNotEmpty){
        //height part
        if(height == 1){
          _height = double.parse(heightController.text) / 100;
        }
        else if (height == 2) {
        _height = double.parse(heightController.text);
        } 
        else if (height == 3) {
          _height = double.parse(heightController.text) / 39.37007874;
        } 
        else if (height == 4) {
          _height = double.parse(heightController.text) / 3.280839895;
        }
        //weight part
        if (weight == 1) {
          _weight = double.parse(weightController.text);
        } 
        else if (weight == 2) {
          _weight = double.parse(weightController.text) / 2.204622622;
        } 
        else if (weight == 3) {
          _weight = double.parse(weightController.text) / 0.1574730444;
        }
        //waist part
        if (waist == 1) {
          _waist = double.parse(waistController.text) / 100;
        } 
        else if (waist == 2) {
          _waist = double.parse(waistController.text);
        } 
        else if (waist == 3) {
          _waist = double.parse(waistController.text) / 39.37007874;
        }
        _bmi = _weight / (_height * _height);
        absi = _waist / (pow(_bmi, (2.0 / 3.0)) * pow(_height, 1.0 / 2.0));
        _calculateABSIMean();

        //read results
        absizScore = (absi - absiMean) / absiSD;
        if (absizScore < -0.868) {
          result = 'very low 👌';
        } 
        else if (absizScore >= -0.868 && absizScore < -0.272) {
          result = 'low 👍';
        } 
        else if (absizScore >= -0.272 && absizScore < 0.229) {
          result = 'average ✔️';
        } 
        else if (absizScore >= 0.229 && absizScore < 0.798) {
          result = 'high ❗';
        } 
        else if (absizScore >= 0.798) {
          result = 'very high ❗❗❗';
        }
      }
    });
  }

  void _calculateABSIMean() {
    int age = int.parse(ageController.text);
    if (age == null || age < 2) {
      age = 2;
    } 
    else if (age > 85) {
      age = 85;
    }
    var data = [];
    if (sex == 1) {
      data = dataMale;
      data.forEach((value) {
        if (age == int.parse(value['name'])) {
          absiMean = double.parse(value['values']['ABSIMean']);
          absiSD = double.parse(value['values']['ABSISD']);
        }
      });
    } 
    else {
      data = dataFemale;
      data.forEach((value) {
        if (age == int.parse(value['name'])) {
          absiMean = double.parse(value['values']['ABSIMean']);
          absiSD = double.parse(value['values']['ABSISD']);
        }
      });
    }
  }

  void _clearText() {
    setState(() {
      sex = 1;
      ageController.clear();
      heightController.clear();
      weightController.clear();
      waistController.clear();
      absi = 0;
      absizScore = 0;
      result = "";
    });
  }

  List<Map<String, dynamic>> dataMale = [
    {
      "name": "2",
      "uid": "1",
      "values": {"ABSIMean": "0.0789", "ABSISD": "0.00384"}
    },
    {
      "name": "3",
      "uid": "2",
      "values": {"ABSIMean": "0.07915", "ABSISD": "0.00384"}
    },
    {
      "name": "4",
      "uid": "3",
      "values": {"ABSIMean": "0.07937", "ABSISD": "0.00383"}
    },
    {
      "name": "5",
      "uid": "4",
      "values": {"ABSIMean": "0.07955", "ABSISD": "0.00383"}
    },
    {
      "name": "6",
      "uid": "5",
      "values": {"ABSIMean": "0.07964", "ABSISD": "0.00382"}
    },
    {
      "name": "7",
      "uid": "6",
      "values": {"ABSIMean": "0.07966", "ABSISD": "0.00382"}
    },
    {
      "name": "8",
      "uid": "7",
      "values": {"ABSIMean": "0.07958", "ABSISD": "0.00382"}
    },
    {
      "name": "9",
      "uid": "8",
      "values": {"ABSIMean": "0.07942", "ABSISD": "0.00381"}
    },
    {
      "name": "10",
      "uid": "9",
      "values": {"ABSIMean": "0.07917", "ABSISD": "0.00381"}
    },
    {
      "name": "11",
      "uid": "10",
      "values": {"ABSIMean": "0.07886", "ABSISD": "0.00381"}
    },
    {
      "name": "12",
      "uid": "11",
      "values": {"ABSIMean": "0.07849", "ABSISD": "0.0038"}
    },
    {
      "name": "13",
      "uid": "12",
      "values": {"ABSIMean": "0.0781", "ABSISD": "0.0038"}
    },
    {
      "name": "14",
      "uid": "13",
      "values": {"ABSIMean": "0.07772", "ABSISD": "0.0038"}
    },
    {
      "name": "15",
      "uid": "14",
      "values": {"ABSIMean": "0.07739", "ABSISD": "0.00379"}
    },
    {
      "name": "16",
      "uid": "15",
      "values": {"ABSIMean": "0.07716", "ABSISD": "0.00379"}
    },
    {
      "name": "17",
      "uid": "16",
      "values": {"ABSIMean": "0.07703", "ABSISD": "0.00378"}
    },
    {
      "name": "18",
      "uid": "17",
      "values": {"ABSIMean": "0.07702", "ABSISD": "0.00378"}
    },
    {
      "name": "19",
      "uid": "18",
      "values": {"ABSIMean": "0.07711", "ABSISD": "0.00378"}
    },
    {
      "name": "20",
      "uid": "19",
      "values": {"ABSIMean": "0.07728", "ABSISD": "0.00377"}
    },
    {
      "name": "21",
      "uid": "20",
      "values": {"ABSIMean": "0.0775", "ABSISD": "0.00377"}
    },
    {
      "name": "22",
      "uid": "21",
      "values": {"ABSIMean": "0.07777", "ABSISD": "0.00377"}
    },
    {
      "name": "23",
      "uid": "22",
      "values": {"ABSIMean": "0.07804", "ABSISD": "0.00376"}
    },
    {
      "name": "24",
      "uid": "23",
      "values": {"ABSIMean": "0.07831", "ABSISD": "0.00376"}
    },
    {
      "name": "25",
      "uid": "24",
      "values": {"ABSIMean": "0.07858", "ABSISD": "0.00376"}
    },
    {
      "name": "26",
      "uid": "25",
      "values": {"ABSIMean": "0.07882", "ABSISD": "0.00375"}
    },
    {
      "name": "27",
      "uid": "26",
      "values": {"ABSIMean": "0.07904", "ABSISD": "0.00375"}
    },
    {
      "name": "28",
      "uid": "27",
      "values": {"ABSIMean": "0.07922", "ABSISD": "0.00374"}
    },
    {
      "name": "29",
      "uid": "28",
      "values": {"ABSIMean": "0.07938", "ABSISD": "0.00374"}
    },
    {
      "name": "30",
      "uid": "29",
      "values": {"ABSIMean": "0.07951", "ABSISD": "0.00374"}
    },
    {
      "name": "31",
      "uid": "30",
      "values": {"ABSIMean": "0.07963", "ABSISD": "0.00373"}
    },
    {
      "name": "32",
      "uid": "31",
      "values": {"ABSIMean": "0.07975", "ABSISD": "0.00373"}
    },
    {
      "name": "33",
      "uid": "32",
      "values": {"ABSIMean": "0.07988", "ABSISD": "0.00373"}
    },
    {
      "name": "34",
      "uid": "33",
      "values": {"ABSIMean": "0.08", "ABSISD": "0.00372"}
    },
    {
      "name": "35",
      "uid": "34",
      "values": {"ABSIMean": "0.08013", "ABSISD": "0.00372"}
    },
    {
      "name": "36",
      "uid": "35",
      "values": {"ABSIMean": "0.08027", "ABSISD": "0.00371"}
    },
    {
      "name": "37",
      "uid": "36",
      "values": {"ABSIMean": "0.08042", "ABSISD": "0.00371"}
    },
    {
      "name": "38",
      "uid": "37",
      "values": {"ABSIMean": "0.08057", "ABSISD": "0.00371"}
    },
    {
      "name": "39",
      "uid": "38",
      "values": {"ABSIMean": "0.08072", "ABSISD": "0.0037"}
    },
    {
      "name": "40",
      "uid": "39",
      "values": {"ABSIMean": "0.08087", "ABSISD": "0.0037"}
    },
    {
      "name": "41",
      "uid": "40",
      "values": {"ABSIMean": "0.08102", "ABSISD": "0.0037"}
    },
    {
      "name": "42",
      "uid": "41",
      "values": {"ABSIMean": "0.08117", "ABSISD": "0.00369"}
    },
    {
      "name": "43",
      "uid": "42",
      "values": {"ABSIMean": "0.08132", "ABSISD": "0.00369"}
    },
    {
      "name": "44",
      "uid": "43",
      "values": {"ABSIMean": "0.08148", "ABSISD": "0.00368"}
    },
    {
      "name": "45",
      "uid": "44",
      "values": {"ABSIMean": "0.08165", "ABSISD": "0.00368"}
    },
    {
      "name": "46",
      "uid": "45",
      "values": {"ABSIMean": "0.08183", "ABSISD": "0.00368"}
    },
    {
      "name": "47",
      "uid": "46",
      "values": {"ABSIMean": "0.08201", "ABSISD": "0.00367"}
    },
    {
      "name": "48",
      "uid": "47",
      "values": {"ABSIMean": "0.08221", "ABSISD": "0.00367"}
    },
    {
      "name": "49",
      "uid": "48",
      "values": {"ABSIMean": "0.0824", "ABSISD": "0.00367"}
    },
    {
      "name": "50",
      "uid": "49",
      "values": {"ABSIMean": "0.0826", "ABSISD": "0.00366"}
    },
    {
      "name": "51",
      "uid": "50",
      "values": {"ABSIMean": "0.08279", "ABSISD": "0.00366"}
    },
    {
      "name": "52",
      "uid": "51",
      "values": {"ABSIMean": "0.08297", "ABSISD": "0.00365"}
    },
    {
      "name": "53",
      "uid": "52",
      "values": {"ABSIMean": "0.08315", "ABSISD": "0.00365"}
    },
    {
      "name": "54",
      "uid": "53",
      "values": {"ABSIMean": "0.08334", "ABSISD": "0.00365"}
    },
    {
      "name": "55",
      "uid": "54",
      "values": {"ABSIMean": "0.08352", "ABSISD": "0.00364"}
    },
    {
      "name": "56",
      "uid": "55",
      "values": {"ABSIMean": "0.08369", "ABSISD": "0.00364"}
    },
    {
      "name": "57",
      "uid": "56",
      "values": {"ABSIMean": "0.08386", "ABSISD": "0.00364"}
    },
    {
      "name": "58",
      "uid": "57",
      "values": {"ABSIMean": "0.08403", "ABSISD": "0.00363"}
    },
    {
      "name": "59",
      "uid": "58",
      "values": {"ABSIMean": "0.08419", "ABSISD": "0.00363"}
    },
    {
      "name": "60",
      "uid": "59",
      "values": {"ABSIMean": "0.08436", "ABSISD": "0.00362"}
    },
    {
      "name": "61",
      "uid": "60",
      "values": {"ABSIMean": "0.08454", "ABSISD": "0.00362"}
    },
    {
      "name": "62",
      "uid": "61",
      "values": {"ABSIMean": "0.08471", "ABSISD": "0.00362"}
    },
    {
      "name": "63",
      "uid": "62",
      "values": {"ABSIMean": "0.08489", "ABSISD": "0.00361"}
    },
    {
      "name": "64",
      "uid": "63",
      "values": {"ABSIMean": "0.08506", "ABSISD": "0.00361"}
    },
    {
      "name": "65",
      "uid": "64",
      "values": {"ABSIMean": "0.08522", "ABSISD": "0.0036"}
    },
    {
      "name": "66",
      "uid": "65",
      "values": {"ABSIMean": "0.08537", "ABSISD": "0.0036"}
    },
    {
      "name": "67",
      "uid": "66",
      "values": {"ABSIMean": "0.08551", "ABSISD": "0.0036"}
    },
    {
      "name": "68",
      "uid": "67",
      "values": {"ABSIMean": "0.08565", "ABSISD": "0.00359"}
    },
    {
      "name": "69",
      "uid": "68",
      "values": {"ABSIMean": "0.08578", "ABSISD": "0.00359"}
    },
    {
      "name": "70",
      "uid": "69",
      "values": {"ABSIMean": "0.08591", "ABSISD": "0.00359"}
    },
    {
      "name": "71",
      "uid": "70",
      "values": {"ABSIMean": "0.08604", "ABSISD": "0.00358"}
    },
    {
      "name": "72",
      "uid": "71",
      "values": {"ABSIMean": "0.08616", "ABSISD": "0.00358"}
    },
    {
      "name": "73",
      "uid": "72",
      "values": {"ABSIMean": "0.08629", "ABSISD": "0.00357"}
    },
    {
      "name": "74",
      "uid": "73",
      "values": {"ABSIMean": "0.08641", "ABSISD": "0.00357"}
    },
    {
      "name": "75",
      "uid": "74",
      "values": {"ABSIMean": "0.08653", "ABSISD": "0.00357"}
    },
    {
      "name": "76",
      "uid": "75",
      "values": {"ABSIMean": "0.08665", "ABSISD": "0.00356"}
    },
    {
      "name": "77",
      "uid": "76",
      "values": {"ABSIMean": "0.08675", "ABSISD": "0.00356"}
    },
    {
      "name": "78",
      "uid": "77",
      "values": {"ABSIMean": "0.08685", "ABSISD": "0.00355"}
    },
    {
      "name": "79",
      "uid": "78",
      "values": {"ABSIMean": "0.08695", "ABSISD": "0.00355"}
    },
    {
      "name": "80",
      "uid": "79",
      "values": {"ABSIMean": "0.08705", "ABSISD": "0.00355"}
    },
    {
      "name": "81",
      "uid": "80",
      "values": {"ABSIMean": "0.08714", "ABSISD": "0.00354"}
    },
    {
      "name": "82",
      "uid": "81",
      "values": {"ABSIMean": "0.08723", "ABSISD": "0.00354"}
    },
    {
      "name": "83",
      "uid": "82",
      "values": {"ABSIMean": "0.08732", "ABSISD": "0.00354"}
    },
    {
      "name": "84",
      "uid": "83",
      "values": {"ABSIMean": "0.08742", "ABSISD": "0.00353"}
    },
    {
      "name": "85",
      "uid": "84",
      "values": {"ABSIMean": "0.08811", "ABSISD": "0.00356"}
    }
  ];

  List<Map<String, dynamic>> dataFemale = [
    {
      "name": "2",
      "uid": "169",
      "values": {"ABSIMean": "0.08031", "ABSISD": "0.00363"}
    },
    {
      "name": "3",
      "uid": "170",
      "values": {"ABSIMean": "0.08016", "ABSISD": "0.00366"}
    },
    {
      "name": "4",
      "uid": "171",
      "values": {"ABSIMean": "0.08001", "ABSISD": "0.00369"}
    },
    {
      "name": "5",
      "uid": "172",
      "values": {"ABSIMean": "0.07985", "ABSISD": "0.00372"}
    },
    {
      "name": "6",
      "uid": "173",
      "values": {"ABSIMean": "0.07969", "ABSISD": "0.00375"}
    },
    {
      "name": "7",
      "uid": "174",
      "values": {"ABSIMean": "0.07952", "ABSISD": "0.00378"}
    },
    {
      "name": "8",
      "uid": "175",
      "values": {"ABSIMean": "0.07935", "ABSISD": "0.0038"}
    },
    {
      "name": "9",
      "uid": "176",
      "values": {"ABSIMean": "0.07917", "ABSISD": "0.00383"}
    },
    {
      "name": "10",
      "uid": "177",
      "values": {"ABSIMean": "0.07899", "ABSISD": "0.00386"}
    },
    {
      "name": "11",
      "uid": "178",
      "values": {"ABSIMean": "0.07881", "ABSISD": "0.00389"}
    },
    {
      "name": "12",
      "uid": "179",
      "values": {"ABSIMean": "0.07863", "ABSISD": "0.00392"}
    },
    {
      "name": "13",
      "uid": "180",
      "values": {"ABSIMean": "0.07846", "ABSISD": "0.00395"}
    },
    {
      "name": "14",
      "uid": "181",
      "values": {"ABSIMean": "0.07829", "ABSISD": "0.00397"}
    },
    {
      "name": "15",
      "uid": "182",
      "values": {"ABSIMean": "0.07814", "ABSISD": "0.004"}
    },
    {
      "name": "16",
      "uid": "183",
      "values": {"ABSIMean": "0.07799", "ABSISD": "0.00403"}
    },
    {
      "name": "17",
      "uid": "184",
      "values": {"ABSIMean": "0.07787", "ABSISD": "0.00406"}
    },
    {
      "name": "18",
      "uid": "185",
      "values": {"ABSIMean": "0.07775", "ABSISD": "0.00408"}
    },
    {
      "name": "19",
      "uid": "186",
      "values": {"ABSIMean": "0.07765", "ABSISD": "0.00411"}
    },
    {
      "name": "20",
      "uid": "187",
      "values": {"ABSIMean": "0.07757", "ABSISD": "0.00414"}
    },
    {
      "name": "21",
      "uid": "188",
      "values": {"ABSIMean": "0.0775", "ABSISD": "0.00416"}
    },
    {
      "name": "22",
      "uid": "189",
      "values": {"ABSIMean": "0.07744", "ABSISD": "0.00419"}
    },
    {
      "name": "23",
      "uid": "190",
      "values": {"ABSIMean": "0.0774", "ABSISD": "0.00422"}
    },
    {
      "name": "24",
      "uid": "191",
      "values": {"ABSIMean": "0.07737", "ABSISD": "0.00424"}
    },
    {
      "name": "25",
      "uid": "192",
      "values": {"ABSIMean": "0.07735", "ABSISD": "0.00427"}
    },
    {
      "name": "26",
      "uid": "193",
      "values": {"ABSIMean": "0.07734", "ABSISD": "0.00429"}
    },
    {
      "name": "27",
      "uid": "194",
      "values": {"ABSIMean": "0.07735", "ABSISD": "0.00432"}
    },
    {
      "name": "28",
      "uid": "195",
      "values": {"ABSIMean": "0.07736", "ABSISD": "0.00435"}
    },
    {
      "name": "29",
      "uid": "196",
      "values": {"ABSIMean": "0.07739", "ABSISD": "0.00437"}
    },
    {
      "name": "30",
      "uid": "197",
      "values": {"ABSIMean": "0.07743", "ABSISD": "0.0044"}
    },
    {
      "name": "31",
      "uid": "198",
      "values": {"ABSIMean": "0.07747", "ABSISD": "0.00442"}
    },
    {
      "name": "32",
      "uid": "199",
      "values": {"ABSIMean": "0.07752", "ABSISD": "0.00445"}
    },
    {
      "name": "33",
      "uid": "200",
      "values": {"ABSIMean": "0.07759", "ABSISD": "0.00447"}
    },
    {
      "name": "34",
      "uid": "201",
      "values": {"ABSIMean": "0.07766", "ABSISD": "0.0045"}
    },
    {
      "name": "35",
      "uid": "202",
      "values": {"ABSIMean": "0.07773", "ABSISD": "0.00452"}
    },
    {
      "name": "36",
      "uid": "203",
      "values": {"ABSIMean": "0.07782", "ABSISD": "0.00454"}
    },
    {
      "name": "37",
      "uid": "204",
      "values": {"ABSIMean": "0.0779", "ABSISD": "0.00457"}
    },
    {
      "name": "38",
      "uid": "205",
      "values": {"ABSIMean": "0.078", "ABSISD": "0.00459"}
    },
    {
      "name": "39",
      "uid": "206",
      "values": {"ABSIMean": "0.0781", "ABSISD": "0.00462"}
    },
    {
      "name": "40",
      "uid": "207",
      "values": {"ABSIMean": "0.0782", "ABSISD": "0.00464"}
    },
    {
      "name": "41",
      "uid": "208",
      "values": {"ABSIMean": "0.07831", "ABSISD": "0.00466"}
    },
    {
      "name": "42",
      "uid": "209",
      "values": {"ABSIMean": "0.07842", "ABSISD": "0.00469"}
    },
    {
      "name": "43",
      "uid": "210",
      "values": {"ABSIMean": "0.07854", "ABSISD": "0.00471"}
    },
    {
      "name": "44",
      "uid": "211",
      "values": {"ABSIMean": "0.07866", "ABSISD": "0.00473"}
    },
    {
      "name": "45",
      "uid": "212",
      "values": {"ABSIMean": "0.07879", "ABSISD": "0.00476"}
    },
    {
      "name": "46",
      "uid": "213",
      "values": {"ABSIMean": "0.07892", "ABSISD": "0.00478"}
    },
    {
      "name": "47",
      "uid": "214",
      "values": {"ABSIMean": "0.07905", "ABSISD": "0.0048"}
    },
    {
      "name": "48",
      "uid": "215",
      "values": {"ABSIMean": "0.07919", "ABSISD": "0.00483"}
    },
    {
      "name": "49",
      "uid": "216",
      "values": {"ABSIMean": "0.07933", "ABSISD": "0.00485"}
    },
    {
      "name": "50",
      "uid": "217",
      "values": {"ABSIMean": "0.07947", "ABSISD": "0.00487"}
    },
    {
      "name": "51",
      "uid": "218",
      "values": {"ABSIMean": "0.07962", "ABSISD": "0.00489"}
    },
    {
      "name": "52",
      "uid": "219",
      "values": {"ABSIMean": "0.07977", "ABSISD": "0.00492"}
    },
    {
      "name": "53",
      "uid": "220",
      "values": {"ABSIMean": "0.07992", "ABSISD": "0.00494"}
    },
    {
      "name": "54",
      "uid": "221",
      "values": {"ABSIMean": "0.08007", "ABSISD": "0.00496"}
    },
    {
      "name": "55",
      "uid": "222",
      "values": {"ABSIMean": "0.08023", "ABSISD": "0.00498"}
    },
    {
      "name": "56",
      "uid": "223",
      "values": {"ABSIMean": "0.08039", "ABSISD": "0.00501"}
    },
    {
      "name": "57",
      "uid": "224",
      "values": {"ABSIMean": "0.08055", "ABSISD": "0.00503"}
    },
    {
      "name": "58",
      "uid": "225",
      "values": {"ABSIMean": "0.08072", "ABSISD": "0.00505"}
    },
    {
      "name": "59",
      "uid": "226",
      "values": {"ABSIMean": "0.08088", "ABSISD": "0.00507"}
    },
    {
      "name": "60",
      "uid": "227",
      "values": {"ABSIMean": "0.08105", "ABSISD": "0.00509"}
    },
    {
      "name": "61",
      "uid": "228",
      "values": {"ABSIMean": "0.08122", "ABSISD": "0.00511"}
    },
    {
      "name": "62",
      "uid": "229",
      "values": {"ABSIMean": "0.08139", "ABSISD": "0.00514"}
    },
    {
      "name": "63",
      "uid": "230",
      "values": {"ABSIMean": "0.08156", "ABSISD": "0.00516"}
    },
    {
      "name": "64",
      "uid": "231",
      "values": {"ABSIMean": "0.08174", "ABSISD": "0.00518"}
    },
    {
      "name": "65",
      "uid": "232",
      "values": {"ABSIMean": "0.08191", "ABSISD": "0.0052"}
    },
    {
      "name": "66",
      "uid": "233",
      "values": {"ABSIMean": "0.08208", "ABSISD": "0.00522"}
    },
    {
      "name": "67",
      "uid": "234",
      "values": {"ABSIMean": "0.08226", "ABSISD": "0.00524"}
    },
    {
      "name": "68",
      "uid": "235",
      "values": {"ABSIMean": "0.08243", "ABSISD": "0.00526"}
    },
    {
      "name": "69",
      "uid": "236",
      "values": {"ABSIMean": "0.08261", "ABSISD": "0.00528"}
    },
    {
      "name": "70",
      "uid": "237",
      "values": {"ABSIMean": "0.08278", "ABSISD": "0.0053"}
    },
    {
      "name": "71",
      "uid": "238",
      "values": {"ABSIMean": "0.08296", "ABSISD": "0.00533"}
    },
    {
      "name": "72",
      "uid": "239",
      "values": {"ABSIMean": "0.08313", "ABSISD": "0.00535"}
    },
    {
      "name": "73",
      "uid": "240",
      "values": {"ABSIMean": "0.0833", "ABSISD": "0.00537"}
    },
    {
      "name": "74",
      "uid": "241",
      "values": {"ABSIMean": "0.08346", "ABSISD": "0.00539"}
    },
    {
      "name": "75",
      "uid": "242",
      "values": {"ABSIMean": "0.08363", "ABSISD": "0.00541"}
    },
    {
      "name": "76",
      "uid": "243",
      "values": {"ABSIMean": "0.0838", "ABSISD": "0.00543"}
    },
    {
      "name": "77",
      "uid": "244",
      "values": {"ABSIMean": "0.08396", "ABSISD": "0.00545"}
    },
    {
      "name": "78",
      "uid": "245",
      "values": {"ABSIMean": "0.08412", "ABSISD": "0.00547"}
    },
    {
      "name": "79",
      "uid": "246",
      "values": {"ABSIMean": "0.08428", "ABSISD": "0.00549"}
    },
    {
      "name": "80",
      "uid": "247",
      "values": {"ABSIMean": "0.08444", "ABSISD": "0.00551"}
    },
    {
      "name": "81",
      "uid": "248",
      "values": {"ABSIMean": "0.0846", "ABSISD": "0.00553"}
    },
    {
      "name": "82",
      "uid": "249",
      "values": {"ABSIMean": "0.08476", "ABSISD": "0.00555"}
    },
    {
      "name": "83",
      "uid": "250",
      "values": {"ABSIMean": "0.08492", "ABSISD": "0.00557"}
    },
    {
      "name": "84",
      "uid": "251",
      "values": {"ABSIMean": "0.08508", "ABSISD": "0.00559"}
    },
    {
      "name": "85",
      "uid": "252",
      "values": {"ABSIMean": "0.08533", "ABSISD": "0.00528"}
    }
  ];

}