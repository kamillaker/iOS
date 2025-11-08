//
//  ViewController.swift
//  player
//
//  Created by Kamilla Kerimbayeva on 08.11.2025.
//

import UIKit
import AVFoundation
struct Track{
    let imageName: String
    let soundName: String
    let artist: String
    let name: String
}

class ViewController: UIViewController, AVAudioPlayerDelegate {
    let tracks: [Track] = [Track(imageName: "1.jpeg", soundName: "1", artist: "The Weeknd", name: "Cry For Me"), Track(imageName: "2.jpeg", soundName: "2", artist: "The Weeknd", name:"Timeless"), Track(imageName: "3.png", soundName: "3", artist: "The Weeknd", name: "Die For You"), Track(imageName: "4.png", soundName: "4", artist: "The Weeknd", name: "Call Out My Name"), Track(imageName: "5.jpg", soundName: "5", artist: "The Weeknd", name: "Often")]
    
    @IBOutlet weak var imageItem: UIImageView!
    
    @IBOutlet weak var progressSlider: UISlider!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    
    
    var shuffled = false
    var currentArray:[Track] = []
    
    @IBAction func shuffleButton(_ sender: Any) {
        print("shuffled button tapped")
        if shuffled == true{
            shuffled = false
            currentArray = tracks
        }
        else{
            shuffled = true
            currentArray = tracks.shuffled()
        }
    }
    
    
    enum RepeatMode {
        case off
        case all
        case one
    }
    var repeatMode: RepeatMode = .off
    
    @IBAction func repeatButton(_ sender: Any) {
        switch repeatMode {
            case .off:
                repeatMode = .all
                
            print("all mode activated")
            case .all:
                repeatMode = .one
            print("one mode activated")
            case .one:
                repeatMode = .off
            print("off mode activated")
            }
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        switch repeatMode {
        case .off:
            // ничего не делаем, песня просто закончилась
            print("Finish: no repeat")
            
        case .all:
            // перейти к следующему треку
            nextButton(self)
            
        case .one:
            playButton(self)
        }
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        guard let player = player else { return }
            player.currentTime = TimeInterval(sender.value)
    }
    
    var player: AVAudioPlayer?
    var i = 0
    var savedTime: TimeInterval = 0
    var isPlaying = false
    
    @IBOutlet weak var playBtn: UIButton!
    
    func setCorrectIcon() {
        if isPlaying {
            playBtn.setBackgroundImage(UIImage(named: "stop"), for: .normal)
        } else {
            playBtn.setBackgroundImage(UIImage(named: "play"), for: .normal)
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        let track = currentArray[i]

            if let player = player {
                if player.isPlaying {
                    stopSound()
                } else {
                    player.currentTime = savedTime
                    player.play()
                    startTimer()
                    isPlaying = true
                    setCorrectIcon()
                }
                return
            }

            playSound(name: track.soundName)
            isPlaying = true
            setCorrectIcon()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if repeatMode == .one {
                playSound(name: currentArray[i].soundName)
                return
            }
            if(i == tracks.count - 1){
                i = 0
            }
            else {i += 1}
        
            let track = currentArray[i]
            playSound(name: track.soundName)
        
        
    }
    
    @IBAction func prevButton(_ sender: Any) {
        if repeatMode == .one {
                playSound(name: currentArray[i].soundName)
                return
            }
        
            if(i == 0){i = tracks.count - 1}
            else {i -= 1}
        
        
        let track = currentArray[i]
        playSound(name: track.soundName)
    }
    
    func updateUI() {
        let track = currentArray[i]
        imageItem.image = UIImage(named: track.imageName)
        songLabel.text = track.name
        artistLabel.text = track.artist
        playBtn.setBackgroundImage(UIImage(named: "stop"), for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        currentArray = tracks
        // Do any additional setup after loading the view.
    }
    
    
    private func playSound(name: String) {
        savedTime = 0
            updateUI()

            guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }
            player = try? AVAudioPlayer(contentsOf: url)
            player?.delegate = self

            progressSlider.maximumValue = Float(player?.duration ?? 0)
            durationLabel.text = formatTime(player?.duration ?? 0)
            currentTimeLabel.text = "00:00"

            startTimer()
            player?.play()

            isPlaying = true
            setCorrectIcon()
    }
    var timer: Timer?
    func startTimer() {
        timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
                guard let self = self, let player = self.player else { return }

                self.progressSlider.value = Float(player.currentTime)
                self.currentTimeLabel.text = self.formatTime(player.currentTime)
            }
        }
    
    @objc func updateSlider() {
           guard let player = player else { return }
           
        progressSlider.maximumValue = Float(player.duration)
        progressSlider.value = Float(player.currentTime)
       }
    
    private func stopSound() {
        if let player = player {
                savedTime = player.currentTime
                player.stop()
            }
            isPlaying = false
            setCorrectIcon()
    }


}

