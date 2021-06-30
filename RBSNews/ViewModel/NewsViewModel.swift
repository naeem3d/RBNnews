//
//  NewsViewModel.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import UIKit

class NewsViewModel {
    
    static let shared = NewsViewModel()
    let cache = NSCache<NSString,UIImage>()

    
    private var articles: [Article]?

    
    var numberOfArticles: Int {
        return articles?.count ?? 0
    }
    
    init() {}
    func parseJSON(_ completion: @escaping () -> Void) {
        if let url = Bundle.main.url(forResource: "News", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(News.self, from: data)
                
                self.articles = jsonData.articles

                completion()
            } catch {
                print("error while decoding the JSON data")
                completion()
            }
        }
    }
    
    
    func getArticlesData(for row:Int)-> (title:String, imageUrl:String, name:String) {
        
        if let articles = articles {
            let article = articles[row]
            var name = ""
            if let source = article.source {
                name = source.name
            }
            let title = article.title ?? ""
            let imageUrl = article.urlToImage ?? ""

            return (title, imageUrl, name)
        }
        
        return ("", "", "")
        
    }
    
    
    func getArticleUrl(for row:Int)-> String {
        
        if let articles = articles {
            let article = articles[row]
            return article.url ?? ""
        }
        
        return ""
        
    }
}
