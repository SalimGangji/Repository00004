### subscription manager disable ###
sleep 30
subscription_manager_file=/etc/yum/pluginconf.d/subscription-manager.conf
if [ -f $subscription_manager_file ]
  then
    sudo sed --in-place=".bak" --regexp-extended --expression="s:enabled=1:enabled=0:gI" $subscription_manager_file
fi
