//
//  JobTableViewCell.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit

class JobTableViewCell: UITableViewCell {
    
    lazy public var jobTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy public var salaryLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy public var locationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy public var fieldLabel: UILabel = {
        let label = UILabel()
        return label
    }()

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
    
    public func configureCell(job: Job) {
        jobTitleLabel.text = job.business_title
        salaryLabel.text = job.salary_range_from + " to " + job.salary_range_to
        locationLabel.text = job.work_location
        fieldLabel.text = job.agency
    }
    
}

extension JobTableViewCell {
    private func setupViews() {
        setupJobTitleLabel()
        setupSalaryLabel()
        setupLocationLabel()
        setupFieldLabel()
    }
    
    private func setupJobTitleLabel() {
        addSubview(jobTitleLabel)
        jobTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(2)
            make.leading.equalTo(snp.leading).offset(2)
        }
    }
    
    private func setupSalaryLabel() {
        addSubview(salaryLabel)
        salaryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(jobTitleLabel.snp.bottom).offset(2)
            make.leading.equalTo(snp.leading).offset(2)
        }
    }
    
    private func setupLocationLabel() {
        addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(salaryLabel.snp.bottom).offset(2)
            make.leading.equalTo(snp.leading).offset(2)
        }
    }
    
    private func setupFieldLabel() {
        addSubview(fieldLabel)
        fieldLabel.snp.makeConstraints { (make) in
            make.top.equalTo(locationLabel.snp.bottom).offset(2)
            make.leading.equalTo(snp.leading).offset(2)
            make.bottom.equalTo(snp.bottom).offset(-2)
        }
    }
}
