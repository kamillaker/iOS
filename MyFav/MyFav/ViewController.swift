//
//  ViewController.swift
//  MyFav
//
//  Created by Kamilla Kerimbayeva on 14.11.2025.
//

import UIKit
struct Item {
    let title: String
    let subtitle: String
    let image: UIImage
    let review: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    let sections: [(title: String, items: [Item])] = [
            ("Fav Movies", [
                Item(title: "Attack on Titan", subtitle: "Titan", image: .attack, review: "Epic, intense, and emotional. A story full of shocking twists and unforgettable moments."),
                Item(title: "Avengers: Endgame", subtitle: "Avengers", image: .avengers, review: "A powerful and emotional finale that delivers epic action and heartfelt goodbyes."),
                Item(title: "Fight Club", subtitle: "Club", image: .fightClub, review: "Bold, stylish, and mind-bending."),
                Item(title: "IronMan", subtitle: "Iron", image: .ironMan, review: "A fun and charismatic superhero origin."),
                Item(title: "LOTR", subtitle: "LOTR", image: .lotr, review: "A breathtaking fantasy adventure.")
            ]),
            ("Fav Music", [
                Item(title: "In Your Eyes", subtitle: "The Weeknd", image: .inYourEyes, review: "Smooth, nostalgic, and emotional. A perfect blend of synth-pop and modern R&B."),
                Item(title: "Cry For Me", subtitle: "The Weeknd", image: .cryForMe, review: "Dark, intense, and beautifully produced — classic Weeknd atmosphere."),
                Item(title: "Timeless", subtitle: "The Weeknd", image: .timeless, review: "Dreamy vocals and deep emotion. A track that feels like floating in space."),
                Item(title: "Coming Down", subtitle: "The Weeknd", image: .comingDown, review: "Raw and personal. A haunting track about love, regret, and vulnerability."),
                Item(title: "The Hills", subtitle: "The Weeknd", image: .theHills, review: "Dark, electrifying, and iconic — one of his most powerful and recognizable songs.")
            ]),
            ("Fav Books", [
                Item(title: "1984", subtitle: "George Orwell", image: ._1984, review: "A dark but powerful story about total control and the fight for freedom."),
                Item(title: "Flowers for Algernon", subtitle: "Daniel Keyes", image: .flowersForAlgernon, review: "Deeply emotional novel that explores intelligence, humanity, and loneliness."),
                Item(title: "The Alchemist", subtitle: "Paulo Coelho", image: .theAlchemist, review: "A simple but inspiring tale about following your dreams and trusting your path."),
                Item(title: "To Kill a Mockingbird", subtitle: "Harper Lee", image: .toKillAMockingbird, review: "A heartfelt story about justice, empathy, and childhood. Warm, honest, and important."),
                Item(title: "The Little Prince", subtitle: "Antoine de Saint-Exupéry", image: .theLittlePrince, review: "A poetic and timeless story about friendship, childhood.")
            ]),
            ("Fav Courses", [
                Item(title: "iOS", subtitle: "Arman Myrzakanurov", image: .iOS, review: "A practical and inspiring course."),
                Item(title: "Computer Networks", subtitle: "Yerlan Sharipov", image: .computerNetworks, review: "Clear explanations of complex networking concepts."),
                Item(title: "Programming Principles 1", subtitle: "Aksha Ayan", image: .pp1, review: "A great introductory course with structured lessons and simple examples."),
                Item(title: "Russian Language", subtitle: "Galina Rybakina", image: .russian, review: "Engaging lessons focused on improving grammar and fluency."),
                Item(title: "Kazakh Language", subtitle: "Nurzhan Rakhimzhanov", image: .kazakh, review: "Friendly teaching style and clear explanations.")
            ])
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let currentItem = sections[indexPath.section].items[indexPath.row]
        cell.configure(item: currentItem)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }


}

