#!/bin/bash
# Script to backup Claude's Google Workspace MCP configuration
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

# Timestamp for backup
TIMESTAMP=$(date +%Y%m%d%H%M%S)
BACKUP_DIR=~/claude_backup_$TIMESTAMP
USERNAME=$(whoami)

# Create backup directory
print_message "Creating backup directory: $BACKUP_DIR"
mkdir -p $BACKUP_DIR
mkdir -p $BACKUP_DIR/.mcp

# Check if needed files and directories exist
if [ ! -d ~/.mcp/google-workspace-mcp ]; then
  print_error "Google Workspace MCP configuration directory not found. Nothing to backup."
  exit 1
fi

# Create backup
print_message "Backing up Google Workspace MCP configuration..."

# Backup accounts.json if it exists
if [ -f ~/.mcp/google-workspace-mcp/accounts.json ]; then
  print_message "Backing up accounts.json..."
  cp ~/.mcp/google-workspace-mcp/accounts.json $BACKUP_DIR/.mcp/
else
  print_message "No accounts.json found. Skipping..."
fi

# Backup credentials (exclude tokens)
if [ -d ~/.mcp/google-workspace-mcp/credentials ]; then
  print_message "Backing up credentials directory (excluding tokens)..."
  mkdir -p $BACKUP_DIR/.mcp/credentials
  find ~/.mcp/google-workspace-mcp/credentials -name "*.json" -not -name "*token*" -exec cp {} $BACKUP_DIR/.mcp/credentials/ \;
fi

# Backup Claude Desktop configuration
if [ -f ~/Library/Application\ Support/Claude/claude_desktop_config.json ]; then
  print_message "Backing up Claude Desktop configuration..."
  mkdir -p $BACKUP_DIR/Library/Application\ Support/Claude/
  cp ~/Library/Application\ Support/Claude/claude_desktop_config.json $BACKUP_DIR/Library/Application\ Support/Claude/
else
  print_message "No Claude Desktop configuration found. Skipping..."
fi

# Create a summary file
print_message "Creating backup summary..."
cat > $BACKUP_DIR/backup_summary.txt << EOF
Claude Google Workspace Configuration Backup
=============================================
Created: $(date)
Username: $USERNAME

Files backed up:
- ~/.mcp/google-workspace-mcp/accounts.json
- ~/.mcp/google-workspace-mcp/credentials/* (excluding tokens)
- ~/Library/Application Support/Claude/claude_desktop_config.json

To restore this backup:
1. Copy accounts.json to ~/.mcp/google-workspace-mcp/
2. Copy claude_desktop_config.json to ~/Library/Application Support/Claude/
3. Restart Claude Desktop
4. Complete OAuth authentication if needed

Note: Authentication tokens are NOT included in this backup for security reasons.
You will need to re-authenticate after restoring this backup.
EOF

# Create a tarball of the backup
print_message "Creating compressed backup archive..."
tar -czf ~/claude_backup_$TIMESTAMP.tar.gz -C $(dirname $BACKUP_DIR) $(basename $BACKUP_DIR)

# Cleanup
rm -rf $BACKUP_DIR

print_success "Backup completed successfully!"
print_message "Backup saved to: ~/claude_backup_$TIMESTAMP.tar.gz"
print_message "You can restore this backup manually or use the restore_config.sh script."
