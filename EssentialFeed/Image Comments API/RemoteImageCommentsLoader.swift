//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 10/03/2023.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader{
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
