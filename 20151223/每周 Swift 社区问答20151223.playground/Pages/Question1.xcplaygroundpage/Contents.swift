//: ### Question1:Code doesn't work on Playground
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/27995)
import Foundation
//: ### 问题描述

//: 提问者说以下代码在 Playground 下运行， `range` 返回`nil`：


var telefone = "+42 43 23123-2221"
let range = telefone.rangeOfString("\\d{4,5}\\-?\\d{4}", options:.RegularExpressionSearch)
print("range \(range)") //here returns nil

/*:
下面回复，实际上是可以的，亲测也是可以，也不知道提问者是不是 Xcode 版本问题，输出结果：
//range Optional(Range(7..<17))\n

*/

//: ### 问题解答

/*:

这个问题是关于正则表达式匹配的，匹配结果返回的是`Range`类型。
然后提问者不甘心，写出了一段很复杂的解决方案：

*/
var telefone = "+55 11 11111‑1111"//字符'‑'和下面正则表达式的字符'-'匹配不上

let phoneNumberRegEx = "(?:(\\+\\d\\d\\s+)?((?:\\(\\d\\d\\)|\\d\\d)\\s+)?)(\\d{4,5}\\-?\\d{4})";
let range = telefone.rangeOfString(phoneNumberRegEx,
    options:.RegularExpressionSearch)
print("range \(range)")
var found = telefone.substringWithRange(range!)
print(found)
let regex = try! NSRegularExpression(pattern: phoneNumberRegEx, options: [])
let telephoneRange = NSMakeRange(0, telefone.characters.count)
let result = regex.firstMatchInString(telefone, options: NSMatchingOptions(rawValue: 0), range: telephoneRange)
let r1 = result!.rangeAtIndex(1)
let r2 = result!.rangeAtIndex(2)
let r3 = result!.rangeAtIndex(3)
if (r1.length > 0) {
    let phoneCountry = (telefone as NSString).substringWithRange(r1)
    print("country: \(phoneCountry)")
}
if (r2.length > 0) {
    let phoneArea = (telefone as NSString).substringWithRange(r2)
    print("area: \(phoneArea)")
}
if (r3.length > 0) {
    let phone = (telefone as NSString).substringWithRange(r3)
    print("phone: \(phone)")
}


//说会报错，下面大神看出了问题：
//原来是字符'‑'和字符'-'用混了。造成匹配不上，range 为 nil。统一改成'-'就好了。
//估计第一个问题也是这样造成的。

//: [上一个问题](@previous)      [下一个问题](@next)
