# This setting is necessary to disable the routing rule that is otherwise injected into the image
# Routing rule prevents cloud-init from contacting meta data service on quantum
# See: https://bugzilla.redhat.com/show_bug.cgi?id=983611
echo "NOZEROCONF=yes" >> /etc/sysconfig/network
