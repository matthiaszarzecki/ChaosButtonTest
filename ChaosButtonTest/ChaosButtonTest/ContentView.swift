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
  @State var tapCount2: CGFloat = 1

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

      VStack(spacing: 32) {
        Button(
          action: {
            tapCount += 1
          },
          label: {
            Text("Metal is Dope")
              .frame(width: 200, height: 64)
              .background(Color.black)
              .cornerRadius(32)
              .shadow(color: .white, radius: 10)
          }
        )

        Button(
          action: {
            tapCount = 0
          },
          label: {
            Text("Reset Count")
              .frame(width: 200, height: 64)
              .background(Color.black)
              .cornerRadius(32)
              .shadow(color: .white, radius: 10)
          }
        )
        .disabled(tapCount <= 0)

        TimelineView(.animation) { context in
          Button(
            action: {
              tapCount2 += 1
            },
            label: {
              Text("Metal is Dope")
                .frame(width: 200, height: 64)
                .background(Color.black)
                .timeLines(
                  seconds: context.date.timeIntervalSince1970 - start.timeIntervalSince1970,
                  tapValue: tapCount2
                )
                .cornerRadius(32)
                .shadow(color: .white, radius: 10)
            }
          )
        }
      }
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
