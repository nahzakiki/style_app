
class Low {
  String? className;
  double? confidence;
  String? base64;

  Low({this.className, this.confidence, this.base64});

  Low.fromJson(Map<String, dynamic> json) {
    className = json['class'];
    confidence = double.parse(json['confidence']);
    base64 = json['base64'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['class'] = className;
  data['confidence'] = confidence;
  data['base64'] = base64;
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
  String? base64;

  Shoe({this.className, this.confidence, this.base64});

  Shoe.fromJson(Map<String, dynamic> json) {
    className = json['class'];
    confidence = double.parse(json['confidence']);
    base64 = json['base64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['class'] = className;
    data['confidence'] = confidence;
    data['base64'] = base64;
    return data;
  }
}

class Top {
  String? className;
  double? confidence;
  String? base64;

  Top({this.className, this.confidence, this.base64});

  Top.fromJson(Map<String, dynamic> json) {
    className = json['class'];
    confidence = double.parse(json['confidence']);
    base64 = json['base64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['class'] = className;
    data['confidence'] = confidence;
    data['base64'] = base64;
    return data;
  }
}