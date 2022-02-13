#!/usr/bin/with-contenv bashio
# ==============================================================================
# Configures InspIRCd
# ==============================================================================

# shellcheck shell=bash

# Test, move to Dockerfile
chown -R inspircd: /etc

bashio::log.info "Testing 123."