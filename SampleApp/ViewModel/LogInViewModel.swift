//
//  LogInViewModel.swift
//  SampleApp
//
//  Created by Iqrah Nadeem on 24/11/2022.
//

import Foundation
import SwiftUI

final class LogInViewModel: ObservableObject{
    
    
    @Published var isAuthenticated: Bool = false{
        willSet{objectWillChange.send()}
    }
    
    
    func authenticate(){
        
        isAuthenticated.toggle()
    
        
    }
    
    
}
