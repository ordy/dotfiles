source $__fish_config_dir/environment.fish
source $__fish_config_dir/alias.fish
set -U fish_key_bindings fish_default_key_bindings

set -g tide_left_prompt_prefix '󰧱 '
set -g tide_character_icon '󰧱'
set -g tide_left_prompt_items pwd git newline character

fish_add_path ~/.spicetify
fish_config theme choose "Rosé Pine"
