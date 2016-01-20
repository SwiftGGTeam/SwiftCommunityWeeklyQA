//: ### Question5: In Swift, how do I prevent a function from being called on a subclass?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34802374/in-swift-how-do-i-prevent-a-function-from-being-called-on-a-subclass)
//: ### 问题描述

/*:
楼主的问题是，给了一个子类的实例，如何在编译器层面，阻止子类去调用或者实现父类的方法。
楼主说的应用场景是父类实现了 add 和 move 操作，子类通过另外一个方法 change ，调用了父类的 add 和 move 方法。这时候子类的实例，只需要调用 change 方法就可以了，没必要调用 add 和 remove 了。
*/

//class Parent {
//    
//    func doThis() { print("Parent Did This") }
//    func doThat() { print("Parent Did That") }
//    
//}
//
//class Child: Parent {
//    
//    override func doThis() {
//        print("Child Did This")
//    }
//    
//    // I want this to be a compile time error
//    override func doThat() {
//        print("Not Supported")
//        return
//    }
//    
//}

//: ### 问题解答

/*:
跟帖中提到了使用 @available 来声明访问的可用性，见代码：
*/


class Parent {
    func doThis() { print("Parent Did This") }
    func doThat() { print("Parent Did That") }
}

class Child: Parent {
    override func doThis() {
        print("Child Did This")
    }
    
    @available(*, unavailable, message="Child can't doThat")
    override func doThat() {
        print("Not Supported")
    }
}


let parent = Parent()
parent.doThis()
parent.doThat()

let child = Child()
child.doThis()
child.doThat() // 编译报错




//: ### 问题思考


/*:
用父类子类来定义这个问题的结构是有问题的。可以另外定义没有继承关系一个类来包裹 add 和 remove 操作。即可以解决楼主的问题。当然如果真的需要用到继承，也是可以的，用上面的方法即可。不过目前的趋势都是少用继承，多用 protocol 来解决问题。。
*/






//: [上一个问题](@previous)      [下一个问题](@next)
