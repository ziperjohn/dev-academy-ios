//
//  CircleButton.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 17.08.2023.
//

import SwiftUI

struct CircleButton: View {
    let icon: String
    let url: String

    var body: some View {
        Button {
            if let url = URL(string: url) {
                UIApplication.shared.open(url)
            }
        } label: {
            Image(systemName: icon).font(.title)
        }
        .frame(width: 60, height: 60)
        .foregroundColor(Color.white)
        .background(Color.blue)
        .clipShape(Circle())
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(icon: "globe", url: "www.seznam.cz")
    }
}
