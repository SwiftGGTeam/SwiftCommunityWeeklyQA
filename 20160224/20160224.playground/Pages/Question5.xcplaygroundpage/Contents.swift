//: ### Question5: How can I do a Swift for-in loop with a step? 
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35556850/how-can-i-do-a-swift-for-in-loop-with-a-step)
//: ### 问题描述

/*:
楼主的问题是：Swift 中的 for 循环，如何按照一个特定的步长递增或者递减，比如 c 语言中可以这样做：
*/
//for (i = 1; i < max; i+=2) {
//    // Do something
//}


//: ### 问题解答

/*:
需要配合方法stride来设置步长，有以下几种写法：
*/

//(i = 1; i < 10; i+=2)
for index in 10.stride(to: 10, by: 2) {
    print(index)
}

1.stride(to: 10, by: 2).forEach { i in
    print(i)
}
//(i = 1; i <= 10; i+=2)
for i in 1.stride(through: 10, by: 2) {
    print(i)
}








//: [上一个问题](@previous)      [下一个问题](@next)
