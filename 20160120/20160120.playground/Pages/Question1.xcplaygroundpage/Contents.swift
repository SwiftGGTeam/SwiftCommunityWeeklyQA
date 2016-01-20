//: ### Question1: Can i have 2 types on parameter in swift?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34786897/can-i-have-2-types-on-parameter-in-swift)
//: ### 问题描述

/*:
楼主想根据传入参数类型，来做不同的处理，见以下的伪代码：
*/
/*
func (parameter: unknownType){
    if(typeof parameter == Int){
        //do this
    }else if(typeof parameter == String){
        //do that
    }
}
*/
//: ### 问题解答

/*:
初看这个问题，以为用泛型就可以解决。但是想到要根据类型做不同的处理，也就是说，需要判断具体类型，然后做一些操作。而泛型跟类型无关。所以用泛型解决不了这个问题。让我们来看看跟帖们的解决方案吧。
*/


//: 方案一：使用重载

class Example
{
    func method(a : String) -> String {
        return a;
    }
    func method(a : UInt) -> String {
        return "{\(a)}"
    }
}

Example().method("Foo") // "Foo"
Example().method(123) // "{123}"

//: 方案二：使用 Any
func foo(bar: Any){
    switch(bar) {
        case let a as String:
            /* String类型的操作 */
            print("The bar is a String, bar = " + a)
        case let a as Int:
            /* Int 类型操作 */
            print("The bar is an Int, bar = \(a)")
        case _ : print("The bar is neither an Int nor a String, bar = \(bar)")
    }
}

/* Example */
var myString = "Hello"
var myInt = 1
var myDouble = 1.5

foo(myString) // The bar is a String, bar = Hello
foo(myInt)    // The bar is an Int, bar = 1
foo(myDouble) // The bar is neither an Int nor a String, bar = 1.5


//：方案三：使用协议

protocol MyProtocol {
    func doSomething()
}

extension Int: MyProtocol {
    func doSomething() {
        print("I am an int")
    }
}

extension String: MyProtocol {
    func doSomething() {
        print("I am a string")
    }
}

func doSomething(parameter: MyProtocol) {
    parameter.doSomething()
}


doSomething(1) // I am an int
doSomething("a") // I am a string
//doSomething(14.0) // 因为Double类型没有扩展实现 MyProtocol 协议，所以报错







//: [上一个问题](@previous)      [下一个问题](@next)
