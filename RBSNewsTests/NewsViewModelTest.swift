//
//  NewsViewModelTest.swift
//  RBSNewsTests
//
//  Created by naeem alabboodi on 7/1/21.
//

import XCTest
@testable import RBSNews

class NewsViewModelTest: XCTestCase {
    
    var  newsViewModel = NewsViewModel()
    
    func test_parseJSON(){
        // GIVEN
        var resouceName = "News"
        // WHEN
        XCTAssertEqual(self.newsViewModel.numberOfArticles, 0)
        
        self.newsViewModel.parseJSON(resouceName) { }
        // THAn
        XCTAssertEqual(self.newsViewModel.numberOfArticles, 6)
        // GIVEN
        resouceName = "NewsFailure"
        // WHEN
        newsViewModel.parseJSON(resouceName) {  }
        // THAN
        XCTAssertEqual(newsViewModel.numberOfArticles, 0)
        
        
    }
    
    func test_getArticlesData(){
        var intNum:Int = 0
        var resouceName = "News"
        XCTAssertEqual(self.newsViewModel.numberOfArticles, 0)
        
        newsViewModel.parseJSON(resouceName) { }
        
        let name = newsViewModel.getArticlesData(for: intNum).name
        XCTAssertTrue(name != "")
        var title  =  newsViewModel.getArticlesData(for: intNum).title
        var urlima = newsViewModel.getArticlesData(for: intNum).imageUrl
        XCTAssertNotNil(title )
        XCTAssertNotNil(urlima )
        intNum = 1
         title  =  newsViewModel.getArticlesData(for: intNum).title
         urlima = newsViewModel.getArticlesData(for: intNum).imageUrl
        XCTAssertEqual(title, "")
        XCTAssertEqual(urlima, "")
     
        resouceName = "NewsFailure"
        newsViewModel.parseJSON(resouceName) { }
     
        
        let urlima2 = newsViewModel.getArticlesData(for: intNum).imageUrl

        XCTAssertEqual("", "") 
        XCTAssertTrue(urlima2 == "" )
        
    
    
    }
    
    
   
    
    
    
}
