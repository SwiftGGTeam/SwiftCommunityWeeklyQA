//: ### Question on dismissing model ViewController
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/29701)
import Foundation

//: ### 问题描述


/*:
VolmDev 问了一个自己在实际开发中遇到的问题：应用需要登录操作，为此当主界面出现之后，跳转到登陆界面，输入账号密码，点击 Login 按钮，关闭登陆界面，回到主界面，一切就应该结束，不是吗？ 可问题偏偏出现了！当关闭登陆界面后居然又跳出了登陆界面！再关闭又打开？ VolmDev 抓狂了，这尼玛什么情况！他附上了完整的代码，如下：


这是ViewController.swift 文件源代码：

// ViewController.swift

import UIKit
import SafariServices

class ViewController: UIViewController, LoginViewDelegate  {

var safariViewController: SFSafariViewController?

override func viewDidLoad() {
super.viewDidLoad()
}

override func viewDidAppear(animated: Bool) {
super.viewDidAppear(animated)
showPopUp()
}

override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
}

func showPopUp()
{
let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
if let loginVC = storyboard.instantiateViewControllerWithIdentifier(
"LoginViewController") as? LoginViewController {
loginVC.delegate = self
self.presentViewController(loginVC, animated: true, completion: nil)
}
}

// delegate function.
func didTapLoginButton() {

self.dismissViewControllerAnimated(false, completion: nil)
//        if let authURL = GitHubAPIManager.sharedInstance.URLToStartOAuth2Login() {
//            safariViewController = SFSafariViewController(URL: authURL)
//            safariViewController?.delegate = self
//            if let webViewController = safariViewController {
//                self.presentViewController(webViewController, animated: true, completion: nil)
//            }
//        }
}
}

这是 LoginViewController.swift 文件源代码:

```swift
//  LoginViewController.swift
//  TestingPopUps

import UIKit

// this is a delegate function that can be used
// to call a funct+-*`*ion outside this class to do
// something on behafe of this class.
protocol LoginViewDelegate: class {
    func didTapLoginButton()
}

class LoginViewController: UIViewController {

weak var delegate: LoginViewDelegate?

@IBAction func btnDismiss(sender: AnyObject) {
// Note: I tried dismissing here too with failure
//self.dismissViewControllerAnimated(false, completion: nil)

if let delegate = self.delegate {
    delegate.didTapLoginButton()
    }

}

override func viewDidLoad() {
    super.viewDidLoad()
// Do any additional setup after loading the view.
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
}

当然，storyboard 还有些不关紧要的东西，倘若有兴趣，你可以自己来补充。

倘若不想看源代码思考下，请直接跳转到问题解答。*/





//: ### 问题解答

/*:
该例出现的问题其实很简单，但也是新手经常犯的错误。贴出逻辑错误的部分：

override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    showPopUp()
}

当 viewController 的主视图出现之后，调用showPopUp方法弹出登陆界面，貌似没什么错误。此时登陆界面位于主视图之上，输入账号密码之后点击按钮，通过 protocol+delegate 方法告知 viewController 视图控制器用户点击了登陆按钮，此时事件处理只是简单的关闭登陆视图：

func didTapLoginButton() {
self.dismissViewControllerAnimated(false, completion: nil)
}

关闭视图之后，意味着 viewController 的视图又出现了！那么就会调用`viewDidAppear` 方法，再次调用了`showPopUp`方法！问题就是这么来的。



#### 思考

今天的问题很基础，但是同样有我们值得学习的地方，我简单归纳下：


1. 你需要了解 ViewController 中几个方法的调用顺序，譬如：viewDidLoad() viewDidAppear() LoadView()等等
2. Protocol + Delegate 的用法。
3. 从 StoryBoard 中加载视图控制器。也就是 `storyboard.instantiateViewControllerWithIdentifier()`。
*/




//: [上一个问题](@previous)      [下一个问题](@next)
