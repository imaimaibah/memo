setsid tail -f /var/log/containers/envoy-jvbpm_projectcontour_envoy-b064fc3cff903b9e586ee28e67467af99947b568bb81f646077582cee75f45ef.log
P=$!
echo $P
ps auxf |grep $P
sleep 3
kill $P
