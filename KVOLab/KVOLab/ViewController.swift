//
//  ViewController.swift
//  KVOLab
//
//  Created by Allen Huang on 2018/4/30.
//  Copyright © 2018年 Allen Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var observation: NSKeyValueObservation?
    @IBOutlet weak var dataTextView: UITextField!
    @objc dynamic var viewModel: ViewModel = ViewModel()

    @IBOutlet weak var valueTextView: UITextField!
    
    @IBAction func updateDataClick(_ sender: Any) {
        //觸發viewModel屬性值改變
        viewModel.value1 = valueTextView.text!
        viewModel.value2 = valueTextView.text!
    }
    @IBOutlet weak var updateDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 建立觀察者觀察viewModel.value1異動
        observation = observe(\.viewModel.value1, options:[.old, .new]) { (object, change) in
            //當viewModel.value1異動時，會執行此closure
            debugPrint("old \(change.oldValue)")
            debugPrint("new \(change.newValue)")
            debugPrint(object.viewModel.value1)
            self.dataTextView.text = change.newValue
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

