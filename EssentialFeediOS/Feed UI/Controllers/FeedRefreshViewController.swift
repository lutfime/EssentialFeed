//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Wan Ahmad Lutfi on 22/02/2023.
//

import UIKit
import EssentialFeed

final class FeedRefreshViewController: NSObject, FeedLoadingView {
    
    
    private(set) lazy var view = loadView()
    
    private let loadFeed: () -> Void
    
    
    init(loadFeed: @escaping () -> Void) {
        self.loadFeed = loadFeed
    }
        
    @objc func refresh() {
        loadFeed()
    }
    
    func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view.beginRefreshing()
        } else {
            view.endRefreshing()
        }
    }
    
    private func loadView() -> UIRefreshControl {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}
