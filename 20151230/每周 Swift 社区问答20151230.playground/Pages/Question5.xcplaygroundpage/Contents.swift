//: ### Question5: Why 'self.self' compiles and run in swift?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34499890/why-self-self-compiles-and-run-in-swift)


//: ### 问题描述

/*
楼主的问题是：为什么 self.self 这样的写法在其他语言会报错，而 Swift 中，不会报错：
*/
class test {
    var someProperty = ""
    func test() {
        print(self.self.someProperty)
    }
}

//: ### 问题解答

/*
实际上，无论支持还是不支持这种语法，一个 self，应该就足够了。
跟帖也在质疑这种用法的实用性在那？例如如下的形式，这样写与只带一个 self，没什么区别：
*/


let s = "Hello".self.self.self.self.self.self.self.self

let s1 = "Hello".self



//: [上一个问题](@previous)      [下一个问题](@next)
