//
//  Petition.swift
//  Project7_100
//
//  Created by Michel Ortega on 10/21/19.
//  Copyright © 2019 Michel Ortega. All rights reserved.
//

import Foundation

//struct Petition: Codable {
//	var title: String
//	var body: String
//	var signatureCount: Int
//	
//}

struct Petition: Codable {
	var id: Int
	var name: String
	var thumbnail: String
	var age: Int
	
	var weight: Int
	var height: Int
	var hairColor: String
	
	var professions = [String]()
	var friends = [String]()
	
}
