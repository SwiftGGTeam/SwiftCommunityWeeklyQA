//: ### Question1: Extending Protocols With Default Implementation with Enums crashes Xcode
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35821778/extending-protocols-with-default-implementation-with-enums-crashes-xcode)
//: ### 问题描述

/*:
以下代码会在`extension`部分挂掉，playground 会弹出错误提示：Communication with the playground service was interrupted unexpectedly.楼主的本意是想给`specialAbility`提供一个默认值。
*/

enum Ability {
    case Flying
    case Running
    case Swimming
    case Hiding
}

//All animals will conform to this
protocol Animal {
    var name: String { get }
    var specialAbility: Ability { get }
}

struct Dog: Animal {
    var name: String
    var specialAbility: Ability
}

let rex = Dog.init(name: "Rex", specialAbility: .Flying)

// 以下代码会crash
//extension Animal where Self: Dog {
//    var specialAbility: Ability { return .Running }
//}

//
//: ### 问题解答

/*:
从 crash 的提示信息，看不出来是什么错，不知道苹果会不会在3.0修复这些提示不准确的问题。问题是由扩展`Animal`协议造成的，`where`语句的约束条件，不能是一个具体的类，只能是协议。而`Dog`是具体的类，`where`的知识点可以查看官方翻译教程：[Where 子句](http://wiki.jikexueyuan.com/project/swift/chapter2/23_Generics.html#where_clauses)。
要解决默认值的问题，新增一个指定构造器即可:
)
*/

extension Dog {
    init(name: String) {
        self.specialAbility = .Running
        self.name = name
    }
}

let rex1 = Dog.init(name: "Rex")
rex1.specialAbility





//: [上一个问题](@previous)      [下一个问题](@next)
