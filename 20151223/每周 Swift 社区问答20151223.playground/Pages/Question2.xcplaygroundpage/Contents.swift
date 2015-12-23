//: ### Question2:Array cannot be bridged from Objective-C
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/28678)
import Foundation
import UIKit
//: import XCTest---playground 目前还不支持测试框架

//: ### 问题描述

//: 以下代码会在`testUnbridgableArrayOfPs `函数中报错:

protocol P {
    var name: String { get }
}
class PImpl: P {
    let name: String
    init(name: String) {
        self.name = name
    }
}

func unbridgableArrayOfPs() -> [P] {
    let pees = [PImpl(name: "A"), PImpl(name: "B"), PImpl(name: "C")]
    //let pees: [P] = [PImpl(name: "A"), PImpl(name: "B"), PImpl(name: "C")]

    //let pees = [PImpl(name: "A"), PImpl(name: "B"), PImpl(name: "C")] as [P]
    return pees
//    let pees = [PImpl(name: "A"), PImpl(name: "B"), PImpl(name: "C")]
//    let peesAsArrayP: [P] = pees.map{$0 as P}
//    return peesAsArrayP
    
}

func arrayOfPs() -> [P] {
    return [PImpl(name: "A"), PImpl(name: "B"), PImpl(name: "C")]
}

func testUnbridgableArrayOfPs() {
    let p = unbridgableArrayOfPs() // Fails with fatal error: array cannot be bridged from Objective-C
    let result = p.map{$0.name}.joinWithSeparator("")
    //XCTAssertEqual(result, "ABC")
}

func testArrayOfPs() {
    let p = arrayOfPs() // We get our P's
    let result = p.map{$0.name}.joinWithSeparator("")
   // XCTAssertEqual(result, "ABC")
}

testUnbridgableArrayOfPs()
testArrayOfPs()

/*:
提问者还用了`XCTAssertEqual `来进行测试，但是 Playground不支持`XCTest`测试框架，所以代码我就现注释掉了。
提问者吐槽，定义了变量，使用了类型推断，就会报错。直接返回就不会。。
*/

//: ### 问题解答

/*: 

 不使用类型推断，定义时候，直接指定类型，就没有问题了：


 let pees: [P] = [PImpl(name: "A"), PImpl(name: "B"), PImpl(name: "C")]

类型推断会把`pees` 推断为`PImpl `类型，虽然`PImpl `遵从协议`P`，目前还是需要显式做一下声明或者转换。`OOPer` 还提供了以下 2 种转换方式：

 let pees = [PImpl(name: "A"), PImpl(name: "B"), PImpl(name: "C")] as [P]

 let pees = [PImpl(name: "A"), PImpl(name: "B"), PImpl(name: "C")]

 let peesAsArrayP: [P] = pees.map{$0 as P}

 return peesAsArrayP
*/



//: [上一个问题](@previous)      [下一个问题](@next)
