//
//  LoadingView.swift
//  SampleApp
//
//  Created by Iqrah Nadeem on 24/11/2022.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(2)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
