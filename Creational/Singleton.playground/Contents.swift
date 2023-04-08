
class MoneyVault {
    
    var money = 0
    static let shared = MoneyVault()
    
    private init() {}
}


let vaultOne = MoneyVault.shared
vaultOne.money += 10000

let vaultTwo = MoneyVault.shared
print(vaultTwo.money)

vaultTwo.money += 5000
print(vaultOne.money)

