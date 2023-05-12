/*
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2023, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE
*/

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../app.dart';

class ExternalTokenController with ChangeNotifier {
  final BuildContext context;

  ExternalTokenController(this.context) {
    loc = AppLocalizations.of(context)!;
    app = context.watch<AppState>();
  }
  late AppLocalizations loc;
  late AppState app;

  String labels(String key) {
    Map<String, String> labels = {
      'appTitle': loc.appTitle,
      'externalToken': loc.externalToken,
      'externalTokenTitle': loc.externalTokenTitle,
    };
    return labels[key].toString();
  }

  Map<String, String> get env => (app.env.isNotEmpty)
      ? {
          'NT_ALIAS_DEMO': app.env['NT_ALIAS_DEMO'].toString(),
          'NT_ALIAS_DEFAULT': 'demo',
          'NT_TOKEN_PUBLIC_KEY_URL':
              app.env['NT_TOKEN_PUBLIC_KEY_URL'].toString(),
        }
      : {};

  final String noteText = """
## **Using external API for token based authentication**
---
One option for allowing your users to login is by using an external identity provider  such as 
Facebook, GitHub, Google or Firebase. Once you successfully authenticate a user with an external 
provider, the service send an Access Token. You can retrieve and use this token to login to the 
Nervatura database.

The tokens may contain the following ID fields (known as claims):
- ***sub, user_id:*** An identifier for the user. Use sub within your 
  application as the unique-identifier key for the user.
- ***email:*** The user's email address. This value may not be unique to 
  this user and is not suitable for use as a primary key. Provided only if your scope 
  included the email scope value.

To match the username, Nervatura processing associates the token fields in the 
following order:

➡ login.***username*** = token.***username*** || token.***user_id*** || 
  token.***sub*** || token.***email***

The user of the database is matched as follows:

➡ login.***username*** = employee.***username*** || employee.***registration_key***

It is recommended that you set the value of the token sub in the registration 
key field of the employee form.

The token fields do not contain the name of the database. To specify this, set the 
**NT_ALIAS_DEFAULT** environment variable.

Grab the public key from **NT_TOKEN_PUBLIC_KEY_URL**. It will be used to verify 
the signature.

✳✳✳ ***This procedure can only be used through the HTTP or gRPC API!*** ✳✳✳

""";
}
