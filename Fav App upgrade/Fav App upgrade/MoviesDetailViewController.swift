//
//  MoviesDetailViewController.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 22.11.2025.
//

import UIKit

class MoviesDetailViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!

    var movie: MovieItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance

        setupUI()
    }

    private func setupUI() {
        guard let movie = movie else { return }

        movieImageView.image = movie.image
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = false

        titleLabel.text = movie.title
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 0

        descriptionLabel.text = movie.description
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0

        reviewLabel.text = movie.review
        reviewLabel.font = UIFont.systemFont(ofSize: 16)
        reviewLabel.numberOfLines = 0
    }
}
