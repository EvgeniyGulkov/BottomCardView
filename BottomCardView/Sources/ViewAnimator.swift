//
//  ViewAnimator.swift
//  BottomCardView
//
//  Created by Gulkov on 13.08.2020.
//  Copyright © 2020 Gulkov. All rights reserved.
//

import UIKit
import pop

public class ViewAnimator {
    static func topSpringAnimation(view: BottomCardView, to: CGFloat, bounces: CGFloat, speed: CGFloat, _ completion: ((POPAnimation?, Bool) -> Void)?) {
        let spring = POPSpringAnimation(propertyNamed: kPOPViewFrame)
        var minY: CGFloat = view.maxHeight - to + view.viewInsets.top
        var height = to
        if minY <= view.viewInsets.top {
            minY = view.viewInsets.top
            height = view.maxHeight
        }
        spring?.toValue = CGRect(x: view.frame.minX, y: minY, width: view.frame.size.width, height: height)
        spring?.springBounciness = bounces
        spring?.springSpeed = speed
        spring?.completionBlock = {completion?($0, $1) }
        view.pop_add(spring, forKey: "kPOPViewFrameSpring")
    }

    static func topAnimation(view: BottomCardView, to: CGFloat, duration: Double, _ completion: ((POPAnimation?, Bool) -> Void)?) {
        let basic = POPBasicAnimation(propertyNamed: kPOPViewFrame)
        var minY: CGFloat = view.maxHeight - to + view.viewInsets.top
        var height = to
        if minY <= view.viewInsets.top {
            minY = view.viewInsets.top
            height = view.maxHeight
        }
        basic?.toValue = CGRect(x: view.frame.minX, y: minY, width: view.frame.size.width, height: height)
        basic?.duration = duration
        basic?.completionBlock = {completion?($0, $1)}
        view.pop_add(basic, forKey: "kPOPViewFrameBasic")
    }
}
