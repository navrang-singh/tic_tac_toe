import 'package:flutter/material.dart';
import 'package:tic_tac_toe/services/service.dart';
import 'package:tic_tac_toe/widgets/widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _usrname1controller = TextEditingController();
  final TextEditingController _usrname2controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 50,
                    color: Colors.blueAccent,
                  )
                ],
                text: "Enter Players Name",
                fontSize: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                controller: _usrname1controller,
                hintText: "Player 1 name",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                controller: _usrname2controller,
                hintText: "Player 2 name",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onPressed: () {
                  print("a" + _usrname1controller.text + "a");
                  if(_usrname1controller.text == ""){
                    _usrname1controller.text = "player1";
                  }
                  if(_usrname2controller.text == ""){
                    _usrname2controller.text = "player2";
                  }
                  Navigator.pushNamed(context, '/gamescreen', arguments: {
                    
                      "player1": _usrname1controller.text,
                    "player2": _usrname2controller.text
                  });
                },
                btnText: "Submit",
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gamescreen', arguments: {
                    "player1": "Player 1",
                    "player2": "Player 2"
                  });
                },
                btnText: "Choose default",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
