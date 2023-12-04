// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> purchaseNFT(
  String contractAddress,
  String className,
  String amount,
) async {
  final bigIntAmount = BigInt.from(int.parse(amount));
  final txHash = await blockchainTransaction(
    contractAddress,
    className,
    'purchaseNFT',
    [bigIntAmount],
  );
  return txHash;
}
