From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Sun, 13 Mar 2011 15:02:00 +0200
Message-ID: <4D7CC048.805@gmail.com>
References: <20110310171940.GA24972@kroah.com> <4D790A20.3050105@gmail.com> <20110310180959.GA26927@kroah.com> <4D793D05.3070908@gmail.com> <20110310211519.GA11862@kroah.com> <4D79CB47.2030405@gmail.com> <20110311170313.GA10202@kroah.com> <4D7A72E3.1050407@gmail.com> <20110311193433.GB14204@kroah.com> <4D7A8419.6080107@gmail.com> <20110311203032.GA14384@kroah.com> <4D7C9668.3000902@gmail.com> <4D7CA2A8.4010700@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:57758 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752948Ab1CMNCE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 13 Mar 2011 09:02:04 -0400
In-Reply-To: <4D7CA2A8.4010700@t-online.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?UmljaGFyZCBTY2jDvHR6?= <r.schtz@t-online.de>
Cc: Greg KH <greg@kroah.com>, Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On 03/13/2011 12:55 PM, Richard Sch=C3=BCtz wrote:
> That sounds like the driver is interfering with the ACPI video driver=
=2E
> Add "acpi_backlight=3Dvendor" to your kernel boot parameters and try =
again.
Thank you, this helped :)

Greg, is it OK that both 0 and 1 backlight values have the same effect =
on
brightness?

Thanks.

Sincerely,
Nick
