//
//  LocalFeedLoader.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 09/02/2023.
//

import Foundation

public class LocalFeedLoader{
    let store: FeedStore
    private let currentDate: () -> Date
    private let calendar = Calendar(identifier: .gregorian)

    public typealias SaveResult = Error?
    public typealias LoadResult = LoadFeedResult

    
    public init(store: FeedStore, currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }
    
    public func save(_ items: [FeedImage], completion: @escaping (SaveResult) -> Void){
        store.deleteCachedFeed { [weak self] error in
            guard let self else {return}
            
            if let error{
                completion(error)
            }else{
                self.cache(items, with: completion)
            }
        }
    }
    
    public func load(completion: @escaping (LoadResult) -> Void) {
        store.retrieve{[unowned self] result in
            switch result{
            case let .found(feed, timestamp) where self.validate(timestamp):
                completion(.success(feed.toModels()))
            case .found:
                self.store.deleteCachedFeed{_ in}
                completion(.success([]))
            case .empty:
                completion(.success([]))
            case .failure(let error):
                self.store.deleteCachedFeed{_ in}
                completion(.failure(error))
            }
        }
    }
    
    private func cache(_ items: [FeedImage], with completion: @escaping (SaveResult) -> Void) {
        store.insert(items.toLocal(), timestamp: currentDate()) { [weak self] error in
            guard self != nil else { return }
            
            completion(error)
        }
    }
    
    private var maxCacheAgeInDays: Int {
        return 7
    }
    
    private func validate(_ timestamp: Date) -> Bool{
        guard let maxCacheAge = calendar.date(byAdding: .day, value:maxCacheAgeInDays, to: timestamp) else{
            return false
        }
        return currentDate() < maxCacheAge
    }
    
}

private extension Array where Element == FeedImage {
    func toLocal() -> [LocalFeedImage] {
        return map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    }
}

private extension Array where Element == LocalFeedImage {
    func toModels() -> [FeedImage] {
        return map { FeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    }
}
