//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 06/03/2023.
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
