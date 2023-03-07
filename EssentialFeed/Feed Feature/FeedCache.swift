//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 07/03/2023.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
