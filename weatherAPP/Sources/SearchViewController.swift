//
//  SearchViewController.swift
//  weatherAPP
//
//  Created by User on 01.09.2021.
//

import UIKit
class SearchViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationbar()
    }
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func addNavigationbar() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 60))
        self.view.addSubview(navBar)
        
        let navigationItem = UINavigationItem(title: "")
        self.searchController = searchControllerWith(searchResultsController: nil)
        navigationItem.titleView = self.searchController.searchBar
        
        navBar.setItems([navigationItem], animated: false)
        self.definesPresentationContext = true
    }
    
    func searchControllerWith(searchResultsController: UIViewController?) -> UISearchController {
        
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        
        return searchController
    }
}
