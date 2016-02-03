//: ### Question2: How to extract emojis from a string?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35106059/how-to-extract-emojis-from-a-string)
//: ### 问题描述

/*:
这是一个纯知识点的问题：如何找出字符串中的emoji表情？*/



//: ### 问题解答

/*:
直接看代码注释：
*/

// 获取字符编码对应的数值
extension Character {
    private var unicodeScalarCodePoint: Int {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        return Int(scalars[scalars.startIndex].value)
    }
}

//扩展定义字符串的一个计算属性，得到字符串中的emoji字符数组。
extension String {
    var emojis:[Character] {
        let emojiRanges = [0x1F601...0x1F64F, 0x2702...0x27B0] // emoji 的范围，可以自己扩充
        let emojiSet = emojiRanges.reduce(Set<Int>()) { (result, elm) -> Set<Int> in
            return result.union(elm)
        }
        return self.characters.filter { emojiSet.contains($0.unicodeScalarCodePoint) }
    }
}

let sentence = "😃 hello world 🙃"
sentence.emojis // ["😃", "🙃"]








//: [上一个问题](@previous)      [下一个问题](@next)
