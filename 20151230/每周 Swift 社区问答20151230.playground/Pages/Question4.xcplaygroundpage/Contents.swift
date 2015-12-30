//: ### How can I filter dictionary [[String:String]]
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34483418/how-can-i-filter-dictionary-stringstring)
import Foundation

//: ### 问题描述


/*:
楼主有一个二维数组，想通过数组中的 type 字段，进行过滤。于是他写出了如下报错的代码：
*/

var data = [["type":"Sport", "model":"R6"],["type":"Enduro", "model":"Tenerre"],["type":"Chopper", "model":"Intruder"]]
//data.filter({ (type: String) -> Bool in
//    return true
//})



//: ### 问题解答

/*:
数组 filter 方法的定义：

filter(includeElement: (T) -> Bool) -> T[]

在这个例子中，数组是二维的，所以 T = [String:String]，也是一个数组。所以正确答案应该是：
*/

let filteredData = data.filter { (dict:[String:String]) -> Bool in
    return dict["type"] == "Sport"
}


//: [上一个问题](@previous)      [下一个问题](@next)
