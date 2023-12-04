// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> borrowFunds(
  String contractAddress,
  String className,
  String amount,
  String startDate,
  String endDate,
) async {
  final bigIntAmount = BigInt.from(int.parse(amount));
  final startDate = BigInt.from(int.parse(startDate));
  final endDate = BigInt.from(int.parse(endDate));
  final txHash = await blockchainTransaction(
    contractAddress,
    className,
    'borrowFunds',
    [bigIntAmount],
    [startDate],
    [endDate],
  );
  return txHash;
}
