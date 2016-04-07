

/*:
autoclosure 的基本用法:
*/
func doSomeOperation(@autoclosure op: () -> Bool) {
    op()
}

doSomeOperation(2 > 3)


/*:
没有 autoclosure 的使用情况:
 */
func doSomeOperationWithoutAutoclosure(op: () -> Bool) {
    op()
}

doSomeOperationWithoutAutoclosure({2 > 3})
doSomeOperationWithoutAutoclosure{2 > 3}


/*:
2 个自动闭包的情况:
 */
//

func doSomeOperationWithTwoAutoclosure(@autoclosure op1: () -> Bool, @autoclosure _ op2: () -> Bool) {
    op1()
    op2()
}

doSomeOperationWithTwoAutoclosure(2 > 3, 3 > 2)


/*:
不能使用@noescape的情况
 */
func executeAsyncOp(asyncClosure: () -> ()) -> Void {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        asyncClosure()
    }
}

/*:
在文件读或写操作后，做一些其他操作 */
func doSomeOpAfterFileOp(@autoclosure fileOp: () -> Bool) {
    if fileOp() == true {
        //做其他操作
    }
}

func fileOp() -> Bool {
    return true
}

doSomeOpAfterFileOp(fileOp())


import Foundation
var customersInLine = ["Barry", "Daniella"]

var customerProviders: [() -> String] = []
func collectCustomerProviders(@autoclosure(escaping) customerProvider: () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.removeAtIndex(0))
collectCustomerProviders(customersInLine.removeAtIndex(0))


print("Collected \(customerProviders.count) closures.")

customersInLine

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}

customersInLine

//: [Next](@next)
