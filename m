From: Samuel Sieb <samuel@sieb.net>
Subject: Acer ES1-522 wifi blocked and Fn keys don't work (WMI)
Date: Wed, 18 Jan 2017 12:05:52 -0800
Message-ID: <3743f661-2ef2-1f54-819c-8dc15569f905@sieb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp-out-no.shaw.ca ([64.59.134.12]:33175 "EHLO
        smtp-out-no.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750836AbdARUQU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Jan 2017 15:16:20 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: jlee@suse.com

I have a user with an Acer ES1-522 laptop and the wifi isn't working. 
The driver detects it correctly, but rfkill says it's hard blocked.  The 
wifi toggle key doesn't have any effect.  The touchpad toggle button 
disables the touchpad, but doesn't enable it when pressed again. 
However, suspend/resume resets the touchpad to working again.  The 
acer-wmi module is loaded and an input device is created.  However, none 
of the listed keys actually provide any output.

I blacklisted the acer_wmi module and now the wifi works.  Is there any 
further information I could provide that would help?

02:00.0 Network controller: Qualcomm Atheros QCA9565 / AR9565 Wireless 
Network Adapter (rev 01)
	Subsystem: Lite-On Communications Inc Device 0642
	Flags: bus master, fast devsel, latency 0, IRQ 40
	Memory at f0a00000 (64-bit, non-prefetchable) [size=512K]
	Expansion ROM at f0a80000 [disabled] [size=64K]
	Capabilities: [40] Power Management version 2
	Capabilities: [50] MSI: Enable- Count=1/4 Maskable+ 64bit+
	Capabilities: [70] Express Endpoint, MSI 00
	Capabilities: [100] Advanced Error Reporting
	Capabilities: [140] Virtual Channel
	Capabilities: [160] Device Serial Number 00-00-00-00-00-00-00-00
	Kernel driver in use: ath9k
	Kernel modules: ath9k		

I: Bus=0019 Vendor=0000 Product=0000 Version=0000
N: Name="Acer WMI hotkeys"
P: Phys=wmi/input0
S: Sysfs=/devices/virtual/input/input8
U: Uniq=
H: Handlers=kbd event7 rfkill
B: PROP=0
B: EV=13
B: KEY=1c0000 0 0 0 0 1600800000c00 300000 0 0
B: MSC=10

Possibly related, the accelerometer gives an error when trying to read it.
# evtest /dev/input/event8
evtest: Operation not permitted

I: Bus=0019 Vendor=0000 Product=0000 Version=0000
N: Name="Acer BMA150 accelerometer"
P: Phys=wmi/input1
S: Sysfs=/devices/virtual/input/input9
U: Uniq=
H: Handlers=event8 js0
B: PROP=0
B: EV=9
B: ABS=7
