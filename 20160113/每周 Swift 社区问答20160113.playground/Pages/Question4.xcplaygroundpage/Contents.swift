//: ### How to use Generic type in Swift2
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34689916/how-to-use-generic-type-in-swift2)
import Foundation

//: ### 问题描述


/*:
以下代码会在方法 addNewType 中报错，大家可以不看答案先，想想为啥会报错。这个问题比较初级，但是经常会有人问到。
*/


class TypeA: NSObject {
    
    override init() {
        print("typeA")
    }
}

class ObjectA<T: TypeA>: NSObject {
    
    var type = [T]()
    
    init(type:T) {
        self.type.append(type)
    }
    
    func addNewType() {
        let newType = TypeA()
        self.type.append(newType) // Cannot invoke "append" with an argument list of type '(TypeA)'
    }
}

//: ### 问题解答

/*:
ObjectA 类定义的泛型 T 遵从类 TypeA，定义的数组是[T]，进行append操作时候，不能匹配具体的 TypeA，所以报错。可以把 type 换成 [TypeA], 因为泛型 T 是表示 TypeA 或者 它的子类。所以[TypeA] 可以 append T 或者 TypeA：
*/

class ObjectA1<T: TypeA>: NSObject {
    
    var type = [TypeA]()
    
    init(type:T) {
        self.type.append(type)
    }
    
    func addNewType() {
        let newType = TypeA()
        self.type.append(newType) // Cannot invoke "append" with an argument list of type '(TypeA)'
    }
}


//: [上一个问题](@previous)      [下一个问题](@next)
