//
//  ViewController.swift
//  MVVMNewsApp
//
//  Created by DA MAC M1 139 on 2023/06/02.
//

import UIKit

class NewsListViewController: UIViewController {
    
    private var articleVM: ArticlesViewModel!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
       
    }
    
    func setup() {
        
        guard let url = URL(string:"https://newsapi.org/v2/top-headlines?country=us&apiKey=18929a4d97d347128bf237e9d29fc571") else
        {
            return
        }
        
        Webservice().getArticles(url: url) { articles in
            
            if let articles = articles{
                self.articleVM = ArticlesViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
//Mark: - Tableview methds
extension NewsListViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return articleVM == nil ? 0 : self.articleVM.numberOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: indexPath) as? NewsListTableViewCell else { return UITableViewCell() }
        
        let articleVM = self.articleVM.articleAtIndex(indexPath.row)
        cell.titleTextLabel.text = articleVM.title
        cell.descriptionTextLabel.text = articleVM.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = storyboard?.instantiateViewController(identifier: "NewsDetailsViewController") as? NewsDetailsViewController
        storyboard?.titleLbl = articleVM.articleAtIndex(indexPath.row).title
        storyboard?.descriptionLbl = articleVM.articleAtIndex(indexPath.row).description
        navigationController?.pushViewController(storyboard!, animated: true)
        
    }
}



