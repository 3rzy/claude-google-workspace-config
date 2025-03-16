#!/bin/bash
# Script to validate Claude's Google Workspace MCP configuration
# Author: Claude AI
# Date: March 16, 2025

# Function to display messages
print_message() {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

print_success() {
  echo -e "\033[1;32m[SUCCESS]\033[0m $1"
}

print_warning() {
  echo -e "\033[1;33m[WARNING]\033[0m $1"
}

print_error() {
  echo -e "\033[1;31m[ERROR]\033[0m $1"
}

# Initialize error counter
ERRORS=0

print_message "Starting validation of Claude Google Workspace configuration..."

# Check required directories
print_message "Checking required directories..."

# Check MCP directory
if [ ! -d ~/.mcp ]; then
  print_error "~/.mcp directory not found"
  ERRORS=$((ERRORS+1))
else
  print_success "~/.mcp directory exists"
fi

# Check Google Workspace MCP directory
if [ ! -d ~/.mcp/google-workspace-mcp ]; then
  print_error "~/.mcp/google-workspace-mcp directory not found"
  ERRORS=$((ERRORS+1))
else
  print_success "~/.mcp/google-workspace-mcp directory exists"
fi

# Check workspace files directory
if [ ! -d ~/Documents/workspace-mcp-files ]; then
  print_error "~/Documents/workspace-mcp-files directory not found"
  ERRORS=$((ERRORS+1))
else
  print_success "~/Documents/workspace-mcp-files directory exists"
fi

# Check Claude configuration directory
if [ ! -d ~/Library/Application\ Support/Claude ]; then
  print_error "~/Library/Application Support/Claude directory not found"
  ERRORS=$((ERRORS+1))
else
  print_success "~/Library/Application Support/Claude directory exists"
fi

# Check required files
print_message "Checking required files..."

# Check accounts.json
if [ ! -f ~/.mcp/google-workspace-mcp/accounts.json ]; then
  print_error "accounts.json not found"
  ERRORS=$((ERRORS+1))
else
  print_success "accounts.json exists"

  # Validate accounts.json format
  if ! jq -e . ~/.mcp/google-workspace-mcp/accounts.json > /dev/null 2>&1; then
    print_error "accounts.json is not a valid JSON file"
    ERRORS=$((ERRORS+1))
  else
    # Check for 'accounts' array
    if ! jq -e '.accounts' ~/.mcp/google-workspace-mcp/accounts.json > /dev/null 2>&1; then
      print_error "accounts.json is missing 'accounts' array"
      ERRORS=$((ERRORS+1))
    else
      print_success "accounts.json is properly formatted"
    fi
  fi
fi

# Check claude_desktop_config.json
if [ ! -f ~/Library/Application\ Support/Claude/claude_desktop_config.json ]; then
  print_error "claude_desktop_config.json not found"
  ERRORS=$((ERRORS+1))
else
  print_success "claude_desktop_config.json exists"

  # Validate claude_desktop_config.json format
  if ! jq -e . ~/Library/Application\ Support/Claude/claude_desktop_config.json > /dev/null 2>&1; then
    print_error "claude_desktop_config.json is not a valid JSON file"
    ERRORS=$((ERRORS+1))
  else
    # Check for 'mcpServers' object
    if ! jq -e '.mcpServers' ~/Library/Application\ Support/Claude/claude_desktop_config.json > /dev/null 2>&1; then
      print_error "claude_desktop_config.json is missing 'mcpServers' object"
      ERRORS=$((ERRORS+1))
    else
      print_success "claude_desktop_config.json is properly formatted"
    fi

    # Check for Google Workspace MCP configuration
    if ! jq -e '.mcpServers."google-workspace-mcp"' ~/Library/Application\ Support/Claude/claude_desktop_config.json > /dev/null 2>&1; then
      print_error "Google Workspace MCP configuration is missing in claude_desktop_config.json"
      ERRORS=$((ERRORS+1))
    else
      print_success "Google Workspace MCP configuration found in claude_desktop_config.json"
    fi
  fi
fi

# Check Docker installation
print_message "Checking Docker installation..."
if ! command -v docker > /dev/null; then
  print_error "Docker is not installed or not in PATH"
  ERRORS=$((ERRORS+1))
else
  print_success "Docker is installed"

  # Check if docker daemon is running
  if ! docker info > /dev/null 2>&1; then
    print_error "Docker daemon is not running"
    ERRORS=$((ERRORS+1))
  else
    print_success "Docker daemon is running"

    # Check if required Docker image is available
    if ! docker image inspect ghcr.io/aaronsb/google-workspace-mcp:latest > /dev/null 2>&1; then
      print_warning "Docker image 'ghcr.io/aaronsb/google-workspace-mcp:latest' is not available locally"
      print_message "This image will be pulled when needed"
    else
      print_success "Docker image 'ghcr.io/aaronsb/google-workspace-mcp:latest' is available"
    fi
  fi
fi

# Check NPX installation
print_message "Checking NPX installation..."
if ! command -v npx > /dev/null; then
  print_error "NPX is not installed or not in PATH"
  ERRORS=$((ERRORS+1))
else
  print_success "NPX is installed"
fi

# Final verdict
if [ $ERRORS -eq 0 ]; then
  print_success "All validation checks passed! Your Claude Google Workspace configuration appears to be correct."
  print_message "You should be able to use Google Workspace with Claude without issues."
  exit 0
else
  print_error "Validation completed with $ERRORS error(s). Please fix these issues before using Claude with Google Workspace."
  print_message "For help, refer to the documentation at: https://github.com/3rzy/claude-google-workspace-config"
  exit 1
fi
