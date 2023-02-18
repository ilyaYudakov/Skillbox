//
//  ViewController.swift
//  m15
//
//  Created by Al Pacino on 13.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let cellIdentifier = "cell"
    
    private lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.allowsSelection = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        initTable()
        setupConstraints()
    }
    
    private func initTable() {
        table.register(CustonCell.self, forCellReuseIdentifier: cellIdentifier)
        table.dataSource = self
        table.delegate = self
        view.addSubview(table)
    }
    
    private func setupConstraints() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell ?? UITableViewCell()
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

