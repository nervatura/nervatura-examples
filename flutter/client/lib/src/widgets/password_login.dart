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
import '../controllers/password_login.dart';
import 'shared.dart';

class PasswordLoginWidget extends StatelessWidget {
  const PasswordLoginWidget({super.key});

  static const routeName = 'password_login';

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
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(
                      softWrap: true,
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: 'token',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          const TextSpan(text: ': '),
                          TextSpan(
                              text: result['token'],
                              style: const TextStyle(
                                fontSize: 16,
                              ))
                        ],
                      ),
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
    final ctr = Provider.of<PasswordLoginController>(context);
    final app = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.restorablePushNamed(context, '/'),
        ),
        title: Text(ctr.labels('passwordLogin')),
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
                    Text(ctr.labels('passwordLoginTitle'),
                        style: Theme.of(context).textTheme.headlineSmall),
                    TextField(
                      decoration:
                          InputDecoration(labelText: ctr.labels('username')),
                      controller: ctr.usernameCtr,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: ctr.labels('password')),
                      obscureText: true,
                      controller: ctr.passwordCtr,
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
                                    onPressed: ctr.onSignIn,
                                    child: Text(ctr.labels('login')),
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
