//
//  JDAddItemViewController.swift
//  CustomTransitionVc
//
//  Created by 王亚康 on 2017/1/28.
//  Copyright © 2017年 王亚康. All rights reserved.
//

import UIKit

class JDAddItemViewController: UIViewController {
    
    // 关闭窗口
    @IBAction func closeClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addItemToLanZi(_ sender: Any) {
        
        let vc = JDItemInfoViewController()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension JDAddItemViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return JDLanZiTransitioningAnimation(trans: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return JDLanZiTransitioningAnimation(trans: .dismiss)
    }
}
