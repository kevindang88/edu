#!/bin/csh
set valid = 0
while ($valid == 0)
  echo "Are you OK?"
  set reply = $<
  if ($reply == "y" || $reply == "Y") then
    echo "glad to hear it"
    set valid = 1
  else if ($reply == "n" || $reply == "N") then
    echo "sorry that you are not feeling good"
    set valid = 1
  else
    echo "in-correct choice"
  endif
end
