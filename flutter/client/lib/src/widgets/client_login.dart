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
import '../controllers/client_login.dart';
import 'shared.dart';

class ClientLoginWidget extends StatelessWidget {
  const ClientLoginWidget({super.key});

  static const routeName = 'client_login';

  @override
  Widget build(BuildContext context) {
    final ctr = Provider.of<ClientLoginController>(context);
    final app = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.restorablePushNamed(context, '/'),
        ),
        title: Text(ctr.labels('clientLogin')),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          serviceList(app.serverReady, ctr.labels),
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
                    Text(ctr.labels('clientLoginTitle'),
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
                    if (ctr.responseType == 'authorization')
                      TextField(
                        decoration: InputDecoration(
                            labelText: ctr.labels('clientToken')),
                        style: TextStyle(
                            color: (app.serverReady['backend'] == false)
                                ? Colors.red
                                : Colors.green),
                        controller: ctr.tokenCtr,
                      ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: ctr.labels('clientLogout')),
                      style: TextStyle(
                          color: (app.serverReady['backend'] == false)
                              ? Colors.red
                              : Colors.green),
                      controller: ctr.logoutCtr,
                    ),
                    Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(ctr.labels('responseType'),
                              style: Theme.of(context).textTheme.labelLarge),
                          Padding(
                              padding: const EdgeInsets.all(16),
                              child: DropdownButton<String>(
                                value: ctr.responseType,
                                elevation: 16,
                                onChanged: (String? value) {
                                  ctr.apiType = value!;
                                },
                                items: ctr.response
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(ctr.labels(value)),
                                  );
                                }).toList(),
                              )),
                          Padding(
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
                                onPressed:
                                    ((app.serverReady['ntura'] == false) ||
                                            ((ctr.responseType ==
                                                    'authorization') &&
                                                (app.serverReady['backend'] ==
                                                    false)))
                                        ? null
                                        : ctr.onLogin,
                                child: Text(ctr.labels('login')),
                              )),
                        ]),
                  ],
                ),
              ),
            ),
          ),
          if (ctr.error != '') Center(child: errorMessage(ctr.error)),
        ],
      ),
    );
  }
}
