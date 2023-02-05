//
//  AboutView.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 01/02/2023.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Designed and developed by")
                Image("profileImg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Tumi Ojo")
                    .bold()
            }
            Spacer()
        }
        .navigationTitle("Credits")
    }
}
