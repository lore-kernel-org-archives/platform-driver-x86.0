From: =?UTF-8?B?UmljaGFyZCBTY2jDvHR6?= <r.schtz@t-online.de>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Sun, 13 Mar 2011 11:55:36 +0100
Message-ID: <4D7CA2A8.4010700@t-online.de>
References: <20110310171940.GA24972@kroah.com> <4D790A20.3050105@gmail.com> <20110310180959.GA26927@kroah.com> <4D793D05.3070908@gmail.com> <20110310211519.GA11862@kroah.com> <4D79CB47.2030405@gmail.com> <20110311170313.GA10202@kroah.com> <4D7A72E3.1050407@gmail.com> <20110311193433.GB14204@kroah.com> <4D7A8419.6080107@gmail.com> <20110311203032.GA14384@kroah.com> <4D7C9668.3000902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout04.t-online.de ([194.25.134.18]:56346 "EHLO
	mailout04.t-online.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752381Ab1CMKzj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 13 Mar 2011 06:55:39 -0400
In-Reply-To: <4D7C9668.3000902@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Greg KH <greg@kroah.com>, Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

> Every time I execute this in the /sys/class/backlight/samsung directo=
ry:
> sudo bash -c 'echo 1 > brightness'
> brightness is reduced a little until it reaches the minimum.
>
> After that, every time I execute this:
> sudo bash -c 'echo 8 > brightness'
> it increases a little until it reaches the maximum.
>
> And each time a message appears in dmesg: "ACPI: Failed to switch the
> brightness", until the brightness stops changing.
>
> At the same time, the little Gnome brightness adjustment window appea=
rs,
> showing the percentage of the brightness, which drops/raises to
> minimum/maximum in only four executions of these commands. After that=
,
> while
> brightness drops/raises with each execution, the percentage stays at
> minimum/maximum.
>
> Is this all normal?

That sounds like the driver is interfering with the ACPI video driver.=20
Add "acpi_backlight=3Dvendor" to your kernel boot parameters and try ag=
ain.

--=20
Regards,
Richard Sch=C3=BCtz
