//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 07/03/2023.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
