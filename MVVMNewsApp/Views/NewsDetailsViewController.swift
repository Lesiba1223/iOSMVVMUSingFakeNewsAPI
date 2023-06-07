//
//  NewsDetailsViewController.swift
//  MVVMNewsApp
//
//  Created by DA MAC M1 139 on 2023/06/02.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
     
    
    var titleLbl = ""
    var descriptionLbl = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = titleLbl
        descriptionLabel.text = descriptionLbl

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
