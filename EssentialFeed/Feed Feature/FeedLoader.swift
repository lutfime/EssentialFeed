//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 04/02/2023.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>


protocol FeedLoader {    
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
