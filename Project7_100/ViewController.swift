//
//  ViewController.swift
//  Project7_100
//
//  Created by Michel Ortega on 10/21/19.
//  Copyright © 2019 Michel Ortega. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	
	var petitions = [Petition]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		let urlString: String
		
		if navigationController?.tabBarItem.tag == 0 {
			urlString = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
			
		} else {
			urlString =  "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
			
		}
		
		if let url = URL(string: urlString) {
			if let data = try? Data(contentsOf: url) {
				parse(json: data)
				return
				
			}
		}
		
		showError()
	}
	
	func showError() {
		let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed. Please show you connection and try again.", preferredStyle: .alert)
		
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, 	animated: true)
	}
	
	func parse(json: Data) {
		let decoder = JSONDecoder()
		
		if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
			petitions = jsonPetitions.results
			tableView.reloadData()
			
		}
		
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	
		return petitions.count
		
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let petition = petitions[indexPath.row]
		
		cell.textLabel?.text = petition.name
		cell.detailTextLabel?.text = petition.hairColor
		
		return cell
		
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = DetailViewController()
		vc.detailItem = petitions[indexPath.row]
		navigationController?.pushViewController(vc, animated: true)
		
	}
}

