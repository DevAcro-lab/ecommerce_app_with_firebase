import 'package:flutter/material.dart';

void nextPage(context, Widget pageName, {bool rootNavigator = false}) {
  Navigator.of(context, rootNavigator: rootNavigator)
      .push(MaterialPageRoute(builder: (context) => pageName));
}

void nextPageRemovePrevious(context, Widget pageName,
    {bool rootNavigator = false}) {
  Navigator.of(context, rootNavigator: rootNavigator).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => pageName), (route) => false);
}
