//
//  DetailViewController.swift
//  m18
//
//  Created by Al Pacino on 17.02.2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var rowSelected: APIResponseResults?
    var imageSelected: Images?
        
    lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var cellTitle: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    lazy var cellDescription: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()

        print(cellTitle.text!)
        print(cellDescription.text!)
    }

    func configure(_ viewModel: APIResponseResults, _ imageModel: Images) {
        cellImage.image = imageSelected?.image
        cellTitle.text = rowSelected?.title
        cellDescription.text = rowSelected?.description
    }

    private func setupViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(cellImage)
        stackView.addArrangedSubview(cellTitle)
        stackView.addArrangedSubview(cellDescription)
    }
    
    private func setupConstraints() {

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        cellImage.snp.makeConstraints { make in
            make.width.equalTo(200)
//            make.height.equalTo(200)
            make.centerX.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        cellTitle.snp.makeConstraints { make in
            make.top.equalTo(cellImage.snp.bottom).offset(50)
            make.centerX.centerX.equalTo(view)
            make.height.equalTo(50)
        }
        cellDescription.snp.makeConstraints { make in
            make.top.equalTo(cellTitle.snp.bottom).offset(50)
            make.centerX.centerX.equalTo(view)
            make.height.equalTo(100)
        }
    }
}
