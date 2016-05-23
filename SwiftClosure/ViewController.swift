//
//  ViewController.swift
//  SwiftClosure
//
//  Created by 程磊 on 16/4/15.
//  Copyright © 2016年 AA租车. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var label :UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label = UILabel.init(frame: CGRectMake(30, 80, 200, 60));
        label.text = "我是第一页的文字";
        label.numberOfLines = 0;
        label.textColor = UIColor.blackColor();
        self.view.addSubview(label);
        let btn = UIButton.init(type: UIButtonType.System);
        btn.frame = CGRectMake(60, 200, 150, 50);
        btn.setTitle("点我跳入下一页", forState: UIControlState.Normal);
        btn.addTarget(self, action: #selector(btnClick), forControlEvents: UIControlEvents.TouchUpInside);
        self.view .addSubview(btn);
    }
    //要进行传递的函数，注意参数类型及个数是否与下个页面定义的闭包函数格式相同
    func changeLabelTextClosure(string: String) -> Void {
        label.text = string;
    }
    func btnClick() -> Void {
        let secondVC = SecondViewController();
        //将当前changeLabelTextClosure函数指针传到第二个界面，第二个界面的闭包拿到该函数指针后会进行回调该函数
        secondVC.secondViewControllerClosure = changeLabelTextClosure;
        self.presentViewController(secondVC, animated: true) { 

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

