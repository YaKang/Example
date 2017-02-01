//
//  InteractivitySecondViewController.swift
//  CustomTransitionVc
//
//  Created by 王亚康 on 2017/1/28.
//  Copyright © 2017年 王亚康. All rights reserved.
//

import UIKit

class InteractivitySecondViewController: UIViewController {
    
    // 添加手势
    lazy var edgeSlider: UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(sliderEdgeEvent(sender:)))
    
//    lazy var transDelegate = InteractivityViewControllerTrans()
    
    // 控制器消失
    @IBAction func dismissVcClick(_ sender: Any) {
        transAnimation(any: sender as AnyObject)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        edgeSlider.edges = .left
        view.addGestureRecognizer(edgeSlider)
    }
    
    // 手势 和 按钮 都会触发的方法
    func transAnimation(any: AnyObject) {
        
        guard let transdele = transitioningDelegate as? InteractivityViewControllerTrans else {
            return
        }

        if any.isKind(of: UIGestureRecognizer.classForCoder()) {
            // 是手势
            transdele.gestureRecognizer = edgeSlider
            transdele.targetEdge = .left
        }else{
            transdele.gestureRecognizer = nil
            transdele.targetEdge = .init(rawValue: 0)
        }
        
        presentingViewController?.dismiss(animated: true, completion: nil)
        
//        dismiss(animated: true, completion: nil)
        
    }
    
    // 边缘手势 识别器 触发
    func sliderEdgeEvent(sender: UIScreenEdgePanGestureRecognizer) {
        // 如果滑动手势已经开始， 这里只会调用一次
        if .began == edgeSlider.state {
            transAnimation(any: sender as AnyObject)
        }
        //        print(sender.edges)
    }
    
    deinit {
        print("InteractivitySecondViewController deinit")
    }

}
