//
//  BrachesViewModel.swift
//  Msigma Gokulam
//
//  Created by Vikash on 09/11/23.
//

import Foundation

class BranchesViewModel: ObservableObject{
    
    @Published var branches: [Branch] = []
    @Published var isLoading: Bool = true
    func getBranches() {
        
        guard let url = URL(string: "https://api.msigma.in/btech/v2/branches") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let session = URLSession.shared

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(APIResponse.self, from: data)
                print(result)
                DispatchQueue.main.async { [self] in
                    self.branches = result.branches
                    isLoading = false
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        task.resume()
    }
}
