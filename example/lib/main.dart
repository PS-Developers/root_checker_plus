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
  bool rootedCheck = false;
  bool jailbreak = false;
  bool devMode = false;

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      androidRootChecker();
      developerMode();
    }
    if (Platform.isIOS) {
      iosJailbreak();
    }
  }

  Future<void> androidRootChecker() async {
    try {
      rootedCheck = (await RootCheckerPlus.isRootChecker())!;
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
      devMode = (await RootCheckerPlus.isDeveloperMode())!;
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
      jailbreak = (await RootCheckerPlus.isJailbreak())!;
    } on PlatformException {
      jailbreak = false;
    }
    if (!mounted) return;
    setState(() {
      jailbreak = jailbreak;
    });
  }

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
}
