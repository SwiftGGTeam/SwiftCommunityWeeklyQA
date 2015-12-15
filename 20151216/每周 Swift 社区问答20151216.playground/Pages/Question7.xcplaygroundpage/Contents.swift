//: ### Question7:Filter array on type
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/28185)
import Foundation

//: ### 问题描述
// 这是一个大问题！

// 声明了一个类
class X{
	var v:Int
	init(_ v:Int){self.v = v}
}

// 继承自X
class X1:X{}
// 继承自X
class X2:X{}

var a :[X]
var a1:[X1]
// 注意这里有些是用X1初始化 有些是用X2初始化
// 但是a数组的类型切记是[X],之所以能这么干的原因在于
// X1 X2都是X的子类，严格意义上来说，说X1 X2是X也是OK的
a=[X1(1),X1(2),X2(3),X2(4),X1(5)]
a[0].v  //输出1

// 错误来了
//a1 = a.filter { $0 is X1 } // <- ERROR
//a1[2].v

//: `is` 关键字就是用来判断某个实例的所属类，注意说的是实例。

//: 报错：Playground execution failed: playground78.swift:15:8: error: cannot invoke 'filter' with an argument list of type '(@noescape (X) throws -> Bool)'

// 提问者想是不是自己闭包格式没写全，于是修改了出错代码

// a1 = a.filter { (p:X) -> Bool in p is X1 } //<= 你可以把Error处的代码修改成这货试试

// 不出意外还是挂了

//: ### 问题解答

//: 首先我们要明白 filter 方法的用法，filter 函数接收一个闭包作为筛选数组元素的过滤器，闭包一次处理一个元素，符合返回true，反之false。只有那些true的元素才会被append到结果数组中返回。更多filter函数请点击[这里](http://www.jianshu.com/notebooks/1752038/latest)。

//: 接着看下问题代码：`a1 = a.filter { $0 is X1 }`

//: 先看式子右边a.filter { $0 is X1 } 传入了一个简化版闭包$0 is X1，其实就是作为筛选条件，一旦a中元素的类型为X1，即我们想要的元素，不过这里的元素类型依旧是X，而非X1，不难得出最后返回的是[X]结果数组； 在看式子左边a1，这货的类型是[X1]。原因找到了！就是因为[X1]≠[X]造成的，修改方式嘛，自然就是as喽。所以最后修改代码如下

// 现在请注释掉 Error 代码 
var a2:[X1]
a2 = a.filter{ $0 is X1} as! [X1]
a2.map{print("\($0.v)")}

// 其实我更推荐第二种方式，使用flatMap实现 
var a3 :[X1]
a3 = a.flatMap{$0 as? X1}

//: 我们对a数组中的元素进行遍历，每个都执行$0 as? X1类型转换，倘若成功就将元素转换为X1类型，失败则返回nil，最后flapMap会为我们剔除nil值。

//: ### 思考

//: 现在有个问题:倘若我们使用面向对象编程呢？上述两种方法还适用吗？

// NOTICE: 你可以将下述代码独立copy到另外一个playground中运行

// demo1
#if false
	protocol X{
		var v:Int{get}
	}
	
	// 继承自X
	class X1:X{
		var v:Int
		init(_ v:Int){self.v = v}
	}
	// 继承自X
	class X2:X{
		var v:Int
		init(_ v:Int){self.v = v}
	}
	
var a :[X]
var a1:[X1]
	// 注意这里有些是用X1初始化 有些是用X2初始化
a=[X1(1),X1(2),X2(3),X2(4),X1(5)]
a[0].v
a1 = a.filter{ $0 is X1} as! [X1] //报错：fatal error: array element cannot be bridged to Objective-C
	
var a2 = a.flatMap{ $0 as? X1}
	
// 看来只有flatMap依旧坚挺！如果想要使用filter的话，可以这么实现：
	
(a.filter { $0 is XValue }).map { $0 as! XValue }
#endif

//: 画蛇添足的赶脚。有木有更好的方法呢？报错说我们没有桥接到OC,让我想到了@objc，于是我尝试了下：

// demo2
#if false
	@objc protocol X{
		var v:Int{get}
	}
	
	// 继承自X
	class X1:X{
		@objc var v:Int
		init(_ v:Int){self.v = v}
	}
	// 继承自X
	class X2:X{
		@objc var v:Int
		init(_ v:Int){self.v = v}
	}
	
var a :[X]
var a1:[X1]
	// 注意这里有些是用X1初始化 有些是用X2初始化
a=[X1(1),X1(2),X2(3),X2(4),X1(5)]
a[0].v
var a2 = a.filter{ $0 is X1} as! [X1]
// It's OK!
#endif


//: [上一个问题](@previous)      [下一个问题](@next)
