#!/bin/bash
# claude-status.1s.sh - Aggregate Claude Code session statuses

STATUS_DIR="/tmp/claude-code-sessions"
NOW=$(date +%s)
STALE_SECONDS=7200  # 2 hours

# Cleanup stale files and count sessions
thinking=0
waiting=0
paused=0
total=0

if [ -d "$STATUS_DIR" ]; then
    for f in "$STATUS_DIR"/*; do
        [ -f "$f" ] || continue
        mtime=$(stat -f %m "$f")
        if (( NOW - mtime > STALE_SECONDS )); then
            rm -f "$f"
            continue
        fi
        total=$((total + 1))
        status=$(/usr/bin/jq -r '.status // empty' "$f" 2>/dev/null)
        if [ "$status" = "thinking" ]; then
            thinking=$((thinking + 1))
        elif [ "$status" = "paused" ]; then
            paused=$((paused + 1))
        elif [ "$status" = "waiting" ]; then
            waiting=$((waiting + 1))
        fi
    done
fi

# Display
if [ "$total" -eq 0 ]; then
    echo "💤"
elif [ "$paused" -gt 0 ]; then
    if [ "$total" -eq 1 ]; then
        echo "⚠️"
    else
        echo "⚠️${paused}/${total}"
    fi
elif [ "$thinking" -gt 0 ]; then
    if [ "$total" -eq 1 ]; then
        echo "🤔"
    else
        echo "🤔 ${thinking}/${total}"
    fi
elif [ "$waiting" -gt 0 ]; then
    if [ "$total" -eq 1 ]; then
        echo "🟢"
    else
        echo "🟢 ${total}"
    fi
else
    echo "❓"
fi

# Dropdown menu
echo "---"
if [ "$total" -eq 0 ]; then
    echo "No active sessions"
else
    for f in "$STATUS_DIR"/*; do
        [ -f "$f" ] || continue
        session_id=$(basename "$f")
        status=$(/usr/bin/jq -r '.status // empty' "$f" 2>/dev/null)
        cwd=$(/usr/bin/jq -r '.cwd // empty' "$f" 2>/dev/null)
        iterm_session=$(/usr/bin/jq -r '.iterm_session_id // empty' "$f" 2>/dev/null)
        branch=$(/usr/bin/jq -r '.branch // empty' "$f" 2>/dev/null)
        case "$status" in
            thinking) icon="🤔" ;;
            paused)   icon="⚠️" ;;
            waiting)  icon="🟢" ;;
            *)        icon="❓" ;;
        esac
        dir_name="${cwd##*/}"
        label="${icon} ${dir_name}"
        [ -n "$branch" ] && label="${label} (${branch})"
        if [ -n "$iterm_session" ]; then
            iterm_session_short=${iterm_session##*:}
            echo "${label} | bash=$(dirname "$0")/../bin/iterm-activate-session param1=${iterm_session_short} terminal=false"
        else
            echo "${label}"
        fi
    done
fi
