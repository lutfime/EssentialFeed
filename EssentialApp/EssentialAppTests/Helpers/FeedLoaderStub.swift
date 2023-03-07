//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Wan Ahmad Lutfi on 07/03/2023.
//

import Foundation
import EssentialFeed

class LoaderStub: FeedLoader {
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }

    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
