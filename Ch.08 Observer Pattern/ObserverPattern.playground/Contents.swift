import UIKit

protocol Subject: class {
    func addObserver(with: Observer)
    func removeObserver(with: Observer)
    func notifyObserver(with message: String)
}

protocol Observer: class {
    func update(with message: String)
}

class People: Observer {
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func update(with message: String) {
        print("\(name): \(message)")
    }
}

class Store: Subject {
    private var observers = [Observer]()
    
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func addObserver(with observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(with observer: Observer) {
        observers = observers.filter{ $0 !== observer }
    }
    
    func notifyObserver(with message: String) {
        observers.forEach { (observer) in
            observer.update(with: message)
        }
    }
}

let store = Store(name: "XXX服飾店")

let people1 = People(name: "王小明")
let people2 = People(name: "葉大雄")
let people3 = People(name: "金城五")

store.addObserver(with: people1)
store.addObserver(with: people2)
store.addObserver(with: people3)

store.removeObserver(with: people1)

store.notifyObserver(with: "商品已到貨")
