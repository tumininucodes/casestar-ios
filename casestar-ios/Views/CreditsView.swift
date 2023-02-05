//
//  AboutView.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 01/02/2023.
//

import SwiftUI

struct CreditsView: View {
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        VStack {
            Spacer().frame(height: 10)
            
            VStack {
                Text("Designed and developed by")
                Image("profileImg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Spacer().frame(height: 10)
                Text("Tumi Ojo")
                    .bold()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(20)
            .background(Color("dark"))
            .cornerRadius(20)
            .padding([.leading, .trailing], 20)
            
            Spacer().frame(height: 20)
            
            VStack {
                Text("Connect with me on:")
                
                Spacer().frame(height: 20)
                
                HStack {
                    VStack {
                        Image("twitter")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        Text("Twitter")
                    }
                    .onTapGesture {
                        openURL(URL(string: "https://twitter.com/tumi_ojo")!)
                    }
                    
                    Spacer().frame(width: 50)
                    
                    VStack {
                        Image("github")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            
                        Text("Github")
                    }
                    .onTapGesture {
                        openURL(URL(string: "https://github.com/tumininucodes")!)
                    }
                    
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(20)
            .background(Color("dark"))
            .cornerRadius(20)
            .padding([.leading, .trailing], 20)
            
            Spacer()
        
        }
        .navigationTitle("Credits")
    }
}
