# .p10k.zsh
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  # Display user@host only in SSH sessions.
  ssh
  # Display the current time.
  time
  # Display the directory with a shortened path.
  dir
  # Display git status.
  vcs
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  # Display a success/failure icon based on last command's status.
  status
)

# Configure the time format.
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'

# Use nerdfont icons for the directory.
typeset -g POWERLEVEL9K_DIR_PATH_SEPARATOR=$'\uE0B1'
typeset -g POWERLEVEL9K_DIR_ETC_ICON=$'\uF423'

# Configure the look of success/failure icon.
typeset -g POWERLEVEL9K_STATUS_OK=true
typeset -g POWERLEVEL9K_STATUS_OK_ICON=$'\uF058'
typeset -g POWERLEVEL9K_STATUS_ERROR_ICON=$'\uF06A'

# Configure the look for git.
typeset -g POWERLEVEL9K_VCS_CLEAN_ICON=$'\uF00C'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uF935'
typeset -g POWERLEVEL9K_VCS_MODIFIED_ICON=$'\uF9DB'

# Colors.
typeset -g POWERLEVEL9K_TIME_FOREGROUND=246
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=76
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=220
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=208
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=70
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=160

# Shorten the directory path.
typeset -g POWERLEVEL9K_DIR_SHORTEN_STRATEGY=none
# Show the full directory path
typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=true

