//: ### Question4: Strange generics behavior in swift
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35658177/strange-generics-behavior-in-swift)
//: ### 问题描述

/*:
楼主定义了一个泛型函数，然后调用时候发现一个奇怪问题，第一次调用还好，数组元素和第二个参数的类型都是Int的。而第二次调用时，数组元素类型是字符串，而第二个参数类型是Double，为神马不会报错？
*/

import Foundation

func findAll<T: Equatable>(arr: [T], _ elem: T) -> [Int] {
    var indexesArr = [Int]()
    var counter = 0
    
    for i in arr {
        if i == elem {
            indexesArr.append(counter)
        }
        counter++
    }
    
    return indexesArr
}

findAll([5, 3, 7, 3, 9], 3)
findAll(["a", "b", "c", "b", "d"], 2.0) //这样调用也可以？？





//: ### 问题解答

/*
问题出在`import Foundation`上面，引入了`Foundation`以后，数组会映射为`[AnyObject]`,而值类型会映射了对应的`Foundation`类型（比如`NSString`，`NSNumber`等），也就是AnyObject了。这样其实，第二个调用对应的函数原型是：`func findAll(arr: [AnyObject], _ elem: AnyObject) -> [Int] `，传入`[String]`和`Double`是可以通过的。

可以把`import Foundation`去掉，就可以查看到错误。

那么正确的定义应该怎么样呢？二楼给出了答案：

*/

public protocol NotAnyObject {}
extension Int: NotAnyObject {}
extension String: NotAnyObject {}
extension Double: NotAnyObject {}
func findAll<T: Equatable where T: NotAnyObject>(arr: [T], _ elem: T) -> [Int] {
    var indexesArr = [Int]()
    var counter = 0
    
    for i in arr {
        if i == elem {
            indexesArr.append(counter)
        }
        counter++
    }
    
    return indexesArr
}


findAll([5, 3, 7, 3, 9], 3)
findAll(["a", "b", "c", "b", "d"], 2.0) //错误

/*
另外增加了一个空的协议，让需要用到的类型去扩展此协议，这样做的目的就是强制把泛型限制在一致的类型上去。而不能使用不同的类型。
*/
//: [上一个问题](@previous)      [下一个问题](@next)
