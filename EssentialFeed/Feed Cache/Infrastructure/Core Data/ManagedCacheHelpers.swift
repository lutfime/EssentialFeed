//
//  ManagedCacheHelpers.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 15/02/2023.
//

import CoreData

extension ManagedCache{
    static func newUniqueInstance(in context: NSManagedObjectContext) throws -> ManagedCache {
        try find(in: context).map(context.delete)
        return ManagedCache(context: context)
    }
    
    static func deleteCache(in context: NSManagedObjectContext) throws {
        try find(in: context).map(context.delete).map(context.save)
    }
    
    static func find(in context: NSManagedObjectContext) throws -> ManagedCache? {
        let request = NSFetchRequest<ManagedCache>(entityName: entity().name!)
        request.returnsObjectsAsFaults = false //This flag set so you can access object immediately
        return try context.fetch(request).first
    }
    
    var localFeed: [LocalFeedImage] {
        return feed!.compactMap { ($0 as? ManagedFeedImage)?.local }
    }
}
