//: ### Question2: How to return `[Self]` from a Swift Protocol?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34942852/how-to-return-self-from-a-swift-protocol)
//: ### 问题描述

/*:
以下代码会报错，楼主的的意思是，想返回 Self 类型数组，可是会报错，怎么做才是对的呢？
*/
struct Database {
    
}
protocol DatabaseInjectable {
    
    static func deriveObjectFromDBRow(row: [String]) -> Self? // Method - 1
    
    static func collectAllObjectsForDatabaseAction(action: (Database) -> Void) -> [Self]? // Method - 2
}

class SampleClass: DatabaseInjectable {
    init() {
    }
    static func deriveObjectFromDBRow(row: [String]) -> Self? {
        return nil
    }
    
    // 报错：'Self' is only available in a protocol or as the result of a method in a class;
    static func collectAllObjectsForDatabaseAction(action: (Database) -> Void) -> [Self]? {
            return nil
    }
}

//: ### 问题解答

/*
第一个回答，Self 替换为协议名，如下：
*/

protocol DatabaseInjectable {
    
    static func deriveObjectFromDBRow(row: [String]) -> DatabaseInjectable? // Method - 1
    
    static func collectAllObjectsForDatabaseAction(action: (Database) -> Void) -> [DatabaseInjectable]? // Method - 2
}

/*
不满足需求，因为楼主希望指定具体的类。而不是协议。返回协议只能调用协议的方法。
*/

/*:
第二个回答说，那你可以实现时候，加入 final 修饰类， Self 就可以替换成具体的类了。见下面代码：
*/




final class SampleClass1: DatabaseInjectable {
    init() {
    }
    static func deriveObjectFromDBRow(row: [String]) -> SampleClass1? {
        return SampleClass1()
    }
    
    static func collectAllObjectsForDatabaseAction(action: (Database) -> Void) -> [SampleClass1]? {
        let array = [SampleClass1]()
        return array
    }
}

/*:
可是这个回答不满足楼主的需求，加入了final 关键字，就不能当做父类继承了。
*/


/*:
最后一个回答，我觉得是最好的，使用typealias来指定需要的类型，这样可以指定任何类型：
*/
class Database1 {
    var desc : String = "Default"
}

protocol DatabaseInjectable1 {
    typealias MySelf
    
    static func deriveObjectFromDBRow(row: [String]) -> MySelf?
    
    static func collectAllObjectsForDatabaseAction(action: (Database1) -> Void) -> [MySelf]?
}

class MyClass : DatabaseInjectable1 {
    typealias MySelf = MyClass
    
    static func deriveObjectFromDBRow(row: [String]) -> MySelf? {
        return MyClass()
    }
    
    static func collectAllObjectsForDatabaseAction(action: (Database1) -> Void) -> [MySelf]? {
        return [MyClass(), MyClass()]
    }
}

/* example */
let closure : (Database1) -> () = { print($0.desc) }
var arr : [MyClass]? = MyClass.collectAllObjectsForDatabaseAction(closure)
/* [MyClass, MyClass] */



//: ### 问题思考


/*:
关于 Self 的详细解释，可以参见喵神的文章[接口和类方法中的 SELF](http://swifter.tips/use-self/), 从语义上来讲，Self代表的是类型本身，或者子类。但是放到数组里面去表示该类型的数组，编译器并不支持。即使是编译器允许这样做，那么应该如何去实现这样的方法呢？
如果没有特别强烈的需求，建议使用 typealias 来实现，不过马上 typealias 要被 associatedtype 取代了。有兴趣的可以看看:
[Replace typealias keyword with associatedtype for associated type declarations](https://github.com/apple/swift-evolution/blob/master/proposals/0011-replace-typealias-associated.md)
*/



//: [上一个问题](@previous)      [下一个问题](@next)
