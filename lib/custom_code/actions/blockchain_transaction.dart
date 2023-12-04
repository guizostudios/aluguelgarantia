// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web3dart/web3dart.dart';
import 'initialize_blockchain.dart';

Future<String> blockchainTransaction(
  String contractAddress,
  String className,
  String functionName,
  List<dynamic> args,
) async {
  final contract = await loadContract(contractAddress, className);
  final ethFunction = contract.function(functionName);
  final result = await ethClient.sendTransaction(
    ethCredentials,
    Transaction.callContract(
      contract: contract,
      function: ethFunction,
      parameters: args,
    ),
    fetchChainIdFromNetworkId: true,
    chainId: null,
  );
  return result;
}
