//: ### Question5: Overriding didSet
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35128118/overriding-didset)
//: ### 问题描述

/*:
楼主的问题：为神马不能重写 didSet？见以下代码：
*/

class Foo {
    var name: String = "" { didSet { print("name has been set") } }
}

let foo = Foo();
foo.name = "test"
class Bar: Foo {
    override var name: String = "" {
        didSet {
            print("print this first")
            // print the line set in the superclass
        }
    }
}

//: ### 问题解答

/*:
实际上，不是不能重写，在重写时报错：具有 getter 和 setter 的变量不能有初始值。适用于子类重写属性的情况。不过这个错误提示有一些歧义，在父类中，其实是可以赋初始值的，见以下代码：*/
class Foo {
    var name: String = "" { didSet { print("name has been set") } }
}

class Bar: Foo {
    override var name: String  {
        didSet {
            print("print this first")
            // print the line set in the superclass
        }
    }
}

let bar = Bar()
bar.name = "name"


/*:
更多关于继承属性和didSet的介绍，见[官方教程](http://wiki.jikexueyuan.com/project/swift/chapter2/13_Inheritance.html#overriding)*/







//: [上一个问题](@previous)      [下一个问题](@next)
