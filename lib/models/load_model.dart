class LoadModel {
  final int pin;
  final int operationPower;
  final String deviceName;
  final String minOnTime;
  final String maxOnTime;
  final String minOffTime;
  final String maxOffTime;
  final String state;
  final int priority;
  String? image;
  LoadModel({
    this.image,
    required this.pin,
    required this.state,
    required this.deviceName,
    required this.operationPower,
    required this.minOnTime,
    required this.maxOnTime,
    required this.minOffTime,
    required this.maxOffTime,
    required this.priority,
  });
  factory LoadModel.fromJson(Map<String, dynamic> map) {
    // print("printing min on time" + map['maxOffTime'].toString());
    return LoadModel(
      image: map['image'],
      pin: map['pin'],
      deviceName: map['name'],
      state: map['state'],
      operationPower: map['power'],
      minOnTime: map["minOnTime"].toString(),
      maxOnTime: map['maxOnTime'].toString(),
      minOffTime: map["minOffTime"].toString(),
      maxOffTime: map["maxOffTime"].toString(),
      priority: map["priority"],
    );
  }
  factory LoadModel.fromMap(Map<String, dynamic> map) {
    // print("printing min on time" + map['maxOffTime'].toString());
    return LoadModel(
      pin: map['pin'],
      image: map['image'],
      deviceName: map['name'],
      state: "OFF",
      operationPower: map['operationPower'],
      minOnTime: map["minOnTime"].toString(),
      maxOnTime: map['maxOnTime'].toString(),
      minOffTime: map["minOffTime"].toString(),
      maxOffTime: map["maxOffTime"].toString(),
      priority: map["priority"],
    );
  }
  Map<String, Object?> toMap() {
    return {
      "name": deviceName,
      "pin": pin,
      "minOnTime": minOnTime,
      "maxOnTime": maxOnTime,
      "minOffTime": minOffTime,
      "maxOffTime": maxOffTime,
      "operationPower": operationPower,
      "priority": priority,
      "image": image,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "deviceName": deviceName,
      "pin": pin,
      "minOnTime": minOnTime,
      "maxOnTime": maxOnTime,
      "minOffTime": minOffTime,
      "maxOffTime": maxOffTime,
      "operationPower": operationPower,
      "priority": priority,
      "image": image,
    };
  }
}
