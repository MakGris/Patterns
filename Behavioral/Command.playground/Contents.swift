//class Account {
//    var accountName: String
//    var accountBalance: Int
//
//    init(name: String, balance: Int) {
//        accountName = name
//        accountBalance = balance
//    }
//}
//
//protocol Command {
//    func execute()
//    var isComplete: Bool { get set }
//}
//
//class Deposite: Command {
//
//    private var account: Account
//    private var amount: Int
//    var isComplete = false
//
//    init(account: Account, amount: Int) {
//        self.account = account
//        self.amount = amount
//    }
//
//    func execute() {
//        account.accountBalance += amount
//        isComplete = true
//    }
//}
//
//class WithDraw: Command {
//
//    private var account: Account
//    private var amount: Int
//    var isComplete = false
//
//    init(account: Account, amount: Int) {
//        self.account = account
//        self.amount = amount
//    }
//
//    func execute() {
//        if account.accountBalance >= amount {
//            account.accountBalance -= amount
//            isComplete = true
//        } else {
//            print("Not enough money")
//        }
//    }
//}
//
//class TransactionManager {
//
//    static let shared = TransactionManager()
//    private init() {}
//
//    private var transactions: [Command] = []
//
//    func addTransaction(command: Command) {
//        transactions.append(command)
//    }
//
//    var pendingTransactions: [Command] {
//        get {
//            return transactions.filter {$0.isComplete == false}
//        }
//    }
//
//    func processingTransactions() {
//        transactions.filter {$0.isComplete == false}.forEach {$0.execute()}
//    }
//}
//
//let account = Account(name: "Maksim", balance: 1000)
//
//let transactionManager = TransactionManager.shared
//
//transactionManager.addTransaction(command: WithDraw(account: account, amount: 500)) //Добавление транзцакции в очередь на выполнение
//transactionManager.addTransaction(command: Deposite(account: account, amount: 1000)) //Добавление транзцакции в очередь на выполнение
//transactionManager.pendingTransactions // Массив с транзакциями, которые еще не проведены
//transactionManager.processingTransactions() // Проведение транзакций
//
//print(account.accountBalance)

class BankAccount {
    var accountName: String
    var balance: Int
    
    init(name: String, balance: Int) {
        accountName = name
        self.balance = balance
    }
}

protocol Command {
    func execute()
    var isComplete: Bool { get set }
}

class Deposite: Command {
    private var account: BankAccount
    private var amount: Int
    var isComplete = false
    
    init(account: BankAccount, amount: Int) {
        self.account = account
        self.amount = amount
    }
    
    
    func execute() {
        account.balance += amount
        isComplete = true
    }
}

class TransactionManager {
    
    static let shared = TransactionManager()
    private init() {}
    
    private var transactions: [Command] = []
    
    func addTransaction(command: Command) {
        transactions.append(command)
    }
    
    var pendingTransactions: [Command] {
        get {
            return transactions.filter{$0.isComplete == false}
        }
    }
    
    func processingTransactions() {
        transactions.filter{$0.isComplete == false}.forEach{$0.execute()}
    }
}
