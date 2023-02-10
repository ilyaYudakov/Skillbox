import UIKit

class Animal {
    var name: String
    var energy: Int = 0
    var weight: Int
    var age: Int = 0
    var maxAge: Int
    
    var isTooOld: Bool {
        if age >= maxAge {
            return true
        } else {
            return false
        }
    }
    
    init (name: String, energy: Int, weight: Int, maxAge: Int) {
        self.name = name
        self.energy = energy
        self.weight = weight
        self.maxAge = maxAge
    }
    
    func tryIncreamentAge() {
        if Bool.random() {
            age += 1
        }
    }
    
    func eat () {
        energy += 3
        weight += 1
        tryIncreamentAge()
        print("\(name) ест...")
    }
    
    func sleep () {
        energy += 5
        age += 1
        print("\(name) спит...")
    }
    
    func move () {
        energy -= 5
        weight -= 1
        tryIncreamentAge()
        print("\(name) перемещается...")
    }
    
    func giveBirthTo() -> Animal {
        let childName = self.name
        let childEnergy = Int.random(in: 1...10)
        let childWeight = Int.random(in: 1...5)
        let childMaxAge = self.maxAge
        
        let child = Animal(name: childName, energy: childEnergy, weight: childWeight, maxAge: childMaxAge)
        print("Рождено потомство: \(childName), энергия: \(childEnergy), вес: \(childWeight), максимальный возраст: \(childMaxAge)")
        return child
    }
}

class Bird: Animal {
    override func giveBirthTo() -> Animal {
        super.giveBirthTo()
    }
    override func move() {
        super.move()
        print("летит...")
    }
}

class Fish: Animal {
    override func giveBirthTo() -> Animal {
        super.giveBirthTo()
    }
    override func move() {
        super.move()
        print("плывет...")    }
}
    
class Dog: Animal {
    override func giveBirthTo() -> Animal {
        super.giveBirthTo()
    }
    override func move() {
        super.move()
        print("идёт")
    }
}

class NatureReserve {
    var natureReserve: [Animal]
    init(natureReserve: [Animal]) {
        self.natureReserve = natureReserve
    }
}

var nature =  [
    Bird(name: "Орёл", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 9),
    Bird(name: "Ворон", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 6),
    Bird(name: "Сокол", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 4),
    Bird(name: "Ласточка", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 5),
    Bird(name: "Папугай", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 5),
    Fish(name: "Лещ", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 6),
    Fish(name: "Вобла", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 6),
    Fish(name: "Карась", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 7),
    Dog(name: "Шарик", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 10),
    Dog(name: "Жучка", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 11),
    Animal(name: "Лемур", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 13),
    Animal(name: "Бурый медведь", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 15),
    Animal(name: "Слон", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 25),
    Animal(name: "Черепаха", energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), maxAge: 75)
]

while (nature.count < 100) {
    for (index, animal) in nature.enumerated() {
        let randomNum = Int.random(in: 1...4)
        switch randomNum {
        case 1: animal.eat()
        case 2: animal.move()
        case 3: animal.sleep()
        default:
            let newChild = animal.giveBirthTo()
            nature.append(newChild)
        }
        if animal.isTooOld {
            nature.remove(at: index)
            print("\(animal.name) умирает от старости")
        }
        if nature.count == 0 {
            print("Все животные умерли")
        }
    }
    print("""
-----------------------------------------------------
|   Сейчас в заповеднике \(nature.count) животных   |
-----------------------------------------------------
""")
}
