import time, requests
import pandas as pd
import matplotlib.pyplot as plt

PROM = "http://localhost:9090"   # e.g., http://192.168.94.140
STEP = "15s"
end = int(time.time())
start = end - 60*60  # last 1 hour

def prom_range(query):
    r = requests.get(f"{PROM}/api/v1/query_range", params={
        "query": query,
        "start": start,
        "end": end,
        "step": STEP
    }, timeout=30)
    r.raise_for_status()
    data = r.json()["data"]["result"]
    # Convert each series to a DataFrame
    frames = []
    for s in data:
        inst = s["metric"].get("instance", "unknown")
        vals = s["values"]  # [ [ts, value], ... ]
        df = pd.DataFrame(vals, columns=["ts","value"])
        df["ts"] = pd.to_datetime(df["ts"], unit="s")
        df["value"] = pd.to_numeric(df["value"], errors="coerce")
        df["instance"] = inst
        frames.append(df)
    return pd.concat(frames, ignore_index=True) if frames else pd.DataFrame(columns=["ts","value","instance"])

# CPU utilization %
cpu_q = '100 - (avg by(instance)(irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)'
cpu = prom_range(cpu_q)

# Memory utilization %
mem_q = '(1 - node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) * 100'
mem = prom_range(mem_q)

# Root filesystem usage %
disk_q = '100 * (node_filesystem_size_bytes{mountpoint="/",fstype!~"tmpfs|overlay"} - node_filesystem_free_bytes{mountpoint="/",fstype!~"tmpfs|overlay"}) / node_filesystem_size_bytes{mountpoint="/",fstype!~"tmpfs|overlay"}'
disk = prom_range(disk_q)

# Plot CPU
for inst, g in cpu.groupby("instance"):
    plt.figure()
    plt.plot(g["ts"], g["value"])
    plt.title(f"CPU Utilization % — {inst}")
    plt.xlabel("Time"); plt.ylabel("%")
    plt.tight_layout()

# Plot Memory
for inst, g in mem.groupby("instance"):
    plt.figure()
    plt.plot(g["ts"], g["value"])
    plt.title(f"Memory Utilization % — {inst}")
    plt.xlabel("Time"); plt.ylabel("%")
    plt.tight_layout()

# Plot Disk
for inst, g in disk.groupby("instance"):
    plt.figure()
    plt.plot(g["ts"], g["value"])
    plt.title(f"Root FS Usage % — {inst}")
    plt.xlabel("Time"); plt.ylabel("%")
    plt.tight_layout()

plt.show()
