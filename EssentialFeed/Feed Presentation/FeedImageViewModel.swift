//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 06/03/2023.
//

import Foundation

public struct FeedImageViewModel<Image> {
    public let description: String?
    public let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool
    
    public var hasLocation: Bool {
        return location != nil
    }
}
