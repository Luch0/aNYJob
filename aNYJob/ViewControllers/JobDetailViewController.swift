//
//  JobDetailViewController.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
//import Social
import MessageUI

class JobDetailViewController: UIViewController, MFMailComposeViewControllerDelegate {

    let jobDetailView = JobDetailView()
    let job: Job
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(jobDetailView)
        jobDetailView.configureScrollView(job: job)
        configureNavBar()
        jobDetailView.shareJobButton.addTarget(self, action: #selector(emailShare), for: .touchUpInside)
        jobDetailView.compareButton.addTarget(self, action: #selector(compareButtonTapped), for: .touchUpInside)
        jobDetailView.applyHereButton.addTarget(self, action: #selector(applyHereButtonTapped), for: .touchUpInside)
    }

    private func configureNavBar() {
        navigationItem.title = job.civil_service_title
        let favoriteButton = UIBarButtonItem(image: #imageLiteral(resourceName: "heart"), style: .plain, target: self, action: #selector(heartButtonTapped))
        navigationItem.rightBarButtonItem = favoriteButton
    }
    
    @objc private func heartButtonTapped() {

        UIView.animate(withDuration: 0.05) {
            self.navigationItem.rightBarButtonItem?.tintColor = .red
        }
    }
    
    @objc private func compareButtonTapped() {
        // TODO: - SEGUE TO COMPARISON
    }
    
    @objc private func applyHereButtonTapped() {
        let url = "https://a127-jobs.nyc.gov/index_new.html?keyword=\(job.job_id)"
        let webViewController = WebViewController(url: url)
        navigationController?.pushViewController(webViewController, animated: true)
    }
    
    init(job: Job) {
        self.job = job
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func emailShare() {
        print("Add Share to Email Function here")
        let mailComposeViewController = self.configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            //self.showAlert(service: "Email") //MailController pops up its own alert with no email service
        }
    }
    
    private func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["example@gmail.com"])
        mailComposerVC.setSubject("Sending you an in-app e-mail with aNYJob!")
        mailComposerVC.setMessageBody("Sending e-mails with Access NY Job is the perfect user experience!", isHTML: false)
        
        return mailComposerVC
    }
    
    // MARK: MFMailComposeViewControllerDelegate
    private func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

