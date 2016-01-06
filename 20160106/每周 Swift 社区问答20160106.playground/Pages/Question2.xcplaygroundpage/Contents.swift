//: ### All func pointers need a protocol now
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/29580)


//: ### 问题描述

/*:
Gargoyle 想实现一个对象之间的回调，但是却未使用 protocol + delegate 的设计模式，而是使用了如下方法：

final class MyView: UIView {
var onSomeAction: ((String) -> Void)!
}

final class MyViewController: UIViewController {
let myView = MyView(frame: CGRectZero)
override func viewDidLoad() {
super.viewDidLoad()
myView.onSomeAction = someFunc
}

private func someFunc(str: String) {
}
}

注意到 `myViewController` 实例与 `myView` 实例会形成一个 retain cycle ，倘若你想为 `var onSomeAction` 使用 `weak` 关键字，抱歉！报错“weak cannot be applied to non-class type xxxx” ，显然对于非 class 对象你无法使用 weak 关键字。

*/


//: ### 问题解答

/*: 
Jessy 提供了一种解决方案：


var onSomeAction_get: () -> (String -> Void)! = {nil}

myView.onSomeAction_get = {[unowned self] in self.someFunc}

首先对闭包类型进行了修改，从`(String) -> Void` 变为 `() -> (String -> Void)` ；其次为 `myView` 的 `onSomeAction_get` 赋值是用闭包方式，其中使用了[unowned self] 保证不会形成retain cycle，这也是问题解决的关键所在。

*/






//: [上一个问题](@previous)      [下一个问题](@next)
