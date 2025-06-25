import time
import requests

while True:
    try:
        requests.get("http://localhost:3128", timeout=5)
        print("✅ Keepalive ping sent.")
    except Exception as e:
        print("❌ Ping failed:", e)
    time.sleep(300)  # Every 5 minutes