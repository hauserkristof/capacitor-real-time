import XCTest
@testable import CapacitorRealTimePlugin

class CapacitorRealTimeTests: XCTestCase {
    func testEcho() {
        // This is an example of a functional test case for a plugin.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let implementation = CapacitorRealTime()
        let value = "Hello, World!"
        let result = implementation.echo(value)

        XCTAssertEqual(value, result)
    }

    func testUptime() {
        let implementation = CapacitorRealTime()
        let uptime = implementation.getUptime()
        XCTAssertGreaterThan(uptime, 0)
    }

    func testUptimeIncludesSleep() {
        let implementation = CapacitorRealTime()
        // Continuous uptime is never behind the awake-only system uptime.
        let awakeUptime = ProcessInfo.processInfo.systemUptime * 1000
        XCTAssertGreaterThanOrEqual(implementation.getUptime(), awakeUptime)
    }

    func testUsedTimeZone() {
        let implementation = CapacitorRealTime()
        let timeZone = implementation.getUsedTimeZone()
        XCTAssertNotNil(timeZone)
    }
}
