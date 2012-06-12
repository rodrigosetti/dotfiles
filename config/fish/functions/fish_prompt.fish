function fish_prompt -d "Write out the prompt"
    printf '%s%s%s@%s%s%s%s%s $ ' (set_color blue --bold) (whoami) (set_color cyan --bold) (set_color purple --bold) (hostname|cut -d . -f 1) (set_color green --bold) (prompt_pwd) (set_color normal)
end

