//
//  MovieView.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 05/02/2023.
//

import SwiftUI


struct MovieView: View {
    
    var imageString: String
    var title: String
    
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: imageString)) { image in
                image.resizable()
                    .imageScale(.small)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 150, alignment: .center)
            } placeholder: {
                Image("picture")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20, alignment: .center)
    
            }
            .frame(width: 100, height: 150, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer().frame(height: 10)
            
            Text(title)
                .lineLimit(3)
                .foregroundColor(.white)
                .frame(height: 60)
            
        }
    }
    
   
}
