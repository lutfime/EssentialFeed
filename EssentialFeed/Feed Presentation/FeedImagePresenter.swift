//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Wan Ahmad Lutfi on 06/03/2023.
//

import Foundation

public final class FeedImagePresenter{
    
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
