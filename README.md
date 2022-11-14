# root_checker_plus

Plugin used for detecting root device in android and jailbreak detection ios.

It uses [RootBeer](https://github.com/scottyab/rootbeer) on Android,
and [DTTJailbreakDetection](https://github.com/thii/DTTJailbreakDetection) on iOS.

## Getting Started
With a placeholder:
```dart

import 'package:root_checker_plus/root_checker_plus.dart';

```

## initState
With a placeholder:
```dart
    if (Platform.isAndroid) {
      androidRootChecker();
      developerMode();
    }
    if (Platform.isIOS) {
      iosJailbreak();
    }

```

## implemented Method
With a placeholder:

```dart
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

```

## Ouput widgets
With a placeholder:

```dart
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

```
