import 'package:ClassPlanner/model/data/dataDiem.dart';
// import 'package:ClassPlanner/network/network_request.dart';
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
  List<ExpansionPanelData> expansionPanelDataList = [];

  @override
  void initState() {
    super.initState();

    // Tạo danh sách ExpansionPanelData từ dữ liệu widget.data
    final Map<String, List<DataDiemKetThucHocPhan>> yearMap = {};
    for (final item in widget.data) {
      final key = '${item.NAMHOC}-Kỳ ${item.HOCKY.toInt()}';
      if (!yearMap.containsKey(key)) {
        yearMap[key] = [];
      }
      yearMap[key]!.add(item);
    }
    expansionPanelDataList = yearMap.entries
        .map((e) => ExpansionPanelData(
              yearAndSemester: e.key,
              dataList: e.value,
              isExpanded: false,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              expansionPanelDataList[index].isExpanded = !isExpanded;
            });
          },
          children: expansionPanelDataList
              .map(
                (expansionPanelData) => ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                          'Năm học ${expansionPanelData.yearAndSemester}'),
                    );
                  },
                  body: Column(
                    children: expansionPanelData.dataList
                        .map((data) => Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Text('${data.DAOTAO_HOCPHAN_TEN}',style: TextStyle(fontWeight: FontWeight.bold, ),),
                                subtitle: Text('${data.DIEMQUYDOI_TEN}'),
                                trailing: Text('${data.DIEM}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 ),),
                              ),
                            ))
                        .toList(),
                  ),
                  isExpanded: expansionPanelData.isExpanded,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class ExpansionPanelData {
  final String yearAndSemester;
  final List<DataDiemKetThucHocPhan> dataList;
  bool isExpanded;

  ExpansionPanelData({
    required this.yearAndSemester,
    required this.dataList,
    required this.isExpanded,
  });
}