import { registerPlugin } from '@capacitor/core';

import type { CapacitorRealTimePlugin } from './definitions';

const CapacitorRealTime = registerPlugin<CapacitorRealTimePlugin>('CapacitorRealTime', {
  web: () => import('./web').then((m) => new m.CapacitorRealTimeWeb()),
});

export * from './definitions';
export { CapacitorRealTime };
