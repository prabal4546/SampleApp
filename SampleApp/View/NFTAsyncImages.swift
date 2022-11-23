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
        VStack{
            if let fetchedImages = vm.nftDetailsList{
                ForEach(fetchedImages, id: \.self) { image in
                    List {
                        HStack{
                            AsyncImage(url: URL(string: image.imageURL))
                    
                            Text(image.name)
                            
                        }
                    }
                }
            }
        }.onAppear{
            vm.loadNFTImages()
        }
    }
}

struct NFTAsyncImages_Previews: PreviewProvider {
    static var previews: some View {
        NFTAsyncImages()
    }
}
