//
//  BooksDetailViewController.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 22.11.2025.
//

import UIKit

class BooksDetailViewController: UIViewController {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!

    var book: BookItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance

        setupUI()
    }

    private func setupUI() {
        guard let book = book else { return }

        bookImageView.image = book.image
        bookImageView.contentMode = .scaleAspectFill
        bookImageView.clipsToBounds = false

        titleLabel.text = book.title
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 0

        descriptionLabel.text = book.description
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0

        reviewLabel.text = book.review
        reviewLabel.font = UIFont.systemFont(ofSize: 16)
        reviewLabel.numberOfLines = 0
    }
}
