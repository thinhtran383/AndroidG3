import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class diemcanhan extends StatefulWidget {
  const diemcanhan({super.key});

  @override
  State<diemcanhan> createState() => _diemcanhanState();
}

class _diemcanhanState extends State<diemcanhan> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Panel List'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              // setState(() {
              //   _data[index].isExpanded = !isExpanded;
              // });
            },
            children: _data.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.header),
                  );
                },
                body: ListTile(
                  title: Text(item.body),
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  }
}