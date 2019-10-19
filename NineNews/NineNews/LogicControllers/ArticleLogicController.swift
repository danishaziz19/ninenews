//
//  ArticleLogicController.swift
//  NineNews
//
//  Created by Danish Aziz on 18/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

enum ArticleCellType: String{
    case article = "articleCell"
}

protocol ArticleLogicControllerDelegate {
    func didSelectCell(article: Article)
}

class ArticleLogicController: NSObject {

    let viewModel: ArticleViewModel = ArticleViewModel()
    var articles: [Article] = []
    var tableView: UITableView?
    var delegate: ArticleLogicControllerDelegate?

    /// Set TableView
    ///
    /// - set tableview delegate, dataSource and register cell
    func setupTableView(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.separatorStyle = .none
        self.registerCell()
    }
    
    /// register tableview cell
    func registerCell() {
        self.tableView?.register(UINib (nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: ArticleCellType.article.rawValue)
    }
    
    /// Get Articles
    ///
    /// get articles from server and set to local article variable
    func getArticles() {
        self.viewModel.getArticle { [weak self]  response in
            switch response {
            case .success(let articles):
                guard let articles = articles else { return }
                self?.articles = articles
                self?.articleSorted()
                DispatchQueue.main.async {
                    self?.reload()
                }
            case .error(let error):
                print(error)
            }
        }
    }

    /// reload tableview
    func reload() {
        self.tableView?.reloadData()
    }
    
    /// Article Sorted
    ///
    /// Sorting the latest article first in the list, use article's 'timeStamp
    func articleSorted() {
        self.articles = articles.sorted(by: { $0.timeStamp.date.compare($1.timeStamp.date) == .orderedDescending })
        print(self.articles)
    }
    
    /// Get CellForRowAt
    ///
    /// - Parameter : Return UITableViewCell
    func getCellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let source = articles[indexPath.row]
        guard let cell: ArticleTableViewCell = tableView.dequeueReusableCell(withIdentifier: ArticleCellType.article.rawValue) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setCell(artical: source)
        return cell
    }
}

// MARK: TableView Delegate and Data Source

extension ArticleLogicController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.getCellForRowAt(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let source = articles[indexPath.row]
        self.delegate?.didSelectCell(article: source)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

