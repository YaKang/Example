//
//  ViewController.swift
//  CustomTransitionVc
//
//  Created by 王亚康 on 2017/1/27.
//  Copyright © 2017年 王亚康. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func modelClick1(_ sender: Any) {
        let vc = JDAddItemViewController()
        present(vc, animated: true, completion: nil)
    }
    @IBAction func modelClick2(_ sender: Any) {
        let vc = InteractivityFirstViewController()
        present(vc, animated: true, completion: nil)
    }
    @IBAction func navClick1(_ sender: Any) {
    }
    @IBAction func navClick2(_ sender: Any) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {[weak self] in
////            let vc = SLViewController()
////            let vc = JDAddItemViewController()
//            let vc = InteractivityFirstViewController()
//            self?.present(vc, animated: true, completion: nil)
//            
////            self?.navigationController?.pushViewController(vc, animated: true)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

