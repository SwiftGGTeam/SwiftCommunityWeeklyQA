//: ### Question2: What does _: mean in Swift?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35821242/what-does-mean-in-swift)
//: ### 问题描述

/*:
楼主在学习 Swift 语言的过程中，阅读了一些学习资料，比如官方文档。看到一些函数定义写成了这样：`recordResponse(_:) `。不理解这样写表示什么意思。
*/




//: ### 问题解答


/*:
在官方文档中，使用这种方式表达函数是一种约定，可以从官方文档[Functions](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158)章节中看到很多这样的表示。刚开始看文档时候，也不太适应这种表示方式。也找不到为什么要这样表示，省略了很多函数的细节（比如没有返回值），把问题发到翻译组内部讨论群里面后，大家都一致认为，这是表达函数的一种约定的方式，至于怎么用这种表达式，下面这段话基本概括了用法：
* 简单的说，函数签名里每个冒号都代表一个参数，每个参数都要有个外部参数名写在冒号前面，写_代表不要外部参数名. 参数名都是自动生成，默认情况下第一个参数不生成外部参数名

大家在写博客时候，可以参照这种写法了，比如以下一些例子：
* sayHello(_:)：传入一个参数
* print(_:separator:terminator:)：传入3个参数

*/




//: [上一个问题](@previous)      [下一个问题](@next)
