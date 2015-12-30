//: ### Question1: Swift regular expressions
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34459701/swift-regular-expressions)
import Foundation
//: ### 问题描述

//: 楼主直接就问：如何在 swift 中使用 [a-zA-Z]+@[a-zA-Z]+.[a-zA-Z] 这样的正则表达式



//: ### 问题解答

/*:

目前在 Swift 中使用正则表达式，还是直接调用 oc 里面的 NSRegularExpression 来完成的。
喵神有一个 tips 专门介绍了这个知识点：
http://swifter.tips/regex/

下面是跟帖的代码，解决了问题：
*/
let test = "someone@somewhere.com"

do {
    let regex = try NSRegularExpression(pattern: "[a-zA-z]+@[a-zA-Z]+.[a-zA-Z]", options: [])
    if regex.firstMatchInString(test, options: [], range: NSMakeRange(0, test.characters.count)) != nil {
        print("matched")
    } else {
        print("not matched")
    }
} catch let error as NSError {
    print(error.localizedDescription)
}



//: [上一个问题](@previous)      [下一个问题](@next)
