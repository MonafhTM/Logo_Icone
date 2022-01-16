//
//  VideoVC.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.
//

import UIKit
import AVKit
import AVFoundation


class VideoVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //         For Video
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Video", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        player.volume = 0
        view.layer.addSublayer(layer)
        player.play()
        
    }
}
