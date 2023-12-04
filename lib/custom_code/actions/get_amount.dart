// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'initialize_blockchain.dart';

Future<String> getAmount(String contractAddress, String className) async {
  final contract = await loadContract(contractAddress, className);
  final ethFunction = contract.function('getAmount');
  final result = await ethClient.call(
    contract: contract,
    function: ethFunction,
    params: [],
  );
  return result[0].toString();
}
