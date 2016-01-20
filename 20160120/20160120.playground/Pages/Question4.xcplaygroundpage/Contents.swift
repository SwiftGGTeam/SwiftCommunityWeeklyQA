//: ### Question4: Swift: Factory Pattern, Subclass methods are not visible
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34825828/swift-factory-pattern-subclass-methods-are-not-visible)
//: ### 问题描述

/*:
楼主想实现工厂模式，于是写下以下代码，报错：
*/

protocol IInterface {
    func InterfaceMethod() -> Void
}

public class SubClass: IInterface {
    init() {}
    
    func InterfaceMethod() { }
    
    public func SubClassMethod() { }
}

public class Factory {
    class func createFactory() -> IInterface {
        return SubClass()
    }
}

let mgr = Factory.createFactory()

mgr.InterfaceMethod()
//mgr.SubClassMethod() // 报错

//: ### 问题解答

/*:
楼主对工厂模式看来理解不深刻，跟帖中做了解释，首先楼主实现的的简单工厂模式，简单工厂会根据对工厂类不同的调用产生最终的使用的类，见跟帖中的例子：
*/

protocol Animal {
    func voice() -> String
}

class Dog: Animal {
    func voice() -> String {
        return "bark"
    }
    
    func sit() {
    }
}

class Cat: Animal {
    func voice() -> String {
        return "meow"
    }
}

class AnimalFactory {
    func getAnimal() -> Animal {
        return Dog()
    }
}


let animalFactory = AnimalFactory()
animalFactory.getAnimal()

//: 稍微做一下改造，就可以根据传入参数，产生不同的 Animal

enum AnimalType {
    case DogType
    case CatType
}

class AnimalFactory1 {
    func getAnimal(type: AnimalType) -> Animal {
        
        switch(type) {
            case .DogType:
                return Dog()
            case .CatType:
                return Cat()
        }
    }
}


let animalFactory1 = AnimalFactory1()
animalFactory1.getAnimal(AnimalType.CatType)


/*:
还有其他 2 种相关的模式：工厂方法模式和抽象工厂模式，具体的模式介绍，请参看[这里](http://www.cnblogs.com/stonehat/archive/2012/04/16/2451891.html) , 大家有兴趣可以自己用 swift 实现。欢迎跟帖！
*/



//: [上一个问题](@previous)      [下一个问题](@next)
