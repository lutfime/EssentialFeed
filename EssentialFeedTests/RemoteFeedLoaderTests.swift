//
//  EssentialFeedTests.swift
//  EssentialFeedTests
//
//  Created by Wan Ahmad Lutfi on 04/02/2023.
//

import XCTest
@testable import EssentialFeed

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    
    init(url: URL,client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let (sut, client) = makeSUT()
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }

    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        
        func get(from url: URL) {
            requestedURL = url
        }
    }

}
