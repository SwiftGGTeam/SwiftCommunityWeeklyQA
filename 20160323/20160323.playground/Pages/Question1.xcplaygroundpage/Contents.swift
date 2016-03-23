//: ### Question1: Overriding function signature--documented?
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/43120)
//: ### 问题描述

/*:
 楼主的问题是，B 是 A 的子类，在 D 中定义了一个方法`arbitraryFactory() -> A`，返回 A 的对象，E 继承 D，定义方法`arbitraryFactory() -> B`。必须加上`override`关键字才能通过编译。但是 D 中的方法`identify(anID: A)`，E 中定义的方法`identify(anID: B)`就不用使用`override`，楼主查不到有文档对此进行了说明，跪求大神解释：
*/

class A {
}
class B : A {
}
class D {
    func arbitraryFactory() -> A {
        return A()
    }
    func identify(anID: A) {
        print(anID)
    }
}
class E : D {
    override func arbitraryFactory() -> B {  // subclass as return type similar enough to require "override"
        return B()
    }
    
    func arbitraryFactory() -> E { // different enough not to require "override"
        return E()
    }
    
    func identify(anID: B) { // subclass as input different enough not to require "override"
        print(anID)
    }
}

//
//: ### 问题解答

/*:
 看了一下[官方文档](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Inheritance.html)对`override`关键词的解释。的确没有讲的太深入。重写在其他语言中也是一个常见的语法，苹果可能觉得其他语言都讲了很多，没必要再讲的太细吧。。
 楼下的同学做了一下解释，我觉得讲的比较好：
 决定一个函数定义的标志是函数名，输入参数和返回类型。E 中定义的方法`arbitraryFactory() -> E`,返回值是 E 的对象，跟父类 D 中的同名方法返回值 A 没有关系，所以不使用`override`关键字来修饰。但是另外一个方法`arbitraryFactory() -> B` 就不一样，B 是 A 的子类，编译器认为这2个方法是相同的函数类型。必须使用`override`表明是重写。不过在调用时候，需要赋值的变量需要显式声明类型，因为方法名称重了。以下代码会报错：
*/
//let f = E().arbitraryFactory()


/*:
 正确的写法:
 */
let f1: A = E().arbitraryFactory()
let f2: B = E().arbitraryFactory()
let f3: E = E().arbitraryFactory()

/*:
 在函数名和返回值相同的情况下，输入参数不能通过继承关系来推断是否一样，也就是说，`identify(anID: A)`和`identify(anID: B)`是不同的函数类型。
 */





//: [上一个问题](@previous)      [下一个问题](@next)
