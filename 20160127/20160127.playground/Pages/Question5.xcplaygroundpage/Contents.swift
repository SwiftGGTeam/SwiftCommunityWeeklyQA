//: ### Question5: Is there way to define compare (`==`) function automatically for `struct` in Swift?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35023904/is-there-way-to-define-compare-function-automatically-for-struct-in-swi)
//: ### 问题描述

/*:
楼主假设有一个巨大（包含很多属性的）的结构体，然后实现 "==" 操作就会很麻烦，因为要每个属性都比较一遍才行，见下面的代码。那么问题来了，有没有更好的办法可以简化 "==" 操作的定义呢？
*/

struct SuperStruct {
    var field1: Int = 0
    var field2: String = ""
    // lots of lines...
    var field512: Float = 0.0
}

extension SuperStruct: Equatable {
}

func ==(lhs: SuperStruct, rhs: SuperStruct) -> Bool {
    return
        lhs.field1 == rhs.field1 &&
            lhs.field2 == rhs.field2 &&
            // lots of lines...
            lhs.field512 == rhs.field512
}

//: ### 问题解答

/*:
stackoverflow上的程序员们的智慧果然是无穷大的。核心的解决思路是：

* 利用协议扩展，把所有用到的类型，都实现 isEqualTo 方法，用于比较类型是否相对。下面的例子只举了基本类型，自定义类型，也可以满足这个协议实现比较。
* 利用 Mirror 函数，得到结构体中所有属性的 list，然后逐个比较
*/

/* Let a heterogeneous protocol act as "pseudo-generic" type
for the different (property) types in 'SuperStruct'         */
protocol MyGenericType {
    func isEqualTo(other: MyGenericType) -> Bool
}
extension MyGenericType where Self : Equatable {
    func isEqualTo(other: MyGenericType) -> Bool {
        if let o = other as? Self { return self == o }
        return false
    }
}

/* Extend types that appear in 'SuperStruct' to MyGenericType  */
extension Int : MyGenericType {}
extension String : MyGenericType {}
extension Float : MyGenericType {}
// ...

/* Finally, 'SuperStruct' conformance to Equatable */
func ==(lhs: SuperStruct, rhs: SuperStruct) -> Bool {
    
    let mLhs = Mirror(reflecting: lhs).children.filter { $0.label != nil }
    let mRhs = Mirror(reflecting: rhs).children.filter { $0.label != nil }
    
    for i in 0..<mLhs.count {
        guard let valLhs = mLhs[i].value as? MyGenericType, valRhs = mRhs[i].value as? MyGenericType else {
            print("Invalid: Properties 'lhs.\(mLhs[i].label!)' and/or 'rhs.\(mRhs[i].label!)' are not of 'MyGenericType' types.")
            return false
        }
        if !valLhs.isEqualTo(valRhs) {
            return false
        }
    }
    return true
}

/* Example */
var a = SuperStruct()
var b = SuperStruct()
a == b // true
a.field1 = 2
a == b // false
b.field1 = 2
b.field2 = "Foo"
a.field2 = "Foo"
a == b // true

/*
如果不用协议扩展，代码会是这个样子， 类型越多， case 越多，显然不是一个很好的解决方案：
*/


func ==(lhs: SuperStruct, rhs: SuperStruct) -> Bool {
    
    let mLhs = Mirror(reflecting: lhs).children.filter { $0.label != nil }
    let mRhs = Mirror(reflecting: rhs).children.filter { $0.label != nil }
    
    for i in 0..<mLhs.count {
        switch mLhs[i].value {
        case let valLhs as Int:
            guard let valRhs = mRhs[i].value as? Int where valRhs == valLhs else {
                return false
            }
        case let valLhs as String:
            guard let valRhs = mRhs[i].value as? String where valRhs == valLhs else {
                return false
            }
        case let valLhs as Float:
            guard let valRhs = mRhs[i].value as? Float where valRhs == valLhs else {
                return false
            }
            /* ... extend with one case for each type
            that appear in 'SuperStruct'  */
        case _ : return false
        }
    }
    return true
}



//: [上一个问题](@previous)      [下一个问题](@next)
