//
//  HomeViewModel.swift
//  kkday-hw
//
//  Created by Mack Liu on 2020/8/20.
//  Copyright © 2020 eBMW Studio. All rights reserved.
//

import UIKit
import Alamofire

class APIService: NSObject {
    
    public class func fetchSource<T>(urlString: String, type: T.Type,
                                     completion: @escaping (_ responseObject: T) -> Void) where T : Decodable {
        
        AF.request(urlString).responseJSON { response in
            switch response.result {
                case .success:
                    if response.data != nil {
                        let decoder = JSONDecoder()
                        
                        if let responseObject = try? decoder.decode(T.self, from: response.data!) {
                            completion(responseObject)
                        }
                        else {
                            print("Decoded Error")
                        }
                    }
                break
                
                case let .failure(error):
                    print("Fetch Error: \(error.localizedDescription)")
                break
            }
        }
    }
}
