#!/bin/bash
# Usage:
# Copy the script in /etc/init.d and make it executable
# Start all VMs with /etc/init.d/kvm-servers start
# Stop all VMs with /etc/init.d/kvm-servers stop

ARG=$1
case $ARG in
        start)
                for I in `virsh list --all | grep "shut off" |awk '{print $2}'`; do virsh start $I; done
                echo "All VMs have been started."
                ;;
        stop)
                for I in `virsh list | grep "running" |awk '{print $2}'`; do virsh shutdown $I; done
                echo "All VMs have been stopped."
                ;;

        *)
                echo "Invalid option (try start|stop)"
                ;;
esac
exit 0

