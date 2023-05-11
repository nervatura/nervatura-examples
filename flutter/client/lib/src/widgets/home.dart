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
import '../controllers/home.dart';
import 'shared.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final ctr = Provider.of<HomeController>(context);
    final app = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(ctr.labels('appTitle')),
        leading: const CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundImage: AssetImage('assets/images/nervatura_logo.png'),
        ),
        actions: [
          IconButton(
            icon: ctr.themeIcon,
            onPressed: ctr.onTheme,
          ),
        ],
      ),
      body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            serviceList(app.enabledService, ctr.labels),
            const Divider(
              color: Colors.black,
              height: 15,
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
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                    shrinkWrap: true,
                    restorationId: 'exampleListView',
                    itemCount: ctr.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = ctr.items[index];
                      return ListTile(
                          title: Text(
                            ctr.labels(item['title'].toString()),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: ctr.labels(item['subtitle'].toString()) ==
                                      '' ||
                                  !item.containsKey('subtitle')
                              ? null
                              : Text(ctr.labels(item['subtitle'].toString()),
                                  style: const TextStyle(color: Colors.red)),
                          leading: const Icon(Icons.help_outline, size: 32),
                          onTap: () {
                            Navigator.restorablePushNamed(
                              context,
                              item['id'].toString(),
                            );
                          });
                    },
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
