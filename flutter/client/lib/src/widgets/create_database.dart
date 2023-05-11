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
import '../controllers/create_database.dart';
import 'shared.dart';

class CreateDatabaseWidget extends StatelessWidget {
  const CreateDatabaseWidget({super.key});

  static const routeName = 'create_database';

  @override
  Widget build(BuildContext context) {
    final ctr = Provider.of<CreateDatabaseController>(context);
    final app = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.restorablePushNamed(context, '/'),
        ),
        title: Text(ctr.labels('createDatabase')),
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
            height: 20,
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
                    Text(ctr.labels('createDatabaseTitle'),
                        style: Theme.of(context).textTheme.headlineSmall),
                    TextField(
                      decoration:
                          InputDecoration(labelText: ctr.labels('apiKey')),
                      controller: ctr.apiKeyCtr,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: ctr.labels('alias')),
                      obscureText: true,
                      controller: ctr.aliasCtr,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(ctr.labels('demo'),
                              style: Theme.of(context).textTheme.labelLarge),
                          Switch(
                            value: ctr.demo,
                            //activeColor: Colors.red,
                            onChanged: (bool value) {
                              ctr.demo = value;
                            },
                          ),
                        ]),
                    Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(ctr.labels('apiType'),
                              style: Theme.of(context).textTheme.labelLarge),
                          Padding(
                              padding: const EdgeInsets.all(16),
                              child: DropdownButton<String>(
                                value: ctr.apiType,
                                elevation: 16,
                                onChanged: (String? value) {
                                  ctr.apiType = value!;
                                },
                                items: app.enabledService.keys
                                    .toList()
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value.toUpperCase()),
                                  );
                                }).toList(),
                              )),
                          (ctr.progress)
                              ? const CircularProgressIndicator()
                              : Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                          left: 24.0,
                                          right: 24,
                                          top: 16,
                                          bottom: 16),
                                      backgroundColor: Colors.blueGrey,
                                    ),
                                    onPressed: ctr.onCreate,
                                    child: Text(ctr.labels('create')),
                                  )),
                        ]),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          if (ctr.error != '') Center(child: errorMessage(ctr.error)),
          if (ctr.result.isNotEmpty)
            DataTable(
              columns: [
                DataColumn(label: Text(ctr.labels('stamp'))),
                DataColumn(label: Text(ctr.labels('info'))),
                DataColumn(label: Text(ctr.labels('result')))
              ],
              rows: ctr.result.map<DataRow>((row) {
                return DataRow(
                  cells: [
                    DataCell(Text(row['stamp'].toString())),
                    DataCell(Text(row["info"].toString())),
                    DataCell(Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        row["result"].toString(),
                        softWrap: true,
                      ),
                    )),
                  ],
                  color: MaterialStateColor.resolveWith((states) =>
                      ((row["info"] == 'error')
                          ? Colors.red.shade50
                          : Colors.green.shade50)),
                );
              }).toList(),
              horizontalMargin: 10,
              showBottomBorder: true,
              headingRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.black12),
              showCheckboxColumn: false,
            ),
        ],
      ),
    );
  }
}
