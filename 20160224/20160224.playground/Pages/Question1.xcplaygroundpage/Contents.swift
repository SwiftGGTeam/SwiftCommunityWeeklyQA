//: ### Question1: Swift Dictionary: Can't completely remove entry
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35494051/swift-dictionary-cant-completely-remove-entry)
//: ### 问题描述

/*:
以下代码中，并没有按照楼主的想法输出:
*/

import UIKit

var questions: [[String:Any]] = [
    [
        "question": "What is the capital of Alabama?",
        "answer": "Montgomery"
    ],
    [
        "question": "What is the capital of Alaska?",
        "answer": "Juneau"
    ]
]

var ask1 = questions[0]
var ask2 = ask1["question"]

print(ask2!) // 输出：What is the capital of Alabama?

questions[0].removeAll()

ask1 = questions[0] // ask1 这时候为：[:]
ask2 = ask1["question"] //ask2=nil  楼主想得到：Should be "What is the capital of Alaska?"

/*:
楼主认为使用removeAll是把index=0的元素从字典中删除，所以再次使用index = 0 获取字典的元素时候，就会获取到下一个元素。*/

//: ### 问题解答

/*:
实际上，removeAtIndex才是楼主想要的方法，而 removeAll 仅仅是将当前元素清空为一个空元素。见以下代码：
*/

questions.removeAtIndex(0) // 删除 index = 0 的元素

ask1 = questions[0] // 得到：["answer": "Juneau", "question": "What is the capital of Alaska?"]
ask2 = ask1["question"] // 得到："What is the capital of Alaska?"










//: [上一个问题](@previous)      [下一个问题](@next)
