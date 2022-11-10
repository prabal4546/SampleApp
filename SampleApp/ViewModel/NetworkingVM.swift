//
//  NetworkingVM.swift
//  SampleApp
//
//  Created by Prabaljit Walia on 10/11/22.
//

import Metaplex
import Solana
import SwiftUI
import UIKit

class NetworkingVM: ObservableObject{
    var ownerPublicKey = PublicKey(string: "Geh5Ss5knQGym81toYGXDbH3MFU2JCMK7E4QyeBHor1b")!
    
    @Published var nftList:[NFT] = []
    lazy var metaplex: Metaplex = {
        let solana = SolanaConnectionDriver(endpoint: RPCEndpoint.mainnetBetaSolana)
        return Metaplex(connection: solana, identityDriver: GuestIdentityDriver(solanaRPC: solana.solanaRPC), storageDriver: URLSharedStorageDriver(urlSession: URLSession.shared))
    }()
    
    
    func viewLoaded(){
        metaplex.nft.findAllByOwner(publicKey: ownerPublicKey) { [weak self] result in
            switch result {
            case .success(let nftList):
                self?.nftList = nftList.compactMap{ $0 }
                print(nftList)
//                for i in 0..<nftList.count{
//
//                }
            case .failure:
                break
            }
        }
    }
}
