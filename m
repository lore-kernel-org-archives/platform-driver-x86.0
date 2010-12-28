From: Ville-Pekka Vainio <vpivaini@cs.helsinki.fi>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Tue, 28 Dec 2010 19:28:53 +0200
Message-ID: <1293557333.1887.5.camel@lenovo-s12>
References: <4D1A9EBD02000023000261D7@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:38139 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753447Ab0L1R24 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Dec 2010 12:28:56 -0500
In-Reply-To: <4D1A9EBD02000023000261D7@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: platform-driver-x86@vger.kernel.org

I decided to upload the files to the web instead of attaching them to
the email since they are quite large.

ti, 2010-12-28 kello 08:36 -0700, Joey Lee kirjoitti:
> It's not make sense acer-wmi probe on Ideapad S12 netbook, could you
> please help to attached the following information?
> 
> - modinfo acer-wmi > acer-wmi.log

http://vpv.kapsi.fi/ideapad-s12/modinfo-acer-wmi.txt

> - dmesg > dmesg.log

http://vpv.kapsi.fi/ideapad-s12/dmesg-acer-wmi.txt

> - dmidecode > dmidecode.log

http://vpv.kapsi.fi/ideapad-s12/dmidecode-acer-wmi.txt

> - acpidump > acpidump.dat

http://vpv.kapsi.fi/ideapad-s12/acpidump.dat

The dmesg may not reveal much, but if I blacklist acer-wmi for booting
and then load it later manually, this is what appears
in /var/log/messages:

kernel: [ 4795.867540] acer-wmi: Acer Laptop ACPI-WMI Extras
NetworkManager[914]: <info> found WiFi radio killswitch rfkill7 (at /sys/devices/platform/acer-wmi/rfkill/rfkill7) (driver acer-wmi)
NetworkManager[914]: <info> WiFi now disabled by radio killswitch

Then, if I unload acer-wmi:

kernel: [ 4852.875590] acer-wmi: Acer Laptop WMI Extras unloaded
NetworkManager[914]: <info> radio
killswitch /sys/devices/platform/acer-wmi/rfkill/rfkill7 disappeared
NetworkManager[914]: <info> WiFi now enabled by radio killswitch
NetworkManager[914]: <info> (wlan0): bringing up device.
kernel: [ 4852.905625] wmi: Mapper unloaded

-- 
Ville-Pekka Vainio
