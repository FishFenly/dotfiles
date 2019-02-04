#!/usr/bin/env python3

import gi
gi.require_version('Notify', '0.7')

from gi.repository import Notify

def notifyMe(bat_status, bat_lvl, tofull):
    """ Initialise a new notification and send the message """
    Notify.init("Acpi Notification")
    
    Notify.Notification.new(
        "Battery Low",
	"{} {}%".format(bat_status, bat_lvl)
    ).show()

# Current battery level and charging vs discharging
with open("/sys/class/power_supply/BAT0/capacity", "r") as l:
    lvl = l.read()
with open("/sys/class/power_supply/BAT0/status", "r") as s:
    status = s.read()

# Calculate time to full charge
with open("/sys/class/power_supply/BAT0/charge_full", "r") as f:
    full = f.read()
with open("/sys/class/power_supply/BAT0/charge_now", "r") as n:
    now = n.read()

tofull = (int(full) - int(now)) / int(now)

if int(lvl) <= 10:
    notifyMe(status, lvl, tofull)
