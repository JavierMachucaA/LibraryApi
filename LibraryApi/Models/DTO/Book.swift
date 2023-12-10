//
//  Book.swift
//  LibraryApi
//
//  Created by Javier Ignacio Machuca Arredondo on 04-12-23.
//

import Foundation

struct Book: Codable, Identifiable {
    var id: String { key }
    var key: String
    var title: String
    var author_name: [String]?
    var publish_date: [String]?
    var isbn: [String]?
    var publisher : [String]?
    var cover_i: Int?
}
