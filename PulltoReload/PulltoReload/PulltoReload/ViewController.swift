//
//  ViewController.swift
//  PulltoReload
//
//  Created by 비알스톰 on 2021/06/01.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var webViewContainer: UIView!
    var webView: WKWebView!
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        webView = WKWebView(frame: webViewContainer.bounds)
        if let webView = webView {
            webView.translatesAutoresizingMaskIntoConstraints = false
            webViewContainer.addSubview(webView)
            let bindings: [String: AnyObject] = ["webView": webView]
            
            webViewContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[webView]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: bindings))
            
            webViewContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[webView]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: bindings))

            let url = URL(string:"https://devm.dibidibi.com:454")
            let request = URLRequest(url:url!)
            webView.load(request)
        }
        
        refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
        webView.scrollView.bounces = true
        
    }
    
    @objc func refreshWebView(_ sender: UIRefreshControl) {
        webView?.reload()
        print("refreshWebview", webView.url?.absoluteString)
        sender.endRefreshing()
    }
    
    
    func request(url: String) {
        self.webView.load(URLRequest(url: URL(string: url)!))
        self.webView.navigationDelegate = self
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.request(url: searchBar.text!)
        
        self.view.endEditing(true)
    }
}

extension ViewController: WKNavigationDelegate {
    
    // loading 완료시 호출
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("webViewloadingFinish", webView.url?.absoluteString)
    }
    
    // loading 시작시 호출
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // 로딩 아이콘 표시 숨기기 등등
        print("webViewloadingStart")
    }
    
    // loading 실패시
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        //
        print("webViewloadingError", error)
    }
    
    //WKWEbView HTTPURLResponse정보를 확인하는 딜리게이트 함수
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if(navigationResponse.response is HTTPURLResponse) {
            let response = navigationResponse.response as? HTTPURLResponse
            print(String(format: "response.statusCode: %Id", response?.statusCode ?? 0))
        }
        
        decisionHandler(.allow)
    }
    

}

