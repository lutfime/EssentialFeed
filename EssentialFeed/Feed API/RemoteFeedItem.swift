//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 09/02/2023.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
