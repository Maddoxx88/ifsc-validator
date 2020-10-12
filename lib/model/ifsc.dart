class IfscFetch {
  String bRANCH;
  String cENTRE;
  String dISTRICT;
  String sTATE;
  String aDDRESS;
  String cONTACT;
  bool uPI;
  bool rTGS;
  String cITY;
  bool nEFT;
  bool iMPS;
  String mICR;
  String bANK;
  String bANKCODE;
  String iFSC;

  IfscFetch(
      {this.bRANCH,
      this.cENTRE,
      this.dISTRICT,
      this.sTATE,
      this.aDDRESS,
      this.cONTACT,
      this.uPI,
      this.rTGS,
      this.cITY,
      this.nEFT,
      this.iMPS,
      this.mICR,
      this.bANK,
      this.bANKCODE,
      this.iFSC});

  IfscFetch.fromJson(Map<String, dynamic> json) {
    bRANCH = json['BRANCH'];
    cENTRE = json['CENTRE'];
    dISTRICT = json['DISTRICT'];
    sTATE = json['STATE'];
    aDDRESS = json['ADDRESS'];
    cONTACT = json['CONTACT'];
    uPI = json['UPI'];
    rTGS = json['RTGS'];
    cITY = json['CITY'];
    nEFT = json['NEFT'];
    iMPS = json['IMPS'];
    mICR = json['MICR'];
    bANK = json['BANK'];
    bANKCODE = json['BANKCODE'];
    iFSC = json['IFSC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BRANCH'] = this.bRANCH;
    data['CENTRE'] = this.cENTRE;
    data['DISTRICT'] = this.dISTRICT;
    data['STATE'] = this.sTATE;
    data['ADDRESS'] = this.aDDRESS;
    data['CONTACT'] = this.cONTACT;
    data['UPI'] = this.uPI;
    data['RTGS'] = this.rTGS;
    data['CITY'] = this.cITY;
    data['NEFT'] = this.nEFT;
    data['IMPS'] = this.iMPS;
    data['MICR'] = this.mICR;
    data['BANK'] = this.bANK;
    data['BANKCODE'] = this.bANKCODE;
    data['IFSC'] = this.iFSC;
    return data;
  }
}
