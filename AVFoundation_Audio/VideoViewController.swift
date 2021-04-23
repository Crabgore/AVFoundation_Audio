//
//  VideoViewController.swift
//  AVFoundation_Audio
//
//  Created by Mihail on 23.04.2021.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {
    
    @IBOutlet weak var videoView: WKWebView!
    
    var video: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("video \(video)")
        let request = URLRequest(url: video!)
        videoView.load(request)
    }
}
