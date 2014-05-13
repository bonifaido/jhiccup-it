DEF_COLOR="\x1b[0m"
CYAN="\x1b[36;01m"

log() {
    echo -e "${CYAN}[$$] @ $(date +%T) >>$DEF_COLOR $@"
}
