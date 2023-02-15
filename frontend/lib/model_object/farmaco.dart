class Farmaco {
  int? id;
  String? nome;
  String? principio, tipo;

  //paziente
  String? descrizioneBug,
      precauzioniBug,
      posologiaBug,
      controindicazioniBug,
      informazioniBug;

  //medico
  String? descrizioneRCP,
      precauzioniRCP,
      posologiaRCP,
      controindicazioniRCP,
      informazioniRCP;

  Farmaco(
      {this.id,
      this.nome,
      this.principio,
      this.tipo,
      this.descrizioneBug,
      this.precauzioniBug,
      this.controindicazioniBug,
      this.informazioniBug,
      this.posologiaBug,
      this.descrizioneRCP,
      this.precauzioniRCP,
      this.controindicazioniRCP,
      this.posologiaRCP,
      this.informazioniRCP});

  Farmaco.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    principio = json['principio'];
    tipo = json['tipo'];
    posologiaBug = json['posologiaBugiardino'];
    descrizioneBug = json['descrizioneBugiardino'];
    precauzioniBug = json['precauzioniBugiardino'];
    controindicazioniBug = json['controindicazioniBugiardino'];
    descrizioneRCP = json['descrizioneRCP'];
    informazioniBug = json['informazioniBugiardino'];
    informazioniRCP = json['informazioniRCP'];
    precauzioniRCP = json['precauzioniRCP'];
    controindicazioniRCP = json['controindicazioniRCP'];
    posologiaRCP = json['posologiaRCP'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['id'] = id;
    data['principio'] = principio;
    data['tipo'] = tipo;
    data['descrizione_bugiardino'] = descrizioneBug;
    data['precauzioni_bugiardino'] = precauzioniBug;
    data['controindicazioni_bugiardino'] = controindicazioniBug;
    data['posologia_bugiardino'] = posologiaBug;
    data['descrizione_RCP'] = descrizioneRCP;
    data['precauzioni_RCP'] = precauzioniRCP;
    data['controindicazioni_RCP'] = controindicazioniRCP;
    data['posologia_RCP'] = posologiaRCP;
    return data;
  }
}
