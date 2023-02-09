class FarmacoPaziente {
  late int id;
  late String nome, principio, conservazioni, informazioni;

  //paziente
  late String descrizioneBug,
      precauzioniBug,
      posologiaBug,
      controindicazioniBug;

  FarmacoPaziente(
      {required this.id,
      required this.nome,
      required this.principio,
      required this.conservazioni,
      required this.informazioni,
      required this.descrizioneBug,
      required this.precauzioniBug,
      required this.controindicazioniBug,
      required this.posologiaBug});

  FarmacoPaziente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    principio = json['principio'];
    conservazioni = json['conservazioni'];
    informazioni = json['informazioni'];
    posologiaBug = json['posologia_bugiardino'];
    descrizioneBug = json['descrizione_bugiardino'];
    precauzioniBug = json['precauzioni_bugiardino'];
    controindicazioniBug = json['controindicazioni_bugiardino'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['id'] = id;
    data['principio'] = principio;
    data['conservazioni'] = conservazioni;
    data['informazioni'] = informazioni;
    data['descrizione_bugiardino'] = descrizioneBug;
    data['precauzioni_bugiardino'] = precauzioniBug;
    data['controindicazioni_bugiardino'] = controindicazioniBug;
    data['posologia_bugiardino'] = posologiaBug;
    return data;
  }
}

class FarmacoMedico {
  late int id;
  late String nome, principio, conservazioni, informazioni;

  //medico
  late String descrizioneRCP,
      precauzioniRCP,
      posologiaRCP,
      controindicazioniRCP;

  FarmacoMedico(
      {required this.id,
      required this.nome,
      required this.principio,
      required this.conservazioni,
      required this.informazioni,
      required this.descrizioneRCP,
      required this.precauzioniRCP,
      required this.controindicazioniRCP,
      required this.posologiaRCP});

  FarmacoMedico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    principio = json['principio'];
    conservazioni = json['conservazioni'];
    informazioni = json['informazioni'];
    descrizioneRCP = json['descrizione_RCP'];
    precauzioniRCP = json['precauzioni_RCP'];
    controindicazioniRCP = json['controindicazioni_RCP'];
    posologiaRCP = json['posologia_RCP'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['id'] = id;
    data['principio'] = principio;
    data['conservazioni'] = conservazioni;
    data['informazioni'] = informazioni;
    data['descrizione_RCP'] = descrizioneRCP;
    data['precauzioni_RCP'] = precauzioniRCP;
    data['controindicazioni_RCP'] = controindicazioniRCP;
    data['posologia_RCP'] = posologiaRCP;
    return data;
  }
}
