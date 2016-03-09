//: ### Question4: Swift array of generics
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35818195/swift-array-of-generics)
//: ### 问题描述

/*:
楼主定义了一个泛型结构体，声明2个变量后，想把这2个变量塞到一个数组里面去，数组定义为[Thing],编译报错。
*/

struct Thing<T> {
}

let intThing = Thing<Int>()
let stringThing = Thing<String>()

// 编译错误：Cannot convert value of type 'Thing<Int>' to expected type 'Thing'
//let things: [Thing] = [intThing, stringThing]





//: ### 问题解答

/*
Thing是一个泛型结构体，不能直接使用[Thing]表明一个数组。只能通过万能的Any来符合编译器的规则。不过这样做，显然就不能直接使用Thing里面的方法了，得做一下转换：
*/

let things: [Any] = [intThing, stringThing]

var intThing1 = things[0] as! Thing<Int>

/*:
如果想要直接[Thing]这样的语法，可以使用枚举, 而使用枚举，就不能使用泛型了：
*/


enum Thing {
    case Text(String)
    case Integer(Int)
}
let thingWithText = Thing.Text("Hello world")
let thingWithInt = Thing.Integer(123)

let things = [thingWithText, thingWithInt]

things.forEach { (thing) -> () in
    switch thing {
    case .Text(let text): print(text)
    case .Integer(let integer): print(integer)
    }
}

/*:
翻译组翻译了一篇关于枚举使用的很详细的文章:[Swift 中枚举高级用法及实践](http://swift.gg/2015/11/20/advanced-practical-enum-examples/)，值得一看！
*/

//: [上一个问题](@previous)      [下一个问题](@next)
