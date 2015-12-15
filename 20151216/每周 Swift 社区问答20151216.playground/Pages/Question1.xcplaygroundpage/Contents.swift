/*:
# 每周SWIFT问答社区
### **Version:** 第一期
### **Date:** 2015-12-13
### **Author:** [shanks](http://codebuild.me) & [pmst](http://www.jianshu.com/users/596f2ba91ce9/latest_articles)
*/


/*:
### **本周整理问题如下:**
Question1:
	[Unwrapping NSNumber works fine in iOS Simulator but unexpectedly found nil on iPhone](Question1)

Question2:
	[Why my code is working in playground but not in my project?](Question2)

Question3:
	[Failable initialisers and unbound instance vars](Question3)

Question4:
	[Read-only property](Question4)

Question5:
[Why? insert a new element into array and it always crash!](Question5)

Question6:[binary operator '??' cannot be applied to functions?](Question6)

Question7:[Filter array on type](Question7)

Question8:[Numbers in swift](Question8)
*/




//: ### Question1:Unwrapping NSNumber works fine in iOS Simulator but unexpectedly found nil on iPhone
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/27726)
import UIKit

//: ### 问题描述
// 数组():元素类型 String
var stack = Array<String>()
// 往栈里面添加一个新元素 "2.3"
stack.append("2.3")
// 取得最顶层的元素 即"2.3"
let lastElement = stack.popLast()!
print("Popped last element: \(lastElement)")

// 将String类型的"2.3" 转换为2.3,此时是NSNumber类型！
let number = NSNumberFormatter().numberFromString(lastElement)
print("NSNumber gives us: \(lastElement)")

// NSNumber 2.3 取到 doubleValue 
// ** 提问者表示Playground中运行正常 在真机调试时crash
let doubleValue = number!.doubleValue // <-Crash  
print("Double value of this element is: \(doubleValue)")

//: ### 问题解答

/*:

对于中国开发者来说，其实基本不会存在这个问题，因为上述问题产生的原因是：你的手机所处国家可能对小数分隔符的定义是一个逗号‘,’，而不是句号‘.’ 。显然咱们是使用‘.’作为小数分隔符的。
*/

/*:
> 当然还是希望给你一个小建议：在需要对数字字符串进行格式化的地方，比如输入数字的用户控件，你就需要显式的指定数字格式的本地化属性。反之在接收用户输入的数字时，你应该判断本地化属性，让一切尽在掌握中。
*/

//: [下一个问题](@next)






