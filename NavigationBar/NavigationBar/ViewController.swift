//
//  ViewController.swift
//  NavigationBar
//
//  Created by 비알스톰 on 2021/03/17.
//  Copyright © 2021 TestApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Click_moveBtn(_ sender: Any) {
        // nill =null
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController") {
            //push, add? controller = navi
            self.navigationController?.pushViewController(controller, animated: true)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

