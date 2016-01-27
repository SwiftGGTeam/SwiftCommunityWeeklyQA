//: ### Question3: How to show a number “to the power of X” with string
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34981520/how-to-show-a-number-to-the-power-of-x-with-string)
//: ### 问题描述

/*:
楼主的问题是，如何用自然的方式，显示 X 的 n 次方
![snail](q3.png "test")

*/



//: ### 问题解答

/*:
这个问题比较普遍，在这个[帖子](http://stackoverflow.com/questions/29225779/how-to-use-subscript-and-superscript-in-swift)中有代码实例，见以下代码：
*/

import UIKit
let font:UIFont? = UIFont(name: "Helvetica", size:20)
let fontSuper:UIFont? = UIFont(name: "Helvetica", size:10)
let attString:NSMutableAttributedString = NSMutableAttributedString(string: "6.022*1023", attributes: [NSFontAttributeName:font!])
attString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:10], range: NSRange(location:8,length:2))
attString
//labelVarName.attributedText = attString;

/*:
在 playground 中， 请点击右边的眼睛按钮查看，显示出渲染后的效果。与问题描述中的一样。
关于 NSMutableAttributedString ，可以查看这里:[NSAttributedString 详解](http://blog.csdn.net/zhangao0086/article/details/7616385), 也可以查看官网的 [Api 说明](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSAttributedString_Class/)，不过最好还是结合实际的代码来看比较好理解。
*/







//: [上一个问题](@previous)      [下一个问题](@next)
