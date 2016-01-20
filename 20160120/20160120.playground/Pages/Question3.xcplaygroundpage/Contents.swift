//: ### Question3: Sorting Dictionarys in Arrays
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34838580/sorting-dictionarys-in-arrays)
//: ### 问题描述

/*:
楼主的问题是，根据字典中某一个key进行排序，按照顺序输出结果，见下面代码：
PS：帖子中代码是不能运行的，因为product1的类型编译器推断不出来，必须显式指定为：[String: Any]，跟帖中定义为[String: AnyObject] 也是错的。因为value都是值类型的，不能用AnyObject来表示。
*/

// 输入
var product1: [String: Any] = ["name": "milk", "price": 3.2]
var product2: [String: Any] = ["name": "bread", "price": 2.9]
var product3: [String: Any] = ["name": "meat", "price": 4.1]
var product4: [String: Any] = ["name": "sweets", "price": 1.0]
// 输出
var priceArray = [1.0,2.9,3.2,4.1]
var nameArray = ["sweets","bread","milk","meat"]

//: ### 问题解答

/*:
解法一：传统的思路来解决
*/


let product11: [String: Any] = ["name": "milk","price": 3.2]
let product21: [String: Any] = ["name": "bread","price": 2.9]
let product31: [String: Any] = ["name": "meat","price": 4.1]
let product41: [String: Any] = ["name": "sweets", "price": 1.0]

var tempDictArray = [[String: Any]]()
tempDictArray.append(product11)
tempDictArray.append(product21)
tempDictArray.append(product31)
tempDictArray.append(product41)

func priceSort(dict1: [String: Any], dict2: [String: Any]) -> Bool {
    let price1 = dict1["price"] as? Float ?? 0
    let price2 = dict2["price"] as? Float ?? 0
    return price1 < price2
}


tempDictArray = tempDictArray.sort(priceSort)

var priceArray1 = [Float]()
var nameArray1 = [String]()

for item in tempDictArray {
    
    let price = item["price"] as? Float ?? 0
    let name = item["name"] as! String
    
    priceArray1.append(price)
    nameArray1.append(name)
}
priceArray1    //[1, 2.9, 3.2, 4.1]
nameArray1     //["sweets", "bread", "milk", "meat"]



/*:
解法二：推荐解法
*/

// 1、使用 struct 替代字典，更加直观和自然

struct Product {
    let name: String
    let price: Double
    
    init?(dict:[String:Any]) {
        guard
            let name = dict["name"] as? String,
            let price = dict["price"] as? Double else {
                return nil
        }
        self.name = name
        self.price = price
    }
}

// 2、定义输入



let productsDict = [product11, product21, product3, product4]

// 3、排序得到结构体数组

let products = productsDict.flatMap { Product(dict: $0) }.sort{ $0.price < $1.price }


// 4、输出结果

let prices2 = products.map { $0.price }
let names2 = products.map { $0.name }


/*:
解法三：与第二种大同小异，有一些细节的差异，大家可以参考一下：
*/

// Define a structure to hold your data.
// The protocol CustomStringConvertible allows you to format the
// data as a nice string for printing.

struct Product1: CustomStringConvertible {
    var name: String
    var price: Double
    var description: String { return "name: \(name), price: \(price)" }
    
    init?(info: [String: Any]) {
        guard let name = info["name"] as? String,
            let price = info["price"] as? Double else { return nil }
        self.name = name
        self.price = price
    }
}


var products1 = [Product1(info: product1), Product1(info: product2), Product1(info: product3), Product1(info: product4)].flatMap {$0}

products1.sortInPlace { $0.price < $1.price }

products1.forEach { print($0) }

let priceArray2 = products1.map { $0.price }  // [1.0, 2.9, 3.2, 4.1]
let nameArray2 = products1.map { $0.name }    // ["sweets", "bread", "milk", "meat"]



//: [上一个问题](@previous)      [下一个问题](@next)
