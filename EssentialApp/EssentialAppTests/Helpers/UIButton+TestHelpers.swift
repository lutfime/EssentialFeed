//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Wan Ahmad Lutfi on 22/02/2023.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
