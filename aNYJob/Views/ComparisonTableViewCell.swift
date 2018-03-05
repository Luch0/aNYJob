//
//  ComparisonTableViewCell.swift
//  aNYJob
//
//  Created by Richard Crichlow on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import SnapKit

class ComparisonTableViewCell: UITableViewCell {

    lazy public var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        return view
    }()
    
    //title description
    lazy var jobNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Pirate"
        Stylesheet.Objects.Labels.JobLabel.style(label: lb)
        lb.font = Stylesheet.Fonts.PostTitle
        return lb
    }()
    
    //base salary
    lazy var salaryLabel: UILabel = {
        let lb = UILabel()
        lb.text = "$99,999"
        Stylesheet.Objects.Labels.SalaryLabel.style(label: lb)
        lb.font = Stylesheet.Fonts.PostTitle
        return lb
    }()
    
    //agency name
    lazy var agencyNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Department of Education"
        Stylesheet.Objects.Labels.AgencyNameLabel.style(label: lb)
        return lb
    }()
    
    //work location
    lazy var workLocationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Queens"
        Stylesheet.Objects.Labels.BoroughLabel.style(label: lb)
        return lb
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: "ComparisonCell")
        setupAndConstrainObjects()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAndConstrainObjects()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupAndConstrainObjects()
        self.backgroundColor = .clear
    }
    
    private func setupAndConstrainObjects(){
        addSubview(containerView)
        containerView.addSubview(jobNameLabel)
        containerView.addSubview(agencyNameLabel)
        containerView.addSubview(salaryLabel)
        containerView.addSubview(workLocationLabel)
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(5)
            make.leading.equalTo(snp.leading).offset(3)
            make.trailing.equalTo(snp.trailing).offset(-3)
            make.bottom.equalTo(snp.bottom).offset(-5)
        }
        
        jobNameLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(containerView.snp.width).multipliedBy(0.7)
            make.top.equalTo(containerView.snp.top)
            make.leading.equalTo(containerView.snp.leading)
        }
        agencyNameLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(containerView.snp.width).multipliedBy(0.6)
            make.top.equalTo(jobNameLabel.snp.bottom)
            make.bottom.equalTo(containerView.snp.bottom)
            make.leading.equalTo(containerView.snp.leading)
            //make.trailing.equalTo(self.snp.trailing)
        }
        salaryLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(containerView.snp.width).multipliedBy(0.3)
            make.top.equalTo(containerView.snp.top)
            make.trailing.equalTo(containerView.snp.trailing)
        }
        workLocationLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(containerView.snp.width).multipliedBy(0.4)
            make.top.equalTo(salaryLabel.snp.bottom)
            make.bottom.equalTo(containerView.snp.bottom)
            //make.leading.equalTo(agencyNameLabel.snp.trailing)
            make.trailing.equalTo(containerView.snp.trailing)
        }
    }
}
