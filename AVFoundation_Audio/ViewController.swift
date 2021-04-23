//
//  ViewController.swift
//  AVFoundation_Audio
//
//  Created by Niki Pavlove on 18.02.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var player = AVAudioPlayer()
    var count = 0
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    let songs = ["Queen",
                 "AC_DC — Highway to Hell",
                 "Guns N Roses — Welcome To The Jungle",
                 "Dead Kennedys - Holiday In Cambodia",
                 "Iron Maiden - The Number of the Beast"]
    let type = "mp3"
    
    let videos = [Video(name: "Rick Astley", url: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")),
                  Video(name: "Scatman", url: URL(string: "https://www.youtube.com/watch?v=pVHKp6ffURY")),
                  Video(name: "Go West", url: URL(string: "https://www.youtube.com/watch?v=LNBjMRvOB5M")),
                  Video(name: "Sabotage", url: URL(string: "https://www.youtube.com/watch?v=z5rRZdiu1UE")),
                  Video(name: "Weapon of Choice", url: URL(string: "https://www.youtube.com/watch?v=wCDIYvFmgW8"))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViews()
        preparePlayer(track: songs[count])
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 250),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            VideosTableViewCell.self,
            forCellReuseIdentifier: String(describing: VideosTableViewCell.self))
    }

    @IBAction func PlayButton(_ sender: Any) {
        player.play()
        print(player.isPlaying)
        label.text = songs[count]
    }
    
    @IBAction func StopButton(_ sender: Any) {
        player.stop()
        print(player.isPlaying)
        player.currentTime = 0
    }
    
    
    @IBAction func pauseButton(_ sender: Any) {
        player.pause()
        print(player.isPlaying)
    }
    
    @IBAction func nextTrack(_ sender: Any) {
        if count < songs.count - 1 {
            count += 1
            preparePlayer(track: songs[count])
            label.text = songs[count]
            player.play()
            print(player.isPlaying)
        }
    }
    
    @IBAction func previousTrack(_ sender: Any) {
        if count > 0 {
            count -= 1
            preparePlayer(track: songs[count])
            label.text = songs[count]
            player.play()
            print(player.isPlaying)
        }
    }
    
    private func preparePlayer(track: String) {
        do {
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: track, ofType: type)!))
            player.prepareToPlay()
        }
        catch {
            print(error)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: VideosTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideosTableViewCell.self), for: indexPath) as! VideosTableViewCell
        cell.video = videos[indexPath.row].name
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = VideoViewController()
        controller.video = videos[indexPath.row].url
        navigationController?.pushViewController(controller, animated: true)
    }
}
