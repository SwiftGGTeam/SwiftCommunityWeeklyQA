//: ### Question2:Why my code is working in playground but not in my project?
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/27764)
import Foundation

//: ### 问题描述

// 和上一个问题类似，这段代码在Playground中能够正常运行，但是真机crash

// 使用 NSDateFormater 解析一个字符串日期，代码如下：
import UIKit
let lTs = String("Mon, 07 Dec 2015 3:58 pm EST")
let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "EEE, dd MMM yyyy h:mm a zzz"
let lDate = dateFormatter.dateFromString(lTs)
print("\(lDate!)")
// 输出The result is "2015-12-07 20:58:00 +0000\n"

// 不过当提问者复制这段代码到项目中时（原来在playground）
// 居然crash掉了，问题出在对lDate!解包过程。

//: ### 问题解答

/*:
由苹果员工eskimo解答：
> 如果是对固定格式的字符串日期解析，你需要确定用户所在地域的local。

增加一行代码： `dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")` 即可
> 最近 swift.gg 也有一篇文章详解了 NSDate 的正确使用姿势，包含了日期格式的一些知识点，有兴趣的同学可以看看：[Swift 的 NSDate 初学者指南](http://swift.gg/2015/12/14/a-beginners-guide-to-nsdate-in-swift/)
*/


//: [上一个问题](@previous)      [下一个问题](@next)
