import Foundation

@objc public class CapacitorRealTime: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }

    @objc public func getUsedTimeZone() -> String {
        return TimeZone.current.identifier
    }

    @objc public func getUptime() -> TimeInterval {
        return ProcessInfo.processInfo.systemUptime * 1000
    }
}
