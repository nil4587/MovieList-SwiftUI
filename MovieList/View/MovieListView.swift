//
//  MovieListView.swift
//  MovieList
//
//  Created by Nileshkumar M. Prajapati on 2023/06/20.
//

import SwiftUI

struct MovieListView: View {
    
    //MARK: - Properties
    
   @ObservedObject var viewModel = MovieListViewModel()
    
    //MARK: - Functions
    
    private func sortByTitle() {
        self.viewModel.setSort(by: .sortByTitle)
    }
    
    private func sortByReleasedDate() {
        self.viewModel.setSort(by: .sortByReleasedDate)
    }
    
    //MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.movies, id: \.id) { $item in
                    NavigationLink(destination: MovieDetailsView(movie: $item)) {
                        MovieListRow(viewModel: MovieListRowViewModel(movie: item))
                    }
                }//: LOOP
            }//: LIST
            .listStyle(.plain)
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu("Sort") {
                        Button(action: sortByTitle) {
                            Text("Title")
                            Image(systemName: viewModel.sortType == .sortByTitle ? "circle.fill" : "circle")
                        }
                        Button(action: sortByReleasedDate) {
                            Text("Released Date")
                            Image(systemName: viewModel.sortType == .sortByReleasedDate ? "circle.fill" : "circle")
                        }
                        Button(action: {}) {
                            Text("Cancel")
                        }
                    }
                    .fontWeight(.regular)
                }//: ToolBarItem
            }
        }//: NAVIGATION
    }
}

//MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
            .previewLayout(.device)
    }
}
