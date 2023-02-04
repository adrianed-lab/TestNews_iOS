//
//  NewsViewController.swift
//  TestNews_iOS
//
//  Created by admin on 4.02.23.
//

import UIKit

protocol NewsViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

class NewsViewController: UIViewController, NewsViewProtocol {
    @IBOutlet weak var newsTableView: UITableView!
    var presenter: NewsViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.register(UINib(nibName: "NewsTitleTableViewCell", bundle: nil), forCellReuseIdentifier: NewsTitleTableViewCell.key)
    }
    
    func success() {
        newsTableView.reloadData()
    }
        
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.countNews()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsTableView.dequeueReusableCell(withIdentifier: NewsTitleTableViewCell.key, for: indexPath) as? NewsTitleTableViewCell else {return UITableViewCell()}
        presenter.configureNewsTitleTableViewCell(indexPath: indexPath, cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
}
