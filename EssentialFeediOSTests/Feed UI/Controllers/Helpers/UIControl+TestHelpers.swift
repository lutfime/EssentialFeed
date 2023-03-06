//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Wan Ahmad Lutfi on 22/02/2023.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
