//
//  MoviesViewController.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 22.11.2025.
//


import UIKit

struct MovieItem {
    let title: String
    let image: UIImage
    let description: String
    let review: String
}

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var moviesTableView: UITableView!

    let movies: [MovieItem] = [
        MovieItem(
            title: "Inception",
            image: UIImage(named: "inception")!,
            description: "A skilled thief enters people's dreams to steal secrets, but a final mission challenges reality itself.",
            review: "Mind-blowing and visually stunning!"
        ),
        MovieItem(
            title: "Interstellar",
            image: UIImage(named: "interstellar")!,
            description: "A team of explorers travel through a wormhole to save humanity from a dying Earth.",
            review: "Emotional, scientific, and unforgettable."
        ),
        MovieItem(
            title: "The Dark Knight",
            image: UIImage(named: "darkKnight")!,
            description: "Batman faces the Joker, a criminal mastermind who brings chaos to Gotham City.",
            review: "One of the greatest superhero films ever made."
        ),
        MovieItem(
            title: "La La Land",
            image: UIImage(named: "lalaland")!,
            description: "A romance between an aspiring actress and a jazz musician in Los Angeles.",
            review: "Beautiful, musical, dreamy."
        ),
        MovieItem(
            title: "Avatar",
            image: UIImage(named: "avatar")!,
            description: "A disabled marine becomes part of the Na’vi world on planet Pandora.",
            review: "Groundbreaking visuals and world-building."
        ),
        MovieItem(
            title: "Titanic",
            image: UIImage(named: "titanic")!,
            description: "A romance between Jack and Rose aboard the ill-fated Titanic.",
            review: "Emotional, dramatic, timeless."
        ),
        MovieItem(
            title: "The Matrix",
            image: UIImage(named: "matrix")!,
            description: "A hacker discovers reality is a simulation controlled by machines.",
            review: "Revolutionary and thought-provoking."
        ),
        MovieItem(
            title: "Harry Potter",
            image: UIImage(named: "harryPotter")!,
            description: "A boy discovers he is a wizard and enters a magical world full of danger and adventure.",
            review: "Magical and nostalgic."
        ),
        MovieItem(
            title: "Spider-Man: No Way Home",
            image: UIImage(named: "spiderman")!,
            description: "Spider-Man seeks help after his identity is revealed, causing universes to collide.",
            review: "Epic and full of fan-service moments."
        ),
        MovieItem(
            title: "Barbie",
            image: UIImage(named: "barbie")!,
            description: "Barbie travels to the real world to discover her true identity.",
            review: "Funny, bright, and surprisingly deep."
        )
    ]



    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell") as! MoviesTableViewCell
        let currentMovie = movies[indexPath.row]
        cell.configure(movie: currentMovie)
        return cell
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieDetail",
           let destination = segue.destination as? MoviesDetailViewController,
           let indexPath = moviesTableView.indexPathForSelectedRow {
            destination.movie = movies[indexPath.row]
        }
    }
}

