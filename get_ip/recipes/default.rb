#
# Cookbook Name:: get_ip
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


#require "ohai"

#require_plugin "hostname"
#require_plugin "#{os}::network"

network = node["network"]

node.default["eth0"] = "eth0"
node.default["eth1"] = "eth1"
network['interfaces'].each do |iface, addrs|

  addrs['addresses'].each do |ip, params|
   if (iface == (node["eth0"]) or iface == node["eth1"])
    node.default["ipaddress_#{iface}"] = ip if params['family'].eql?('inet')
    node.default["ipaddress6_#{iface}"] = ip if params['family'].eql?('inet6')
    node.default["macaddress_#{iface}"] = ip if params['family'].eql?('lladdr')
   if (params['family'].eql?('inet'))
     puts "ip ",node["ipaddress_eth0"],node["ipaddress_eth1"]
   end
   end
  end

     puts "ip ",node["ipaddress_eth0"]
end

     puts "ip in terms ",node["ipaddress_eth0"],node["ipaddress_eth1"]
#network
