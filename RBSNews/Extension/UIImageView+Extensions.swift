//
//  UIImageView+Extensions.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import Foundation
import UIKit

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
           let link = "\(url)"

           NewsViewModel.shared.cache.setObject(image, forKey: link as NSString)
           DispatchQueue.main.async {
                self.image = image
           }
             
        }.resume()
    }
	
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        let cashekey = NSString(string: "\(link)")
        if let image = NewsViewModel.shared.cache.object(forKey: cashekey){
            self.image = image
            return
        }
        downloaded(from: url, contentMode: mode)
    }
}
