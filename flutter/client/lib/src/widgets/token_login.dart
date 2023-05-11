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
import '../controllers/token_login.dart';
import 'shared.dart';

class TokenLoginWidget extends StatelessWidget {
  const TokenLoginWidget({super.key});

  static const routeName = 'token_login';

  Widget resultMessage(Map<String, dynamic> result) {
    return Center(
      child: Card(
        child: Container(
          constraints:
              const BoxConstraints(maxWidth: 600, maxHeight: double.infinity),
          padding: const EdgeInsets.all(20),
          color: Colors.green[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (result.containsKey('database'))
                ListTile(
                  leading: const Icon(Icons.check, size: 48),
                  iconColor: Colors.green,
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'username',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  const TextSpan(text: ': '),
                                  TextSpan(
                                      text: result['username'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'database',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  const TextSpan(text: ': '),
                                  TextSpan(
                                      text: result['database'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'engine',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  const TextSpan(text: ': '),
                                  TextSpan(
                                      text: result['engine'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'version',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  const TextSpan(text: ': '),
                                  TextSpan(
                                      text: result['version'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              if (result.containsKey('empnumber'))
                ListTile(
                  leading: const Icon(Icons.check, size: 48),
                  iconColor: Colors.green,
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'username',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  const TextSpan(text: ': '),
                                  TextSpan(
                                      text: result['username'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'empnumber',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  const TextSpan(text: ': '),
                                  TextSpan(
                                      text: result['empnumber'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'id',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  const TextSpan(text: ': '),
                                  TextSpan(
                                      text: result['id'].toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'scope',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  const TextSpan(text: ': '),
                                  TextSpan(
                                      text: result['scope'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'department',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  const TextSpan(text: ': '),
                                  TextSpan(
                                      text: result['department'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctr = Provider.of<TokenLoginController>(context);
    final app = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.restorablePushNamed(context, '/'),
        ),
        title: Text(ctr.labels('tokenLogin')),
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
                    Text(ctr.labels('tokenLoginTitle'),
                        style: Theme.of(context).textTheme.headlineSmall),
                    TextField(
                      decoration:
                          InputDecoration(labelText: ctr.labels('username')),
                      controller: ctr.usernameCtr,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: ctr.labels('database')),
                      controller: ctr.databaseCtr,
                    ),
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
                                    onPressed: ctr.onValidate,
                                    child: Text(ctr.labels('validate')),
                                  )),
                        ]),
                  ],
                ),
              ),
            ),
          ),
          if (ctr.error != '') Center(child: errorMessage(ctr.error)),
          if (ctr.result.isNotEmpty) resultMessage(ctr.result),
        ],
      ),
    );
  }
}
