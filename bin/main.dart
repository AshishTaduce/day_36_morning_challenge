import 'dart:core';
/// Challenge
/// Accounts Merge
// Given a list accounts, each element accounts[i] is a list of strings, where
// the first element accounts[i][0] is a name, and the rest of the elements are
// emails representing emails of the account.
//
// Now, we would like to merge these accounts. Two accounts definitely belong to
// the same person if there is some email that is common to both accounts. Note
// that even if two accounts have the same name, they may belong to different people
// as people could have the same name. A person can have any number of accounts
// initially, but all of their accounts definitely have the same name.
//
// After merging the accounts, return the accounts in the following format: the
// first element of each account is the name, and the rest of the elements are
// emails in sorted order. The accounts themselves can be returned in any order.
/// Example 1:
/// Input:
// accounts = [["John", "johnsmith@mail.com", "john00@mail.com"],
// ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
// ["Mary", "mary@mail.com"]]
/// Output: [["John", 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'],
/// ["John", "johnnybravo@mail.com"], ["Mary", "mary@mail.com"]]

class Account {
  String name;
  List<String> emails = [];

  Account(this.name, this.emails);

  bool duplicateEmail(Account other) {
    return other.emails.any((String email) => this.emails.contains(email));
  }

  Account mergedAccounts(Account other) {
    this.emails.addAll(other.emails);
    return Account(this.name, this.emails.toSet().toList());
  }
}

dynamic accountsMerge(List<List<String>> accounts) {
  List<Account> accountsList = [];

  for (int i = 0; i < accounts.length; i++) {
    List<String> emails = [];

    for (int j = 1; j < accounts[i].length; j++) {
      emails.add(accounts[i][j]);
    }
    accountsList.add(Account(accounts[i][0], emails));
    emails = [];
  }
  // for loop for matching accounts

  for (int i = 0; i < accountsList.length - 1; i++) {
    for (int j = i + 1; j < accountsList.length; j++) {
      if (accountsList[i].duplicateEmail(accountsList[j])) {
        accountsList[i] = accountsList[i].mergedAccounts(accountsList[j]);
        accountsList.removeAt(j);
        j = i;
      }
    }
  }
  List<List<String>> result = [];
  for (int i = 0; i < accountsList.length; i++) {
    List<String> temp = [];
    temp.add(accountsList[i].name);
    accountsList[i].emails.sort();
    temp.addAll(accountsList[i].emails);
    result.add(temp);
  }
  return result;
}

main() {
  print(accountsMerge([
    ["John", "johnsmith@mail.com", "john00@mail.com"],
    ["John", "johnnybravo@mail.com"],
    ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
    ["Mary", "mary@mail.com"]
  ]));
}
