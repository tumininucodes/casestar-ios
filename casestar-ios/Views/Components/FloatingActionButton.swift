//
//  FloatingActionButton.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 19/03/2023.
//

import SwiftUI

struct FloatingActionButton<ImageView: View>: ViewModifier {
  let color: Color // background color of the FAB
  let image: ImageView // image shown in the FAB
  let action: () -> Void

  private let size: CGFloat = 40 // size of the FAB circle
  private let margin: CGFloat = 15 // distance from screen edges

  func body(content: Content) -> some View {
    GeometryReader { geo in
      ZStack {
        Color.clear // allows the ZStack to fill the entire screen
        content
        button(geo)
      }
    }
  }

  @ViewBuilder private func button(_ geo: GeometryProxy) -> some View {
    image
      .imageScale(.small)
      .frame(width: 40, height: 40)
      .background(Circle().fill(color))
      .onTapGesture(perform: action)
      .offset(x: (geo.size.width - size) / 2 - margin,
              y: (geo.size.height - size) / 2 - margin)
  }
}

extension View {
  func floatingActionButton<ImageView: View>(
    color: Color,
    image: ImageView,
    action: @escaping () -> Void) -> some View {
    self.modifier(FloatingActionButton(color: color, image: image, action: action))
  }
}
