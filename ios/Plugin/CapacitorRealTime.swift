import Foundation

@objc public class CapacitorRealTime: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
