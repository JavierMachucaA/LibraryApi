//
//  ContentView.swift
//  LibraryApi
//
//  Created by Javier Ignacio Machuca Arredondo on 04-12-23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var books = [Book]()
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            TextField("Buscar libros", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Buscar") {
                viewModel.search(query: searchText)
            }
           
            ScrollView {
                VStack {
                    ForEach(viewModel.books, id: \.id) { book in
                        VStack(alignment: .leading) {
                            HStack {
                                Image("openbook")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .background(Color.blue) // El color de fondo de la imagen es azul en tu captura de pantalla

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(book.title)
                                        .fontWeight(.bold)
                                    Text(book.author_name?.joined(separator: ", ") ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }

                                Spacer() // Empuja todo el contenido hacia la izquierda
                            }
                            .background(Color.white) // Fondo blanco para cada elemento de la lista

                            Divider() // Línea divisoria entre elementos
                        }
                        .background(Color.white) // También puedes establecer el fondo aquí si es necesario
                        .padding(.horizontal)
                    }
                }
                .background(Color.white) // Fondo de la lista completa, si es necesario
           }
        }
    }
}

#Preview {
    ContentView()
}
