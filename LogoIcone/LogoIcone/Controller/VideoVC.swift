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
    
    override func viewDidApper(_ animated: Bool) {
        super.viewDidApper(animated)

        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "", ofType: "m4v")!))
        
        let vc = AVPlayerViewController()
        vc.player = player
        present(vc, animated: true)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        
    }
}

