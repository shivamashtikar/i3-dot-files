#! /usr/bin/env bash
PROJECTS_DIR=$HOME/Documents

# Save find result to F_ARRAY
readarray -t F_ARRAY <<<"$(find "$PROJECTS_DIR" -type f -regex ".*.shell.nix" | grep shell.nix | sed 's/shell.nix//g')"

# Associative array for storing projects
# key => project name
# value => absolute path to the file
# PROJECTS['filename']='path'
declare -A PROJECTS

# Add elements to PROJECTS array
get_projects() {

  # if [ ${#F_ARRAY[@]} != 0 ]; then
  if [[ ! -z ${F_ARRAY[@]} ]]; then
    for i in "${!F_ARRAY[@]}"; do
      path=${F_ARRAY[$i]}
      file=$(basename "${F_ARRAY[$i]}")
      PROJECTS+=(["$file"]="$path")
    done
  else
    echo "$PROJECTS_DIR is empty!"
    echo "Please put some projects in it."
    echo "Only .pdf files are accepted."
    exit
  fi

}

# List for rofi
gen_list() {
  for i in "${!PROJECTS[@]}"; do
    echo "$i"
  done
}

main() {
  get_projects
  project=$( (gen_list) | rofi -dmenu -i -matching fuzzy -no-custom -p "Nix-Projects λ")

  if [ -n "$project" ]; then
    DIR=${PROJECTS[$project]}
    terminator -e "i3-msg \"floating toggle,resize shrink left 350,resize shrink down 300, move right 600, move down 550\" ; zsh" --working-directory=$DIR
    code $DIR

  fi
}

main
