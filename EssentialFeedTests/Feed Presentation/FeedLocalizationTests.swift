//
//  FeedLocalizationTests.swift
//  EssentialFeediOSTests
//
//  Created by Wan Ahmad Lutfi on 06/03/2023.
//

import XCTest
import EssentialFeed

final class FeedLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Feed"
        let presentationBundle = Bundle(for: FeedPresenter.self)
        assertLocalizedKeyAndValuesExist(in: presentationBundle, table)
    }
}
