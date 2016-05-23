//
//  SecondViewController.swift
//  SwiftClosure
//
//  Created by aayongche on 16/4/15.
//  Copyright © 2016年 AA租车. All rights reserved.
//

import UIKit

/* 定义一个类似于OC中的block快代码，其中第一个页面中定义的函数参数个数以及类型必须按照下面的格式，
 从而确保在第一个页面定义的函数指针可以正确的传递到第二个页面，
 从而使第二个页面的闭包拿到第一个页面的函数指针进行回调
 */
typealias TwoViewControllerClosure = (string :String) -> Void;

class SecondViewController: UIViewController {

    var secondViewControllerClosure :TwoViewControllerClosure?
    let secondStr = "Hello World, This is Swift Closure"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.view.backgroundColor = UIColor.whiteColor();

        let btn = UIButton.init(type: UIButtonType.System);
        btn.frame = CGRectMake(50, 100, 220, 50);
        btn.backgroundColor = UIColor.redColor();
        btn.setTitle("点我传值到上个页面", forState: UIControlState.Normal);
        btn.addTarget(self, action: #selector(btnClick), forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(btn);
    }

    func btnClick() -> Void {
        if (secondViewControllerClosure != nil) {
            secondViewControllerClosure!(string: secondStr);
        }
        self.dismissViewControllerAnimated(true) { 

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
