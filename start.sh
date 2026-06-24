#!/bin/bash
# Easy start script for the ODIN MCP stack (bridge/mcp/proxy)
# Clears any stale processes hogging the known ports, then runs launch.py.
# Runs the same cleanup again after launch.py exits, so the next start is
# always clean even if Ctrl+C left orphaned children behind.

cd "$(dirname "$0")"

PORTS=(8099 8080 3099)

cleanup() {
    echo "[start.sh] Clearing ports: ${PORTS[*]}"
    for port in "${PORTS[@]}"; do
        fuser -k "${port}/tcp" 2>/dev/null
    done
    sleep 1
}

echo "[start.sh] Pre-launch cleanup..."
cleanup

echo "[start.sh] Starting ODIN stack..."
python launch.py
EXIT_CODE=$?

echo "[start.sh] launch.py exited (code $EXIT_CODE) — post-launch cleanup..."
cleanup

exit $EXIT_CODE
