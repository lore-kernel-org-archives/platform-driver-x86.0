From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: asus-nb-wmi: wifi & brightness keys does not work on asus x200la
 laptop
Date: Sun, 19 Oct 2014 17:18:46 +0400
Message-ID: <5443BA36.2010304@msgid.tls.msk.ru>
References: <542BD424.8010202@msgid.tls.msk.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from isrv.corpit.ru ([86.62.121.231]:52268 "EHLO isrv.corpit.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751904AbaJSNSt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 19 Oct 2014 09:18:49 -0400
In-Reply-To: <542BD424.8010202@msgid.tls.msk.ru>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: acpi4asus-user@lists.sourceforge.net, Corentin Chary <corentin.chary@gmail.com>

On 10/01/2014 02:15 PM, Michael Tokarev wrote:
> Hello.
> 
> It looks like asus-nb-wmi (or asus-wmi) does not handle some
> (acpi?) keys on some recent asus laptops.  In particular, on
> my x200la laptop, the mentioned keys does absolutely nothing
> (neither showkeys nor xev shows them).  Also, wifi led is
> always off.
> 
> Reportedly the same prob exists on another (but similar) series,
> x200ma (which is basically the same but is built on celeron/atom
> processor).
> 
> How can I help in debugging/implementing this support?

Anyone know this stuff, maybe some hints about where to start?
I wrote this email almost 3 weeks ago, and so far there was no
single reply...  Does anyone actually maintain this module?

Thanks,

/mjt
