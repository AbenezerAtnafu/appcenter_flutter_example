import 'package:flutter_job_one/service/models/Code.dart';

class OtpScreenArguments {
  final Code code;
  final String phoneNumber;

  OtpScreenArguments({
    required this.code,
    required this.phoneNumber,
  });
}
