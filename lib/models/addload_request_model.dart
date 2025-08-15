class AddloadRequestModel {
  final String deviceName;
  final int priority;
  final int pin;
  final double operationPower;
  final int minOnTime;
  final int maxOnTime;
  final int minOffTime;
  final int maxOffTime;

  AddloadRequestModel({
    required this.pin,
    required this.operationPower,
    required this.deviceName,
    required this.minOnTime,
    required this.maxOnTime,
    required this.minOffTime,
    required this.maxOffTime,
    required this.priority,
  });

  Map<String, dynamic> toJson() {
    return {
      'pin': pin,
      'operationPower': operationPower,
      'deviceName': deviceName,
      'minOnTime': minOnTime,
      'maxOnTime': maxOnTime,
      'minOffTime': minOffTime,
      'maxOffTime': maxOffTime,
      'priority': priority,
    };
  }
}