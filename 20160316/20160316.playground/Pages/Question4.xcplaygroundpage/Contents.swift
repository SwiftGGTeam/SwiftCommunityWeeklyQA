//: ### Question4: Prevent lazy initialization of static var

//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/41489)
//: ### 问题描述

/*:
类中的静态变量，为什么天生就有`lazy`属性，也就是说，在第一次用的时候，才去做初始化。例如以下的代码，在第一次使用`Features.feature1`的时候，才去生成一个`Feature`类的实例。楼主问，能不能在这个类第一次使用到的时候，去初始化静态变量呢？
*/

class Features
{
    static var feature1 = Feature()
    static var feature2 = Feature()
}

Features.feature1 //用到的时候才去生成实例



//: ### 问题解答

/*
楼下大神的回答很精彩，可以反过来想一下，如果静态变量不是第一次用到时候去初始化，那什么时候去初始化呢？App 启动时候？类库被加载时候？还是第一个实例被初始化的时候呢？即使可以在以上情况下可行，那么是先初始化`feature1`，还是`feature2`呢？如果静态变量是存在不同的扩展内的呢？那么应该怎么做？这些问题显然不能用语法很好的表达出来。
可以参看 Swift 刚出生那段时候的官方blog 的一篇文章：[Files and Initialization
](https://developer.apple.com/swift/blog/?id=7)，很显然，在第一次用到的时候，才去初始化静态变量。是最好的方式。
*/



//: [上一个问题](@previous)      [下一个问题](@next)
