//
//  Test-NFTFetch.swift
//  SampleApp
//
//  Created by Prabaljit Walia on 10/11/22.
//

import SwiftUI
import Solana
import Metaplex

struct Test_NFTFetch: View {

    @StateObject var homeVM:NetworkingVM = NetworkingVM()
    var body: some View {
        let actualNFT = homeVM.nftList[0..<homeVM.nftList.count]
        NavigationView {
            List{
                if homeVM.nftList.count == 0{
                    ProgressView()
                }else{
//                    Text(homeVM.nftList.first?.name ?? "falied")
//                Text("\(homeVM.nftList.count)")
                    ForEach(actualNFT.indices,id:\.self){index in
                        HStack(spacing:10){
                            Text(actualNFT[index].name)
                                .font(.caption)
                            .foregroundColor(.white)
                            
//                            AsyncImage(url: URL(string: actualNFT[index].metadata(metaplex: self.homeVM.metaplex, onComplete: { result in
//                                switch result {
//                                case .success(let metadata):
//                                    metadata.image
//                                case .failure:
//                                    break
//                                }
//                            })))
                            
                        }
                    }
                }
                    
            }
        }.onAppear{
            homeVM.viewLoaded()
        }
    }
    
}

struct Test_NFTFetch_Previews: PreviewProvider {
    static var previews: some View {
        Test_NFTFetch()
    }
}


