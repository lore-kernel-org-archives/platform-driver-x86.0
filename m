From: Jan Ceuleers <jan.ceuleers@computer.org>
Subject: Re: ethernet-related thermal emergency on Thinkpad x60
Date: Wed, 04 Jul 2012 17:03:00 +0200
Message-ID: <4FF45B24.20804@computer.org>
References: <20120704141756.GA2089@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailrelay007.isp.belgacom.be ([195.238.6.173]:35843 "EHLO
	mailrelay007.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752849Ab2GDPGU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Jul 2012 11:06:20 -0400
In-Reply-To: <20120704141756.GA2089@elf.ucw.cz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

On 07/04/2012 04:17 PM, Pavel Machek wrote:
> Hi!
> 
> When using nework interface (eth0), machine starts to behave
> weird. Like... complete freeze, then poweroff, then it hangs on boot
> (initializing ACPI) until I let it to cool down... and I'm not even
> using gigabit speed.

Hi Pavel.

Please could you clarify why you believe that this is related to
Ethernet? I.e. does the problem not happen when you're not using
Ethernet (but rather wifi or no networking at all)?

Does the problem start to happen when you plug in the Ethernet cable,
having previously booted the machine without being connected to the network?

Where does the CPU spend its time when the problem occurs?

Basic question: does your CPU fan work? Nothing is obstructing the
airflow (e.g. dust)? If you're using fancontrol in order to regulate the
fan speed, it is set up properly to prevent overheating?

HTH, Jan
