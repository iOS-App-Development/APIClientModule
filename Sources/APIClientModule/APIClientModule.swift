import Foundation
import APIClient
import HTTPClientModule

public struct APIClientModule {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

extension APIClientModule:APIClientModuleAPI
{
    func load() {
    }
    
    func unload() {
    }
}
