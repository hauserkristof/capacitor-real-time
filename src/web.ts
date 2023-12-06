// web.ts
import { WebPlugin } from '@capacitor/core';

import type { CapacitorRealTimePlugin } from './definitions';

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
    console.log('getUptime not available in web');
    return { uptime: 0 };
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
    console.log('getTrueTime not available in web');
    return { trueTime: null };
  }
}
