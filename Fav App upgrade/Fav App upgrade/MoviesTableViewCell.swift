//
//  MoviesTableViewCell.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 22.11.2025.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(movie: MovieItem) {
        titleLabel.text = movie.title
        iconImage.image = movie.image
    }
}

