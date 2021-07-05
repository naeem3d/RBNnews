//
//  UIImageView+Extensions.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import Foundation
import UIKit

extension UIImageView {
   
   func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
    let Cashe = NewsViewModel.shared.cache
    
    guard let url = URL(string: link) else { return }
    let cashekey = NSString(string: "\(link)")
    
        contentMode = mode
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
               let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
           let link = "\(url)"
            
            if let image  = Cashe.object(forKey: cashekey){
                self.image = image
            }
            Cashe.setObject(image, forKey: link as NSString)
           DispatchQueue.main.async {
                self.image = image
           }
             
        }.resume()
    }
	
    
}
