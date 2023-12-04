// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web3dart/web3dart.dart';

dynamic loadContract(String contractAddress, String className) {
  final abi = getAbi();
  final contract = DeployedContract(
    ContractAbi.fromJson(abi, className),
    EthereumAddress.fromHex(contractAddress),
  );
  return contract;
}
