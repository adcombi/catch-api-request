require 'trollop'
require 'active_support/core_ext/object/blank'

opts = Trollop::options do
  version "notifier 0.1.0 (c) 2015 Egbert Pot"
  banner <<-EOS
Test is an awesome program that does something very, very important.

Usage:
       notifier [options]
where [options] are:
EOS

  opt :k8s_uri, "URI to Kubernetes master API endpoint",
        :type => String
  opt :k8s_username, "Kubernetes username",
        :type => String
  opt :k8s_password, "Kubernetes password", 
        :type => String
  opt :docker_registry, "URI to (private) docker registry", :default => "http://registry.adcombi.com:5000",
        :type => String
end
Trollop::die :k8s_uri, "URI to Kubernetes API endpoint" if opts[:k8s_uri].blank?
Trollop::die :k8s_username, "Kubernetes username can't be blank" if opts[:k8s_username].blank?
Trollop::die :k8s_password, "Kubernetes password can't be blank" if opts[:k8s_password].blank?
Trollop::die :docker_registry, "URI to (private) docker registry can't be blank" if opts[:docker_registry].blank?

p opts

p ENV