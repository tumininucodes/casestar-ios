//
//  ActorView.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 21/03/2023.
//

import SwiftUI

struct ActorView: View {
    
    var imageString: String
    var title: String
    
    var body: some View {
        VStack(spacing: 0) {
            
            AsyncImage(url: URL(string: imageString)) { image in
                image.resizable()
                    .imageScale(.small)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 120, alignment: .center)
            } placeholder: {
                Image("picture")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20, alignment: .center)
    
            }
            .frame(width: 100, height: 120, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(title)
                .font(.caption)
                .lineLimit(2)
                .foregroundColor(.white)
                .frame(width: 100, height: 40)
            
        }
        .background(Color("dark"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
