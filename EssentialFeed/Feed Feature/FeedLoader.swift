//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 04/02/2023.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
