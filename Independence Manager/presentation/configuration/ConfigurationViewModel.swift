//
//  ConfigurationViewModel.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

class ConfigurationViewModel {
    
    private let getConfigInfo = UCGetConfigTopInfo()
    var configInfo: Box<ObjConfigTopInfo> = Box()
    
    func loadInfo() {
        getConfigInfo.execute { info in
            self.configInfo.setItem(item: info)
        }
    }
    
    func cancel() {
        configInfo.cancel()
        getConfigInfo.cancelAll()
    }
}
