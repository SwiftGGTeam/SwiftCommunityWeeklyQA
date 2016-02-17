//: ### Question1: A variable in generic class gets wrong type
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35338485/a-variable-in-generic-class-gets-wrong-type)
//: ### 问题描述

/*:
这个问题有点绕，大家细细看代码，涉及到继承和泛型的知识点。楼主的问题是问，定义的`serviceC`中的属性`cache`的`dynamicType`为神马是`AbstractCache<B>`,而不是`AbstractCache<C>`。
*/

// Models:
class A {}
class B: A { }
class C: B { }

// Cache:
class AbstractCache<T> {}

// Services:
class AbstractService<T> {
    let cache = AbstractCache<T>()
}
class ServiceA<T: A>: AbstractService<T> {}
class ServiceB<T: B>: ServiceA<B> {}
class ServiceC<T: C>: ServiceB<C> {}

let serviceC = ServiceC()
print(serviceC.cache.dynamicType) // 这里输出AbstractCache<B>

//: ### 问题解答

/*:
楼主首先定义了类A, B, C 的继承关系。然后定义了一个泛型类`AbstractCache<T>`,随后又定义了一个使用`AbstractCache<T>`的泛型类`AbstractService<T>`, 里面有一个属性`cache`是`AbstractCache<T>`的对象。这个时候 T 还没指定具体的类型。第一次指定 T 类型的时候是在定义`ServiceB<T: B>`时候，继承自`ServiceA<B>`,这里的 T 替换成了 B，所以即使`ServiceC<T: C>` 继承自 `ServiceB<C>`, 因为 B，C是继承关系，这样定义是合法的。但是改变不了 T 的指代。所以`cache`的`dynamicType`为`AbstractCache<B>`。
要解决这个问题，见以下代码，定义继承的时候，不要指定泛型具体的类型，见以下代码：
*/
class ServiceA<T: A>: AbstractService<T> {}
class ServiceB<T: B>: ServiceA<T> {}
class ServiceC<T: C>: ServiceB<T> {}

let serviceC = ServiceC()
print(serviceC.cache.dynamicType) // 这里输出AbstractCache<C>









//: [上一个问题](@previous)      [下一个问题](@next)
