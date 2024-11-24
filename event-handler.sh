#!/bin/bash

case "$SERF_EVENT" in
  member-join)
    echo "Node joined: $SERF_MEMBER_NAME"
    ;;
  member-leave)
    echo "Node left: $SERF_MEMBER_NAME"
    ;;
  query)
    if [ "$SERF_QUERY_NAME" == "service-status" ]; then
      echo "Service is running on $(hostname)"
    fi
    ;;
  *)
    echo "Received event: $SERF_EVENT"
    echo "Event payload: $SERF_PAYLOAD"
    ;;
esac