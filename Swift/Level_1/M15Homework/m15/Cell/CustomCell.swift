//
//  CustomCell.swift
//  m15
//
//  Created by Al Pacino on 13.02.2023.
//

import UIKit
import SnapKit

class CustonCell: UITableViewCell {
    
    private lazy var horizontalStack: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.contentMode = .scaleAspectFit
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = Constants.Images.mainImage
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .systemGray
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var horizontalUpStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.contentMode = .scaleToFill
        return stackView
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .firstBaseline
        return stackView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Text.mainHeader
        label.font = UIFont(name: Constants.Fonts.interSemiBold, size: 16)
        return label
    }()
    
    private lazy var secondaryText: UILabel = {
        let label = UILabel()
        label.text = Constants.Text.secondaryText
        label.textColor = Constants.Colors.colorOfText
        label.font = UIFont(name: Constants.Fonts.interRegular, size: 14)
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Text.time
        label.font = UIFont(name: Constants.Fonts.interRegular, size: 14)
        label.textColor = Constants.Colors.colorOfTime
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addLabelsAndImageOfStack()
        
    }
    
    func addLabelsAndImageOfStack() {
        self.addSubview(horizontalStack)
        self.horizontalStack.addArrangedSubview(image)
        self.horizontalStack.addArrangedSubview(verticalStack)
        self.verticalStack.addArrangedSubview(horizontalUpStack)
        self.horizontalUpStack.addArrangedSubview(headerLabel)
        self.horizontalUpStack.addArrangedSubview(timeLabel)
        self.verticalStack.addArrangedSubview(secondaryText)
        addSnapKitConstraints()
    }
    
    func addSnapKitConstraints() {
        horizontalStack.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
        image.snp.makeConstraints { make in
            make.left.equalTo(horizontalStack.snp.left).inset(16)
            make.top.equalTo(horizontalStack.snp.top).inset(16)
            make.bottom.equalTo(self.snp.bottom).inset(19)
            make.width.equalTo(50)
            make.height.equalTo(image.snp.width)
        }
        verticalStack.snp.makeConstraints { make in
            make.right.equalTo(horizontalStack.snp.right)
            make.left.equalTo(image.snp.right).offset(16)
            make.top.equalTo(horizontalStack.snp.top).inset(16)
            make.bottom.equalTo(horizontalStack.snp.bottom).inset(16)
        }
        horizontalUpStack.snp.makeConstraints { make in
            make.left.equalTo(verticalStack.snp.left)
            make.right.equalTo(self.snp.right).inset(16)
        }
        secondaryText.snp.makeConstraints { make in
            make.top.equalTo(horizontalUpStack.snp.bottom).offset(8)
            make.left.equalTo(verticalStack.snp.left)
            make.right.equalTo(verticalStack.snp.right).inset(24)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has been implemented")
    }
}
