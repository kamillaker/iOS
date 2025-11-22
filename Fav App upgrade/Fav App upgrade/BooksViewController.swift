//
//  BooksViewController.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 22.11.2025.
//

import UIKit

struct BookItem {
    let title: String
    let image: UIImage
    let description: String
    let review: String
}

class BooksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var booksTableView: UITableView!

    let books: [BookItem] = [
        BookItem(
            title: "1984",
            image: UIImage(named: "1984")!,
            description: "A dystopian novel about a totalitarian society where Big Brother controls every aspect of life.",
            review: "Powerful and thought-provoking."
        ),
        BookItem(
            title: "To Kill a Mockingbird",
            image: UIImage(named: "mockingbird")!,
            description: "A story about racial injustice and childhood innocence in the American South.",
            review: "Deeply emotional and beautifully written."
        ),
        BookItem(
            title: "The Great Gatsby",
            image: UIImage(named: "gatsby")!,
            description: "A tragic tale of love, dreams, and wealth during the Roaring Twenties.",
            review: "Classic, elegant, and unforgettable."
        ),
        BookItem(
            title: "Harry Potter and the Philosopher’s Stone",
            image: UIImage(named: "harryPotterBook")!,
            description: "A boy discovers he is a wizard and begins his journey into the magical world.",
            review: "Magical and full of adventure."
        ),
        BookItem(
            title: "Pride and Prejudice",
            image: UIImage(named: "pride")!,
            description: "A romantic novel exploring love, misunderstandings, and social expectations.",
            review: "Charming story with witty dialogue."
        ),
        BookItem(
            title: "The Hobbit",
            image: UIImage(named: "hobbit")!,
            description: "Bilbo Baggins embarks on an unexpected journey with a group of dwarves.",
            review: "A fun and imaginative adventure."
        ),
        BookItem(
            title: "The Alchemist",
            image: UIImage(named: "alchemist")!,
            description: "A philosophical story about pursuing dreams and personal destiny.",
            review: "Inspirational and simple yet profound."
        ),
        BookItem(
            title: "The Catcher in the Rye",
            image: UIImage(named: "catcher")!,
            description: "A teenage boy navigates loneliness, identity, and society.",
            review: "Raw and emotionally real."
        ),
        BookItem(
            title: "The Lord of the Rings",
            image: UIImage(named: "lotr")!,
            description: "An epic fantasy about the fight against darkness and the power of friendship.",
            review: "Epic and masterfully written."
        ),
        BookItem(
            title: "The Little Prince",
            image: UIImage(named: "littlePrince")!,
            description: "A poetic story about childhood, love, and seeing with the heart.",
            review: "Touching, simple, and wise."
        )
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        booksTableView.delegate = self
        booksTableView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BooksTableViewCell") as! BooksTableViewCell
        let currentBook = books[indexPath.row]
        cell.configure(book: currentBook)
        return cell
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookDetail",
           let destination = segue.destination as? BooksDetailViewController,
           let indexPath = booksTableView.indexPathForSelectedRow {
            destination.book = books[indexPath.row]
        }
    }
}

