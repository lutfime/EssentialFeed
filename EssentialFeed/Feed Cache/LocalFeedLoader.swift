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

    
    public init(store: FeedStore, currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }
    
    public func save(_ items: [FeedItem], completion: @escaping (Error?) -> Void){
        store.deleteCachedFeed { [weak self] error in
            guard let self else {return}
            
            if let error{
                completion(error)
            }else{
                self.cache(items, with: completion)
            }
        }
    }
    
    private func cache(_ items: [FeedItem], with completion: @escaping (Error?) -> Void) {
        store.insert(items, timestamp: currentDate()) { [weak self] error in
            guard self != nil else { return }
            
            completion(error)
        }
    }
    
}
