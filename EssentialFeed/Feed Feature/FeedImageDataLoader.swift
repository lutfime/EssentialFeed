//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Wan Ahmad Lutfi on 22/02/2023.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
