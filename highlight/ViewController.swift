//
//  ViewController.swift
//  highlight
//
//  Created by icafe on 16/1/13.
//  Copyright © 2016年 swiftcafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textView:UITextView?
    
    var textStorage = SwiftTextStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layoutManager = NSLayoutManager()
        
        textStorage.addLayoutManager(layoutManager)
        
        let textContainer = NSTextContainer()
        layoutManager.addTextContainer(textContainer)
        
        self.textView = UITextView(frame: CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height), textContainer: textContainer)
        self.textView?.text = "最近各大网站上最喜大普奔的新闻莫过于 Swift 正式开源这条了。这无疑是一个里程碑式的前进，苹果也向开源社区更加进了一步。那么 Swift 开源后有什么具体的改变呢，我们一一道来。"
        self.view.addSubview(self.textView!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

