//
//  ViewController.swift
//  AVPlayerEx
//
//  Created by 비알스톰 on 2021/03/17.
//  Copyright © 2021 TestApp. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        //비디오 파일명을 사용하여 비디오가 저장된 앱 내부의 파일 경로를 받아옴
        let filePath:String? = Bundle.main.path(forResource: "dibidibi_Launch_video_iPhone_6 Plus, 6s Plus, 7 Plus, 8 Plus", ofType: "mp4")
        // 앱 내부의 파일명을 NSURL 형식으로 변경
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오 재생
    }
    
    @IBAction func btnPlayEnternalMovie(_ sender: UIButton) {
        //외부에 링크된 주소를 NSURL형식으로 변경
        let url = NSURL(string: "https://youtu.be/yOYnXoFvmj4")!
        playVideo(url: url) //앞에서 얻은 url을 사용하여 비디오를 재생
    }
    
    private func playVideo(url: NSURL){
        //AVPlayerController의 인스턴스 생성
        let playerController = AVPlayerViewController()
        //비디오 URL로 초기화된 AVPlayer의 인스턴스 생성
        let player = AVPlayer(url: url as URL)
        //playerController의 player속성에 위에서 생성한 AVPlayer 인스턴스를 할당
        playerController.player = player
        self.present(playerController, animated: true){
            player.play() //비디오 재생
        }
    }
    
}

