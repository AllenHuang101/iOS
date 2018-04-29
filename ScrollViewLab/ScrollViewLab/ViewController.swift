//
//  ViewController.swift
//  ScrollViewLab
//
//  Created by Allen Huang on 2018/4/28.
//  Copyright © 2018年 Allen Huang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
  
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func btnLogin(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
    }


    @objc func keyboardWillShow(notification: NSNotification) {
        //使用 contentInset 將 Scrollview
        let keyboardFrame: NSValue? = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
       
        
        if let keyboardFrame = keyboardFrame {
            let adjustment = keyboardFrame.cgRectValue.height
            
            scrollView.contentInset.bottom = adjustment
            scrollView.scrollIndicatorInsets.bottom = adjustment
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let keyboardFrame: NSValue? = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
        
        if keyboardFrame != nil {
            self.scrollView.contentOffset = CGPoint.zero
            scrollView.contentInset.bottom = 0
            scrollView.scrollIndicatorInsets.bottom = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

