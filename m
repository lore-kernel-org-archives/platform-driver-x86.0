From: Jean-Louis Dupond <jean-louis@dupond.be>
Subject: dell-laptop: bug in rfkill
Date: Sun, 04 Dec 2011 20:20:31 +0100
Message-ID: <4EDBC7FF.9070207@dupond.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from apollo.dupie.be ([94.75.207.143]:52444 "EHLO apollo.dupie.be"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754315Ab1LDTUc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 4 Dec 2011 14:20:32 -0500
Received: from [IPv6:2001:6f8:3d0:0:16fe:b5ff:feba:6034] (unknown [IPv6:2001:6f8:3d0:0:16fe:b5ff:feba:6034])
	by apollo.dupie.be (Postfix) with ESMTPSA id C9F9C14001C7
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 Dec 2011 20:20:31 +0100 (CET)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hello all!

There seems to be a bug in the rfkill handling of dell-laptop.

When you kill dell-bluetooth, it also hard blocks 'Wireless LAN'.
This should NOT be the case and only block your bluetooth.

jean-louis@laptop-jl:~$ sudo rfkill list
0: dell-wifi: Wireless LAN
     Soft blocked: no
     Hard blocked: no
1: dell-bluetooth: Bluetooth
     Soft blocked: no
     Hard blocked: no
2: dell-wwan: Wireless WAN
     Soft blocked: no
     Hard blocked: no
5: hci0: Bluetooth
     Soft blocked: no
     Hard blocked: no
6: phy0: Wireless LAN
     Soft blocked: no
     Hard blocked: no
jean-louis@laptop-jl:~$ sudo rfkill block 1
jean-louis@laptop-jl:~$ sudo rfkill list
0: dell-wifi: Wireless LAN
     Soft blocked: no
     Hard blocked: no
1: dell-bluetooth: Bluetooth
     Soft blocked: yes
     Hard blocked: no
2: dell-wwan: Wireless WAN
     Soft blocked: no
     Hard blocked: no
6: phy0: Wireless LAN
     Soft blocked: no
     Hard blocked: yes

FYI:
root@laptop-jl:/sys/kernel/debug/dell_laptop# cat rfkill
status:    0x1071D
Bit 0 : Hardware switch supported:   1
Bit 1 : Wifi locator supported:      0
Bit 2 : Wifi is supported:           1
Bit 3 : Bluetooth is supported:      1
Bit 4 : WWAN is supported:           1
Bit 5 : Wireless keyboard supported: 0
Bit 8 : Wifi is installed:           1
Bit 9 : Bluetooth is installed:      1
Bit 10: WWAN is installed:           1
Bit 16: Hardware switch is on:       1
Bit 17: Wifi is blocked:             0
Bit 18: Bluetooth is blocked:        0
Bit 19: WWAN is blocked:             0

hwswitch_state:    0x7
Bit 0 : Wifi controlled by switch:      1
Bit 1 : Bluetooth controlled by switch: 1
Bit 2 : WWAN controlled by switch:      1
Bit 7 : Wireless switch config locked:  0
Bit 8 : Wifi locator enabled:           0
Bit 15: Wifi locator setting locked:    0



Jean-Louis Dupond
