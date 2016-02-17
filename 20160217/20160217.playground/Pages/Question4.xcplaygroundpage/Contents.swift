//: ### Question4: swift enum case declaration synatx
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35401603/swift-enum-case-declaration-synatx)
//: ### 问题描述

/*:
吐槽一下，帖子标题的syntax单词写错了。
这个问题是关于枚举类型的默认值的，楼主是想知道， Swift 中的枚举类型的原始值默认值有那些规则？
*/



//: ### 问题解答

/*:
Swift 的枚举类型，如果指定了原始值的类型（Int， String等），就会有默认值的存在。如果不指定原始值类型，编译器就不会分配默认值。
当枚举类型的原始值类型指定为 Int 时，这个时候，就和其他语言的枚举的默认值分配一样。比如下面的例子，Bar,Baz, Boz 的原始值就是 0, 1, 2
*/

enum Foo: Int {
    case Bar, Baz, Boz
}

Foo.Boz.rawValue // 原始值为2

//如果指定了一个枚举值的原始值，后面接下来的枚举值的原始值会自动 +1, 比如：
enum Foo1: Int {
    case Bar = 2, Baz, Boz // Baz 原始值为 3， Boz 原始值为 4
}
Foo1.Boz.rawValue

// 原始值类型为字符串的时候，默认的值就是和枚举值的字符串一样，比如：

enum Foo2: String {
    case Bar, Baz, Boz
}
Foo2.Bar.rawValue // 原始值为 Bar

// 可以显示设置原始值，那么没有设置原始值的，就使用默认值

enum Foo3: String {
    case Bar = "Something"
    case Baz = "Something else"
    case Boz  // 隐式设置为 "Boz"
}

Foo2.Boz.rawValue








//: [上一个问题](@previous)      [下一个问题](@next)
