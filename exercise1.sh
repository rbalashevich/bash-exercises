#!/usr/bin/env bash

script_args=("$@")

name="${script_args[0]}"
count="${script_args[1]}"
args=("${script_args[@]:2}") # https://stackoverflow.com/a/1336245

echo "Number of arguments: $#"
echo "Filename: ${name}"
echo "Count: ${count}"
echo "Additional arguments: ${args[@]}"

ArrayStatus=("normal" "request" "failure" "error" "warning" "alert" "notice" "note")

log_folder="${HOME}/mylogs"
log_file="${name}.log"
log_path="${log_folder}/${log_file}"

mkdir -p "${log_folder}"
if [ -f "${log_path}" ]
then
  rm "${log_path}"
  echo "Old file ${log_path} removed."
fi
touch "${log_path}"

for i in "${args[@]}"; do
  echo "🔬 Dumping argument, it is \"$i\" now. Checking is it a numeric or not"
  if [[ "$i" ]] && [[ -z "${i//[0-9]}" ]]; then # https://stackoverflow.com/a/61835747
    echo "🔢 Error: one of additional parameters is numeric and not a string! Exiting." >&2
    exit 1
  fi
done

args_multiplier=${args[@]}
for ((i=1; i<${count}; i++)); do
  args+=(${args_multiplier[@]})
done

for i in "${args[@]}"; do
  echo "$i: ${ArrayStatus[RANDOM%7]}" >> "${log_path}"
done
