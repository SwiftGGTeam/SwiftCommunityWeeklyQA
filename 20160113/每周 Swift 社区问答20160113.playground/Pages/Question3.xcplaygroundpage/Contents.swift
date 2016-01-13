//: ### Implicitly lazy static members in Swift
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34667134/implicitly-lazy-static-members-in-swift)
import Foundation
import UIKit

//: ### 问题描述

/*:
楼主的问题是：
如何理解 struct 中的静态变量(static)?
1、在下面的代码中， Baz 类的构造函数只被调用了一次？
2、Foo 结构体中的静态常量 bar 是延迟加载的？

*/

class Baz {
    init(){
        print("initializing a Baz")
    }
}
struct Foo {
    static let bar = Baz()
}

var z = Foo.bar
z = Foo.bar



//: ### 问题解答

/*: 
静态变量(static)本身就是独立于对象存在的。通过类型名来直接访问。且在调用时候只初始化一次，也就是延迟加载的。
由于结构体是值类型，所以可以通过static关键字很方便的实现单例模式。
如果需要绑定到对象，不需要static即可。
*/


struct Foo1 {
    static let cache = NSCache()
    
    // now you might have methods that use this shared `cache`
}

struct Foo2 {
    let bar = Baz()
}

let x = Foo2()
let y = Foo2() //x,y 分别调用了 Baz 的构造函数








//: [上一个问题](@previous)      [下一个问题](@next)
