//: ### Question3: Using guard to check parameters to inits in Swift 2.2
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35545521/using-guard-to-check-parameters-to-inits-in-swift-2-2)
//: ### 问题描述

/*:
以下代码，如果注释掉 guard 语句后面的赋值语句，会报错。楼主不理解这是为什么。
*/
import Foundation

struct Foo{
    
    var url : NSURL
    
    init?(urlString: String){
        
        guard let url = NSURL(string: urlString) else{
            return nil
        }
        
        //self.url = url // 此处注释后， 会报错：return from initializer without initializing all stored properties
    }
}





//: ### 问题解答

/*:
即使是可失败构造器，要么返回nil，要么确保所有存储属性有初始值。而上例中，guard 里面的 url 只是一个临时变量，本身的存储属性没有在init中赋值，所以不能注释掉最后一个语句。

关于可失败构造器，可以查看[官方文档](http://wiki.jikexueyuan.com/project/swift/chapter2/14_Initialization.html#failable_initializers)
*/








//: [上一个问题](@previous)      [下一个问题](@next)
