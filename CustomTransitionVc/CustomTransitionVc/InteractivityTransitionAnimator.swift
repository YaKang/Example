//
//  InteractivityTransitionAnimator.swift
//  CustomTransitionVc
//
//  Created by 王亚康 on 2017/1/29.
//  Copyright © 2017年 王亚康. All rights reserved.
//  动画怎么做

import UIKit

class InteractivityTransitionAnimator: NSObject {

    // 动画的类型
    fileprivate var transType: Transitioning?
    
    init(trans: Transitioning) {
        super.init()
        transType = trans
    }
    
}

extension InteractivityTransitionAnimator : UIViewControllerAnimatedTransitioning {
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        switch transType! {
        case .present:
            persentAnimation(transitionContext: transitionContext)
        case .dismiss:
            dismissAnimation(transitionContext: transitionContext)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
}

extension InteractivityTransitionAnimator {
    // 需要关注一下from/to和presented/presenting的关系
    // For a Presentation:
    //      fromView = The presenting view.
    //      toView   = The presented view.
    // For a Dismissal:
    //      fromView = The presented view.
    //      toView   = The presenting view.
    
    // 显示
    func persentAnimation(transitionContext: UIViewControllerContextTransitioning) {
        let fromVc = transitionContext.viewController(forKey: .from)
        let toVc = transitionContext.viewController(forKey: .to)
        let contentView = transitionContext.containerView
        
//        let fromView = fromVc?.view
        let toView = toVc?.view
        contentView.addSubview(toView!)
        
        let initFrame = transitionContext.initialFrame(for: fromVc!)
//        let finshFrame = transitionContext.finalFrame(for: toVc!)
        let initOffset = initFrame.offsetBy(dx: initFrame.width * 1, dy: 0)
        toView?.frame = initOffset
        
        UIView.animate(withDuration: 0.25, animations: {
            
            toView?.frame = initFrame
        }) { (true) in
            let comp = transitionContext.transitionWasCancelled
            if comp { toView?.removeFromSuperview() }
            transitionContext.completeTransition(!comp)
        }
        
    }
    
    // 隐藏
    func dismissAnimation(transitionContext: UIViewControllerContextTransitioning) {
        let fromVc = transitionContext.viewController(forKey: .from)
//        let toVc = transitionContext.viewController(forKey: .to)
//        let contentView = transitionContext.containerView
        
        let fromView = fromVc?.view
//        let toView = toVc?.view
        
        let initFrame = transitionContext.initialFrame(for: fromVc!)
        let initOffset = initFrame.offsetBy(dx: initFrame.width * 1, dy: 0)
//        toView?.frame = initOffset
        
        UIView.animate(withDuration: 0.25, animations: {
            fromView?.frame = initOffset
//            contentView.insertSubview(toView!, belowSubview: fromView!)
            
        }) { (true) in
            let comp = transitionContext.transitionWasCancelled
//            if comp { toView?.removeFromSuperview() }
            transitionContext.completeTransition(!comp)
        }
    }
}


