//
//  MovieDetailsHeaderView.swift
//  MovieList
//
//  Created by Nileshkumar M. Prajapati on 2023/06/20.
//

import SwiftUI

struct MovieDetailsHeaderView: View {
    
    //MARK: - Properties
    
    @Binding var movie: Movie
    
    private var watchListButtonTitle: String {
        movie.onWatchList == true ? "Remove from WatchList" : "+ Add to WatchList"
    }
    
    private var attributedRating: AttributedString {
        var result = AttributedString(movie.rating)
        result.foregroundColor = .accentColor
        result.font = .system(.title2, design: .default, weight: .heavy)
        
        var stringSuffix = AttributedString("/10")
        stringSuffix.foregroundColor = .secondary
        stringSuffix.font = .system(.title3, design: .default, weight: .bold)
        result.append(stringSuffix)
        
        return result
    }
    
    //MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(movie.image)
                    .resizable()
                    .frame(width: 100, height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(.leading, 10)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(movie.title)
                            .font(.headline)
                            .fontWeight(.heavy)

                        Spacer()
                        Spacer()
                        
                        Text(attributedRating)

                    }//: HStack
                    
                    Spacer()
                    
                    Button {
                        movie.onWatchList.toggle()
                    } label: {
                        Text(watchListButtonTitle.uppercased())
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(
                                Capsule()
                                    .stroke(.primary, lineWidth: 2)
                            )
                    }//: Add to WatchList
                    
                    Spacer()
                    
                    Button {
                        // Remove to fix conflicts between actions of two buttons
                    } label: {
                        Text("WATCH TRAILER")
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(
                                Capsule()
                                    .stroke(.primary, lineWidth: 2)
                            )
                    }//: WATCH TRAILER
                    .onTapGesture {
                        guard let url = URL(string: movie.trailerLink) else { return }
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                }//: VStack
                .padding()
            }//: HSTACK
        }
    }
}

//MARK: - Preview

struct MovieDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        @State var movie = moviesData.first!
        
        MovieDetailsHeaderView(movie: $movie)
            .previewLayout(.fixed(width: 375, height: 185))
    }
}
