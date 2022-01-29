//
//  NewsListTableViewCell.swift
//  KeywordNews
//
//  Created by 이현영 on 2022/01/29.
//

import SnapKit
import UIKit

final class NewsListTableViewCell: UITableViewCell {
    static let identifier = "NewsListTableViewCell"
    
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    func setup() {
        setupLayout()
        
        accessoryType = .disclosureIndicator
        
        titleLabel.text = "기사제목"
        descriptionLabel.text = "기사내용"
        dateLabel.text = "2021/01/01"
    }
}

//테이블뷰안에 있는 제목 내용 날짜
private extension NewsListTableViewCell {
    func setupLayout() {
        [titleLabel, descriptionLabel, dateLabel].forEach {
            addSubview($0)
        }
        let superViewInset: CGFloat = 16.0
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(superViewInset)
            $0.trailing.equalToSuperview().inset(48.0)
            $0.top.equalToSuperview().inset(superViewInset)
        }
        
        let verticalSpacing: CGFloat = 4.0
        
        descriptionLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
        }
        
        dateLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(verticalSpacing)
            $0.bottom.equalToSuperview().inset(superViewInset)
        }
        
    }
}
