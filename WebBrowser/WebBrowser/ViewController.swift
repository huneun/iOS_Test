//
//  ViewController.swift
//  WebBrowser
//
//  Created by 비알스톰 on 2021/03/17.
//  Copyright © 2021 TestApp. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var WebViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //1. url string
        //2. url > request
        //3. req > load
        
        let urlString = "https://www.google.com"
        if let url = URL(string : urlString){ //unwrap
            let urlReq = URLRequest(url: url)
            WebViewMain.load(urlReq)
        }
        
//        var abc = "1"
//        var abc1 :String? = nil // (recommand!) unwrapping = optionall binding
//        let aaa = abc1! // unwrapping
//        
//
//        let abc2 = "2"
        
        
        
    }


}

