//
//  SearchViewModel.swift
//  LibraryApi
//
//  Created by Javier Ignacio Machuca Arredondo on 09-12-23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var books: [Book] = []
    private var searchRepository: ISearchRepository

    init(repository: ISearchRepository = SearchRepositoryImpl()) {
        self.searchRepository = repository
    }

    func search(query: String) {
        searchRepository.searchBookQuery(query: query) { [weak self] result in
            self?.books = result.docs
        }
    }
}
