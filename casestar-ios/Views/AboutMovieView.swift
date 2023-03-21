//
//  AboutMovie.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 20/03/2023.
//

import SwiftUI
import WebKit

struct AboutMovieView: View {
    
    @StateObject var mainVM = MainVIewModel()
    var movie: Movie
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                
                if !mainVM.videos.isEmpty {

                    YouTubeView(videoId: mainVM.videos.first { $0.name?.contains("official trailer") ?? false }?.key ?? mainVM.videos.first?.key ?? "")
                        .onAppear  {
                            print("==============")
                            print(mainVM.videos)
                            print(mainVM.videos.first { $0.name?.contains("official trailer") ?? false }?.key ?? "")
                        }
                        .frame(height: 200)
                }


                Spacer().frame(height: 20)
                
                Text(movie.title)
                    .bold()
                    .font(.title2)
                    .padding([.leading, .trailing], 10)
                    .foregroundColor(.white)
                
                Spacer().frame(height: 10)
                
                Text(movie.overview ?? "")
                    .font(.body)
                    .padding([.leading, .trailing], 10)
                    .foregroundColor(.white)
                
                Spacer().frame(height: 10)
                
                HStack {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.poster_path ?? "")")) { image in
                        image.resizable()
                            .frame(width: 150, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } placeholder: {
                        Image("picture")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20, alignment: .center)
                    }
                    .frame(width: 150, height: 250)

                    Spacer().frame(width: 20)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Release date")
                            .bold()
                            .foregroundColor(.white)
                        Text(movie.release_date ?? "")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        
                        Spacer().frame(height: 10)
                        
                        Group {
                            
                            VStack(alignment: .leading) {
                                Text("Vote count")
                                    .bold()
                                    .foregroundColor(.white)
                                
                                Text("\(movie.vote_count)")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                
                                Spacer().frame(height: 10)
                                
                                Text("Average rating")
                                    .bold()
                                    .foregroundColor(.white)
                                Text("\(movie.vote_average)")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                
                                Spacer().frame(height: 10)
                            }
                            
                        }
                        
                        
                        Text("Popularity score")
                            .bold()
                            .foregroundColor(.white)
                        
                        Text("\(movie.popularity)")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        
                        Spacer().frame(height: 10)
                        
                        Text("Language")
                            .bold()
                            .foregroundColor(.white)
                        
                        Text(movie.original_language ?? "")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                }
                .padding([.leading, .trailing], 10)
                
                Text("Cast")
                    .bold()
                    .font(.title2)
                    .padding([.leading, .trailing], 10)
                    .foregroundColor(.white)
                
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(mainVM.cast, id: \.id) { person in
                            ActorView(imageString: "https://image.tmdb.org/t/p/original\(person.profile_path ?? "")", title: person.name ?? "")
                           
                        }
                    }
                }
                
                Spacer()
                
            }
            

            
        }
        .onAppear {
            mainVM.getCast(movieId: movie.id.description)
            mainVM.getMovieVideo(movieId: movie.id.description)
        }
        
        
    }
}



struct YouTubeView: UIViewRepresentable {
    let videoId: String
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}
