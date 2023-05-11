/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app.dart';
import '../controllers/all_api.dart';
import 'shared.dart';

class FnData extends DataTableSource {
  final List<Map<String, dynamic>> _data;
  final AllApiController ctr;

  FnData(this._data, this.ctr);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(ctr.stateIcon(_data[index]['state'])),
        DataCell(Text(_data[index]['apiKey'].toString())),
        DataCell(Text(_data[index]["funcName"].toString())),
      ],
      color: MaterialStateColor.resolveWith((states) =>
          ((_data[index]["enabled"] == false)
              ? Colors.grey.shade100
              : Colors.white)),
    );
  }
}

class AllApiWidget extends StatelessWidget {
  const AllApiWidget({super.key});

  static const routeName = 'all_api';

  @override
  Widget build(BuildContext context) {
    final ctr = Provider.of<AllApiController>(context);
    final app = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.restorablePushNamed(context, '/'),
        ),
        title: Text(ctr.labels('allApi')),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          serviceList(app.enabledService, ctr.labels),
          envList(ctr.env),
          const Divider(
            color: Colors.black,
            height: 25,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Card(
              child: Container(
                constraints: const BoxConstraints(
                    maxWidth: 600, maxHeight: double.infinity),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(ctr.labels('allApi'),
                        style: Theme.of(context).textTheme.headlineSmall),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: ctr.labels('username')),
                          controller: ctr.usernameCtr,
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: ctr.labels('database')),
                          controller: ctr.databaseCtr,
                        ),
                      )),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    (ctr.progress)
                        ? const CircularProgressIndicator()
                        : Padding(
                            padding: const EdgeInsets.all(4),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.only(
                                    left: 24.0, right: 24, top: 16, bottom: 16),
                                backgroundColor: Colors.blueGrey,
                              ),
                              onPressed: ctr.onStart,
                              child: Text(ctr.labels('start')),
                            )),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: ctr.labels('all').toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )),
                                    const TextSpan(text: ': '),
                                    TextSpan(
                                        text: ctr.funcList.length.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: ctr.labels('disabled').toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )),
                                    const TextSpan(text: ': '),
                                    TextSpan(
                                        text: ctr.disabled.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: ctr.labels('returned').toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )),
                                    const TextSpan(text: ': '),
                                    TextSpan(
                                        text: ctr.returned.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 510,
                      child: SingleChildScrollView(
                        child: PaginatedDataTable(
                          source: FnData(ctr.funcList, ctr),
                          columns: [
                            DataColumn(
                                label: Text(
                              ctr.labels('state'),
                              style: const TextStyle(fontSize: 18),
                            )),
                            DataColumn(
                                label: Text(
                              ctr.labels('apiType'),
                              style: const TextStyle(fontSize: 18),
                            )),
                            DataColumn(
                                label: Text(
                              ctr.labels('funcName'),
                              style: const TextStyle(fontSize: 18),
                            )),
                          ],
                          horizontalMargin: 10,
                          rowsPerPage: 8,
                          showCheckboxColumn: false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          if (ctr.error.isNotEmpty)
            Center(child: errorMessage(ctr.error.join('\n'))),
        ],
      ),
    );
  }
}
