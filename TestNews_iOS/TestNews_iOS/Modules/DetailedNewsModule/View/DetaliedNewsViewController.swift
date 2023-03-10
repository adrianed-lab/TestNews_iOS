//
//  DetaliedNewsViewController.swift
//  TestNews_iOS
//
//  Created by admin on 4.02.23.
//

import UIKit

protocol DetaliedNewsViewProtocol: AnyObject {
    
}

class DetaliedNewsViewController: UIViewController, DetaliedNewsViewProtocol {
    @IBOutlet weak var detaliedNewsTableView: UITableView!
    var presenter: DetaliedNewsViewPresenterProtocol!
    var shareLinkNewsButton: UIBarButtonItem {
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(shareLink))
        shareButton.tintColor = .black
        shareButton.width = 30
        return shareButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detaliedNewsTableView.register(UINib(nibName: "DetaliedNewsTableViewCell", bundle: nil), forCellReuseIdentifier: DetaliedNewsTableViewCell.key)
        detaliedNewsTableView.register(UINib(nibName: "NewsTitleTableViewCell", bundle: nil), forCellReuseIdentifier: NewsTitleTableViewCell.key)
        navigationItem.rightBarButtonItems = [shareLinkNewsButton]

    }
    
    @objc func shareLink(sender: UIBarButtonItem) {
        let link = presenter.getLinkURL()
        let shareController = UIActivityViewController(activityItems: [link], applicationActivities: .none)
        present(shareController, animated: true)
    }
}

extension DetaliedNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = detaliedNewsTableView.dequeueReusableCell(withIdentifier: NewsTitleTableViewCell.key, for: indexPath) as? NewsTitleTableViewCell else {return UITableViewCell()}
            presenter.configureNewsTitleTableViewCell(cell: cell)
            return cell
        case 1:
            guard let cell = detaliedNewsTableView.dequeueReusableCell(withIdentifier: DetaliedNewsTableViewCell.key, for: indexPath) as? DetaliedNewsTableViewCell else {return UITableViewCell()}
            presenter.configureDetaliedNewsTableViewCell(indexPath: indexPath, cell: cell)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 120
        case 1:
            return 350
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
