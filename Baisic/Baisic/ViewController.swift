//
//  ViewController.swift
//  Baisic
//
//  Created by 비알스톰 on 2021/03/18.
//  Copyright © 2021 TestApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    lazy var imageView: UIImageView = {
//
//        let width: CGFloat = self.view.bounds.width/2
//        let height: CGFloat = 150
//
//        let posX: CGFloat = (self.view.bounds.width - width)/2
//        let posY: CGFloat = (self.view.bounds.height - height)/2
//
//        let imageView = UIImageView(frame: CGRect(x: posX, y: posY, width: width, height: height))
//        let myImage: UIImage = UIImage(named: "bgImage.jpg")!
//
//        imageView.image = myImage
//
//        return imageView
//    }()
//
    @IBOutlet weak var lblFirstView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
//        self.view.addSubview(self.imageView)
//
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func moveSecondView(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let secondView = storyboard.instantiateViewController(identifier: "NextViewController") as! NextViewController
        self.present(secondView, animated: true)
    }
    
    
    

}

