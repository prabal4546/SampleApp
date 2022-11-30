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
    
//    UIKit: Geh5Ss5knQGym81toYGXDbH3MFU2JCMK7E4QyeBHor1b
    
    @Published var nftList:[NFT] = []
    @Published var nftDetailsList:[NFTHolder] = []
//    var NFTURLs: [String] = []
    var metaplex: Metaplex = {
        let solana = SolanaConnectionDriver(endpoint: RPCEndpoint.mainnetBetaSolana)
        return Metaplex(connection: solana, identityDriver: GuestIdentityDriver(solanaRPC: solana.solanaRPC), storageDriver: URLSharedStorageDriver(urlSession: URLSession.shared))
    }()
    

    func loadNFTImages(){
        metaplex.nft.findAllByOwner(publicKey: ownerPublicKey) { [weak self] result in
            switch result {
                case .success(let nftList):
                    for i in 0..<10{
                        nftList[i]?.metadata(metaplex: self!.metaplex , onComplete: { result in
                        switch result {
                            case .success(let metadata):
                                print("Name: \(metadata.name!)")
//                                print("Description: \(metadata.description!)")
//                                print("URL: \(metadata.image!)")
                            
//                                print("ATTRIBUTES: \(metadata.attributes)")
                            
                            
                            DispatchQueue.main.async{
                                self?.nftDetailsList.append(NFTHolder(name: metadata.name!, description: metadata.description!, imageURL: metadata.image!))

                            }
                                print(self!.nftDetailsList)
                            case .failure:
                                print("FAILUREEE")
                                break
                            }
                        })
                    }
                case .failure:
                    break
            }
        }
    }
    
    
    
    
    func viewLoaded(){
        metaplex.nft.findAllByOwner(publicKey: ownerPublicKey) { [weak self] result in
            switch result {
            case .success(let nftList):
                self?.nftList = nftList.compactMap{ $0 }
//                print(nftList)
                for i in 0..<nftList.count{

                    nftList[i]?.metadata(metaplex: self!.metaplex , onComplete: { result in
                    switch result {
                        case .success(let metadata):
                        print("Print URL count \(i):")
                        print(metadata.image ?? "Image String Error")
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

