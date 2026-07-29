#!/bin/zsh

src() {
    source /Users/arturgudiev/.zshrc
}

# openProjectAndFile <projectOrWorkspace> [filename-substring] [extraSearchRoot...]
# Opens Cursor on the project/workspace. If a substring is given, finds a matching
# file under the project dir (or extra search roots / workspace folders) and opens it too.
openProjectAndFile() {
    local projectPath=$1
    local namePart=$2
    shift 2 2>/dev/null
    local -a searchRoots=("$@")

    if [[ -z "$projectPath" ]]; then
        echo "Usage: openProjectAndFile <projectOrWorkspace> [filename-substring] [searchRoot...]" >&2
        return 1
    fi

    if [[ -z "$namePart" ]]; then
        cursor "$projectPath"
        return
    fi

    if (( ${#searchRoots} == 0 )); then
        if [[ -d "$projectPath" ]]; then
            searchRoots=("$projectPath")
        elif [[ "$projectPath" == *.code-workspace && -f "$projectPath" ]]; then
            local wsDir=${projectPath:h}
            local raw
            while IFS= read -r raw; do
                [[ -z "$raw" ]] && continue
                # Resolve relative paths against the workspace file directory
                if [[ "$raw" != /* ]]; then
                    raw="$wsDir/$raw"
                fi
                # Fix odd leading double-slash paths from some workspace files
                [[ "$raw" == //* ]] && raw="/${raw#//}"
                [[ -d "$raw" ]] && searchRoots+=("${raw:A}")
            done < <(grep -oE '"path"[[:space:]]*:[[:space:]]*"[^"]+"' "$projectPath" \
                | sed -E 's/.*"path"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')
        fi
    fi

    if (( ${#searchRoots} == 0 )); then
        echo "No searchable project folders for: $projectPath" >&2
        return 1
    fi

    local filePath
    filePath=$(find "${searchRoots[@]}" -type f -iname "*${namePart}*" 2>/dev/null | head -n 1)

    if [[ -z "$filePath" ]]; then
        echo "No file matching '*${namePart}*' under ${searchRoots[*]}" >&2
        return 1
    fi

    cursor "$projectPath" "$filePath"
}
