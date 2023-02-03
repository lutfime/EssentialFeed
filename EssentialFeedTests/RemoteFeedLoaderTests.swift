//
//  EssentialFeedTests.swift
//  EssentialFeedTests
//
//  Created by Wan Ahmad Lutfi on 04/02/2023.
//

import XCTest
@testable import EssentialFeed

class RemoteFeedLoader{
    
}

class HTTPClient {
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }

}
