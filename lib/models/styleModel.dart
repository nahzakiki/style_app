
class Low {
  String? className;
  double? confidence;

  Low({this.className, this.confidence});

  Low.fromJson(Map<String, dynamic> json) {
    className = json['class'];
  confidence = double.parse(json['confidence']);
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['class'] = className;
  data['confidence'] = confidence;
  return data;
  }
}

class StyleModel {
  Low? low;
  Shoe? shoe;
  Top? top;

  StyleModel({this.low, this.shoe, this.top});

  StyleModel.fromJson(Map<String, dynamic> json) {
    low = json['low'] != null ? Low?.fromJson(json['low']) : null;
    shoe = json['shoe'] != null ? Shoe?.fromJson(json['shoe']) : null;
    top = json['top'] != null ? Top?.fromJson(json['top']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['low'] = low!.toJson();
    data['shoe'] = shoe!.toJson();
    data['top'] = top!.toJson();
    return data;
  }
}

class Shoe {
  String? className;
  double? confidence;

  Shoe({this.className, this.confidence});

  Shoe.fromJson(Map<String, dynamic> json) {
    className = json['class'];
  confidence = double.parse(json['confidence']);
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['class'] = className;
  data['confidence'] = confidence;
  return data;
  }
}

class Top {
  String? className;
  double? confidence;

  Top({this.className, this.confidence});

  Top.fromJson(Map<String, dynamic> json) {
    className = json['class'];
  confidence = double.parse(json['confidence']);
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['class'] = className;
  data['confidence'] = confidence;
  return data;
  }
}