//
//  ReachabilityTest.swift
//  sizeit
//
//  Created by Jaydeep on 11/13/18.
//

import Foundation
import SystemConfiguration
import Reachability
import Alamofire
public class ReachabilityTest {
    
    class func isConnectedToNetwork() -> Bool {        
        var zeroAddress = sockaddr_in()
//        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}

class MNNetworkUtils {
    static let main = MNNetworkUtils()
    init() {
        manager = NetworkReachabilityManager(host: "google.com")
        listenForReachability()
    }
    
    private let manager: NetworkReachabilityManager?
    private var reachable: Bool = false
    private func listenForReachability() {
        self.manager?.listener = { [unowned self] status in
            switch status {
            case .notReachable:
                self.reachable = false
            case .reachable(_), .unknown:
                self.reachable = true
            }
        }
        self.manager?.startListening()
    }
    
    func isConnected() -> Bool {
        return reachable
    }
}
