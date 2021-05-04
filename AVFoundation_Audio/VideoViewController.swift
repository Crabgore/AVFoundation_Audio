//
//  VideoViewController.swift
//  AVFoundation_Audio
//
//  Created by Mihail on 23.04.2021.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {
    
    private let videoView: WKWebView = {
        let video = WKWebView()
        video.translatesAutoresizingMaskIntoConstraints = false
        return video
    }()
    
    var video: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        let request = URLRequest(url: video!)
        videoView.load(request)
    }
    
    private func setupViews() {
        view.addSubview(videoView)
        
        let constraints = [
            videoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            videoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            videoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
