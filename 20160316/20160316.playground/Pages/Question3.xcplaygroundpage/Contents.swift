//: ### Question3:confusion over initialisation in swift
//: > [点击打开问题原地址](http://stackoverflow.com/questions/36012380/confusion-over-initialisation-in-swift)
/*:
这个问题是对官方文档关于子类会自动继承父类的构造器知识点的疑惑。下面是官方文档的例子，`ShoppingListItem`由于满足所有属性都已经赋值，且没有构造器，所以自动继承父类`RecipeIngredient`，其中还包含一个自动继承的无参构造器`init()`。见下图：

楼主的疑问是，当创建一个`ShoppingListItem`实例时候，自动继承的构造器里面，会运行`super.init(name: name)`, 这条语句的`super`, 是访问的`RecipeIngredient` 的`init(name: name)`, 还是`Food`的`init(name: name)`呢？
*/


class Food {
    var name: String
    init(name: String){
        self.name = name
    }
    convenience init() {
        self.init(name: "[unnamed]")
    }
    
}

class RecipeIngredient: Food{
    var quantity: Int
    init(name: String, quantity: Int){
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String){
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) X \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}


let ingredientThree = ShoppingListItem(name: "apple", quantity: 10)

ingredientThree.quantity
//: ### 问题解答

/*:
这里的规则其实可以这样解释：`ShoppingListItem` 本身没有构造器，只是借用了父类`RecipeIngredient`的构造器。也就是说，创建一个`ShoppingListItem`的实例时候，调用的是父类`RecipeIngredient`的构造器。既然是调用了`RecipeIngredient`的构造器，那么这里的`super`就是指的是`Food`。
可以假设`super`是`RecipeIngredient`, 那么调用的`super.init(name: name)`会把`quantity`重置为 1。 不满足 Swift 中构造器的[两段式构造过程](http://wiki.jikexueyuan.com/project/swift/chapter2/14_Initialization.html#class_inheritance_and_initialization)的规则。
楼下的回答没有直接回答楼主的疑问，但是通过打印出构造过程的输出，可以清晰的看出来，楼主的问题的答案了。

*/







//: [上一个问题](@previous)      [下一个问题](@next)
