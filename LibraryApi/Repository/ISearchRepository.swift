//
//  SearchService.swift
//  LibraryApi
//
//  Created by Javier Ignacio Machuca Arredondo on 04-12-23.
//

import Foundation

protocol ISearchRepository {
    func searchBookQuery(query: String, completion: @escaping(SearchResult) -> Void)
}
