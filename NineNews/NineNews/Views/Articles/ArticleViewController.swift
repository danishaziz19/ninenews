//
//  ArticleViewController.swift
//  NineNews
//
//  Created by Danish Aziz on 18/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let logicController: ArticleLogicController = ArticleLogicController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setDefault()
    }
    
    /// Set Default Value
    func setDefault() {
        self.title = "Articles"
        self.logicController.setupTableView(tableView: self.tableView)
        self.logicController.getArticles()
        self.logicController.delegate = self
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

extension ArticleViewController: ArticleLogicControllerDelegate {
    
    func didSelectCell(article: Article) {
        if let articleStoryViewController = self.storyboard?.instantiateViewController(withIdentifier: "articleStoryViewController") as? ArticleStoryViewController {
            articleStoryViewController.logicController.article = article
            self.navigationController?.pushViewController(articleStoryViewController, animated: true)
        }
    }
}
