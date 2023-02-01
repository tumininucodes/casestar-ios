//
//  AboutView.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 01/02/2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Designed and developed by")
                Image("profileImg")
                Text("Tumi Ojo")
            }
            
        }
        .navigationTitle("Credits")
    }
}
