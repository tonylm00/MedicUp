import 'package:frontend/model_object/medico.dart';
import 'package:frontend/model_object/paziente.dart';

class LoginData {
  Paziente paziente = Paziente();
  Medico medico = Medico();

  LoginData({required this.paziente, required this.medico});

  LoginData.fromJson(Map<String, dynamic> json) {
    paziente = (json['paziente'] != null
        ? Paziente.fromJson(json['paziente'])
        : null)!;
    medico = (json['medico'] != null ? Medico.fromJson(json['medico']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.paziente != null) {
      data['paziente'] = this.paziente.toJson();
    }
    if (this.medico != null) {
      data['medico'] = this.medico.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'LoginData{paziente: $paziente, medico: $medico}';
  }
}
