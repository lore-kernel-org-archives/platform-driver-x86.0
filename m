From: Mattia Dongili <malattia@linux.it>
Subject: Re: Sony Vaio Duo 11: getting middle mouse button to work
Date: Sat, 25 Jan 2014 12:17:13 +0900
Message-ID: <20140125031713.GA30047@taihen.jp>
References: <1674012.xCMptsh8XR@myon.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:55202 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751416AbaAYD0W (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jan 2014 22:26:22 -0500
Content-Disposition: inline
In-Reply-To: <1674012.xCMptsh8XR@myon.chronox.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stephan Mueller <smueller@chronox.de>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Jan 23, 2014 at 05:21:10PM +0100, Stephan Mueller wrote:
...
> Bus 001 Device 005: ID 26e1:c1a0

Ciao!

...
> - playing around with debug modes of the sony_laptop does not indicate that it 
> records any events for special keys

I have never seen a vaio where touchpad buttons where dependent on the
devices controlled with sony-laptop.ko.

...
> As I am out of ideas. Does anybody have an idea on how to identify where the 
> problem is? Would I need to send some "enabling" events to the mouse before it 
> activates the middle mouse button? Or is there anything in Linux that could 
> help me debug the situation?

I'd try with the input subsystem and the synaptics_usb driver first but
it's just a wild guess. Your kernel log should give you more hints about
which driver is bound to the device and the sysfs tree under
/sys/class/input/event*/device/* has all the capabilities and
identifiers.

Hope this helps.
-- 
mattia
:wq!

PS: Could you send me your laptop's DSDT off-list?
