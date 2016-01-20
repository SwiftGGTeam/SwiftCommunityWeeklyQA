//: ### Question2: Swift: why aren't all variables lazy by default?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34841915/swift-why-arent-all-variables-lazy-by-default)
//: ### 问题描述

/*:
楼主提问，为什么 lazy 关键字不能作为默认的存在。他列出了自己的分析：

先看看 2 行代码，更直观的进行比较：

var networkManager = NetworkManager.sharedInstance()

var lazy networkManager = NetworkManager.sharedInstance()

2行代码共有的特性点：

* 可以通过右值的计算得到值
* 可以直接赋值

lazy 的好处：

* 可以引用 self
* 在使用时才计算得到值
* 如果没有使用它，就不会计算它

非 lazy 的好处：

* 无


由此分析可以得出结论：lazy 可以默认的定义存在。
*/



//: ### 问题解答

/*:
跟帖中发表了一些看法，值得参考：

1、lazy 增加了程序的不确定性，因为并知道，何时会用到 lazy 定义的变量。
2、lazy 使用场景是在需要得到一个计算量很大或者占用资源很大的变量的时候使用的，一般情况下，不需要用到 lazy
3、在 Swift 函数式编程中，用到一些带有 lazy 性质的特性，比如 map 和filter 就是后计算的。lazy 性质的特性在 Swift 用的比较多。但是 lazy 不是线程安全的。
*/










//: [上一个问题](@previous)      [下一个问题](@next)
