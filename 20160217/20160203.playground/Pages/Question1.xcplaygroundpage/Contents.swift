//: ### Question1: Is “defer” guaranteed to be called in Swift?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35108261/is-defer-guaranteed-to-be-called-in-swift)
//: ### 问题描述

/*:
这个问题比较有意思，楼主贴出以下代码，第一个 defer 顺利执行，而第二个 defer 没有执行。中间夹杂着一个 try 语句抛出了异常。
*/

enum SomeError: ErrorType {
    case BadLuck
}

func unluckey() throws {
    print("\n\tunluckey(💥) -> someone will have a bad day ;)\n")
    throw SomeError.BadLuck
}

func callsUnluckey() throws {
    
    print("callsUnluckey() -> OPENING something")
    defer {
        print("callsUnluckey(😎) -> CLOSEING something")
    }
    
    print("callsUnluckey() -> WORKING with something")
    
    try unluckey()
    print("callsUnluckey() -> will never get here so chill...")
    
    defer {
        print("callsUnluckey(💩) -> why this is not getting called?")
    }
}

do {
    try callsUnluckey()
} catch {
    print("")
    print("someone had a bad day")
}

//: ### 问题解答

/*:

官方文档对这个隐藏逻辑应该没有提到，如果是程序运行中，没有运行到 defer 的代码段，在函数结束之前， defer 代码也不会执行。大家可以试试，去掉 try 语句，加上 return 语句也是一样的效果。也就是说。defer 最好写在 try 和 return 之前。
*/










//: [上一个问题](@previous)      [下一个问题](@next)
