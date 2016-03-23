//: ### Question2: Swift syntax for struct: variations ?
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/42887)
//: ### 问题描述

/*:
楼主的问题，如何在结构体里面实现以下的伪代码功能，根据属性的值，定义不同的新属性。以下代码是楼主能想到的代码，但是通不过编译：
*/
import UIKit

struct Item {
    var selectionNum: Int
    var selectionName : String
    var itemCase : Int
    switch itemCase {
    case 0 :
    var paramNum: Int
    var paramImage: NSImage
    case 1 : var paramText: String
}

//: ### 问题解答

/*:
Swift 的枚举，就是为了这种应用场景而设计的，可以使用关联值来解决此问题：
*/


struct Item {
    var selectionNum: Int
    var selectionName : String
    enum ItemCase {
        case Image (a: Int, b: NSURL?)
        case Text (c: String)
    }
    var anItemCase : ItemCase
    init(num: Int, name : String, aCase : ItemCase) {
        selectionNum = num
        selectionName = name
        anItemCase = aCase
    }
}
var example : Item = Item(num: 0, name: "", aCase: .Image(a:1, b:nil))

/*:
请阅读翻译组翻译的经典长文：[Swift 中枚举高级用法及实践](http://swift.gg/2015/11/20/advanced-practical-enum-examples/), 枚举知识一网打尽。
*/




//: [上一个问题](@previous)      [下一个问题](@next)
