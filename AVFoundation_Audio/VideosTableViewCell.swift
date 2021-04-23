//
//  VideosTableViewCell.swift
//  AVFoundation_Audio
//
//  Created by Mihail on 23.04.2021.
//

import UIKit

class VideosTableViewCell: UITableViewCell {
    
    var video: String? {
        didSet {
            videoView.text = video
        }
    }
    
    private let videoView: UILabel = {
        let video = UILabel()
        video.translatesAutoresizingMaskIntoConstraints = false
        return video
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(videoView)
        
        let constraints = [
            videoView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            videoView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            videoView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
