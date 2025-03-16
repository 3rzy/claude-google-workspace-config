#!/bin/bash
# Script to restore Claude's Google Workspace MCP configuration
# Author: Claude AI
# Date: March 16, 2025

set -e  # Exit on any error

# Function to display messages
print_message() {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

print_success() {
  echo -e "\033[1;32m[SUCCESS]\033[0m $1"
}

print_error() {
  echo -e "\033[1;31m[ERROR]\033[0m $1"
}

# Check if user provided their email
if [ -z "$1" ]; then
  print_error "Please provide your Gmail address as an argument."
  echo "Usage: $0 your.email@gmail.com"
  exit 1
fi

EMAIL=$1
USERNAME=$(whoami)

print_message "Starting Claude Google Workspace configuration restoration..."
print_message "Using email: $EMAIL"
print_message "Username detected as: $USERNAME"

# Create necessary directories
print_message "Creating required directories..."
mkdir -p ~/.mcp/google-workspace-mcp
mkdir -p ~/.mcp/gdrive-creds
mkdir -p ~/Documents/workspace-mcp-files
mkdir -p ~/Library/Application\ Support/Claude

# Create accounts.json
print_message "Creating accounts.json..."
cat > ~/.mcp/google-workspace-mcp/accounts.json << EOF
{"accounts":[{"email":"$EMAIL","category":"personal","description":"Konto osobiste"}]}
EOF

# Check if config file already exists, back it up if it does
if [ -f ~/Library/Application\ Support/Claude/claude_desktop_config.json ]; then
  print_message "Backing up existing Claude Desktop configuration..."
  cp ~/Library/Application\ Support/Claude/claude_desktop_config.json ~/Library/Application\ Support/Claude/claude_desktop_config.json.backup.$(date +%Y%m%d%H%M%S)
fi

# Request Google API credentials
print_message "Please enter your Google Workspace API credentials:"
read -p "Google Workspace Client ID: " WORKSPACE_CLIENT_ID
read -p "Google Workspace Client Secret: " WORKSPACE_CLIENT_SECRET
read -p "Google Drive Client ID: " DRIVE_CLIENT_ID
read -p "Google Drive Client Secret: " DRIVE_CLIENT_SECRET

# Create claude_desktop_config.json 
print_message "Creating Claude Desktop configuration..."
cat > ~/Library/Application\ Support/Claude/claude_desktop_config.json << EOF
{
  "mcpServers": {
    "brave-search": {
      "command": "npx",
      "args": [
        "@modelcontextprotocol/server-brave-search"
      ],
      "env": {
        "BRAVE_API_KEY": "YOUR_BRAVE_API_KEY"
      }
    },
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/Users/$USERNAME/apps/MCP"
      ]
    },
    "github": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-github"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_GITHUB_TOKEN"
      }
    },
    "gdrive": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-gdrive"
      ],
      "env": {
        "GOOGLE_CLIENT_ID": "$DRIVE_CLIENT_ID",
        "GOOGLE_CLIENT_SECRET": "$DRIVE_CLIENT_SECRET"
      }
    },
    "google-workspace-mcp": {
      "command": "docker",
      "args": [
        "run",
        "--rm",
        "-i",
        "-v", "/Users/$USERNAME/.mcp/google-workspace-mcp:/app/config",
        "-v", "/Users/$USERNAME/Documents/workspace-mcp-files:/app/workspace",
        "-e", "GOOGLE_CLIENT_ID",
        "-e", "GOOGLE_CLIENT_SECRET",
        "-e", "LOG_MODE=strict",
        "ghcr.io/aaronsb/google-workspace-mcp:latest"
      ],
      "env": {
        "GOOGLE_CLIENT_ID": "$WORKSPACE_CLIENT_ID",
        "GOOGLE_CLIENT_SECRET": "$WORKSPACE_CLIENT_SECRET"
      }
    }
  }
}
EOF

# Set appropriate permissions
print_message "Setting correct permissions..."
chmod 700 ~/.mcp/google-workspace-mcp
chmod 600 ~/.mcp/google-workspace-mcp/accounts.json
chmod 600 ~/Library/Application\ Support/Claude/claude_desktop_config.json

print_success "Configuration restored successfully!"
print_message "Please restart Claude Desktop to apply changes."
print_message "After restarting, you'll need to complete the OAuth authentication process."
print_message "If you need help, check the documentation at: https://github.com/3rzy/claude-google-workspace-config"
