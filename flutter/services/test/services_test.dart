import 'package:services/services.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final cli = CliClient('../bin/nervatura', {
      'NT_ALIAS_DEMO': 'sqlite://file:../data/demo.db?cache=shared&mode=rwc'
    });

    setUp(() {
      // Additional setup goes here.
    });

    test('CLI userLogin Test', () async {
      final result = await cli
          .userLogin({'username': 'admin', 'password': '', 'database': 'demo'});
      expect(result.containsKey('error'), isFalse);
    });
  });
}
