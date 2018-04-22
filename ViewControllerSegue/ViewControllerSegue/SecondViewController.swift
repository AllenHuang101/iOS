//
//  SecondViewController.swift
//  ViewControllerSegue
//
//  Created by Allen Huang on 2018/4/22.
//  Copyright © 2018年 Allen Huang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var passData: String?
    
    @IBAction func dismiss(_ sender: Any) {
        passData = nil
        dataLabel.text = ""
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let passData = passData {
            dataLabel.text = passData
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
