//
//  JDLanZiTransitioningAnimation.swift
//  CustomTransitionVc
//
//  Created by 王亚康 on 2017/1/28.
//  Copyright © 2017年 王亚康. All rights reserved.
//

import UIKit

enum Transitioning {
    case present
    case dismiss
}

class JDLanZiTransitioningAnimation: NSObject {

    // 动画的类型
    fileprivate var transType: Transitioning?
    
    init(trans: Transitioning) {
        super.init()
        transType = trans
    }
}

extension JDLanZiTransitioningAnimation : UIViewControllerAnimatedTransitioning {
    
    // 动画的时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    // 动画怎么执行
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        switch transType! {
        case .present:
            persentAnimation(transitionContext: transitionContext)
        case .dismiss:
            dismissAnimation(transitionContext: transitionContext)
            
        }
    }
    
}

// 写具体的动画
extension JDLanZiTransitioningAnimation {
    
    // 需要关注一下from/to和presented/presenting的关系
    // For a Presentation:
    //      fromView = The presenting view.
    //      toView   = The presented view.
    // For a Dismissal:
    //      fromView = The presented view.
    //      toView   = The presenting view.
    
    // 显示
    func persentAnimation(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let contentView = transitionContext.containerView
        
        let fromView = fromViewController?.view
        let toView = toViewController?.view
        toView?.frame = CGRect(x: 0.0, y: 200, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.height - 200)
        contentView.addSubview(toView!)
        
        toView?.transform = CGAffineTransform.init(translationX: 0.0, y: UIScreen.main.bounds.size.height)
        
        // 创建一个 遮罩 view （黑色遮罩）
        let markView = UIView(frame: UIScreen.main.bounds)
        markView.backgroundColor = UIColor.black
        markView.alpha = 0.0
        fromView?.addSubview(markView)
        
        var transfrom = CATransform3DIdentity
        UIView.animate(withDuration: 0.25, animations: {
            transfrom.m24 = -1/3000
            transfrom = CATransform3DScale(transfrom, 0.85, 0.85, 1.0)
            fromView?.layer.transform = transfrom
            
            markView.alpha = 0.5
            
        }) { (true) in
            
            UIView.animate(withDuration: 0.5, animations: {
//                toView?.alpha = 0.6
                transfrom = CATransform3DIdentity
                transfrom = CATransform3DScale(transfrom, 0.85, 0.85, 1.0)
                fromView?.layer.transform = transfrom
                
                //                transfrom = CATransform3DIdentity
                //                transfrom = CATransform3DTranslate(transfrom, 0.0, -0.8, 0.0)
                //                toView?.layer.transform = transfrom
                toView?.transform = CGAffineTransform.identity
                
                
            }, completion: { (true) in
                transitionContext.completeTransition(true)
            })
        }
    }
    
    // 隐藏
    func dismissAnimation(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
//        let contentView = transitionContext.containerView
        
        let fromView = fromViewController?.view
        let toView = toViewController?.view
        var markView = toView?.subviews.last
        
        var transfrom = CATransform3DIdentity
        
        UIView.animate(withDuration: 0.25, animations: {
            fromView?.transform = CGAffineTransform.init(translationX: 0, y: UIScreen.main.bounds.size.height)
            
            markView?.alpha = 0.0
            
            transfrom.m24 = -1/3000
            transfrom = CATransform3DScale(transfrom, 0.85, 0.85, 1.0)
            toView?.layer.transform = transfrom
            
        }) { (true) in
            markView?.removeFromSuperview()
            markView = nil

            UIView.animate(withDuration: 0.25, animations: { 
                transfrom = CATransform3DIdentity
                transfrom = CATransform3DScale(transfrom, 1.0, 1.0, 1.0)
                toView?.layer.transform = transfrom
            }, completion: { (true) in
                transitionContext.completeTransition(true)
                UIView.animate(withDuration: 0.25, animations: { 
                    
                }, completion: { (true) in
                })
            })
        }
    }
    
}
