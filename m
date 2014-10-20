From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: asus-nb-wmi: wifi & brightness keys does not work on asus x200la
 laptop
Date: Mon, 20 Oct 2014 20:23:42 +0400
Message-ID: <5445370E.4030105@msgid.tls.msk.ru>
References: <542BD424.8010202@msgid.tls.msk.ru>	<5443BA36.2010304@msgid.tls.msk.ru> <CAHR064iiO3+i+KO2Yw6PEw183BN6yywSoAi6_Fx7mPErveg6fA@mail.gmail.com> <5445367C.4050305@msgid.tls.msk.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from isrv.corpit.ru ([86.62.121.231]:38674 "EHLO isrv.corpit.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751671AbaJTQXp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Oct 2014 12:23:45 -0400
In-Reply-To: <5445367C.4050305@msgid.tls.msk.ru>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>

On 10/20/2014 08:21 PM, Michael Tokarev wrote:
[]
> This prompted me to pefrorm some research, and I also found this (which is quite old
> already and I should have seen it before but apparently I didn't):
> 
>   http://forums.linuxmint.com/viewtopic.php?f=49&t=171563&start=20#p883644
> 
> (this is a similar model but with different cpu).  Their solution was to boot
> with acpi_osi= (empty string) -- with that, all 4 keys (brightness up/down,
> screen on/off and wifi key) works.

..but wifi LED doesn't work still.

Thanks,

/mjt
