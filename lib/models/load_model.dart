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
  LoadState loadState = LoadState.auto;
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
    required this.loadState,
  });
  factory LoadModel.fromJson(Map<String, dynamic> map) {
    // print("printing min on time" + map['maxOffTime'].toString());
    LoadState state;
    if (map['stateByUser'] == 1) {
      state = LoadState.forcedOff;
    } else if (map['stateByUser'] == 2) {
      state = LoadState.forcedOn;
    } else {
      state = LoadState.auto;
    }
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
      loadState: state,
    );
  }
  factory LoadModel.fromMap(Map<String, dynamic> map) {
    // print("printing min on time" + map['maxOffTime'].toString());
    LoadState state;
    if (map['stateByUser'] == 1) {
      state = LoadState.forcedOff;
    } else if (map['stateByUser'] == 2) {
      state = LoadState.forcedOn;
    } else {
      state = LoadState.auto;
    }
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
      loadState: state,
    );
  }
  Map<String, Object?> toMap() {
    int value = 0;
    if (loadState == LoadState.forcedOn) {
      value = 2;
    } else if (loadState == LoadState.forcedOff) {
      value = 1;
    } else {
      value = 0;
    }
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
      "loadState": value,
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

enum LoadState { forcedOff, forcedOn, auto }
