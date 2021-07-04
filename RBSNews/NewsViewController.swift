//
//  NewsViewController.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController {
    
    var newsViewModel: NewsViewModel!
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News screen"
        newsViewModel = NewsViewModel()
        
        newsViewModel.parseJSON("News") { [weak self] in
            self?.newsTableView.reloadData()
        }
       
    }
    
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewModel.numberOfArticles
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        let article = newsViewModel.getArticlesData(for: indexPath.row)
        
        cell.setupNewsCell(source: article.name, title: article.title)
        cell.setupNewsImage(imageURL: article.imageUrl)
        return cell
    }
    
    
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let urlString = newsViewModel.getArticleUrl(for: indexPath.row)
        if let url = URL(string: urlString){
            let safariViewController = SFSafariViewController(url: url)
                present(safariViewController, animated: true, completion: nil)
                safariViewController.delegate = self
        }
        
    }
}

extension NewsViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
