//
//  CoursesTableViewCell.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 21.11.2025.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!

    func configure(course: CourseItem) {
        titleLabel.text = course.title
        iconImage.image = course.image
    }

}
