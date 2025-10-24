//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Kamilla Kerimbayeva on 24.10.2025.
//

import UIKit
let flowers: [(name: String, image: String, description: String, category: String, origin: String, year: Int, rating: Int)] = [
    ("Rose", "rose", "Symbol of love and beauty", "Perennial", "Asia", 1750, 5),
    ("Tulip", "tulip", "Known for vibrant spring colors", "Bulb", "Turkey", 1593, 4),
    ("Orchid", "orchid", "Exotic flowers with intricate patterns", "Perennial", "South America", 1731, 5),
    ("Lily", "lily", "Elegant trumpet-shaped flowers", "Perennial", "Europe", 1600, 4),
    ("Sunflower", "sunflower", "Large yellow blooms that follow the sun", "Annual", "North America", 1500, 5),
    ("Daisy", "daisy", "Simple, cheerful flowers", "Perennial", "Europe", 1753, 3),
    ("Lotus", "lotus", "Sacred flower often found in ponds", "Perennial", "Asia", 1000, 5),
    ("Lavender", "lavender", "Fragrant purple flowers", "Perennial", "Mediterranean", 1700, 4),
    ("Peony", "peony", "Large, lush blooms in many colors", "Perennial", "China", 1800, 5),
    ("Cactus Flower", "cactus", "Desert flower that blooms rarely", "Succulent", "North America", 1600, 4)
]

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageItem: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBAction func randomizeButton(_ sender: Any) {
        guard let randomItem = flowers.randomElement() else { return }

                imageItem.image = UIImage(named: randomItem.image)
                nameLabel.text = randomItem.name
                descriptionLabel.text = randomItem.description
        
        let text = """
            Category: \(randomItem.category)
            Origin: \(randomItem.origin)
            Year: \(randomItem.year)
            Rating: \(String(repeating: "⭐️", count: randomItem.rating)) (\(randomItem.rating)/5)
            """
        let paragraph2 = NSMutableParagraphStyle()
        paragraph2.lineSpacing = 12

        let attributedInfo = NSAttributedString(
            string: text,
            attributes: [
                .paragraphStyle: paragraph2,
                .font: infoLabel.font as Any
            ]
        )

        infoLabel.attributedText = attributedInfo
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

