# This needs to get pointed at and sourced

PATH+=:$(dirname $(readlink -f $0))

source gripe.sh

export EC2_HOME=<path_to_tools>
export AWS_ELB_HOME=<path_to_tools>
export AWS_CLOUDWATCH_HOME=<path_to_tools>
export AWS_AUTO_SCALING_HOME=<path_to_tools>
export EC2_PRIVATE_KEY=<path_to_private_key.pem>
export EC2_CERT=<path_to_certificate.pem>
export AWS_CREDENTIAL_FILE=<path_to_credentials.txt>
for i in EC2 AWS_ELB AWS_CLOUDWATCH AWS_AUTO_SCALING; do
  B=${i}_HOME/bin
  if [ -d ${!B} ]; then
    PATH+=:${!B}
  else
    die "${!B} does not exist"
  fi
done
export JAVA_HOME=<path_to_java>
