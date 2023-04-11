

class FruitShop {
    func buyFruits() -> String {
        return "fruits"
    }
}

class MeatShop {
    func buyMeat() -> String {
        return "meat"
    }
}

class MilkShop {
    func buyMilk() -> String {
        return "milk"
    }
}

//Facade

class SuperMarket {
    
    private let fruitShop = FruitShop()
    private let meatShop = MeatShop()
    private let milkShop = MilkShop()
    
    func buyProducts() -> String {
        
        var products = ""
        products += fruitShop.buyFruits() + ", "
        products += meatShop.buyMeat() + ", "
        products += milkShop.buyMilk()
        return "I bought: \(products)"
    }
}

let superMarket = SuperMarket()
superMarket.buyProducts()
