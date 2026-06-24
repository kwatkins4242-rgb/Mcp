# ODIN MCP Server

FastMCP server for ODIN Industries. Exposes ODIN bridge, Bella memory, n8n, and file tools as MCP tools attachable to Claude Code, Claude Desktop, or any MCP-compatible client.

## Setup

```bash
cd my-mcp-server
python -m venv venv
source venv/bin/activate          # Windows: venv\Scripts\activate
pip install -r requirements.txt

cp .env.example .env              # edit .env if keys/IPs change
```

## Run

```bash
# stdio mode (Claude Desktop / Claude Code)
python server.py stdio

# or just
python server.py
```

## Attach to Claude Code

Edit `~/.claude/claude_desktop_config.json` (or the Claude Code MCP config) and paste the contents of `claude_mcp_config.json`, updating the `args` path to wherever you cloned this.

## Tools exposed

| Tool | What it does |
|---|---|
| `shell_run` | Run a shell command via ODIN bridge |
| `shell_run_task` | Run a mapped bridge task (list_dir, read_file, etc.) |
| `file_read` | Read a file |
| `file_write` | Write a file |
| `file_list` | List a directory |
| `file_delete` | Delete a file |
| `file_move` | Move/rename a file |
| `dir_make` | Create a directory |
| `memory_write` | Write to Bella's memory brain |
| `memory_read` | Read memories from a session |
| `memory_search` | Search Bella's memories |
| `memory_increase_trust` | Bump trust score |
| `n8n_trigger_webhook` | Fire an n8n webhook workflow |
| `n8n_list_workflows` | List all n8n workflows |
| `n8n_execute_workflow` | Execute a workflow by ID |
| `odin_chat` | Chat with ODIN core API |
| `odin_auto` | Send autonomous task to ODIN |
| `odin_code` | Code gen/review via ODIN |
| `take_screenshot` | Capture screen via bridge |
| `health_check` | Ping all services |

## Environment Variables

See `.env.example` — all URLs/keys can be overridden without touching server.py.
