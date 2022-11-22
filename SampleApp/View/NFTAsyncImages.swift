//
//  NFTAsyncImages.swift
//  SampleApp
//
//  Created by Iqrah Nadeem on 16/11/2022.
//

import SwiftUI
import Solana
import Metaplex

struct NFTAsyncImages: View {
    
    @StateObject var vm = NetworkingVM()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: vm.loadNFTImages)
    }
}

struct NFTAsyncImages_Previews: PreviewProvider {
    static var previews: some View {
        NFTAsyncImages()
    }
}
