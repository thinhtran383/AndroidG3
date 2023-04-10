import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/data/data.dart';

List<Data> parseData(String responseData) {
  var parsedData = jsonDecode(responseData)['Data']  ;
  return List<Data>.from(parsedData.map((e) => Data.fromJson(e)));;
}

Future<List<Data>> fetchData(
    String userId, String startDate, String endDate) async {
  final apiUrl =
      'https://qldtbeta.phenikaa-uni.edu.vn/sinhvienapi/api/SV_ThongTin/LayDSLichCaNhan';
  final beerKey =
      'Bearer "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Ijc5QkUzRkYxMzI4RjQ5QTM5N0UxNUVGQUY0RTgzODcwOzZkYzBiYzIyMTliMzQ5YTJiNWQ1NWYzMzY4Y2QxMmQxOzIwMjMwNDEwMTAwMTAyIiwibmJmIjoxNjgxMDk1NjYyLCJleHAiOjE2ODM2ODc2NjIsImlhdCI6MTY4MTA5NTY2MiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3QifQ.Z7YRqtFgu37PAV6vqouyv-5WE5bm5AVHZTIDAx3aLfQ"';

  final url =
      '$apiUrl?action=SV_ThongTin%2FLayDSLichCaNhan&type=GET&strQLSV_NguoiHoc_Id=$userId&strNgayBatDau=$startDate&strNgayKetThuc=$endDate';

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
