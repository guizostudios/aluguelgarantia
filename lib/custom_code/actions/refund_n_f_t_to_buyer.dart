// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> refundNFTToBuyer(
  String contractAddress,
  String className,
  String id,
  String address,
) async {
  final bigIntId = BigInt.from(int.parse(id));
  final address = BigInt.from(int.parse(address));
  final txHash = await blockchainTransaction(
    contractAddress,
    className,
    'refundNFTToBuyer',
    [bigIntId],
    [address],
  );
  return txHash;
}
