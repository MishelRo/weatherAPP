//
//  MainViewController.swift
//  weatherAPP
//
//  Created by User on 02.09.2021.
//
import UIKit

class MainViewController: UIViewController, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    
    var tableView: UITableView!
    var searchController : UISearchController!
    var network: Network!
    var model: MainViewModel!
    var button: CustomButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button = CustomButton()
        network = Network()
        model = MainViewModel()
        tableView = UITableView(frame: CGRect(x: 15, y: 10, width: view.bounds.width,
                                              height: view.bounds.height + view.bounds.height / 5 ))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: MainTableViewCell.cellName, bundle: nil),
                           forCellReuseIdentifier: MainTableViewCell.reuseId)
        button.addTarget(self, action: #selector(buttonTab), for: .touchDown)
        bind()
        model.tableOfCityData(array: model.arrayOfCity)
        buttonSetup()
        checkCoreDataCitys()
        self.view.addSubview(tableView)
        self.searchController = UISearchController(searchResultsController:  nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.text = .none
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = true
    }
    
    @objc func buttonTab(){
        let alert = UIAlertController().getNewComment { [unowned self] (city) in
            self.model.arrayOfCity.append(city)
            tableView.reloadData()
        }
        present(alert, animated: true, completion: nil)
    }
    
    func buttonSetup(){
        view.addSubview(button)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
    }
    
    
    func bind() {
        model.arrayOfData.bind(to: self){ [unowned self]  _,_ in
            self.tableView.reloadData()
        }
    }
    
    
    func checkCoreDataCitys() {
        model.getCity { [unowned self]  (arrayOfCitys) in
            for item in arrayOfCitys {
                self.model.arrayOfCity.append(item)
            }
        }
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let city = searchController.searchBar.text ?? ""
        guard city.count > 4 else {return}
        model.citySearch(city: city) { [unowned self] (responce) in
            guard responce.name == city else {return}
            self.navigationController?.pushViewController(DetailViewController(), animated: false)
            DetailViewModel().getData(data: responce)
            dismiss(animated: false, completion: nil)
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.arrayOfData.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var index = 0
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseId,
                                                 for: indexPath) as! MainTableViewCell
        if index <= model.arrayOfData.value.count {
            index += 1
            let currentInfo = model.arrayOfData.value[indexPath.row]
            cell.cityLabel.text = "City - \(currentInfo.name)"
            cell.tempLabel.text = "Tempeture \(currentInfo.main.temp)"
            cell.pressureLabel.text = "Pressure \(currentInfo.main.pressure)"
            let imager = WeatherImage().searchImageFromId(id: currentInfo.weather.first!.id)
            cell.imagesView.image = imager
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewController(), animated: false)
        let currentInfo = model.arrayOfData.value[indexPath.row]
        DetailViewModel().getData(data: currentInfo)
    }
}
