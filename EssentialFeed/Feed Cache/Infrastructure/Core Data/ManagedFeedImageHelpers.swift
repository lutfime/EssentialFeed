//
//  ManagedFeedImageHelpers.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 15/02/2023.
//

import CoreData

extension ManagedFeedImage{
    static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
        return NSOrderedSet(array: localFeed.map { local in
            let managed = ManagedFeedImage(context: context)
            managed.id = local.id
            managed.imageDescription = local.description
            managed.location = local.location
            managed.url = local.url
            return managed
        })
    }

    var local: LocalFeedImage {
        return LocalFeedImage(id: id!, description: imageDescription, location: location, url: url!)
    }
}
