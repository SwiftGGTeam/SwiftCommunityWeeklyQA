//: ### Type *My Custom Class* has no subscript members
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34667955/type-my-custom-class-has-no-subscript-members)

import Foundation
//: ### 问题描述

/*:
楼主想要实现的功能是，定义一个类的构造函数，传入一个字典，使用字典里面的值，赋值给类中的成员变量。但是在赋值语句处报错。

*/

//class Product {
//    
//    var name : String!
//    var type: String!
//    var description: String!
//    var taste: String!
//    var picturePath: String!
//    var pairings: [String]
//    var similar: [String]
//    
//    init(dict: Dictionary<String, AnyObject>) {
//        let props = ["name", "type", "description", "taste", "pairings", "similar"]
//        for prop in props {
//            self[prop] = dict[prop] //报错：Type 'Product' has no subscript members
//        }
//    }
//}


//: ### 问题解答

/*: 

楼下的解答，也比较巧妙，类需要继承 NSObject，也就具有了 OC 的一些特性。在构造函数中使用 Mirror 得到类的结构信息，进一步得到类的成员变量数组，同时使用 oc 的 setValue(,forKey:) 设置对应的成员变量：
*/


class Product : NSObject {
    
    var varDump: AnyObject?
    var name : String?
    var type: String?
    // ...
    
    init(dict: Dictionary<String, AnyObject>) {
        super.init()
        
        let a = Mirror(reflecting: self).children.filter { $0.label != nil }
        for b in a {
            self.setValue(dict[(b.label ?? "")], forKey: (b.label ?? "varDump"))
        }
    }
    
}

var propertyInit = [String:AnyObject]()
propertyInit["name"] = "John"
propertyInit["type"] = "Human"

var a = Product(dict: propertyInit)

print(a.name ?? "Not initalized") // John
print(a.type ?? "Not initalized") // Human



//: [上一个问题](@previous)      [下一个问题](@next)
