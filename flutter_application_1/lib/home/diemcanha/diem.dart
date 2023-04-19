import 'package:ClassPlanner/model/data/dataDiem.dart';
import 'package:ClassPlanner/network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class diemcanhan extends StatefulWidget {
  List<DataDiemKetThucHocPhan> data;

  diemcanhan({Key? key, required this.data}) : super(key: key);

  @override
  State<diemcanhan> createState() => _diemcanhanState();
}

class _diemcanhanState extends State<diemcanhan> {
  bool hienthi = false;
  bool hienthi2 = false;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách điểm kết thúc học phần'),
      ),
      body: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.data[index];
          return Card(
            child: ListTile(
              title: Text(item.DAOTAO_HOCPHAN_TEN),
              subtitle: Text('Điểm: ${item.DIEM}'),
              trailing: Text('Điểm quy đổi: ${item.DIEMQUYDOI_TEN}'),
            ),
          );
        },
      ),
    );
  }
}
  

