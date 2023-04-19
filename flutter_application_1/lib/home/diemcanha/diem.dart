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
  @override
  Widget build(BuildContext context) {
    final Map<String, List<DataDiemKetThucHocPhan>> yearMap = {};
    for (final item in widget.data) {
      final key = '${item.NAMHOC}-${item.HOCKY}';
      if (!yearMap.containsKey(key)) {
        yearMap[key] = [];
      }
      yearMap[key]!.add(item);
    }

    final List<ExpansionPanel> expansionPanels = yearMap.entries.map((e) {
      final String yearAndSemester = e.key;
      final List<DataDiemKetThucHocPhan> dataList = e.value;

      final List<Widget> dataListWidget = dataList.map((data) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            
            title: Text('${data.DAOTAO_HOCPHAN_TEN}'),
            subtitle: Text('${data.DIEMQUYDOI_TEN}'),
            trailing: Text('${data.DIEM}'),
          ),
        );
      }).toList();

      final List<String> yearAndSemesterList = yearAndSemester.split('-');
      final String year = yearAndSemesterList[0];
      final String semester = yearAndSemesterList[1];

      return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text('Năm học $year - Học kỳ $semester'),
          );
        },
        body: Column(
          children: dataListWidget,
        ),
        isExpanded: false,
      );
    }).toList();

    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
        child: ExpansionPanelList(
          
          expansionCallback: (int index, bool isExpanded) {},
          children: expansionPanels,
        ),
      ),
    );
  }
}