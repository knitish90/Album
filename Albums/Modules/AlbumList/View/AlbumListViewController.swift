//
//  ViewController.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import UIKit

class AlbumListViewController: BaseViewController {

    @IBOutlet weak private var tableView: UITableView!
    var viewModel : AlbumListViewModelProtocol!
    var dropDownPicker : DropDownPicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindViewModel()
    }

    
    override func bindViewModel() {
        viewModel.fetchAlbums()
        self.view.showLoader()
        viewModel.didDataLoaded = { (error) in
            self.view.hideLoader()
            if error == nil {
                self.tableView.reloadData()
            }else {
                self.showAlert(error?.localizedDescription)
            }
        }
    }
    
    override func configureUI() {
        self.tableView.accessibilityIdentifier  =   "AlbumListTableView"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort By :", style: .plain, target: self, action: #selector(showFilterOptions))
 
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier =   "AddContactButton"
        setHeaderTitle()
    }
    
    private func setHeaderTitle() {
        self.title =   "Albums"
    }

    @objc private func showFilterOptions() {
        let filterlist = SortOptions.allCases.map{$0.rawValue}
        
        if dropDownPicker == nil {
            dropDownPicker = DropDownPicker(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.size.width, height: 200));
        }
        dropDownPicker?.delegate = self
        dropDownPicker?.showPicker(filterlist , toView: self.view )
               
    }
}

extension AlbumListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumListCell") as! AlbumListCell
        cell.accessibilityLabel = "AlbumListCell_\(indexPath.row)"
        cell.updateUI(cellModel: viewModel.dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AlbumListViewController : dropDownPickerViewDelegate {
    func didPickerViewRowSelected(_ selectedText: String, index: Int) {
        let sortOptions = SortOptions.allCases[index]
        viewModel.prepareDataSource(with: sortOptions)
        self.tableView.reloadData()
    }
    
    
}
