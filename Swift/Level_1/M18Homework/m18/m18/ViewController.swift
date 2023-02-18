//
//  ViewController.swift
//  m18
//
//  Created by Al Pacino on 16.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let apiKey = "k_whgw4i20"
    let customCellIdentifier = "cell"
    
    var movies: [APIResponseResults] = []
    var images: [Images] = []
    
    var clickedMovie: APIResponseResults?
    var clickedMovieImage: Images?
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.center = self.view.center
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: customCellIdentifier)
        tableView.rowHeight = 170
        tableView.bounces = true
        return tableView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        //        Service.loadImage(urlString)
        getData()
        setupView()
        setupConstraints()
        
    }
    
    private func setupView() {
        view.addSubview(tableView)
        view.addSubview(searchBar)
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.right.left.bottom.equalTo(view)
        }
        activityIndicator.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.left.equalTo(view)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVC" {
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.rowSelected = clickedMovie
                detailVC.imageSelected = clickedMovieImage
                detailVC.cellImage.image = self.clickedMovieImage?.image
                print("Изображение: \(String(describing: clickedMovieImage))")
                detailVC.cellTitle.text = self.clickedMovie!.title
                detailVC.cellDescription.text = self.clickedMovie!.description
            }
        }
    }
    
    func getData() {
        let urlString = URL(string: "https://imdb-api.com/en/API/Search/\(apiKey)/\(searchBar.text!)")
        DispatchQueue.global(qos: .userInitiated).async {
            guard let url = urlString else { return }
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return }
                var result: APIResponse?
                do {
                    result = try JSONDecoder().decode(APIResponse.self, from: data)
                } catch {
                    print("Failed to decode with error: \(error)")
                }
                guard let final = result else { return }
                final.results.forEach { element in
                    self.movies.append(APIResponseResults(id: element.id,
                                                          title: element.title,
                                                          description: element.description,
                                                          image: element.image))
                    self.loadImage(urlString: element.image)
                }
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
            }
            task.resume()
        }
    }
    
    func loadImage(urlString: String) {
        guard let url = URL(string: urlString),
              let data = try? Data(contentsOf: url) else {
                  print("Ошибка, не удалось загрузить изображения")
                  return
              }
        let image = UIImage(data: data) ?? UIImage()
        images.append(Images(image: image))
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier) as? CustomTableViewCell
        
        let viewModel = movies[indexPath.row]
        let imageModel = images[indexPath.row]
        cell?.configure(viewModel, imageModel)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        clickedMovie = movies[indexPath.row]
        clickedMovieImage = images[indexPath.row]
        
        self.performSegue(withIdentifier: "detailVC", sender: self)
    }
}


extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        movies = []
        images = []
        activityIndicator.startAnimating()
        getData()
    }
}
