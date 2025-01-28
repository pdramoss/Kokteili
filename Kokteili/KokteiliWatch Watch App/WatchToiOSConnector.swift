//
//  WatchToiOSConnector.swift
//  KokteiliWatch Watch App
//
//  Created by Pedro Ramos on 26/01/25.
//

import Foundation
import WatchConnectivity

class WatchToiOSConnector: NSObject {
    var session: WCSession
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    func sendMacroToiOS() {
        
    }
    
}
extension WatchToiOSConnector: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
}
