#!/bin/sh
#
# Starts a local fast-synced geth node.

DEFAULT_NETWORK=mainnet

if [ "$NETWORK" = "" ]; then
	NETWORK=$DEFAULT_NETWORK
fi


if [ "$START_GETH" != "" ]; then
	if [ "$NETWORK" != "$DEFAULT_NETWORK" ]; then
		exec geth --goerli --http --http.addr "0.0.0.0" --http.vhosts=* --http.api "eth,net" --ipcdisable --authrpc.jwtsecret /root/jwttoken
	else
		exec geth --syncmode snap --http --http.addr "0.0.0.0" --http.vhosts=* --http.api "eth,net" --ipcdisable --authrpc.jwtsecret /root/jwttoken
	fi
fi
