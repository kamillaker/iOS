//
//  MusicDetailViewController.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 22.11.2025.
//

import UIKit


class MusicDetailViewController: UIViewController {


    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!

   
    var music: MusicItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupUI()
    }

    private func setupUI() {
        guard let music = music else { return }

        musicImageView.image = music.image
        musicImageView.contentMode = .scaleAspectFill
        musicImageView.clipsToBounds = false

        // Title
        titleLabel.text = music.title
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 0

        // Description
        descriptionLabel.text = music.description
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0

        // Review
        reviewLabel.text = music.review
        reviewLabel.font = UIFont.systemFont(ofSize: 16)
        reviewLabel.numberOfLines = 0
    }
}
