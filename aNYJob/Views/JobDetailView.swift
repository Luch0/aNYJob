//
//  JobDetailView.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class JobDetailView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy public var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy public var departmentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy public var salaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy public var shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
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
        label.lineBreakMode = .byWordWrapping
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
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy public var jobRequirementsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
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

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
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
    
    public func configureScrollView(job: Job) {
        titleLabel.text = job.business_title
        departmentLabel.text = job.division_work_unit
        salaryLabel.text = job.salary_range_from + " to " + job.salary_range_to
        shortDescriptionLabel.text = job.job_description
        locationLabel.text = job.work_location
        additionalInfoLabel.text = job.additional_information
        jobRequirementsLabel.text = job.minimum_qual_requirements ?? ""
        turnAddressIntoCoordinates(address: job.work_location, completionHandler: { (coordinate) in
            self.configureMapView(coordinate: coordinate)
        }) { (error) in
            
        }
    }
    
    private func configureMapView(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
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
}

extension JobDetailView {
    private func setupViews() {
        setupScrollView()
        setupContentView()
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
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide.snp.edges)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView.snp.edges)
        }
    }
    
    ///////////////
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top)
            make.width.equalTo(snp.width)
            make.leading.equalTo(contentView.snp.leading)
//            make.trailing.equalTo(contentView.snp.trailing)
        }
    }
    
    private func setupDepartmentLabel() {
        contentView.addSubview(departmentLabel)
        departmentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.width.equalTo(snp.width)
            make.leading.equalTo(contentView.snp.leading)
            //            make.trailing.equalTo(contentView.snp.trailing)
        }
    }
    
    private func setupSalaryLabel() {
        contentView.addSubview(salaryLabel)
        salaryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(departmentLabel.snp.bottom)
            make.width.equalTo(snp.width)
            make.leading.equalTo(contentView.snp.leading)
            //            make.trailing.equalTo(contentView.snp.trailing)
        }
    }
    
    private func setupShortDescriptionLabel() {
        contentView.addSubview(shortDescriptionLabel)
        shortDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(salaryLabel.snp.bottom)
            make.width.equalTo(snp.width)
            make.leading.equalTo(contentView.snp.leading)
            //            make.trailing.equalTo(contentView.snp.trailing)
        }
    }
    
    private func setupApplyHereButton() {
        contentView.addSubview(applyHereButton)
        applyHereButton.snp.makeConstraints { (make) in
            make.top.equalTo(shortDescriptionLabel.snp.bottom)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
    
    private func setupLocationLabel() {
        contentView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(applyHereButton.snp.bottom)
            make.width.equalTo(snp.width)
            make.leading.equalTo(contentView.snp.leading)
            //            make.trailing.equalTo(contentView.snp.trailing)
        }
    }
    
    private func setupMapView() {
        contentView.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(locationLabel.snp.bottom)
            make.width.equalTo(snp.width)
            make.leading.equalTo(contentView.snp.leading)
            make.centerX.equalTo(contentView.snp.centerX)
            make.height.equalTo(200)
        }
    }
    
    private func setupAdditionalInfoLabel() {
        contentView.addSubview(additionalInfoLabel)
        additionalInfoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mapView.snp.bottom)
            make.width.equalTo(snp.width)
            make.leading.equalTo(contentView.snp.leading)
            //            make.trailing.equalTo(contentView.snp.trailing)
        }
    }
    
    private func setupJobRequirementLabel() {
        contentView.addSubview(jobRequirementsLabel)
        jobRequirementsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(additionalInfoLabel.snp.bottom)
            make.width.equalTo(snp.width)
            make.leading.equalTo(contentView.snp.leading)
            //            make.trailing.equalTo(contentView.snp.trailing)
        }
    }
    
    private func setupDidYouApplyButton() {
        contentView.addSubview(didYouApplyButton)
        didYouApplyButton.snp.makeConstraints { (make) in
            make.top.equalTo(jobRequirementsLabel.snp.bottom)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
    
    private func setupShareJobButton() {
        contentView.addSubview(shareJobButton)
        shareJobButton.snp.makeConstraints { (make) in
            make.top.equalTo(didYouApplyButton.snp.bottom)
            make.centerX.equalTo(contentView.snp.centerX)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}

extension JobDetailView: MKMapViewDelegate {
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
