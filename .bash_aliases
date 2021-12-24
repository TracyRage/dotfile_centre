# General alias
alias upgrade="sudo apt upgrade && sudo apt autoremove"
alias install="sudo apt install"
alias sd="shutdown now"

# Tree
alias tree_dir="tree -dL 2"
alias tree="tree -L 2"

# tmux
alias tmux_n="tmux new -s"
alias tmux_a="tmux attach -t"

# Conda alias
alias conda_on="conda activate"
alias conda_off="conda deactivate"
alias conda_env="conda env list"
alias conda_list="conda list"

# Protonvpn alias
alias proton_on="sudo protonvpn c -f"
alias proton_re="sudo protonvpn r"
alias proton_p2p="sudo protonvpn c --p2p"
alias proton_sc="sudo protonvpn c --sc"
alias proton_st="sudo protonvpn s"
alias proton_off="sudo protonvpn d"

# yadm alias
alias yadm_push="yadm push -u origin main"
