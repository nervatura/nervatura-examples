/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'package:flutter/material.dart';

Widget envList(Map<String, String> env) {
  return Wrap(
    spacing: 1.0,
    runSpacing: 1.0,
    alignment: WrapAlignment.center,
    children: env.keys
        .map(
          (value) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: Chip(
              padding: const EdgeInsets.all(8.0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only()),
              label: Text.rich(
                  softWrap: true,
                  maxLines: 5,
                  TextSpan(children: [
                    TextSpan(
                        text: value,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
                    const TextSpan(text: ': '),
                    TextSpan(
                        text: env[value],
                        style: const TextStyle(
                          fontSize: 14,
                        ))
                  ])),
            ),
          ),
        )
        .toList(),
  );
}

Widget serviceList(Map<String, bool> srv, String Function(String key) labels) {
  return Wrap(
    spacing: 2.0,
    runSpacing: 2.0,
    alignment: WrapAlignment.center,
    children: srv.keys
        .map(
          (value) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: Chip(
              avatar: Icon(
                srv[value] == true ? Icons.check : Icons.close,
                color: srv[value] == true ? Colors.green : Colors.red,
              ),
              backgroundColor: Colors.brown.shade200,
              label: Text(labels(value),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        )
        .toList(),
  );
}

Widget errorMessage(String error) {
  return Card(
    child: Container(
      constraints:
          const BoxConstraints(maxWidth: 600, maxHeight: double.infinity),
      padding: const EdgeInsets.all(24),
      color: Colors.red[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.error, size: 48),
            iconColor: Colors.red,
            title: Text(
              error,
              softWrap: true,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}
