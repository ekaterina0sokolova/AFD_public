import 'package:flutter/material.dart';
import 'package:a_for_dictation/modules/glossary_module.dart';


class GlossaryScreen extends StatefulWidget {
  @override
  _GlossaryScreenState createState() => _GlossaryScreenState();
}

class _GlossaryScreenState extends State<GlossaryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Словарь'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FutureBuilder<List<DataRow>>(
            future: prepareDataTableRows(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                List<DataRow> rows = snapshot.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight,
                      ),
                      child: DataTable(
                        columns: [
                          DataColumn(label: SizedBox()),
                          DataColumn(label: SizedBox()),
                        ],
                        rows: rows,
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Ошибка при загрузке данных'),
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
