//
//  JobDetailTableViewCell.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SnapKit

class JobDetailTableViewCell: UITableViewCell {

    // Title
    // Department/ Field
    // Salary
    // Blurb
    
    // Apply Here

    // Location
    //
    // Map View
    //
    //
    //
    
    // Additional Info
    
    // Buttons
    
    lazy public var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy public var departmentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy public var salaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy public var shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    
    // APPLY HERE BUTTON
    lazy public var applyHereButton: UIButton = {
        let button = UIButton()
        button.setTitle("Apply Here", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    
    
    lazy public var locationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    // MapKit
    lazy public var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    
    
    lazy public var additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy public var jobRequirementsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    // BUTTONS
    lazy public var didYouApplyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Did you apply to this job?", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    lazy public var shareJobButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share Job", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    // MARK: - Inits
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func turnAddressIntoCoordinates(address: String,
                                            completionHandler: @escaping (CLLocationCoordinate2D) -> Void,
                                            errorHandler: @escaping (Error) -> Void) {
        CLGeocoder().geocodeAddressString(address) { (placemarks, error) in
            if let error = error {
                errorHandler(error)
            }
            if let placemarks = placemarks {
                let placemark = placemarks.first
                let coordinate = placemark?.location?.coordinate
                completionHandler(coordinate!)
            }
        }
    }
    
    public func configureCell(job: Job) {
        titleLabel.text = job.business_title
        departmentLabel.text = job.division_work_unit
        salaryLabel.text = job.salary_range_from + " to " + job.salary_range_to
        shortDescriptionLabel.text = job.job_description
        locationLabel.text = job.work_location
        additionalInfoLabel.text = job.additional_information
        jobRequirementsLabel.text = job.minimum_qual_requirements ?? ""
        
        
    }
    
    private func configureMapView(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
    
}

extension JobDetailTableViewCell {
    private func setupViews() {
        setupTitleLabel()
        setupDepartmentLabel()
        setupSalaryLabel()
        setupShortDescriptionLabel()
        setupApplyHereButton()
        setupLocationLabel()
        setupMapView()
        setupAdditionalInfoLabel()
        setupJobRequirementLabel()
        setupDidYouApplyButton()
        setupShareJobButton()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading)
        }
    }
    
    private func setupDepartmentLabel() {
        addSubview(departmentLabel)
        departmentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(snp.leading)
        }
    }
    
    private func setupSalaryLabel() {
        addSubview(salaryLabel)
        salaryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(departmentLabel.snp.bottom)
            make.leading.equalTo(snp.leading)
        }
    }
    
    private func setupShortDescriptionLabel() {
        addSubview(shortDescriptionLabel)
        shortDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(salaryLabel.snp.top)
            make.leading.equalTo(snp.leading)
        }
    }
    
    private func setupApplyHereButton() {
        addSubview(applyHereButton)
        applyHereButton.snp.makeConstraints { (make) in
            make.top.equalTo(shortDescriptionLabel.snp.bottom)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    private func setupLocationLabel() {
        addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(applyHereButton.snp.bottom)
            make.leading.equalTo(snp.leading)
        }
    }
    
    private func setupMapView() {
        addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(locationLabel.snp.bottom)
            make.width.equalTo(snp.width)
            make.centerX.equalTo(snp.centerX)
            make.height.equalTo(200)
        }
    }
    
    private func setupAdditionalInfoLabel() {
        addSubview(additionalInfoLabel)
        additionalInfoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mapView.snp.bottom)
            make.leading.equalTo(snp.leading)
        }
    }
    
    private func setupJobRequirementLabel() {
        addSubview(jobRequirementsLabel)
        jobRequirementsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(additionalInfoLabel.snp.bottom)
            make.leading.equalTo(snp.leading)
        }
    }
    
    private func setupDidYouApplyButton() {
        addSubview(didYouApplyButton)
        didYouApplyButton.snp.makeConstraints { (make) in
            make.top.equalTo(jobRequirementsLabel.snp.bottom)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    private func setupShareJobButton() {
        addSubview(shareJobButton)
        shareJobButton.snp.makeConstraints { (make) in
            make.top.equalTo(didYouApplyButton.snp.bottom)
            make.centerX.equalTo(snp.centerX)
        }
    }
}

extension JobDetailTableViewCell: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") as? MKMarkerAnnotationView
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "annotationView")
            annotationView?.canShowCallout = true
            annotationView?.animatesWhenAdded = true
            annotationView?.markerTintColor = Stylesheet.Colors.RedBg
            annotationView?.isHighlighted = true
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
}
