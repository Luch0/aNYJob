//
//  JobDetailViewController.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit

class JobDetailViewController: UIViewController {

    let jobDetailView = JobDetailView()
    let job: Job
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(jobDetailView)
        jobDetailView.tableView.dataSource = self
        jobDetailView.tableView.delegate = self
    }
    
    init(job: Job) {
        self.job = job
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension JobDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! JobDetailTableViewCell
        cell.configureCell(job: job)
        return cell
    }
}

extension JobDetailViewController: UITableViewDelegate {

}
