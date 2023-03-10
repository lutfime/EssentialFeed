//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 04/02/2023.
//

import Foundation


public class RemoteFeedLoader: FeedLoader {
    let client: HTTPClient
    let url: URL
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = FeedLoader.Result
    
    public init(url: URL,client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) {[weak self] result in
            guard self != nil else {return}
            
            switch result {
            case .success((let data, let response)):
                completion(RemoteFeedLoader.map(data, from: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
    
    private static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let items = try FeedItemsMapper.map(data, from: response)
            return .success(items)
        } catch {
            return .failure(error)
        }
    }
}
