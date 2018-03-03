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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(jobDetailView)
        jobDetailView.tableView.dataSource = self
        jobDetailView.tableView.delegate = self
    }
    
    

}

extension JobDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        default:
            print("3")
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCellOne", for: indexPath)
        return cell
    }
}

extension JobDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        default:
            print("3")
        }
    }
}
