import 'dart:ffi';

class DataDiemKetThucHocPhan {
  dynamic? DAOTAO_HOCPHAN_TEN;
  dynamic? DANHGIA_TEN;
  dynamic? DIEM;
  dynamic? DIEMQUYDOI;
  dynamic? DIEMQUYDOI_TEN;
  dynamic? HOCKY;
  dynamic? LANHOC;
  dynamic? LANTHI;
  dynamic? NAMHOC;
  DataDiemKetThucHocPhan({
    required this.DAOTAO_HOCPHAN_TEN,
    required this.DANHGIA_TEN,
    required this.DIEM,
    required this.DIEMQUYDOI,
    required this.DIEMQUYDOI_TEN,
    required this.HOCKY,
    required this.LANHOC,
    required this.LANTHI,
    required this.NAMHOC,
  });

  factory DataDiemKetThucHocPhan.fromJson(Map<String, dynamic> json) {
    return DataDiemKetThucHocPhan(
      DAOTAO_HOCPHAN_TEN: json['DAOTAO_HOCPHAN_TEN'],
      DANHGIA_TEN: json['DANHGIA_TEN'],
      DIEM: json['DIEM'],
      DIEMQUYDOI: json['DIEMQUYDOI'],
      DIEMQUYDOI_TEN: json['DIEMQUYDOI_TEN'],
      HOCKY: json['HOCKY'],
      LANHOC: json['LANHOC'],
      LANTHI: json['LANTHI'],
      NAMHOC: json['NAMHOC'],
    );
  }
}
