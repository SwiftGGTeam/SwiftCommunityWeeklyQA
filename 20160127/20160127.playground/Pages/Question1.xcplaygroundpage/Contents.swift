//: ### Question1: Understanding Enums with Functions as Associated Values in Swift
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34947679/understanding-enums-with-functions-as-associated-values-in-swift)
//: ### 问题描述

/*:
楼主的问题是，在 Swift 的枚举类型中，如何理解关联值参数允许传入函数类型（闭包）？楼主可以理解以下代码，关联值只包含一些基本数据结构：
*/

enum Homework{
    case InProgress(Int, Int)
    case Complete
}

let load = Homework.InProgress(50, 100)

switch load {
case .InProgress(let done, let total):
    print("\(done) out of \(total)")
    
case .Complete:
    print("complete")
}

//: ### 问题解答

/*:
其实函数在 Swift 是一等公民，可以在当做参数传入和右值使用。这是 Swift 函数式编程的基础。特别用在枚举类型的关联值中，能够做一些附加处理，见下面的例子：
*/

enum Error: ErrorType {
    case Temporary(message: String, recovery: () -> Void)
    case Final(message: String)
}

func reconnect() {}

let err = Error.Temporary(
    message: "Network down",
    recovery: { reconnect() } // 重试操作
)

switch err {
case let .Temporary(message, recovery):
    print(message)
    recovery()
case let .Final(message):
    print(message)
    fatalError()
}

/*:
关于枚举的高级用法，可以参见我们翻译组的翻译的长文，值得一读：[Swift 中枚举高级用法及实践](http://swift.gg/2015/11/20/advanced-practical-enum-examples/)
*/






//: [上一个问题](@previous)      [下一个问题](@next)
