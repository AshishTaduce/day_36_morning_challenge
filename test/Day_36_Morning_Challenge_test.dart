import 'package:test/test.dart';

import '../bin/main.dart';

void main() {
  test('accounts merge', () {
    expect(
        accountsMerge([
          ["John", "johnsmith@mail.com", "john00@mail.com"],
          ["John", "johnnybravo@mail.com"],
          ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
          ["Mary", "mary@mail.com"]
        ]),
        [
          [
            "John",
            'john00@mail.com',
            'john_newyork@mail.com',
            'johnsmith@mail.com'
          ],
          ["John", "johnnybravo@mail.com"],
          ["Mary", "mary@mail.com"]
        ]);

    expect(
        accountsMerge([
          ['john', 'a', 'b'],
          ['john', 'c', 'd'],
          ['john', 'b', 'c'],
          ['john', 'e', 'd'],
          ['john', 'e', 'f'],
          ["Mary", "mary@mail.com"]
        ]),
        [
          ['john', 'a', 'b', 'c', 'd', 'e', 'f'],
          ['Mary', 'mary@mail.com']
        ]);
  });
}
