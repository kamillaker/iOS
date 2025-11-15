//
//  TableViewCell.swift
//  MyFav
//
//  Created by Kamilla Kerimbayeva on 14.11.2025.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageItem: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var review: UILabel!
    
    func configure(item: Item) {
        title.text = item.title
        subtitle.text = item.subtitle
        review.text = item.review
        imageItem.image = item.image
    }
    

}
