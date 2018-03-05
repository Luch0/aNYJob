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
        DatabaseService.manager.showAlertDelegate = self
        setupButtons()
    }
    
    private func setupButtons() {
        jobDetailView.shareJobButton.addTarget(self, action: #selector(emailShare), for: .touchUpInside)
        jobDetailView.compareButton.addTarget(self, action: #selector(compareButtonTapped), for: .touchUpInside)
        jobDetailView.applyHereButton.addTarget(self, action: #selector(applyHereButtonTapped), for: .touchUpInside)
        jobDetailView.moreDescriptionButton.addTarget(self, action: #selector(moreDescriptionButtonTapped), for: .touchUpInside)
        jobDetailView.moreAdditionInfoButton.addTarget(self, action: #selector(moreAdditionalInfoButtonTapped), for: .touchUpInside)
        jobDetailView.moreJobRequirementsButton.addTarget(self, action: #selector(moreJobRequirementsButtonTapped), for: .touchUpInside)
    }

    private func configureNavBar() {
        navigationItem.title = job.civil_service_title
        let favoriteButton = UIBarButtonItem(image: #imageLiteral(resourceName: "star"), style: .plain, target: self, action: #selector(heartButtonTapped))
        navigationItem.rightBarButtonItem = favoriteButton
    }
    
    @objc private func heartButtonTapped() {
        DatabaseService.manager.addSavedJob(job)
        UIView.animate(withDuration: 0.1) {
            self.navigationItem.rightBarButtonItem?.tintColor = .yellow
        }
    }
    
    @objc private func compareButtonTapped() {
        // TODO: - SEGUE TO COMPARISON
        let comparisonVC = ComparisonViewController(job: job)
        navigationController?.pushViewController(comparisonVC, animated: true)
    }
    
    @objc private func applyHereButtonTapped() {
        let url = "https://a127-jobs.nyc.gov/index_new.html?keyword=\(job.job_id)"
        let webViewController = WebViewController(url: url)
        navigationController?.pushViewController(webViewController, animated: true)
    }
    
    @objc private func moreDescriptionButtonTapped() {
        UIView.animate(withDuration: 0.2) {
            self.jobDetailView.moreDescriptionButton.removeFromSuperview()
            self.jobDetailView.shortDescriptionLabel.numberOfLines = 0
        }
    }
    
    @objc private func moreAdditionalInfoButtonTapped() {
        UIView.animate(withDuration: 0.2) {
            self.jobDetailView.moreAdditionInfoButton.removeFromSuperview()
            self.jobDetailView.additionalInfoLabel.numberOfLines = 0
        }
    }
    
    @objc private func moreJobRequirementsButtonTapped() {
        UIView.animate(withDuration: 0.2) {
            self.jobDetailView.moreJobRequirementsButton.removeFromSuperview()
            self.jobDetailView.jobRequirementsLabel.numberOfLines = 0
        }
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
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)

    }
    
//    private func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
//        self.dismiss(animated: true, completion: nil)
//        //controller.dismiss(animated: true, completion: nil)
//    }
    
}

extension JobDetailViewController: ShowAlertDelegate {
    func showAlertDelegate(nameOfWhatYoureSaving: String) {
        let alert = Alert.create(withTitle: "Success", andMessage: "Job added to favorites.", withPreferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}

