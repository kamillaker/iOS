//
//  CoursesViewController.swift
//  Fav App upgrade
//
//  Created by Kamilla Kerimbayeva on 21.11.2025.
//

import UIKit

struct CourseItem {
    let title: String
    let image: UIImage
    let description: String
    let review: String
}

class CoursesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var coursesTableView: UITableView!
    
    let courses: [CourseItem] = [
        CourseItem(
            title: "Computer Networks",
            image: UIImage(named: "computerNetworks")!,
            description: "Learn the fundamentals of networking, protocols, and communication between devices.",
            review: "Very informative and practical!"
        ),
        CourseItem(
            title: "iOS",
            image: UIImage(named: "iOS")!,
            description: "Develop iOS applications using Swift, Xcode, and UIKit.",
            review: "Challenging but rewarding."
        ),
        CourseItem(
            title: "Kazakh Language",
            image: UIImage(named: "kazakh")!,
            description: "Improve your skills in reading, writing, and speaking Kazakh.",
            review: "Engaging and interactive."
        ),
        CourseItem(
            title: "Programing Principles 1",
            image: UIImage(named: "pp1")!,
            description: "Introduction to programming concepts and basic algorithms.",
            review: "Great foundation for further programming courses."
        ),
        CourseItem(
            title: "Programing Principles 2",
            image: UIImage(named: "pp2")!,
            description: "Learn advanced programming concepts in C++ including OOP and data structures.",
            review: "Challenging but rewarding."
        ),
        CourseItem(
            title: "Web Development",
            image: UIImage(named: "webDev")!,
            description: "Build full-stack web applications using Angular for frontend and Django for backend.",
            review: "Hands-on and very practical."
        ),
        CourseItem(
            title: "Physical Education",
            image: UIImage(named: "physEd")!,
            description: "Focus on fitness, teamwork, and maintaining a healthy lifestyle.",
            review: "Fun and engaging."
        ),
        CourseItem(
            title: "Calculus 1",
            image: UIImage(named: "calculus1")!,
            description: "Learn limits, derivatives, and integrals with practical examples.",
            review: "Mathematically intensive but clear explanations."
        ),
        CourseItem(
            title: "Discrete Mathematics",
            image: UIImage(named: "discreteMath")!,
            description: "Study logic, sets, combinatorics, graph theory, and proofs.",
            review: "Very theoretical, great for computer science."
        ),
        CourseItem(
            title: "Russian Language",
            image: UIImage(named: "russian")!,
            description: "Learn Russian grammar, vocabulary, and conversational skills.",
            review: "Very educational and useful."
        )
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        coursesTableView.delegate = self
        coursesTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showCourseDetail",
               let destination = segue.destination as? CoursesDetailViewController,
               let indexPath = coursesTableView.indexPathForSelectedRow {

                destination.course = courses[indexPath.row]
            }
        }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableViewCell") as! CoursesTableViewCell
        let currentCourse = courses[indexPath.row]
        cell.configure(course: currentCourse)
        return cell
    }

}
