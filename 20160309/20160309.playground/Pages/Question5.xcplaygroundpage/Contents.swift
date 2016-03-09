//: ### Question5: Parentheses in Function and Closure
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35834586/parentheses-in-function-and-closure)
//: ### 问题描述

/*:
有以下三种函数定义方式，有什么区别？
*/
func myFunction() -> (()-> Int)

func myFunction1() -> (Void-> Int)

func myFunction2() -> Void-> Int

//: ### 问题解答

/*:
* () 和 Void 是一样的，2种不同的写法而已。看你喜欢，Swift 中比较常用 ()。
* -> 操作符是右关联的，也就是说，多个 -> 连接在一起时候，编译器优先解析右边的。

所以以上3个定义是一样的。第一个和第二个虽然加了括号，优先处理最右边的，但是因为->是右关联的，所以加括号和不加括号是一样的。

这3个表达式表示的意思是：定义一个函数，没有传入参数，返回一个闭包, 闭包的类型是`() -> Int`

楼下还举了一个更复杂的例子加深理解：
*/
func myFuncA() -> () -> Int -> String {
    return { () -> Int -> String in return { (i: Int) -> String in String(i) } }
}

func myFuncB() -> () -> (Int -> String) {
    return { () -> Int -> String in return { (i: Int) -> String in String(i) } }
}

func myFuncC() -> (() -> Int) -> String {
    return { (f: () -> Int) in String(f()) }
}

/*:
这个例子中，myFuncA 和 myFuncB 是一样的。没有传入参数，返回一个闭包，这个闭包也没有传入参数，返回是另外一个闭包。而返回的闭包类型是 Int -> String。
而 myFuncC 也是没有传入参数，返回一个闭包。这个闭包传入参数是一个闭包，返回是一个String。传入闭包类型是: `() -> Int`
*/








//: [上一个问题](@previous)      [下一个问题](@next)
