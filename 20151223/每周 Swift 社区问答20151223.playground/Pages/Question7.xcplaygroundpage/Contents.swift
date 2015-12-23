//: ### Question7:Why I can't use let in protocol in Swift?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34385897/why-i-cant-use-let-in-protocol-in-swift)

//: ### 问题描述

//: 楼主问，为啥以下协议定义中的只读存储变量，不能使用`let`定义的常量替代？

protocol someProtocol
{
    var someProperty: String { get }
}

//protocol someProtocol1
//{
//    let someProperty: String
//}

//: ### 问题解答

/*:
`let` 修饰的是常量，而协议里面是不能指定变量的存储方式的，也就是说，如果要在协议里面，要求遵从只读属性，只能使用var和get，也就是`var someProperty: String { get }`这种写法。
在具体定义的类或者结构体中，如果协议是要求只读计算属性，那么具体的实现可以使用`let`修饰，也可以实现`set`操作，也可以是一个存储属性。
*/
protocol MyProtocol {
    var someProperty: String { get }  // abstract interface
}

struct MyStruct: MyProtocol {
    let someProperty: String  // concrete implementation: stored property
}

struct OtherStruct: MyProtocol {
    var str: String
    var someProperty: String {
        get {
            return "\(str)"
        }
        set(newValue) {
            str = newValue
        }
    }  // concrete implementation: computed property
}

var a = MyStruct(someProperty: "")
//a.someProperty = "est"

var b = OtherStruct(str: "test")
b.someProperty
b.someProperty = "other test"
b.str

/*:
也就是说，协议要求只是一个最小化要求。如果协议是定义的`get`和`set`，那么具体实现就不能定义为只读的了：
*/

//protocol MyProtocol1 {
//    var someProperty: String { get set }  // abstract interface
//}
//
//struct OtherStruct1: MyProtocol1 { //错误：candidate is not settable, but protocol requires it
//    var str: String
//    var someProperty: String {
//        get {
//            return "\(str)"
//        }
//        
//    }  // concrete implementation: computed property
//}


//: [上一个问题](@previous)      [下一个问题](@next)
