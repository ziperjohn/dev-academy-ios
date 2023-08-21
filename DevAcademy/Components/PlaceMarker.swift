//
//  PlaceMarker.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 17.08.2023.
//

import SwiftUI

struct PlaceMarker: View {
    var body: some View {
        ZStack {
            Triangle()
                .fill(Color.red)
                .frame(width: 20, height: 20)
                .rotationEffect(.degrees(180))
                .offset(y: 12)

            Circle()
                .fill(Color.red)
                .frame(width: 20, height: 20)

            Circle()
                .fill(Color.white)
                .frame(width: 10, height: 10)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}

struct PlaceMarker_Previews: PreviewProvider {
    static var previews: some View {
        PlaceMarker()
    }
}
