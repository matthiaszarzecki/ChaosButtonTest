//
//  ContentView.swift
//  ChaosButtonTest
//
//  Created by Matthias Zarzecki on 21.06.24.
//

import SwiftUI

struct ContentView: View {
  @State var start = Date()
  @State var tapCount: CGFloat = .zero

  var body: some View {
    ZStack {
      TimelineView(.animation) { context in
        Rectangle()
          .foregroundStyle(.white)
          .timeLines(
            seconds: context.date.timeIntervalSince1970 - start.timeIntervalSince1970,
            tapValue: tapCount
          )
      }
      Button(
        action: {
          tapCount += 1
        },
        label: {
          Text("Metal is Dope")
        }
      )
    }
  }
}

extension View {
  func timeLines(seconds: Double,  tapValue: CGFloat ) -> some View {
    self.colorEffect(
      ShaderLibrary.default.timeLines(
        .boundingRect,
        .float(seconds),
        .float(tapValue)
      )
    )
  }
}

#Preview {
  ContentView()
}
