//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 07/03/2023.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
