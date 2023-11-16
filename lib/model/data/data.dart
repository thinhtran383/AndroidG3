class Data {
  dynamic TENHOCPHAN;
  dynamic THU;
  dynamic SOTIET;
  dynamic TIETBATDAU;
  dynamic TIETKETTHUC;
  dynamic TENPHONGHOC;
  dynamic BUOIHOC;

  Data(
      {required this.BUOIHOC,
      required this.SOTIET,
      required this.TENHOCPHAN,
      required this.TENPHONGHOC,
      required this.THU,
      required this.TIETBATDAU,
      required this.TIETKETTHUC});


  factory Data.fromJson(Map<String, dynamic> json){
  
    return Data(
    TENHOCPHAN : json["TENHOCPHAN"],
    THU : json['THU'],
    SOTIET : json['SOTIET'],
    TIETBATDAU:json['TIETBATDAU'],
    TIETKETTHUC:json['TIETKETTHUC'],
    TENPHONGHOC:json['TENPHONGHOC'],
    BUOIHOC:json['BUOIHOC'],
    );

  }

}
