//
//  FetchedNFT.swift
//  SampleApp
//
//  Created by Prabaljit Walia on 25/10/22.
//
import SwiftUI

struct FetchedNFT{
    var image:String
    var title:String
    var description:String?
}


struct NFTTopHalfDetail{
    
    var title:String
    var description:String
    var image:String
    var attributes:[String : String]
    
}


struct NFTHolder:Hashable {
    let name: String
    let description: String
    let imageURL:String
}

struct MockData{
    
    static let nftList = [sampleNFT, sampleNFT, sampleNFT, sampleNFT]
    
    static let sampleNFT = NFTHolder(name: "OnlyHands 3266",
                                     description: "OnlyHands is a series of 3,337 custom designed NFTs on the Solana Blockchain. We are also the FIRST EVER community driven animated NFT series.",
                                     imageURL: "https://nftstorage.link/ipfs/QmdSL7XfBzcjAWknopWDcnE97qqWSgsrz43ig8c6LcdNfE/3790.png")
}
