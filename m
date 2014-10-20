From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: asus-nb-wmi: wifi & brightness keys does not work on asus x200la
 laptop
Date: Mon, 20 Oct 2014 20:21:16 +0400
Message-ID: <5445367C.4050305@msgid.tls.msk.ru>
References: <542BD424.8010202@msgid.tls.msk.ru>	<5443BA36.2010304@msgid.tls.msk.ru> <CAHR064iiO3+i+KO2Yw6PEw183BN6yywSoAi6_Fx7mPErveg6fA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from isrv.corpit.ru ([86.62.121.231]:52078 "EHLO isrv.corpit.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750993AbaJTQVS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Oct 2014 12:21:18 -0400
In-Reply-To: <CAHR064iiO3+i+KO2Yw6PEw183BN6yywSoAi6_Fx7mPErveg6fA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>

On 10/20/2014 08:01 PM, Corentin Chary wrote:
> On Sun, Oct 19, 2014 at 2:18 PM, Michael Tokarev <mjt@tls.msk.ru <mailto:mjt@tls.msk.ru>> wrote:
>     On 10/01/2014 02:15 PM, Michael Tokarev wrote:
>     > Hello.
>     >
>     > It looks like asus-nb-wmi (or asus-wmi) does not handle some
>     > (acpi?) keys on some recent asus laptops.  In particular, on
>     > my x200la laptop, the mentioned keys does absolutely nothing
>     > (neither showkeys nor xev shows them).  Also, wifi led is
>     > always off.
>     >
>     > Reportedly the same prob exists on another (but similar) series,
>     > x200ma (which is basically the same but is built on celeron/atom
>     > processor).
>     >
>     > How can I help in debugging/implementing this support?
> 
>     Anyone know this stuff, maybe some hints about where to start?
>     I wrote this email almost 3 weeks ago, and so far there was no
>     single reply...  Does anyone actually maintain this module?
[]
> Well, I guess if you don't see anything in the output of asus-nb-wmi, the keys are unlikely to be handled by this module.
> I don't really have the time to look at your DSDT, but I guess you can start with:
> - http://lwn.net/Articles/391230/
> - http://lwn.net/Articles/367630/
> 
> Reading the DSDT you may understand what is happening to your brighntess  events.

Thank you for the warm words, Corentin ;)

This prompted me to pefrorm some research, and I also found this (which is quite old
already and I should have seen it before but apparently I didn't):

  http://forums.linuxmint.com/viewtopic.php?f=49&t=171563&start=20#p883644

(this is a similar model but with different cpu).  Their solution was to boot
with acpi_osi= (empty string) -- with that, all 4 keys (brightness up/down,
screen on/off and wifi key) works.

I don't know what it really means, and if linux should work around this somehow
by its own, but at least it looks like no new driver should be written.

Also I don't know if there's anything else which breaks this way.

What does this acpi_osi= (empty) does, anyway?

Thanks,

/mjt
