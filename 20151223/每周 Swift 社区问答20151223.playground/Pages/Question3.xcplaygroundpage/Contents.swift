//: ### Why do we need the keywords "let" and "var" at all ?
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/28673）
import Foundation

//: ### 问题描述

/*:

这个问题没有涉及到代码，提问者写了几段文字，为了表达自己的观点：为神马会有`var`关键字的存在，完全可以去掉：
    
* 定义局部变量时，如果要定义一个常量，可以直接使用`let`,然后其他非常量的情况下，完全可以省略掉`var`, 因为可以直接推断出来啊
* 类中变量定义也是可以类似的来做，`let` 定义常量，没有`let`就是变量

回想一下好像是这么一回事。。。
*/

//: ### 问题解答

/*: 

这个问题引来了 Chris Lattner 的回复。。。，所以得好好说说， Chris 回复的大概意思如下：
首先，Chris 认为这个问题很有意思，说明 Swift 作者也应该思考过这个问题的。的确， Swift 编译器是可以基于提问者的思考，去推断出变量的可变修饰符，加`var` 和没加`var`对于编译器来讲没啥区别。主要基于2个目的来设计的`var`关键字：
    
* human factors：主要是从可读性来讲，显式的声明`var`能够让代码更加可读，有点类似于 Swift 中目前饱受诟病的类型推断一样，目前大部分指南，都推荐你显式定义类型，可读性很高，且编译器不会出错。
* hard cases：在一些复杂的情况下，没有使用`var`和`let`，编译器会很难推断出来是变量还是常量（公共全局变量，公共实例变量等）。所以人为使用`var`和`let`表明你的态度很重要。

*/


//: [上一个问题](@previous)      [下一个问题](@next)
