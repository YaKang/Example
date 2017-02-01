//
//  JDItemInfoViewController.swift
//  CustomTransitionVc
//
//  Created by 王亚康 on 2017/1/28.
//  Copyright © 2017年 王亚康. All rights reserved.
//

import UIKit

class JDItemInfoViewController: UIViewController {

    
    @IBAction func buyItemClick(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("deinit -> JDItemInfoViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
