//
//  InteractivityViewControllerTrans.swift
//  CustomTransitionVc
//
//  Created by 王亚康 on 2017/1/29.
//  Copyright © 2017年 王亚康. All rights reserved.
//  自己完成动画，遵守的 协议

import UIKit

class InteractivityViewControllerTrans: NSObject {

    var gestureRecognizer: UIScreenEdgePanGestureRecognizer? = nil
    var targetEdge: UIRectEdge = .init(rawValue: 0)
    
}

extension InteractivityViewControllerTrans : UIViewControllerTransitioningDelegate {
    
    // 这两个 用于 基本
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return InteractivityTransitionAnimator(trans: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return InteractivityTransitionAnimator(trans: .dismiss)
    }
    
    // 这两个 用于 手势
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if let gesture = gestureRecognizer {
            return TransitionInteractionController(gestureRecognizer: gesture, edgeDragging: targetEdge)
        }else{
            return nil
        }
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if let gesture = gestureRecognizer {
            return TransitionInteractionController(gestureRecognizer: gesture, edgeDragging: targetEdge)
        }else{
            return nil
        }
    }
    
}
