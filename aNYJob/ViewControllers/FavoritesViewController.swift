//
//  FavoritesViewController.swift
//  aNYJob
//
//  Created by Richard Crichlow on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import TableFlip

class FavoritesViewController: UIViewController {

    var jobs = [Job]() {
        didSet {
            favoritesView.jobTableView.reloadData()
            favoritesView.jobTableView.animate(animation: TableViewAnimation.Cell.fade(duration: 0.5))
        }
    }
    
    let favoritesView = FavoritesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Delegates
        favoritesView.jobTableView.dataSource = self
        favoritesView.jobTableView.delegate = self
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.933, green: 0.494, blue: 0.212, alpha: 1.00)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DatabaseService.manager.getSavedJobs { (jobs) in
            if let jobs = jobs {
                self.jobs = jobs
            }
        }
    }
    
    private func setupView() {
        self.view.addSubview(favoritesView)
        navigationItem.title = "Favorites"
    }

}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobTableViewCell
        let job = jobs[indexPath.row]
        cell.selectionStyle = .none
        cell.configureCell(job: job)

        return cell
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = JobDetailViewController(job: jobs[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

