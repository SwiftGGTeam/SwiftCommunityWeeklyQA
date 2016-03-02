//: ### Question1: How to make shallow copy of array in swift
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35716175/how-to-make-shallow-copy-of-array-in-swift)
//: ### 问题描述

/*:
此问题是与 Swift 中的值类型和引用类型相关的。楼主提问：以下代码中，数组之间的赋值不是浅拷贝（arr2 只是指向 arr1，arr1内部值变动，arr2访问也会跟着变化）的？
*/

class Person
{
    var name:String = ""
}

var arr1:[Person] = [Person]()

let p1 = Person()
p1.name = "Umair"

let p2 = Person()
p2.name = "Ali"

arr1.append(p1)
arr1.append(p2)
var arr2 = arr1

print("\(arr1.count)")    //"2\n"
print("\(arr2.count)")    //"2\n"

arr1.removeFirst()

print("\(arr1.count)")    //"1\n"
print("\(arr2.count)")    //"2\n"



//: ### 问题解答

/*:
事实上，Array 在 Swift 中，是作为值类型存在的。而值类型的赋值，默认是深拷贝的。只有类在 Swift 中是浅拷贝的。这篇[文章](http://letsswift.com/2014/08/value-type-and-reference-type/)可以看到更多的细节。值类型和引用类型作为 Swift 中非常基础并且重要的概念，理解了值类型，写 Swift 代码就会更加清晰。
如果要在 Swift 中实现浅拷贝数组咋办？那就要借助一个类来实现了，用一个独立的类把数组包装起来，拷贝这个类的实例是浅拷贝的。见以下代码：
*/





class Person
{
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

let p1 = Person("Umair")
let p2 = Person("Ali")


class Container {
    var people = [Person]()
    
    init(people: [Person]) {
        self.people = people
    }
}

let arr1 = Container(people: [p1, p2])
let arr2 = arr1

print(arr1.people)
print(arr2.people)

arr1.people.removeFirst()

print(arr1.people)
print(arr2.people)









//: [上一个问题](@previous)      [下一个问题](@next)
