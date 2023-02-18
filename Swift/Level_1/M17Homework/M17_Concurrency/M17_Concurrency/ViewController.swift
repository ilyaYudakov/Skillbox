//
//  ViewController.swift
//  M17_Concurrency
//
//  Created by Maxim NIkolaev on 08.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let service = Service()
    var images = [UIImage]()
    let imageQty = 6
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 2
        return view
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        onLoad()
        
        
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.left.right.equalToSuperview()
        }
        stackView.addArrangedSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    private func onLoad() {
        let dispatchGroup = DispatchGroup()
        (0...imageQty).forEach { _ in
            dispatchGroup.enter()
            print(Thread.current)
            service.getImageURL { urlString, error in
                guard let urlString = urlString else { return }
                guard let image = self.service.loadImage(urlString: urlString) else { return }
                print(image)
                self.images.append(image)
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) { [weak self] in
            print(Thread.current)
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.stackView.removeArrangedSubview(self.activityIndicator)
            (0...self.imageQty).forEach { image in
                let imageView = UIImageView(image: self.images[image])
                imageView.contentMode = .scaleAspectFit
                self.stackView.addArrangedSubview(imageView)
                print(self.images[image])
            }
        }
    }
}

