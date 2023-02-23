//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Wan Ahmad Lutfi on 23/02/2023.
//

import Foundation
import UIKit
import EssentialFeed

struct FeedImageViewModel<Image>{
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
