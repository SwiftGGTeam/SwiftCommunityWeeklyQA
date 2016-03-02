//: ### Question2: swift closure cannot override Any
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35697569/swift-closure-cannot-override-any)
//: ### 问题描述

/*:
楼主定义了一个类的方法`on`，参数中包含一个含有`Any?`参数的闭包。见以下代码：
*/

mutating func on(eventName:String, action:((Any?)->())) {
    
}


/*
调用此方法时，以下代码会报错：
*/
appSessionHadler.on("login") { (weak data: String?) in
    //...
}
/*
以下是正确的调用方式：
*/

appSessionHadler.on("login") { (weak data: Any?) in
    //...
}

/*
那么问题来了，既然Any?是表示所有的类型，那么应该也包括了String?,在第一次调用时，传入String?为什么会报错？
*/
//: ### 问题解答


/*
此问题和问题5有点类似，Any是可以包含所有类型的值，但是这仅仅是表示，内部数据可以是任何值。在定义方法参数指定为Any?后，调用这个方法，也必须传入Any?的变量作为入参。所以以上把data变成String?当然会报错。
此问题更好的方法是使用泛型来解决，可以在调用时候指定参数的类型：
*/


mutating func on<T>(eventName:String, action:((T?)->()))


appSessionHadler.on("login") { (weak data: String?) in
    //...
}




//: [上一个问题](@previous)      [下一个问题](@next)
