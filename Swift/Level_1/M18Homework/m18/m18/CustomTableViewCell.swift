//
//  CustomTableViewCell.swift
//  m18
//
//  Created by Al Pacino on 16.02.2023.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 85, height: 200))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var stackViewH: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.addArrangedSubview(cellImage)
        return stackView
    }()
    
    private lazy var stackViewV: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackViewH)
        contentView.addSubview(stackViewV)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        cellImage.image = nil
    }
    
    func configure(_ viewModel: APIResponseResults,_ imageModel: Images) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        cellImage.image = imageModel.image
    }
    
    private func setupConstraints() {
        stackViewH.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.right.equalTo(stackViewV.snp.left)
            make.bottom.equalTo(contentView)
            make.left.equalTo(contentView)
            make.width.equalTo(contentView).dividedBy(3)
        }
        stackViewV.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.right.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.left.equalTo(stackViewH.snp.right)
        }
    }
}
