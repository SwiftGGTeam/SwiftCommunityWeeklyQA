//: ### Question2: map function argument type
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/40451)
//: ### 问题描述

/*:
以下代码在定义`view1`的时候会报错。报错信息:


error: cannot invoke 'map' with an argument list of type '(@noescape (Int) throws -> _)'
let views1 = (1...2).map { _ in

^
note: expected an argument list of type '(@noescape (Self.Generator.Element) throws -> T)'
let views1 = (1...2).map { _ in
*/

import UIKit

func foo() {
    let views1 = (1...2).map { _ in
        let v = UIView()
        return v
    }
    
    let views2 = (1...2).map { _ in
        return UIView()
    }
    
    
}


//: ### 问题解答


/*:
定义一个变量来返回`UIView`实例，`map`方法就不能推断出返回的类型了。需要显式定义view1的类型，就能编译通过了：

*/

import UIKit
func foo() {
    let views1: [UIView] = (1...2).map { _ in
        let v = UIView()
        return v
    }
    
    let views2 = (1...2).map { _ in
        return UIView()
    }
    
}
/*:
类型推断在 Swift 中，是一个很重要的特性。但是目前推断能力还不是很强。推荐大家都显式地定义类型。避免一些莫名其妙的错误出现。
*/

//: [上一个问题](@previous)      [下一个问题](@next)
