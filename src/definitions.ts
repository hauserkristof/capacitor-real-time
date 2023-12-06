// definitions.ts
export interface CapacitorRealTimePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  getUptime(): Promise<{ uptime: number }>;
  getGnssTime(): Promise<{ gnssTime: number | null }>;
  getNetworkTime(): Promise<{ networkTime: number | null }>;
  getTrueTime(): Promise<{ trueTime: number | null }>;
}
