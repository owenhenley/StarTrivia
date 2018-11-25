//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/24/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, SelectPersonDelegate {
    
    @IBOutlet weak var titleLabel     : UILabel!
    @IBOutlet weak var episodeLabel   : UILabel!
    @IBOutlet weak var directorLabel  : UILabel!
    @IBOutlet weak var producerLabel  : UILabel!
    @IBOutlet weak var releasedLabel  : UILabel!
    @IBOutlet weak var overviewTV     : UITextView!
    @IBOutlet weak var previousButton : FadeButton!
    @IBOutlet weak var nextButton     : FadeButton!
    @IBOutlet weak var activityMonitor: UIActivityIndicatorView!
    
    var person: Person!
    var films = [String]()
    var currentFilm = 0
    let api = FilmAPI()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.filmUrls
        previousButton.isEnabled = false
        nextButton.isEnabled = films.count > 1
        
        guard let film = films.first else { return }
        getFilm(url: film)
    }
    
    @IBAction func previousTapped(_ sender: Any) {
        currentFilm -= 1
        setButtonState()
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        currentFilm += 1
        setButtonState()
    }
    
    func getFilm(url: String) {
        activityMonitor.startAnimating()
        api.getFilms(url: url) { (film) in
            if let film = film {
                DispatchQueue.main.async {
                    self.setupLabels(film: film)
                    self.activityMonitor.stopAnimating()
                }
            }
        }
    }
    
    func setButtonState() {
        previousButton.isEnabled = currentFilm == 0 ? false : true
        nextButton.isEnabled = currentFilm == films.count - 1 ? false : true
        
        getFilm(url: films[currentFilm])
    }
    
    func setupLabels(film: Film) {
        titleLabel.text    = film.title
        episodeLabel.text  = "\(film.episode)"
        directorLabel.text = film.director
        producerLabel.text = film.producer
        releasedLabel.text = film.releaseDate
        overviewTV.text    = film.overview
    }
}
