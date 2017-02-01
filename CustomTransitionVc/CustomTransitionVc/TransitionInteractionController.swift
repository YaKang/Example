//
//  TransitionInteractionController.swift
//  CustomTransitionVc
//
//  Created by 王亚康 on 2017/1/29.
//  Copyright © 2017年 王亚康. All rights reserved.
//

import UIKit

class TransitionInteractionController: UIPercentDrivenInteractiveTransition {

    var gestureRecognizer: UIScreenEdgePanGestureRecognizer
    var rectEdge: UIRectEdge
    var transitionContext: UIViewControllerContextTransitioning? = nil
    
    init(gestureRecognizer: UIScreenEdgePanGestureRecognizer, edgeDragging edge: UIRectEdge) {
        
        assert(edge == .top ||
            edge == .bottom ||
            edge == .left ||
            edge == .right, "只能是 上下左右 其中一个")
        
        self.gestureRecognizer = gestureRecognizer
        self.rectEdge = edge
        
        super.init()
        
        self.gestureRecognizer.addTarget(self, action: #selector(gestureRecognizerUpdate(gesture:)))
        
    }
    
    override func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        
        super.startInteractiveTransition(transitionContext)
    }
    
    // 计算完成的百分比
    func percentFor(gesture: UIScreenEdgePanGestureRecognizer) -> CGFloat {
        guard let contentView = transitionContext?.containerView else {
            return 0.0
        }
        let location = gesture.location(in: contentView)
        
        let W = contentView.bounds.size.width
//        let H = UIScreen.main.bounds.size.height
        
        switch rectEdge {
        case UIRectEdge.right:
            return (W - location.x) / W
        case UIRectEdge.left:
            return location.x / W
        default:
            return 0.0
        }
    }
    
    // 手势事件触发
    func gestureRecognizerUpdate(gesture: UIScreenEdgePanGestureRecognizer) {
        
        switch gesture.state {
        case .began: break
        case .changed:
            update(percentFor(gesture: gesture))
        case .ended : // 手势结束，判断 是否完成一半，是 完成，否 回去
            if percentFor(gesture: gesture) >= 0.5 {
                finish()
            }else{
                cancel()
            }
        default:
            cancel()
        }
    }
}

