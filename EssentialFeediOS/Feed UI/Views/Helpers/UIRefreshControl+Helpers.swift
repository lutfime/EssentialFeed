//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Wan Ahmad Lutfi on 06/03/2023.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}

