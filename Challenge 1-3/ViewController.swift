//
//  ViewController.swift
//  Challenge 1-3
//
//  Created by Denys Denysenko on 12.10.2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [String]()
    var countriesforDispalying = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix(".png") {
                var dot = item.firstIndex(of: ".")
                var countryName = item[..<dot!]
                countriesforDispalying.append(String(countryName))
                countries.append(item)
            }
        }
        
      
        
        print (countriesforDispalying)
        
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countriesforDispalying[indexPath.row].uppercased()
        
        
      
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedItem = countries[indexPath.row]
            vc.navBarTitle = countriesforDispalying[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    

}

