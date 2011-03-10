From: =?UTF-8?B?T3phbiDDh2HEn2xheWFu?= <ozan@pardus.org.tr>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Thu, 10 Mar 2011 09:52:26 +0200
Message-ID: <4D78833A.5040008@pardus.org.tr>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com> <20110103204910.GA4223@srcf.ucam.org> <4D6EA053020000230002943D@novprvlin0050.provo.novell.com> <201103022109.51600.carlos@strangeworlds.co.uk> <4D6FDCA0020000230002951C@novprvlin0050.provo.novell.com> <4D786E67.5050100@pardus.org.tr> <4D790C240200002300029A17@novprvlin0050.provo.novell.com> <4D787685.80009@pardus.org.tr> <4D791C2E0200002300029A36@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lider.pardus.org.tr ([193.140.100.216]:53021 "EHLO
	lider.pardus.org.tr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159Ab1CJHz2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Mar 2011 02:55:28 -0500
In-Reply-To: <4D791C2E0200002300029A36@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: ike.pan@canonical.com, vpivaini@cs.helsinki.fi, dwmw2@infradead.org, mjg59@srcf.ucam.org, carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

10-03-2011 09:45 tarihinde, Joey Lee yazd=C4=B1:
> OK, there have no VPC2004 and VPCW, VPCR method in your DSDT, that me=
ans
> ideapad-laptop doesn't support 3000 V200 and b560.
>
> If we are lucky, we can find out which EC register mapping to wifi ke=
y's
> status.
>
> If you want...
> Could you please help to try Carlos's acer_ec.pl tool?
>
> http://code.google.com/p/aceracpi/wiki/EmbeddedController
>
> Download the acer_ec.pl file then put to your Lenovo machine.
> Run:
> 	watch -n 1 perl acer_ec.pl regs
>
> Start to press wifi Fn key on Lenovo machines' keyboard, then monitor
> the result from acer_ec. Please press wifi Fn key a couple of times,
> fine out which register changed when you press Fn key.
>
> Please send out the register number and value when wifi on/off.
> e.g.

OK will tell the users to try this if they can. BTW, note that I didn't=
=20
send the dsdt of b560, it may contain
the ACPI device that you wanted to know.

Also, the user didn't complain about a non-functional Wifi Fn key. If=20
everything works OK for him, should we bother about anything at all?

Thanks
