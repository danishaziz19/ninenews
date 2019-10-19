//
//  ArticleStoryLogicController.swift
//  NineNews
//
//  Created by Danish Aziz on 19/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit
import WebKit

class ArticleStoryLogicController: NSObject {

    var article: Asset?
    var webView: WKWebView?
    var navigationBar: UINavigationBar?
    
    /// Progress view reflecting the current loading progress of the web view.
    let progressView = UIProgressView(progressViewStyle: .default)
    
    /// The observation object for the progress of the web view (we only receive notifications until it is deallocated).
    private var estimatedProgressObserver: NSKeyValueObservation?
    
    /// Set UINavigationBar
    func setUINavigationBar(navigationBar: UINavigationBar?) {
        self.navigationBar = navigationBar
    }
    
    /// Set webview
    func setupWebView(webView: WKWebView) {
        self.webView = webView
        self.webView?.navigationDelegate = self
        self.webView?.allowsBackForwardNavigationGestures = true
        self.setupProgressView()
        self.setupEstimatedProgressObserver()
        self.loadStory()
    }
    
    /// Load Story from URL
    func loadStory() {
        if let stroyUrl = article?.url, let url = URL(string: stroyUrl) {
            self.webView?.load(URLRequest(url: url))
        }
    }
    
    // hide ProgressBar
    func hideProgressbar() {
        self.progressView.removeFromSuperview()
    }
    
     // remove ProgressBar from navigation bar
    func removeProgressbar() {
        self.progressView.removeFromSuperview()
    }
    
    // MARK: - Private methods
    
    /// Setup Progressbar
    private func setupProgressView() {
        guard let navigationBar = self.navigationBar else { return }
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.addSubview(progressView)
        
        progressView.isHidden = true
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
            
            progressView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 2.0)
            ])
    }
    
    private func setupEstimatedProgressObserver() {
        estimatedProgressObserver = webView?.observe(\.estimatedProgress, options: [.new]) { [weak self] webView, _ in
            self?.progressView.progress = Float(webView.estimatedProgress)
        }
    }
}

extension ArticleStoryLogicController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {
        if progressView.isHidden {
            // Make sure our animation is visible.
            progressView.isHidden = false
        }
        
        UIView.animate(withDuration: 0.33,
                       animations: {
                        self.progressView.alpha = 1.0
        })
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIView.animate(withDuration: 0.33,
                       animations: {
                        self.progressView.alpha = 0.0
        },
                       completion: { isFinished in
                        // Update `isHidden` flag accordingly:
                        //  - set to `true` in case animation was completly finished.
                        //  - set to `false` in case animation was interrupted, e.g. due to starting of another animation.
                        self.progressView.isHidden = isFinished
        })
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
         self.progressView.isHidden = true
    }
}
