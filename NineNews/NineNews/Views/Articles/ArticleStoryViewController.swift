//
//  ArticleStoryViewController.swift
//  NineNews
//
//  Created by Danish Aziz on 19/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit
import WebKit

class ArticleStoryViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    let logicController: ArticleStoryLogicController = ArticleStoryLogicController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setDefault()
    }
    
    func setDefault() {
        self.title = "Story"
        self.logicController.setUINavigationBar(navigationBar: self.navigationController?.navigationBar)
        self.logicController.setupWebView(webView: self.webView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.logicController.hideProgressbar()
    }
    
    deinit {
        self.logicController.removeProgressbar()
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
