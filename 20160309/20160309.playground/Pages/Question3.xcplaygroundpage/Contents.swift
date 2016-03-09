//: ### Question3:swift difference between final var and non-final var | final let and non-final let
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35818703/swift-difference-between-final-var-and-non-final-var-final-let-and-non-final-l)

/*:
楼主的问题是关于`final`关键字的，带有`final`修饰符的变量和没有带的变量区别是什么？
*/


var someVar = 5
final var someFinalVar = 5


let someLet = 5
final let someFinalLet = 5




//: ### 问题解答

/*:
`final`关键字主要用来修饰类和类中的属性、方法或者下标。子类继承时，不能重写父类中带有`final`修饰的属性、方法或者下标。如果`final`修饰的是类，那么此类不能被继承。
*/

// 没有final修饰属性的情况
class A {
    var x: Int {return 5}
}
class B : A {
    override var x: Int {return 3}
}
var b = B()
assert(b.x == 3)

// 有final修饰的情况，报错
class A {
    final var x: Int {return 5}
}
class B : A {
    // 此处报错
    override var x: Int {return 3}
}

/*
更多final的细节，可以看看喵神关于final的[单独一篇tips](http://swifter.tips/final/)
*/



//: [上一个问题](@previous)      [下一个问题](@next)
