//
//  CoursesDetailViewController.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 21.11.2025.
//

import UIKit

class CoursesDetailViewController: UIViewController {
    @IBOutlet weak var courseImageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!


    var course: CourseItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()

        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        setupUI()
    }
    

    private func setupUI() {
        guard let course = course else { return }

        courseImageView.image = course.image
                courseImageView.contentMode = .scaleAspectFill
                courseImageView.clipsToBounds = false

                // Title
                titleLabel.text = course.title
                titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
                titleLabel.numberOfLines = 0

                // Description
                descriptionLabel.text = course.description
                descriptionLabel.font = UIFont.systemFont(ofSize: 16)
                descriptionLabel.numberOfLines = 0

                // Review
                reviewLabel.text = course.review
                reviewLabel.font = UIFont.systemFont(ofSize: 16)
                reviewLabel.numberOfLines = 0
    }

}
