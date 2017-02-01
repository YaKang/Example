//
//  InteractivityFirstViewController.swift
//  CustomTransitionVc
//
//  Created by 王亚康 on 2017/1/28.
//  Copyright © 2017年 王亚康. All rights reserved.
//

import UIKit

class InteractivityFirstViewController: UIViewController {

    @IBAction func closeClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // 添加手势
    lazy var edgeSlider: UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(sliderEdgeEvent(sender:)))
    
    lazy var transDelegate = InteractivityViewControllerTrans()
    
    // 跳转到下一页
    @IBAction func nextPageClick(_ sender: Any) {
        transAnimation(any: sender as AnyObject)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgeSlider.edges = .right
        view.addGestureRecognizer(edgeSlider)
    }
    
    // 手势 和 按钮 都会触发的方法
    func transAnimation(any: AnyObject) {
        let vc = InteractivitySecondViewController()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = transDelegate
        
        if any.isKind(of: UIGestureRecognizer.classForCoder()) {
            // 是手势
            transDelegate.gestureRecognizer = edgeSlider
            transDelegate.targetEdge = .right
        }else{
            transDelegate.gestureRecognizer = nil
            transDelegate.targetEdge = .init(rawValue: 0)
        }
        
        present(vc, animated: true, completion: nil)
        
    }
    
    // 边缘手势 识别器 触发
    func sliderEdgeEvent(sender: UIScreenEdgePanGestureRecognizer) {
        // 如果滑动手势已经开始， 这里只会调用一次
        if .began == edgeSlider.state {
            transAnimation(any: sender as AnyObject)
        }
//        print(sender.edges)
    }
}
