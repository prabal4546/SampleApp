//
//  ViewModel.swift
//  SampleApp
//
//  Created by Prabaljit Walia on 24/10/22.
//

import Metaplex
import Solana
import SwiftUI
import UIKit

final class ViewModel: ObservableObject{
    
    var ownerPublicKey = PublicKey(string: "Geh5Ss5knQGym81toYGXDbH3MFU2JCMK7E4QyeBHor1b")!
    
    @Published var nftList:[NFTHolder] = []
    @Published var isLoading = false
    
    var metaplex: Metaplex = {
        let solana = SolanaConnectionDriver(endpoint: RPCEndpoint.mainnetBetaSolana)
        return Metaplex(connection: solana, identityDriver: GuestIdentityDriver(solanaRPC: solana.solanaRPC), storageDriver: URLSharedStorageDriver(urlSession: URLSession.shared))
    }()
    
    func getNFTList(){
        isLoading = true
        metaplex.nft.findAllByOwner(publicKey: ownerPublicKey) { [weak self] result in
            switch result {
                case .success(let nftList):
                    for i in 0..<10{
                        nftList[i]?.metadata(metaplex: self!.metaplex , onComplete: { result in
                        switch result {
                            case .success(let metadata):
                            DispatchQueue.main.async{
                                self!.isLoading = false
                                
                                self?.nftList.append(NFTHolder(name: metadata.name!, description: metadata.description!, imageURL: metadata.image!))
                            }
                            case .failure:
                                break
                            }
                        })
                    }
                case .failure:
                    break
            }
        }
    }
}

