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
import SwiftyButton

class JobDetailView: UIView {
    
    let buttonColor = UIColor(red: 52 / 255, green: 152 / 255, blue: 219 / 255, alpha: 1)
    let shadowColor = UIColor(red: 41 / 255, green: 128 / 255, blue: 185 / 255, alpha: 1)
    
    lazy public var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy public var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy public var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Stylesheet.Fonts.PostTitle
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy public var departmentLabel: UILabel = {
        let label = UILabel()
        label.font = Stylesheet.Fonts.Bold
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy public var salaryLabel: UILabel = {
        let label = UILabel()
        label.font = Stylesheet.Fonts.Bold
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
//    lazy public var compareButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Compare to similar jobs", for: .normal)
//        button.layer.cornerRadius = 5.0
//        button.layer.borderColor = UIColor.red.cgColor
//        button.layer.borderWidth = 1.5
//        button.backgroundColor = UIColor.blue
//        button.tintColor = UIColor.white
//        return button
//    }()
    
    lazy public var compareButton: PressableButton = {
        let button = PressableButton()
        button.setTitle("Compare to similar jobs", for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.colors = .init(button: buttonColor, shadow: shadowColor)
        return button
    }()
    
    lazy public var shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Stylesheet.Fonts.Regular
        label.numberOfLines = 4
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    // APPLY HERE BUTTON
//    lazy public var applyHereButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Apply Here", for: .normal)
//        button.layer.cornerRadius = 5.0
//        button.layer.borderColor = UIColor.white.cgColor
//        button.layer.borderWidth = 1.5
//        button.backgroundColor = UIColor.green
//        button.tintColor = UIColor.white
//        return button
//    }()
    
    lazy public var moreDescriptionButton: UIButton = {
        let button = UIButton()
        button.setTitle("more", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    lazy public var applyHereButton: PressableButton = {
        let button = PressableButton()
        button.setTitle("Apply Here!", for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.colors = .init(button: buttonColor, shadow: shadowColor)
        return button
    }()
    
    lazy public var locationLabel: UILabel = {
        let label = UILabel()
        label.font = Stylesheet.Fonts.Bold
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    // MapKit
    lazy public var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.isScrollEnabled = false
        return mapView
    }()
    
    
    
    lazy public var additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.font = Stylesheet.Fonts.Regular
        label.numberOfLines = 4
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy public var moreAdditionInfoButton: UIButton = {
        let button = UIButton()
        button.setTitle("more", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    lazy public var jobRequirementsLabel: UILabel = {
        let label = UILabel()
        label.font = Stylesheet.Fonts.Regular
        label.numberOfLines = 4
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy public var moreJobRequirementsButton: UIButton = {
        let button = UIButton()
        button.setTitle("more", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    // BUTTONS
//    lazy public var didYouApplyButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Did you apply to this job?", for: .normal)
//        button.layer.cornerRadius = 5.0
//        button.layer.borderColor = UIColor.red.cgColor
//        button.layer.borderWidth = 1.5
//        button.backgroundColor = UIColor.blue
//        button.tintColor = UIColor.white
//        return button
//    }()
    
    lazy public var didYouApplyButton: PressableButton = {
        let button = PressableButton()
        button.setTitle("Did you apply to this job?", for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.colors = .init(button: buttonColor, shadow: shadowColor)
        return button
    }()
    
//    lazy public var shareJobButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Share Job", for: .normal)
//        button.layer.cornerRadius = 5.0
//        button.layer.borderColor = UIColor.red.cgColor
//        button.layer.borderWidth = 1.5
//        button.backgroundColor = UIColor.blue
//        button.tintColor = UIColor.white
//        return button
//    }()
    
    lazy public var shareJobButton: PressableButton = {
        let button = PressableButton()
        button.setTitle("Share Job", for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.colors = .init(button: buttonColor, shadow: shadowColor)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func configureScrollView(job: Job) {
        titleLabel.text = job.business_title
        departmentLabel.text = job.division_work_unit
        salaryLabel.text = "$\(job.salary_range_from)  -  $\(job.salary_range_to)"
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
        setupCompareButton()
        setupShortDescriptionLabel()
        setupApplyHereButton()
        setupLocationLabel()
        setupMapView()
        setupAdditionalInfoLabel()
        setupJobRequirementLabel()
        setupDidYouApplyButton()
        setupShareJobButton()
        setupMoreDescriptionButton()
        //setupMoreAdditionalInfoButton()
        setupMoreJobRequirementsButton()
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
            make.top.equalTo(contentView.snp.top).offset(2)
            make.width.equalTo(snp.width).offset(-4)
            make.leading.equalTo(contentView.snp.leading).offset(2)
        }
    }
    
    private func setupDepartmentLabel() {
        contentView.addSubview(departmentLabel)
        departmentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.width.equalTo(snp.width).offset(-4)
            make.leading.equalTo(contentView.snp.leading).offset(2)
        }
    }
    
    private func setupSalaryLabel() {
        contentView.addSubview(salaryLabel)
        salaryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(departmentLabel.snp.bottom).offset(2)
            make.width.equalTo(snp.width).offset(-4)
            make.leading.equalTo(contentView.snp.leading).offset(2)
        }
    }
    
    private func setupCompareButton() {
        contentView.addSubview(compareButton)
        compareButton.snp.makeConstraints { (make) in
            make.top.equalTo(salaryLabel.snp.bottom).offset(5)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.65)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.07)
        }
    }
    
    private func setupShortDescriptionLabel() {
        contentView.addSubview(shortDescriptionLabel)
        shortDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(compareButton.snp.bottom).offset(5)
            make.width.equalTo(snp.width).offset(-4)
            make.leading.equalTo(contentView.snp.leading).offset(2)
        }
    }
    
    private func setupApplyHereButton() {
        contentView.addSubview(applyHereButton)
        applyHereButton.snp.makeConstraints { (make) in
            make.top.equalTo(shortDescriptionLabel.snp.bottom).offset(5)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(compareButton.snp.width)
            make.height.equalTo(compareButton.snp.height)
        }
    }
    
    private func setupLocationLabel() {
        contentView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(applyHereButton.snp.bottom).offset(5)
            make.width.equalTo(snp.width).offset(-4)
            make.leading.equalTo(contentView.snp.leading).offset(2)
        }
    }
    
    private func setupMapView() {
        contentView.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(locationLabel.snp.bottom).offset(2)
            make.width.equalTo(snp.width)
            make.leading.equalTo(contentView.snp.leading)
            make.centerX.equalTo(contentView.snp.centerX)
            make.height.equalTo(mapView.snp.width)
        }
    }
    
    private func setupAdditionalInfoLabel() {
        contentView.addSubview(additionalInfoLabel)
        additionalInfoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mapView.snp.bottom).offset(5)
            make.width.equalTo(snp.width).offset(-4)
            make.leading.equalTo(contentView.snp.leading).offset(2)
        }
    }
    
    private func setupJobRequirementLabel() {
        contentView.addSubview(jobRequirementsLabel)
        jobRequirementsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(additionalInfoLabel.snp.bottom).offset(5)
            make.width.equalTo(snp.width).offset(-4)
            make.leading.equalTo(contentView.snp.leading).offset(2)
        }
    }
    
    private func setupDidYouApplyButton() {
        contentView.addSubview(didYouApplyButton)
        didYouApplyButton.snp.makeConstraints { (make) in
            make.top.equalTo(jobRequirementsLabel.snp.bottom).offset(5)
            make.centerX.equalTo(contentView.snp.centerX)
            //make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.55)
            make.width.equalTo(compareButton.snp.width)
            make.height.equalTo(compareButton.snp.height)
        }
    }
    
    private func setupShareJobButton() {
        contentView.addSubview(shareJobButton)
        shareJobButton.snp.makeConstraints { (make) in
            make.top.equalTo(didYouApplyButton.snp.bottom).offset(5)
            make.centerX.equalTo(contentView.snp.centerX)
            make.bottom.equalTo(contentView.snp.bottom).offset(-2)
            //make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.25)
            make.width.equalTo(compareButton.snp.width)
            make.height.equalTo(compareButton.snp.height)
        }
    }
    
    private func setupMoreDescriptionButton() {
        contentView.addSubview(moreDescriptionButton)
        moreDescriptionButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(shortDescriptionLabel.snp.bottom)
            make.trailing.equalTo(shortDescriptionLabel.snp.trailing)
        }
    }
    
    private func setupMoreAdditionalInfoButton() {
        contentView.addSubview(moreAdditionInfoButton)
        moreAdditionInfoButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(additionalInfoLabel.snp.bottom)
            make.trailing.equalTo(additionalInfoLabel.snp.trailing)
        }
    }
    
    private func setupMoreJobRequirementsButton() {
        contentView.addSubview(moreJobRequirementsButton)
        moreJobRequirementsButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(jobRequirementsLabel.snp.bottom)
            make.trailing.equalTo(jobRequirementsLabel.snp.trailing)
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
