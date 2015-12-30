//: ### Storing a reference to array in swift
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34486043/storing-a-reference-to-array-in-swift)


//: ### 问题描述

/*:
Swift 类中定义的方法，传入参数默认是值拷贝，也就是说，即使方法内部改变参数值，传入的参数原始值是不会改变的。

楼主纠结如何实现引用拷贝，也就是，赋值给类中的属性以后，改变了属性的值，传入的参数也会跟着改变，见代码如下：

*/

import Foundation

class Foo {
    var foo : Array<Int>
    
    init(foo: Array<Int>) {
        self.foo = foo
    }
    
    func modify() {
        foo.append(5)
    }
}

var a = [1,2,3,4]
let bar = Foo(foo: a)
bar.modify()
print(a) // My goal is that it will print 1,2,3,4,5

//: ### 问题解答

/*: 
实际上，使用inout，也不能解决问题，inout 只是应用在方法内部直接改变传入值的时候有用，而上例中，是先赋值给了类的一个属性，改变了属性的值，而没有改变传入参数值。因为 Array<Int> 是值类型，赋值默认为值拷贝：

*/

class Foo1 {
    var foo : Array<Int>
    
    init(foo: Array<Int>) {
        self.foo = foo
    }
    
    func modify() {
        foo.append(5)
    }
}

let bar1 = Foo1(foo: a)
bar.modify()
print(a) // 还是没有改变 a

/*:
以下代码是跟帖中提供的解决方案，使用 UnsafeMutablePointer<Int>，也就是 c 语言中的 int * 指针来达成指向内存的一致。从而在修改时候，能够保持一致。但是强烈不推荐此种做法，因为 Swift 强调的类型安全丢失了。

*/

class Foo2 {
    var foo : [Int]
    var pInner: UnsafeMutablePointer<Int>
    
    init(foo: [Int]) {
        pInner = UnsafeMutablePointer(foo)
        self.foo = Array(UnsafeBufferPointer(start: pInner, count: foo.count))
    }
    
    func modify(inout pOuter: UnsafeMutablePointer<Int>) {
        foo.append(5) // <-- foo gets new memory adress
        pInner = UnsafeMutablePointer(foo)
        pOuter = pInner
    }
}

var pOuter: UnsafeMutablePointer<Int> = UnsafeMutablePointer(a)
var bar2 = Foo2(foo: a) // 'bar.foo' now at same address as 'a'
print(bar2.foo) // [1,2,3,4]
bar2.modify(&pOuter) // -> [1,2,3,4,5]
a = Array(UnsafeBufferPointer(start: pOuter, count: bar.foo.count))

/* Same pointer adress, OK! */
print(bar2.pInner)
print(pOuter)

/* Naturally same value (same address in memory) */
print(bar.foo)
print(a)


//: 此问题其实在实际编码中，应该尽量避免，一个类，去改变外部的值，违背了类的封装性。

//: [上一个问题](@previous)      [下一个问题](@next)
