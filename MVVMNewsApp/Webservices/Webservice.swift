//
//  Webservice.swift
//  MVVMNewsApp
//
//  Created by DA MAC M1 139 on 2023/06/02.
//

import Foundation
import UIKit

struct Webservice{
    func getArticles(url: URL, completion: @escaping([Article]?) -> Void){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
                print(data)
                
                let articles = try? JSONDecoder().decode(Articles.self, from: data).articles
                if let articles = articles {
                    print(articles)
                    completion(articles)
                }
            }
        }.resume()
    }
}
