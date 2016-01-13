//: ### Get nth character of a string in Swift programming language
//: > [点击打开问题原地址](http://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language)


//: ### 问题描述

/*
以下代码会报错，String 不提供直接的下标访问字符串里面的字符了。这对于 C 和 C++ 程序员来说，有点不太适应。
*/

var string = "Hello, world!"

var firstChar:Character = string[0] // Throws error

//: ### 问题解答

/*
需要自定义subscript来提供对字符串的访问，内部是通过Range来提供范围进行访问，见以下代码：
*/



extension String {
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[Range(start: start, end: end)]
    }
}


string.characters.first

//: 关于 Swift 2 中对字符串更多的解释，可以查看：[https://developer.apple.com/swift/blog/?id=30](https://developer.apple.com/swift/blog/?id=30)


//: [上一个问题](@previous)      [下一个问题](@next)
