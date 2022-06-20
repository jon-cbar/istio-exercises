while getopts "n:a:p:" opt
do
  case "$opt" in
    n ) namespace="$OPTARG" ;;
    a ) app="$OPTARG" ;;
    p ) port="$OPTARG" ;;
    ? ) helpfunction ;;
  esac
done

helpFunction()
{
  echo ""
  echo "Usage, $0 -n namespace -a application -p port"
  exit 1
}

if [ -z "$namespace" ] || [ -z "$app" ] || [ -z "$port" ]
  then
    echo "Some or all of the parameters are empty";
    helpFunction
fi

kubectl exec -n "$namespace" "$(kubectl get pod -n "$namespace" -l app="$app" -o jsonpath={.items..metadata.name})" -c istio-proxy -- sudo tcpdump dst port "$port" -A
