//
//  MusicViewController.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 22.11.2025.
//

import UIKit

struct MusicItem {
    let title: String
    let image: UIImage
    let description: String
    let review: String
}

class MusicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var musicTableView: UITableView!

    let musics: [MusicItem] = [
        MusicItem(
            title: "Blinding Lights",
            image: UIImage(named: "blindingLights")!,
            description: "A synthwave-inspired hit about longing and late-night drives.",
            review: "Catchy, energetic, and iconic!"
        ),
        MusicItem(
            title: "Save Your Tears",
            image: UIImage(named: "saveYourTears")!,
            description: "A smooth pop song about heartbreak and moving on.",
            review: "Melodic and emotional."
        ),
        MusicItem(
            title: "Can't Feel My Face",
            image: UIImage(named: "cantFeelMyFace")!,
            description: "A funky, upbeat song mixing love and obsession metaphors.",
            review: "Super catchy and fun to sing along."
        ),
        MusicItem(
            title: "Starboy",
            image: UIImage(named: "starboy")!,
            description: "A collaboration with Daft Punk celebrating fame and success.",
            review: "Stylish, modern, and unforgettable."
        ),
        MusicItem(
            title: "The Hills",
            image: UIImage(named: "theHills")!,
            description: "A dark, moody track about complicated relationships.",
            review: "Intense and hauntingly good."
        ),
        MusicItem(
            title: "I Feel It Coming",
            image: UIImage(named: "iFeelItComing")!,
            description: "A disco-influenced track with smooth vocals and romantic vibes.",
            review: "Perfect summer feel, very relaxing."
        ),
        MusicItem(
            title: "After Hours",
            image: UIImage(named: "afterHours")!,
            description: "Title track reflecting on pain, love, and personal growth.",
            review: "Emotional and beautifully produced."
        ),
        MusicItem(
            title: "Heartless",
            image: UIImage(named: "heartless")!,
            description: "A trap-pop hit about living a reckless, fame-filled lifestyle.",
            review: "Bold, catchy, and dramatic."
        ),
        MusicItem(
            title: "Take My Breath",
            image: UIImage(named: "takeMyBreath")!,
            description: "A high-energy dance track with a retro-futuristic sound.",
            review: "Energetic and addictive."
        ),
        MusicItem(
            title: "Die For You",
            image: UIImage(named: "dieForYou")!,
            description: "A passionate R&B song about undying love and devotion.",
            review: "Smooth, emotional, and timeless."
        )
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        musicTableView.delegate = self
        musicTableView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell") as! MusicTableViewCell
        let currentMusic = musics[indexPath.row]
        cell.configure(music: currentMusic)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMusic = musics[indexPath.row]
        performSegue(withIdentifier: "showMusicDetail", sender: selectedMusic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMusicDetail",
           let destination = segue.destination as? MusicDetailViewController,
           let indexPath = musicTableView.indexPathForSelectedRow {
            destination.music = musics[indexPath.row]
        }
    }
}

