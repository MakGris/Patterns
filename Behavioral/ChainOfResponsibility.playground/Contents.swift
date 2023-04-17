class Enemy {
    let strenght = 600
}


protocol MilitaryChain {
    var strenght: Int { get }
    var nextRank: MilitaryChain? { get set }
    func shouldDefeatWithStrenght(amount: Int)
    
}

class Soldier: MilitaryChain {
    var strenght = 100
    
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrenght(amount: Int) {
        if strenght > amount {
            print("Soldier defeat enemy")
        } else {
            nextRank?.shouldDefeatWithStrenght(amount: amount)
        }
    }
}

class Officer: MilitaryChain {
    var strenght = 500
    
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrenght(amount: Int) {
        if strenght > amount {
            print("Officer defeat enemy")
        } else {
            nextRank?.shouldDefeatWithStrenght(amount: amount)
        }
    }
}

class General: MilitaryChain {
    var strenght = 1000
    
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrenght(amount: Int) {
        if strenght > amount {
            print("General defeat enemy")
        } else {
            print("Our army can't defeat enemy")
        }
    }
}

let enemy = Enemy()

let soldier = Soldier()
let officer = Officer()
let general = General()

soldier.nextRank = officer
officer.nextRank = general

soldier.shouldDefeatWithStrenght(amount: enemy.strenght)
