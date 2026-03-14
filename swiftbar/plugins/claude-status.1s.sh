#!/bin/bash
# claude-status.1s.sh - Aggregate Claude Code session statuses

STATUS_DIR="/tmp/claude-code-sessions"
NOW=$(date +%s)
STALE_SECONDS=7200

thinking=0
waiting=0
paused=0
total=0
sessions=()

if [ -d "$STATUS_DIR" ]; then
    for f in "$STATUS_DIR"/*; do
        [ -f "$f" ] || continue
        mtime=$(stat -f %m "$f")
        if (( NOW - mtime > STALE_SECONDS )); then
            rm -f "$f"
            continue
        fi
        total=$((total + 1))
        eval "$(/usr/bin/jq -r '@sh "status=\(.status // "") cwd=\(.cwd // "") branch=\(.branch // "")"' "$f" 2>/dev/null)"
        case "$status" in
            thinking) thinking=$((thinking + 1)) ;;
            paused)   paused=$((paused + 1)) ;;
            waiting)  waiting=$((waiting + 1)) ;;
        esac
        sessions+=("$status|$cwd|$branch")
    done
fi

if [ "$total" -eq 0 ]; then
    echo "💤"
elif [ "$paused" -gt 0 ]; then
    [ "$total" -eq 1 ] && echo "⚠️" || echo "⚠️${paused}/${total}"
elif [ "$thinking" -gt 0 ]; then
    [ "$total" -eq 1 ] && echo "🤔" || echo "🤔 ${thinking}/${total}"
elif [ "$waiting" -gt 0 ]; then
    [ "$total" -eq 1 ] && echo "🟢" || echo "🟢 ${total}"
else
    echo "❓"
fi

echo "---"
if [ "$total" -eq 0 ]; then
    echo "No active sessions"
else
    for session in "${sessions[@]}"; do
        IFS='|' read -r status cwd branch <<< "$session"
        case "$status" in
            thinking) icon="🤔" ;;
            paused)   icon="⚠️" ;;
            waiting)  icon="🟢" ;;
            *)        icon="❓" ;;
        esac
        dir_name="${cwd##*/}"
        label="${icon} ${dir_name}"
        [ -n "$branch" ] && label="${label} (${branch})"
        echo "${label} | bash=/usr/bin/open param1=-a param2=Ghostty terminal=false"
    done
fi
