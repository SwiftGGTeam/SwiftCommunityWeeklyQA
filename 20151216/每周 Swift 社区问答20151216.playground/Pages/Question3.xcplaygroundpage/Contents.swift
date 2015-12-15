//: ### Question3:Failable initialisers and unbound instance vars
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/27743)
import Foundation

//: ### 问题描述
// 请仔细看这段代码：

// 代码片段1
class Foo {
	let a :Int
	let b : Int
	
	init?(name: String, m: Int, n: Int){
		if name != "fistro" {
			a = m
			b = n
		}else{
			return nil //<-crash here
		}
	}
}

/*:
小小疑惑：

编译器报错在 else{} 内并未对 a,b 进行变量初始化，但是其实提问者是想说，既然是一个可失败的构造器，为什么一定要对 a,b进行赋值才能返回 nil 呢？

*/

//: ### 问题解答
// Jessy提供了这么一个方法:
// Ps: 先把代码片段1完全注释掉。
class NewFoo {
	let a :Int
	let b : Int
	
	init?(name: String, m: Int, n: Int){
		a = m
		b = n
		// guard 用法倘若还不知晓 请花5分钟阅读下这篇文章
		// http://www.jianshu.com/p/eb718439551f
		guard name == "fistro" else { return nil }
	}
}

// ========================================================
// 号外！ 号外！
// Chris Lattner大神（swift之父）说：
// 这是 Swift 2.1 版本的限制，在即将发布的 Swift 2.2 中已经修复啦
// ========================================================

//: 最后给个stackoverflow类似问题链接：
//: [最佳的可失败构造器方案](http://stackoverflow.com/questions/26495586/best-practice-to-implement-a-failable-initializer-in-swift)

//: [上一个问题](@previous)      [下一个问题](@next)
