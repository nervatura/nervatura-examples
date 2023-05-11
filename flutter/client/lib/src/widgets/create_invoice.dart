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
import '../controllers/create_invoice.dart';
import 'shared.dart';

class CreateInvoiceWidget extends StatelessWidget {
  const CreateInvoiceWidget({super.key});

  static const routeName = 'create_invoice';

  Widget resultMessage(String result, String Function(String key) labels,
      void Function()? onDownload) {
    return Card(
      child: Container(
        constraints:
            const BoxConstraints(maxWidth: 500, maxHeight: double.infinity),
        padding: const EdgeInsets.all(24),
        color: Colors.green[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.error, size: 48),
              iconColor: Colors.green,
              title: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    '${labels('newInvoice')} $result',
                    softWrap: true,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 24.0, right: 24, top: 16, bottom: 16),
                      backgroundColor: Colors.green.shade100,
                    ),
                    onPressed: onDownload,
                    child: Text(labels('invoiceDownload')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctr = Provider.of<CreateInvoiceController>(context);
    final app = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.restorablePushNamed(context, '/'),
        ),
        title: Text(ctr.labels('createInvoice')),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          serviceList(app.serverReady, ctr.labels),
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
                    maxWidth: 1200, maxHeight: double.infinity),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(ctr.labels('createInvoice'),
                        style: Theme.of(context).textTheme.headlineSmall),
                    Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        alignment: WrapAlignment.center,
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxWidth: 300),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: ctr.labels('username')),
                                controller: ctr.usernameCtr,
                              ),
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 300),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: ctr.labels('database')),
                                controller: ctr.databaseCtr,
                              ),
                            ),
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
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      alignment: WrapAlignment.center,
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              minLines: 5,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                labelText: 'customer',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                                border: OutlineInputBorder(),
                              ),
                              controller: ctr.customerCtr,
                              readOnly: true,
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              minLines: 5,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                labelText: 'address',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                                border: OutlineInputBorder(),
                              ),
                              controller: ctr.addressCtr,
                              readOnly: true,
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              minLines: 5,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                labelText: 'contact',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                                border: OutlineInputBorder(),
                              ),
                              controller: ctr.contactCtr,
                              readOnly: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      alignment: WrapAlignment.center,
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 450),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              minLines: 5,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                labelText: 'trans',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                                border: OutlineInputBorder(),
                              ),
                              controller: ctr.transCtr,
                              readOnly: true,
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 450),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              minLines: 5,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                labelText: 'items',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                                border: OutlineInputBorder(),
                              ),
                              controller: ctr.itemsCtr,
                              readOnly: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (ctr.error != '') Center(child: errorMessage(ctr.error)),
          if (ctr.invoiceId != '')
            Center(
                child: resultMessage(ctr.invoiceId, ctr.labels,
                    (app.serverReady['backend'] == true) ? ctr.onPdf : null)),
        ],
      ),
    );
  }
}
