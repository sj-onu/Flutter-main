abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited: \$$amount');
    print('Current balance: \$$balance');
  }

  void withdraw(double amount){
    balance -= amount;
    print('Withdrawn: \$$amount');
    print('Current balance: \$$balance');
  }
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      balance += balance * interestRate;
      print('Withdrawn: \$$amount');
      print('Current balance: \$$balance');
    } else {
      print('Insufficient funds!');
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
      print('Withdrawn: \$$amount');
      print('Current balance: \$$balance');
    } else {
      print('Insufficient funds!');
    }
  }
}

main() {
  print('.......Savings Account.......');
  SavingsAccount savingsAccount = SavingsAccount(123456, 10000.0, 0.05);
  print(' Account Number: ${savingsAccount.accountNumber}');
  print('Initial Balance: \$${savingsAccount.balance}');
  savingsAccount.deposit(4000.0);
  savingsAccount.withdraw(2500.0);

  print('.......Current Account.......');
  CurrentAccount currentAccount = CurrentAccount(18101043, 150000.0, 10000.0);
  print(' Account Number: ${currentAccount.accountNumber}');
  print('Initial Balance: \$${currentAccount.balance}');
  currentAccount.deposit(800.0);
  currentAccount.withdraw(3000.0);
}
