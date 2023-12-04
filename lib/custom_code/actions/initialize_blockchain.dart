// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

late final Client httpClient;
late final Web3Client ethClient;
late final EthPrivateKey ethCredentials;

Future<void> initializeBlockchain(String url, String privateKey) async {
  httpClient = Client();
  ethClient = Web3Client(url, httpClient);
  ethCredentials = EthPrivateKey.fromHex(privateKey);
}
