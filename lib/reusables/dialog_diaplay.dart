import 'package:flutter/material.dart';
class DialogDisplay{

  static showErrorDialog(BuildContext context, String errorMessage) {
    // set up the button
    Widget okButton =  Padding(
      padding: const EdgeInsets.only(left: 70, right: 70,),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: 250,
        child: TextButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
          child: Text(
            "OK",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.black.withOpacity(0.87),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
      title: const Text(
        "" , //errorCode.toString(),
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: Text(errorMessage, textAlign: TextAlign.center, style:  const TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black),),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
