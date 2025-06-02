function jwt
  read v
  echo $v | jq -R 'split(".") | .[0] | @base64d | fromjson'
  echo $v | jq -R 'split(".") | .[1] | @base64d | fromjson'
end

