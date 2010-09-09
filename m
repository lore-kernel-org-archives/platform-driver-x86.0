From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: asus-laptop kill wifi when initital
Date: Thu, 9 Sep 2010 09:52:20 +0200
Message-ID: <AANLkTikog39Co8SYiapnF8+n_Evng8UBz6kRSa=YnvF8@mail.gmail.com>
References: <4C888FA7.9090402@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:52128 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab0IIHwV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Sep 2010 03:52:21 -0400
In-Reply-To: <4C888FA7.9090402@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: acpi4asus-user@lists.sourceforge.net, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>

On Thu, Sep 9, 2010 at 9:41 AM, Ike Panhc <ike.pan@canonical.com> wrote:
> Hi,
>
> I have a report[1] that user has to blacklist the asus-laptop otherwise wifi
> can not work. I copied asus-laptop.c from 2.6.32 kernel and remove two
> lines[2] that set WLED/BLED on. The modified driver works fine.
>
> User uses 2.6.32 based kernel and when 2.6.34, a module parameter
> "wifi_status" is added[3] to let user choose what he want to do on WLED/BLED
> when initial. So I guess there are some reports tells the parameter for
> WLED/BLED maybe changed. Since the default action is still on because some
> machine need to enable WLED/BLED when booting. Any idea for the future
> change? For example telling user add an options on /etc/modprobe.d, or try
> to have a list of machine that not to set WLED/BLED to 1 when booting?

You can help me fill the acpi4asus wiki [1]. If we manage to get a real
list of laptop where we should not write in WLED/BLED, then we can
try to implement a black list.

WLED/BLED/WAPF never worked well, mainly because the behavior
seems to be completly inconsistant between laptops. You may try to
ask Asus about that, but they never answered to me :/. But again, the
wiki could help us, we just need to find out how  HWRS, RSTS, SFUN
and WAPF really work.

[1] http://dev.iksaif.net/projects/acpi4asus/wiki



-- 
Corentin Chary
http://xf.iksaif.net
