/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../controllers/external_token.dart';
import 'shared.dart';

class ExternalTokenWidget extends StatelessWidget {
  const ExternalTokenWidget({super.key});

  static const routeName = 'external_token';

  @override
  Widget build(BuildContext context) {
    final ctr = Provider.of<ExternalTokenController>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.restorablePushNamed(context, '/'),
        ),
        title: Text(ctr.labels('externalTokenTitle')),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
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
                    maxWidth: 800, maxHeight: double.infinity),
                padding: const EdgeInsets.all(24),
                child: MarkdownBody(
                  selectable: true,
                  styleSheet: MarkdownStyleSheet(textScaleFactor: 1.2),
                  data: ctr.noteText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
