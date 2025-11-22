//
//  BooksTableViewCell.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 22.11.2025.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(book: BookItem) {
        titleLabel.text = book.title
        iconImage.image = book.image
    }
}
