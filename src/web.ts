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
}
