import 'dart:convert';

import 'package:ClassPlanner/model/data/dataDiem.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/data/data.dart';
import '../model/data/dataDiem.dart';

List<Data> parseData(String responseData) {
  var parsedData = jsonDecode(responseData)['Data']  ;
  return List<Data>.from(parsedData.map((e) => Data.fromJson(e)));;
}

List<DataDiemKetThucHocPhan> parseDataDiem(String responseData) {
  var parsedData = jsonDecode(responseData)['Data']['rsDiemKetThucHocPhan']  ;
  return List<DataDiemKetThucHocPhan>.from(parsedData.map((e) => DataDiemKetThucHocPhan.fromJson(e)));;
}

Future<List<Data>> fetchData(String userId, String startDate, String endDate) async {
  final apiUrl =
      'https://qldtbeta.phenikaa-uni.edu.vn/sinhvienapi/api/SV_ThongTin/LayDSLichCaNhan';
  final beerKey =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Ijc5QkUzRkYxMzI4RjQ5QTM5N0UxNUVGQUY0RTgzODcwOzZkYzBiYzIyMTliMzQ5YTJiNWQ1NWYzMzY4Y2QxMmQxOzIwMjMwNDEwMTAwMTAyIiwibmJmIjoxNjgxMDk1NjYyLCJleHAiOjE2ODM2ODc2NjIsImlhdCI6MTY4MTA5NTY2MiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3QifQ.Z7YRqtFgu37PAV6vqouyv-5WE5bm5AVHZTIDAx3aLfQ';

  final url =
      '$apiUrl?action=SV_ThongTin%2FLayDSLichCaNhan&type=GET&strQLSV_NguoiHoc_Id=$userId&strNgayBatDau=$startDate&strNgayKetThuc=$endDate&strChucNang_Id=B46109CD333D4E3DAC50D43E8607ED46';

  final response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': beerKey},
  );

  if (response.statusCode == 200) {
   

    return compute(parseData, response.body);
    
    
  } else {
    // Lỗi xảy ra khi lấy dữ liệu từ API
    print('Lỗi ${response.statusCode}: ${response.reasonPhrase}');
  }
  throw Exception('Some error occurred');
}



Future<List<DataDiemKetThucHocPhan>> fetchDataDiemKetThucHocPhan() async {
  final apiUrl =
      'https://qldtbeta.phenikaa-uni.edu.vn/sinhvienapi/api/SV_ThongTin/KetQuaHocTapCaNhan?action=SV_ThongTin%2FKetQuaHocTapCaNhan&strChucNang_Id=458922CCB7064213A3D94F7511852261&strQLSV_NguoiHoc_Id=7EEE02F6121340B98E4F0530ECB0AD84&strDaoTao_ChuongTrinh_Id=68F33FEDF14D4576943E7AFE6E05F84A&strNguoiThucHien_Id=7EEE02F6121340B98E4F0530ECB0AD84';
  final beerKey =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Ijc5QkUzRkYxMzI4RjQ5QTM5N0UxNUVGQUY0RTgzODcwOzZkYzBiYzIyMTliMzQ5YTJiNWQ1NWYzMzY4Y2QxMmQxOzIwMjMwNDEwMTAwMTAyIiwibmJmIjoxNjgxMDk1NjYyLCJleHAiOjE2ODM2ODc2NjIsImlhdCI6MTY4MTA5NTY2MiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3QifQ.Z7YRqtFgu37PAV6vqouyv-5WE5bm5AVHZTIDAx3aLfQ';

  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {'Authorization': beerKey},
  );

  if (response.statusCode == 200) {
    // print(response.body);
   
  // var parsedData = jsonDecode(response.body)['Data']['rsDiemKetThucHocPhan'][6] ;

//  print(parsedData);
    return compute(parseDataDiem, response.body);
    
    
  } else {
    // Lỗi xảy ra khi lấy dữ liệu từ API
    print('Lỗi ${response.statusCode}: ${response.reasonPhrase}');
  }
  throw Exception('Some error occurred');
}
