import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_test_booking_app/Screens/BookingScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lab_test_booking_app/Screens/Lab1.dart';

class LabInfo extends StatefulWidget {
  static const String id = "LabInfo";
  @override
  _LabInfoState createState() => _LabInfoState();
}

List labNames = ["Saroj", "Evegreen", "GMC"];

class _LabInfoState extends State<LabInfo> {
  String labSelect;
  bool _isChecked = false;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  TextEditingController controller;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  void onChanged1(bool value) {
    setState(() {
      _isChecked1 = value;
    });
  }

  void onChanged2(bool value) {
    setState(() {
      _isChecked2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.white,
                expandedHeight: 65,
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: TextField(
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      onChanged: (value) {},
                      decoration: buildLocationInputDecoration()),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CheckboxListTile(
                                  activeColor: Theme.of(context).primaryColor,
                                  value: _isChecked,
                                  onChanged: (bool value) {
                                    onChanged(value);
                                    setState(() {
                                      labSelect = labNames[0];
                                      _firestore
                                          .collection("lab names")
                                          .add({'lab1': labSelect});
                                      if (labSelect.isEmpty) {
                                        return "Select a lab";
                                      }
                                      Navigator.pushNamed(
                                          context, BookingScreen.id);
                                    });
                                  },
                                ),
                                Text("Saroj Diagonistic Laboratory",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontFamily: "Poppins-Bold",
                                        letterSpacing: .6)),
                                SizedBox(
                                  height: 5,
                                ),
                                ListTile(
                                    title: Text(
                                        "Olive Arcade, Junction, Malaparamba, Kozhikode, Kerala 673009"),
                                    leading: Icon(Icons.location_city)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        "250/-",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontFamily: "Poppins-Medium",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CheckboxListTile(
                                activeColor: Theme.of(context).primaryColor,
                                value: _isChecked1,
                                onChanged: (bool value) {
                                  onChanged1(value);
                                  setState(() {
                                    labSelect = labNames[1];
                                    if (labSelect.isEmpty) {
                                      return "Select a lab";
                                    }
                                    Navigator.pushNamed(
                                        context, BookingScreen.id);
                                  });
                                },
                              ),
                              Text("Evergreen Diagonistics",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: 5,
                              ),
                              ListTile(
                                  title: Text(
                                      "Address: SH29, Malaparamba, Kozhikode, Kerala 673017"),
                                  leading: Icon(Icons.location_city)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      "200/-",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CheckboxListTile(
                                activeColor: Theme.of(context).primaryColor,
                                value: _isChecked2,
                                onChanged: (bool value) {
                                  onChanged2(value);
                                  setState(() {
                                    labSelect = labNames[2];
                                    if (labSelect.isEmpty) {
                                      return "Select a lab";
                                    }
                                    Navigator.pushNamed(
                                        context, BookingScreen.id);
                                  });
                                },
                              ),
                              Text("GMC Laboratory",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: 5,
                              ),
                              ListTile(
                                  title:
                                      Text("Address: Kakkodi, Kerala 673611"),
                                  leading: Icon(Icons.location_city)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      "240/-",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, Lab1.id);
                              });
                            },
                            highlightColor: Colors.cyan,
                            focusColor: Colors.cyan.shade200,
                            textColor: Colors.black,
                            splashColor: Colors.cyan.shade200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Malva Laboratories",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontFamily: "Poppins-Bold",
                                        letterSpacing: .6)),
                                SizedBox(
                                  height: 5,
                                ),
                                ListTile(
                                    title: Text(
                                        "Address: East Hill, Kozhikode, Kerala 673005"),
                                    leading: Icon(Icons.location_city)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        "220/-",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontFamily: "Poppins-Medium",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, Lab1.id);
                              });
                            },
                            highlightColor: Colors.cyan,
                            focusColor: Colors.cyan.shade200,
                            textColor: Colors.black,
                            splashColor: Colors.cyan.shade200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Neethi Labs and Scans",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontFamily: "Poppins-Bold",
                                        letterSpacing: .6)),
                                SizedBox(
                                  height: 5,
                                ),
                                ListTile(
                                    title: Text(
                                        "Address: P.O, Chelannur, Kerala 673317"),
                                    leading: Icon(Icons.location_city)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        "250/-",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontFamily: "Poppins-Medium",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: buildBoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, Lab1.id);
                              });
                            },
                            highlightColor: Colors.cyan,
                            focusColor: Colors.cyan.shade200,
                            textColor: Colors.black,
                            splashColor: Colors.cyan.shade200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Plasma Diagnostic Services",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontFamily: "Poppins-Bold",
                                        letterSpacing: .6)),
                                SizedBox(
                                  height: 5,
                                ),
                                ListTile(
                                    title: Text(
                                        "Address: Wayanad Rd, near Thayat Temple, Eranhipaalam, Bilathikkulam, Kozhikode, Kerala 673006"),
                                    leading: Icon(Icons.location_city)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        "200/-",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontFamily: "Poppins-Medium",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildLocationInputDecoration() {
    return InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Icon(
          Icons.search,
          color: Colors.cyan,
        ),
      ),
      hintText: 'Search for the Laboratory',
      hintStyle: TextStyle(
          fontFamily: "Lobster-Regular", color: Colors.cyan, fontSize: 23),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.cyan, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.cyan.shade100,
              offset: Offset(0.0, 0.0),
              blurRadius: 15.0),
          BoxShadow(
              color: Colors.cyan.shade100,
              offset: Offset(0.0, 0.0),
              blurRadius: 10.0),
        ]);
  }
}
