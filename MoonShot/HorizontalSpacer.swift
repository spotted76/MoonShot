//
//  HorizontalSpacer.swift
//  MoonShot
//
//  Created by Peter Fischer on 4/1/22.
//

import SwiftUI

struct HorizontalSpacer: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct HorizontalSpacer_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalSpacer()
    }
}
