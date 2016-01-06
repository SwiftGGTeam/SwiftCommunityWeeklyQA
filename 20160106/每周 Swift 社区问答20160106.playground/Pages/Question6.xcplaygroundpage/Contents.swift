//: ### Cannot invoke [Method] with argument list of type ( , )
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34610440/cannot-invoke-method-with-argument-list-of-type)


//: ### 问题描述

/*
楼主的问题是：
已知协议 A，B 其中协议 B 遵从 协议 A。类 Utility 定义了一个泛型方法 add，T 遵从 A 协议。
在另外一个 Test 类的方法 addItem 中，调用了这个 add 方法，但是传入的 data 类型是 B，但调用时候出错，见下面代码：
*/
protocol A { }

protocol B: A { }

class Utility {
    func add<T:A>(t:T.Type,param:T){
    }
}

class Test {
    var util: Utility
    
    init() {
        util = Utility()
    }
    
    func addItem(data:B){
        //util.add(B.self,param: data) //这里报错：expected an argument list of type '(T.Type, param: T)'
    }
}

//: ### 问题解答

/*
楼主把 data 的类型定义为协议 B，这不是正确的用法，应该定义一个泛型类型 T，T 遵从 B 协议，见以下代码：
*/



class Test1 {
    var util: Utility
    
    init() {
        util = Utility()
    }
    
    func addItem<T: B>(data: T) {
        util.add(T.self, param: data)
    }
}


//: [上一个问题](@previous)      [下一个问题](@next)
