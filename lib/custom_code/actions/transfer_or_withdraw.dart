// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> transferOrWithdraw(
  String contractAddress,
  String className,
  String amount,
  String ERC20Address,
) async {
  final bigIntAmount = BigInt.from(int.parse(amount));
  final ERC20Address = BigInt.from(int.parse(ERC20Address));
  final txHash = await blockchainTransaction(
    contractAddress,
    className,
    'transferOrWithdraw',
    [bigIntAmount],
    [ERC20Address],
  );
  return txHash;
}
