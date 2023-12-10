//
//  SearchResult.swift
//  LibraryApi
//
//  Created by Javier Ignacio Machuca Arredondo on 04-12-23.
//

import Foundation

struct SearchResult: Codable {
    var numFound: Int
    var start: Int
    var numFoundExact: Bool
    var docs: [Book]
}
