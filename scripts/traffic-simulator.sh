while getopts "o:d:" opt
do
  case "$opt" in
    o ) origin="$OPTARG" ;;
    d ) destination="$OPTARG" ;;
    ? ) helpfunction ;;
  esac
done

helpFunction()
{
  echo ""
  echo "Usage, $0 -o origin -d destination"
  echo "Examples: permissive, strict and nosidecar"
  exit 1
}

if [ -z "$origin" ] || [ -z "$destination" ]
  then
    echo "Some or all of the parameters are empty";
    helpFunction
fi

clientApp="python-client"
serverApp="java-server"
serverPort="8080"

kubectl exec "$(kubectl get pod -l app=${clientApp} -n ${origin} -o jsonpath={.items..metadata.name})" -c ${clientApp} -n ${origin} -- curl http://${serverApp}.${destination}:${serverApp} -s -o /dev/null -w "${clientApp}.${origin} to ${serverApp}.${destination}: %{http_code}\n"
