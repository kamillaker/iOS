//
//  MusicTableViewCell.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 22.11.2025.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(music: MusicItem) {
        titleLabel.text = music.title
        iconImage.image = music.image
    }
}

