# meant to be sourced by anything that watches for an event to complete

# track completion of an volume-related event
watch-volumes-while() {
  # wait for completion of an event
  condition=$1
  shift
  volumes="$*"

  while true; do
    ec2-describe-volumes $volumes | tee /dev/stderr |
      grep -q $condition || break
    sleep 30
  done
}

# track completion of an instance-related event
watch-instances-while() {
  # wait for completion of an event
  condition=$1
  shift
  instances="$*"

  while true; do
    ec2-describe-instances $instances | tee /dev/stderr |
      grep -q $condition || break
    sleep 30
  done
}


# track completion of a snapshot-related event
watch-snapshots-while() {
  condition=$1
  shift
  snapshots="$*"

  while true; do
    ec2-describe-snapshots $snapshots | tee /dev/stderr |
      grep -q $condition || break
    sleep 30
  done
}

