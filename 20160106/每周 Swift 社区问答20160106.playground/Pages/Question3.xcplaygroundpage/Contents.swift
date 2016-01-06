//: ### Property for Double and CGFloat
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/29710)
import Foundation
import UIKit

//: ### 问题描述

/*:
Albinus 希望判断是一个随意给定的 number 是否是整型，譬如给定一个 number 是 Double 类型，他现在是通过extension 来实现的，代码如下：

*/

extension Double {
    var isInteger: Bool {
        return Double(self) == Double(Int(self))
    }
}

/*:

注意到通过 extension 扩展了一个computed property `isInteger` ， 布尔类型，判断方式也很简单，是通过类型转换先 Int 去除小数部分（如果有的话），然后再转成 Double 类型，这样做很繁琐，但是 Swift 作为一门强类型语言，类型安全放在首位，任何时候都要先保证类型统一。

再来说说其他数字类型，譬如 CGFloat 、 Float 等等，我们都可以通过 extension 依葫芦画瓢来实现，不过有木有更简单，直观的方式呢？


*/

//: ### 问题解答

/*: 
OOPer 给出了自己解答：
*/


protocol IntegerCheckableFloatType: FloatLiteralConvertible, Equatable {
    func % (lhs: Self, rhs: Self) -> Self   // % 可是取余运算符哦
    var isInteger: Bool {get}
    }
extension IntegerCheckableFloatType {
    var isInteger: Bool {
        return self % 1.0 == 0.0 as Self
    }
}
extension Double: IntegerCheckableFloatType {}
extension CGFloat: IntegerCheckableFloatType {}
extension Float: IntegerCheckableFloatType {}
(123.4).isInteger //->false
(123.0).isInteger //->true


/*:

首先定义 `IntegerCheckableFloatType` 协议，它遵循（实现）了 `FloatLiteralConvertible` 和 `Equatable` 协议，当然协议本身还要求一个 method 以及 read-only property，分别是 `func % (lhs: Self, rhs: Self) -> Self` 和 `isInteger`。

对于 `FloatLiteralConvertible` 协议内容：

*/

typealias FloatLiteralType
/// Create an instance initialized to `value`.
public init(floatLiteral value: Self.FloatLiteralType)


/*:

`FloatLiteralType` 又是什么鬼？其实是`public typealias FloatLiteralType = Double` 正如你所看到其实就是 Double。 只要实现了这个协议的类型就能使用浮点类型**字面量**进行初识化。

`Equatable` 更简单，协议内容如下：

*/

public func ==(lhs: Self, rhs: Self) -> Bool

/*:

从名称就知道这个协议用于 `==` 进行两个数之间的判断了，返回一个布尔类型值来标示是否相等。

现在巧妙的是我们使用了 Protocol 中的 [extension 特性](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID267)，为协议增加了默认行为，如下：

*/

extension IntegerCheckableFloatType {
    var isInteger: Bool {
        return self % 1.0 == 0.0 as Self
    }
}

/*:


根据协议的知识，一个类型遵循了某个协议，那么必须实现该协议中的所有“要求”。但是！倘若你使用了 extension 特性为协议增加了一个默认行为，那么类型遵循了该协议，本身却不实现，则会调用默认行为。就拿上文例子说吧，如果类型遵循了`IntegerCheckableFloatType` 协议却没有实现 `var isInteger:Bool` 这个只读属性，就会调用默认行为`self % 1.0 == 0.0 as Self` ，不过一旦你自己实现了 `var isInteger:Bool`这个协议内容，就会覆盖原有的默认行为。


再来看看后面部分：

extension Double: IntegerCheckableFloatType {}
extension CGFloat: IntegerCheckableFloatType {}
extension Float: IntegerCheckableFloatType {}

我们令 `Double、CGFloat和Float` 遵循自定义协议`IntegerCheckableFloatType`，你可能会问怎么不实现协议内容呢？原因是这些类型本身就已经是实现了`FloatLiteralConvertible` 以及 `Equatable` 协议，另外`func % (lhs: Self, rhs: Self) -> Self` 也是实现的。所以你只需要贴心地用extension对已有类型进行扩展，告知它们是遵循`IntegerCheckableFloatType`即可，想要判断是否是整型，只需要获取`isInteger`属性即可。

*/



//: [上一个问题](@previous)      [下一个问题](@next)
