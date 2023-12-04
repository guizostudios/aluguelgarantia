// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> createRentLockWallet(
  String contractAddress,
  String className,
  String taker,
  String fee,
  String securityDeposit,
  String rentAmount,
  String endDate,
  String daysForPayment,
) async {
  final txHash = await blockchainTransaction(
    contractAddress,
    className,
    'createRentLockWallet',
    [taker],
    [fee],
    [securityDeposit],
    [rentAmount],
    [endDate],
    [daysForPayment],
  );
  return txHash;
}
