import '../../../model/data/dataDiem.dart';

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