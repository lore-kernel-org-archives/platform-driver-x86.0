From: Stephan Mueller <smueller@chronox.de>
Subject: Re: Sony Vaio Duo 11: getting middle mouse button to work
Date: Sat, 25 Jan 2014 05:51:58 +0100
Message-ID: <2093581.PZC0zrVCWg@myon.chronox.de>
References: <1674012.xCMptsh8XR@myon.chronox.de> <20140125031713.GA30047@taihen.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.eperm.de ([89.247.134.16]:38331 "EHLO mail.eperm.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751146AbaAYEwK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jan 2014 23:52:10 -0500
Received: from myon.chronox.de
	by mail.eperm.de with [XMail 1.27 ESMTP Server]
	id <S3E5> for <platform-driver-x86@vger.kernel.org> from <smueller@chronox.de>;
	Sat, 25 Jan 2014 05:52:05 +0100
In-Reply-To: <20140125031713.GA30047@taihen.jp>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org

Am Samstag, 25. Januar 2014, 12:17:13 schrieb Mattia Dongili:

Hi Mattia,

> 
> I'd try with the input subsystem and the synaptics_usb driver first but
> it's just a wild guess. Your kernel log should give you more hints about
> which driver is bound to the device and the sysfs tree under
> /sys/class/input/event*/device/* has all the capabilities and
> identifiers.

The following did not help:

modprobe synaptics_usb
cd /sys/bus/usb/drivers/usbhid
echo -n "1-1.3:1.0" > unbind
#now the mouse is without driver, does not move, and
#/sys/class/input/event2/device/device is without driver
cd /sys/bus/usb/drivers/synaptics_usb
echo -n "1-1.3:1.0" > bind
#error: no such device, mouse does not work, nothing in dmesg
cd /sys/bus/usb/drivers/usbhid
echo -n "1-1.3:1.0" > bind
#mouse works again without middle button

Ciao
Stephan
-- 
| Cui bono? |
