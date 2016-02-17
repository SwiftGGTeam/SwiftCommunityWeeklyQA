//: ### Question5: Swift 2.1 Dictionary extension
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35421820/swift-2-1-dictionary-extension)
//: ### 问题描述

/*:
楼主对 Dictionary 做了一个扩展，报错了。
*/

extension Dictionary where Key: StringLiteralConvertible, Value: AnyObject {
    mutating func auth() -> Dictionary  {
        self.updateValue("2.0", forKey: "api") //Cannot invoke 'updateValue' with an argument list of type '(String, forKey:String)'

        return self
    }
}

//: ### 问题解答

/*:
* 需要显式转换成 Value 和 Key
* 因为 mutating 修饰了函数，所以不用显式返回self，updateValue直接就修改了字典了
*/
extension Dictionary {
    mutating func auth()  {
        updateValue("2.0" as! Value, forKey: "api" as! Key)
    }
}

var dic: [String:AnyObject] = [:]

print(dic)  // "[:]\n"
dic.auth()
print(dic)  // "["api": 2.0]\n"








//: [上一个问题](@previous)      [下一个问题](@next)
