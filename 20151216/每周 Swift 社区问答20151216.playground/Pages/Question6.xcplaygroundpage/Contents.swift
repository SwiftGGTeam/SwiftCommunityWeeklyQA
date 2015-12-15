//: ### Question6:binary operator '??' cannot be applied to functions?
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/28099)
import Foundation

//: ### 问题描述
// 在 Playground 中运行以下代码：

func f1() {
	return
}
var f2:(()->())?

// 倘若 f2 等于 nil 就执行 f1 函数
let f3 = f2 ?? f1	//<-crash error:binary operator '??' cannot be applied to operands of type '(() -> ())?' and '() -> ()'

//: ### 问题解答

/*:
其实Chris Lattner 大神说了：这就是个已知的 BUG ! 处理 autoclosure 和 function 时已经有人 report 过了。
> 不过呢OOPer还是提供了他自己的解决方式。
*/
var f = f1
let f3 = f2 ?? f  //不再报错

/*:
注意倘若把 var 变成 let 常量定义的话就报错了!
> 即 `let f = f1
let f3 = f2 ?? f  //报错`

> 亲测在swift2 中依然存在这个BUG！希望大家引起注意。
*/



//: [上一个问题](@previous)      [下一个问题](@next)
