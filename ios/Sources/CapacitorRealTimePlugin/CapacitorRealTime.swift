import Foundation
import Kronos

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

    @objc public func getGnssTime() -> TimeInterval {
        return 0
    }

    @objc public func getNetworkTime() -> TimeInterval {
        return 0
    }

    @objc public func getTrueTime() -> TimeInterval {
        Clock.sync {
            time, error in
            if let time = time {
                return time.timeIntervalSince1970 * 1000
            }
            return 0
        }
    }
}
