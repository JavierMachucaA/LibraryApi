//
//  SearchRepositoryImpl.swift
//  LibraryApi
//
//  Created by Javier Ignacio Machuca Arredondo on 09-12-23.
//

import Foundation

class SearchRepositoryImpl : ISearchRepository {
    
    func searchBookQuery(query: String, completion: @escaping(SearchResult) -> Void) {
        let codecUrl  = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://openlibrary.org/search.json?q=\(codecUrl)"
        guard let url = URL(string: urlString ) else { return }
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
                if let data = data {
                    if let result = try? JSONDecoder().decode(SearchResult.self, from: data) {
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    }
                }
        }.resume()
    }
}
