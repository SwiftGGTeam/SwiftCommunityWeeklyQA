//: ### Question4:Read-only property
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/27892)
import Foundation

//: ### 问题描述

//: 日常项目开发中，我们会遇到一些 Access Control 的问题。
//: 譬如，我想要在类中实现一个属性对外是readonly(可读)，对内是write and read(可读写)。
//: 那么如何实现是最好的呢？下面提供一个简单的思路。

//: ### 问题解答

class MyClass{
	// 对内可修改属性
	private var gip: Bool = false
	// 这是一个对外的可读属性
	var gameInProgress: Bool {
		return gip
	}
}

//: 不过这并不是一个最佳的选择，希望有知道的小伙伴可以私信me。

//: [上一个问题](@previous)      [下一个问题](@next)
