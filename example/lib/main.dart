///Plugin used for detecting root device in android and jailbreak detection ios.

///It uses RootBeer on Android, and DTTJailbreakDetection on iOS.

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:root_checker_plus/root_checker_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Initial Android root checker in set false value
  bool rootedCheck = false;

  //Initial iOS jailbreak detection in set false value
  bool jailbreak = false;

  //Initial Android Developer mode checker in set false value
  bool devMode = false;

  @override
  void initState() {
    super.initState();

    //Android initState check status on root check and developer mode checking
    if (Platform.isAndroid) {
      androidRootChecker();
      developerMode();
    }

    //Android initState check status on jailbreak detection checking
    if (Platform.isIOS) {
      iosJailbreak();
    }
  }

  // Check the status display widgets
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Root checker example app'),
        ),
        body: Center(
            child: Platform.isAndroid
                ? Text('Running on Android\n\n Root Checker: $rootedCheck\n Developer Mode Enable:$devMode')
                : Text('Running on iOS\n Jailbreak: $jailbreak \n')),
      ),
    );
  }

  
  Future<void> androidRootChecker() async {
    try {
      rootedCheck = (await RootCheckerPlus.isRootChecker())!; // return rootcheck status is true or false
    } on PlatformException {
      rootedCheck = false;
    }
    if (!mounted) return;
    setState(() {
      rootedCheck = rootedCheck;
    });
  }

  Future<void> developerMode() async {
    try {
      devMode = (await RootCheckerPlus.isDeveloperMode())!; // return Android developer mode status is true or false
    } on PlatformException {
      devMode = false;
    }
    if (!mounted) return;
    setState(() {
      devMode = devMode;
    });
  }

  Future<void> iosJailbreak() async {
    try {
      jailbreak = (await RootCheckerPlus.isJailbreak())!;  // return iOS jailbreak status is true or false
    } on PlatformException {
      jailbreak = false;
    }
    if (!mounted) return;
    setState(() {
      jailbreak = jailbreak;
    });
  }
}
