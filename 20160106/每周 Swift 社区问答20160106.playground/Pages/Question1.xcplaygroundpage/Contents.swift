//: ### Question1: Question on extracting a substring from a url
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/29374)
import Foundation
//: ### 问题描述

/*:
这个问题在实战中经常被提及，譬如现在有一个字符串URL：[https://api.github.com/gists/public?page=2]( https://api.github.com/gists/public?page=2) ，我需要从中提取出“?page=2”以及“https://api.github.com/gists/public”，将这两个部分存储到两个变量中，如下：
*/

//var strBase = "https://api.github.com/gists/public"
//var strPage = "?page=2"

/*:
问题解答前了解下小知识：

1. HTTP GET请求中，url 与请求参数之间用**?**分隔，参数与参数之间是**&**分隔。
*/



//: ### 问题解答

/*:

思路：显而易见，关注点应该放在**?**上，解决方式也五花八门，现提供以下几种方式：

方法一：
*/

var urlStr = "https://api.github.com/gists/public?page=2"
var strBase:String		// 请求地址
var strPage:String		// 请求参数

if let qIndex = urlStr.characters.indexOf("?") {  //35
// 2
strBase = urlStr.substringToIndex(qIndex)
strPage = urlStr.substringFromIndex(qIndex)
} else {
// 3
strBase = urlStr
strPage = ""
}

/*:
1. 首先定位到 **?** 的 index 索引值。
2. 请求地址中存在参数（即存在?），那么通过`substringToIndex` 和 `substringFromIndex` 获取到两个部分
3. 请求地址中不存在参数，那么直接传入的地址就是`strBase`。

这里的`qIndex`是一个索引值，类型是`String.CharacterView.Index`，修改该值并非是用 `+、-` 操作，而是调用`qIndex.successor()` 取到下一位索引值，使用`qIndex.predecessor()`取到前一位索引值。

对于`substringToIndex(qIndex)`方法，从 urlStr 的 `startIndex(这里是0)` 开始截取直到 `qIndex`；对于`substringFromIndex(qIndex)` 方法，即从 `qIndex` 索引开始直到`endIndex`前面一个索引，为什么这么说？举个例子，“Hello”字符的 startIndex 毫无疑问是等于0，但 endIndex 不是等于4！！而是5！！最后一个字符的后一位！希望大家记住。


方法二：

这里是使用了`componentsSeparatedByString`方法，通过**?**字符将字符串分隔符将原字符串分割成多个部分到数组中。

*/

let parts = urlStr.componentsSeparatedByString("?")
// 1
strBase = parts[0]
// 2
strPage = parts.count >= 2 ? "?" + parts[1] : ""

/*:
1. 显然这里只有一个 ? 字符，将原字符串分割成两个部分，第一个部分当然是 strBase 喽
2. 通过数组的count 来判断是否存在请求参数。

方法三：


这里使用了 NSURLComponents 方法：
*/

if let urlCompo = NSURLComponents(string: urlStr) {
strPage = urlCompo.query != nil ? "?" + urlCompo.query! : ""
urlCompo.query = nil
strBase = urlCompo.string!
} else {
fatalError("invalid URL")
}

/*:

举一反三，如果我还想获得请求参数中的各个参数，那应该怎么做呢？我先抛砖引玉下：
*/

var urlStr1 = "https://api.github.com/gists/public?page=2&name=machao&pwd=222"



let parts1 = urlStr1.componentsSeparatedByString("?")
strBase = parts1[0]
var strPara = parts1.count >= 2 ? "?" + parts[1] : ""

strPara.removeAtIndex(strPara.startIndex)
let Paras1 = strPara.componentsSeparatedByString("&")//就是这个！





//: [上一个问题](@previous)      [下一个问题](@next)
