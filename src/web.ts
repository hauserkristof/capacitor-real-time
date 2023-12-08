// web.ts
import { WebPlugin } from '@capacitor/core';

import type { CapacitorRealTimePlugin } from './definitions';

interface NtpResponse {
  time: string;
  type: string;
  roundTripTime: number;
}
export class CapacitorRealTimeWeb
  extends WebPlugin
  implements CapacitorRealTimePlugin
{
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
  async getUptime(): Promise<{ uptime: number }> {
    // Mock implementation or log statement
    const now: Date = new Date();
    const unixTimestamp: number = now.getTime();
    return { uptime: unixTimestamp };
  }

  async getGnssTime(): Promise<{ gnssTime: number | null }> {
    // Mock implementation or log statement
    console.log('getGnssTime not available in web');
    return { gnssTime: null };
  }

  async getNetworkTime(): Promise<{ networkTime: number | null }> {
    // Mock implementation or log statement
    console.log('getNetworkTime not available in web');
    return { networkTime: null };
  }

  async getTrueTime(): Promise<{ trueTime: number | null }> {
    // Mock implementation or log statement
    const res = await fetch('https://time.hauserresults.hu/time');
    if (res.ok) {
      const json = (await res.json()) as NtpResponse;
      const trueTime = new Date(json.time).getTime();
      return { trueTime: trueTime };
    }
    console.error('Error fetching NTP time');
    return { trueTime: null };
  }
}
