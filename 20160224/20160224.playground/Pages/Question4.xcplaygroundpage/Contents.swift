//: ### Question4: static Dictionary DictionaryGenerator?
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/38694)
//: ### 问题描述

/*:
楼主想要一一对应2个数组，生成一个新的字典，于是出现以下代码：
*/
enum ItemKind : Int {
    case    All
    case    Mine
    case    InUse
    case    Archive
    
    
    static let all = [ItemKind.All, ItemKind.Mine, ItemKind.InUse, ItemKind.Archive]
    static let strings = ["All", "Mine", "In Use", "Archive"]
    static let values:[String:ItemKind] = [
        strings[ItemKind.All.rawValue]: ItemKind.All
        ,   strings[ItemKind.Mine.rawValue]: ItemKind.Mine
        ,   strings[ItemKind.InUse.rawValue]: ItemKind.InUse
        ,   strings[ItemKind.Archive.rawValue]: ItemKind.Archive
    ]
    
    
    var description: String {
        return ItemKind.strings[self.rawValue]
    }  
}

/*
这样的写法，楼主感觉有点繁琐，不好扩展，于是想通过 map 来实现功能，但是使用map时候出现编译错误：
*/

enum ItemKind1 : Int {
    case    All
    case    Mine
    case    InUse
    case    Archive
    
    
    static let all = [ItemKind.All, ItemKind.Mine, ItemKind.InUse, ItemKind.Archive]
    static let strings = ["All", "Mine", "In Use", "Archive"]
    static let values:[String:ItemKind] = all.map { //报错
        /// ???
        return ($0.description, $0)
        /// ??? or something
        
    }
    
    
    var description: String {
        return ItemKind.strings[self.rawValue]
    }
}  



//: ### 问题解答

/*
事实上，map是从一个数组，变换为另外一个数组，而不能由数组变换为一个字典。正确做法有2种，第一种是用forEach来对目标字典进行赋值。见下面的代码：
*/

enum ItemKind2 : Int {
    case    All
    case    Mine
    case    InUse
    case    Archive
    
    static let all = [ItemKind.All, ItemKind.Mine, ItemKind.InUse, ItemKind.Archive]
    static let values:[String:ItemKind] = {
        var result: [String: ItemKind] = [:]
        all.forEach {
            result[$0.description] = $0
        }
        return result
    }()
    
    var description: String {
        return String(self)
    }
}
print(ItemKind2.values)



/*
另外一种做法，既然数组不支持到字典的转换，那我们实现一个即可：
*/

extension Array {
    func mapThatReturnsADictionary<KeyType:Hashable>(lambdaThatCreatesOneDictEntryFrom:(Element)->(KeyType,Element))->[KeyType:Element] {
        var result: [KeyType:Element] = [:]
        self.forEach {elt in
            let (key,value) = lambdaThatCreatesOneDictEntryFrom(elt)
            result[key] = value
        }
        return result
    }
}
enum ItemKind4 : Int {
    case    All
    case    Mine
    case    InUse
    case    Archive
    
    static let all: [ItemKind] = [.All, .Mine, .InUse, .Archive]
    static let values: [String: ItemKind] = all.mapThatReturnsADictionary{($0.description,$0)}
    
    var description: String {
        return String(self)
    }
}

print(ItemKind4.values)

//: [上一个问题](@previous)      [下一个问题](@next)
