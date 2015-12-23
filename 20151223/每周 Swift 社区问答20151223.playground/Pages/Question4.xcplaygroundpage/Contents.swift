//: ### “If” statement with an optional value not working
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34389158/if-statement-with-an-optional-value-not-working)
import Foundation

//: ### 问题描述


//: 此贴问题比较初级，楼主问的问题也是错误的，但是对于初学者来讲，值得一看。主要是对 Optional 类型的使用和理解。首先我们看看问题：

var x = Optional(6)

if(x == 6) {
    print("x is 6")
}
else
{
    print("x is not 6")
}
//: 楼主说定义了一个值为 Optional("6") 的变量 x， 然后去和数字 6 比较，这段代码在 Playground 运行，因为 Optional("6") 是 Optional<String> 类型的，不能和 Int 进行比较。


//: ### 问题解答

//: x 的类型是一个可选类型，直接使用 if 去和固定值进行比较，编译器会拆包出来真正的值去比较。不过更推荐的做法是，使用 if let 去显式拆包：

var x1 = Optional(6)

if let y = x1 where y == 6  {
    print("x is 6")
}
else
{
    print("x is not 6")
}



//: [上一个问题](@previous)      [下一个问题](@next)
