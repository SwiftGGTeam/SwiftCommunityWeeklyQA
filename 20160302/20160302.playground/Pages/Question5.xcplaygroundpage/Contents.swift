//: ### Question5: Adoption of Protocol in Swift
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35656667/adoption-of-protocol-in-swift)
//: ### 问题描述

/*:
以下代码会报错，代码中， 类 Y 遵循协议 X，赋值时候，把A的子类B的实例赋值给了协议X中的存储属性。楼主认为既然A和B有继承关系，那么为啥会报错了？
*/
protocol A {
    
}

class B : A {
    var foo = "foo"
}

protocol X {
    var someA : A {get set}
}

//class Y : X {  //错误: Type Y does not conform to protocol X
//    var someA = B()
//}

//: ### 问题解答

/*:
编译器只能根据协议X的情况，去要求someA必须是类A的一个实例，B是继承自A的，它有自己的存储属性foo。当然不满足协议X了。如果真的需要声明一个B的实例，那么必须显式指定someA类型为A。见以下代码：
*/

class Y : X {
    var someA: A = B()
}

/*
以上的代码虽然可以运行，但是someA已经不能调用B的存储属性了。如果需要调用，必须做一下显式转换：`someA as! B`。一般使用as语句的地方，目前的主流做法都不太推荐。楼下举了一个例子，某个协议要求一个存储属性去存储一辆车的信息，这个时候某人有一辆保时捷，赋值给了这个存储属性，然后另外一个人有一辆马自达，同样也可以赋值给这个存储属性，但是我们看不出来这车是保时捷还是马自达，其实他们差别还是蛮大的。
关于这个话题，有以下2篇文章可以进一步解答：
* [Friday Q&A 2015-11-20: Covariance and Contravariance](https://mikeash.com/pyblog/friday-qa-2015-11-20-covariance-and-contravariance.html)，中文版本，咱们翻译组翻译的：[Friday Q&A 2015-11-20：协变与逆变](http://swift.gg/2015/12/24/friday-qa-2015-11-20-covariance-and-contravariance/)
* [Type Variance in Swift](http://nomothetis.svbtle.com/type-variance-in-swift)
*/








//: [上一个问题](@previous)      [下一个问题](@next)
