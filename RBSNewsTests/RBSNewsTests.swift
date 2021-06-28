//
//  RBSNewsTests.swift
//  RBSNewsTests
//
//  RBS Tests Project on 12/10/20.
//

import XCTest
@testable import RBSNews

class RBSNewsTests: XCTestCase {
    
    let newsViewModel = NewsViewModel()
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testNewsModelTotalResults() {
        newsViewModel.parseJSON { (news) in
            if let news = news {
                XCTAssertEqual(news.totalResults, 70, "Total results is not matching!")
            }
        }
    }
    
    func testNewsModelArticles() {
        newsViewModel.parseJSON { (news) in
            if let news = news, let articles = news.articles {
                XCTAssertEqual(articles.count, 20, "Articless count is not matching!")
            }
        }
    }

}
