//
//  SLTwoViewController.swift
//  CustomTransitionVc
//
//  Created by 王亚康 on 2017/1/27.
//  Copyright © 2017年 王亚康. All rights reserved.
//

import UIKit

class SLTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.6, alpha: 1.0)

    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

}
