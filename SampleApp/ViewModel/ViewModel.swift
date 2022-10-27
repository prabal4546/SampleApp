//
//  ViewModel.swift
//  SampleApp
//
//  Created by Prabaljit Walia on 24/10/22.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject{
    
    
    @Published var isAuthenticated: Bool = false{
        willSet{objectWillChange.send()}
    }
    
    
    func authenticate(){
        
        isAuthenticated.toggle()
    
        
    }
    
    
}

