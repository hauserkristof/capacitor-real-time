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

    func testUsedTimeZone() {
        let implementation = CapacitorRealTime()
        let timeZone = implementation.getUsedTimeZone()
        XCTAssertNotNil(timeZone)
    }

    func testGnssTime() {
        let implementation = CapacitorRealTime()
        let gnssTime = implementation.getGnssTime()
        XCTAssertNil(gnssTime)
    }

    func testNetworkTime() {
        let implementation = CapacitorRealTime()
        let networkTime = implementation.getNetworkTime()
        XCTAssertNil(networkTime)
    }

    func testTrueTime() {
        let implementation = CapacitorRealTime()
        let trueTime = implementation.getTrueTime()
        XCTAssertNotNil(trueTime)
    }

    func testAll() {
        testEcho()
        testUptime()
        testUsedTimeZone()
        testGnssTime()
        testNetworkTime()
        testTrueTime()
    }
}
