//
//  ViewController.swift
//  ViewControllerSegue
//
//  Created by Allen Huang on 2018/4/22.
//  Copyright © 2018年 Allen Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func goToSecondViewWay1(_ sender: Any) {
        let secondViewController: SecondViewController
        secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        secondViewController.passData = "Hello"
        
        present(secondViewController, animated: true, completion: nil)
    }
    
    @IBAction func goToSecondViewWay2(_ sender: Any) {
        performSegue(withIdentifier: "goToSecondView", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondView" {
            let secondViewController = segue.destination as! SecondViewController
            
           secondViewController.passData = "Hello"
        }
    }
    

}

