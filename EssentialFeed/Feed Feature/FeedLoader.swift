//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 04/02/2023.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
