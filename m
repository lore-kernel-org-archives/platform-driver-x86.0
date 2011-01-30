From: Jeff Chua <jeff.chua.linux@gmail.com>
Subject: Re: [ibm-acpi-devel] thinkpad-acpi: fn-f4 issues
Date: Mon, 31 Jan 2011 01:22:31 +0800
Message-ID: <AANLkTin-rO5Uge9y3JDAG5rBe=iuJ2qSb02myzTqVJ6c@mail.gmail.com>
References: <Pine.LNX.4.64.1101251740380.3737@boston.corp.fedex.com>
	<20110125151346.GB14803@khazad-dum.debian.net>
	<AANLkTim9cN8KXx5DVrH_nBzVjnmuYsxOHwP4msBKs=gS@mail.gmail.com>
	<20110126003034.GC25953@khazad-dum.debian.net>
	<AANLkTinazKxNF27m_PkE097hnfZtOqBuAmLZYXydWCpL@mail.gmail.com>
	<20110129175533.GB26442@khazad-dum.debian.net>
	<AANLkTikjA=F7Q6zdZ8Gnq57NxBfr2vyU4eshmnZytw-m@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:54303 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751023Ab1A3RWc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 30 Jan 2011 12:22:32 -0500
In-Reply-To: <AANLkTikjA=F7Q6zdZ8Gnq57NxBfr2vyU4eshmnZytw-m@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Dominik Kopp <my@kabelfunk.de>, ibm-acpi-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Sun, Jan 30, 2011 at 1:55 AM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
>
> On Wed, 26 Jan 2011, Jeff Chua wrote:
>
> > xev reported both up/down. I'm using mplayer and it doesn't see those
> > events.
>
> Now I am confused.  Did you get any xev events for Fn+F4?  Or do you mean
> volume up/down?

No event for Fn+F4 with CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y, and
Suspend doesn't work.

With CONFIG_THINKPAD_ACPI_HOTKEY_POLL unset, Syspend works with Fn+F4.

xev reported events when volume up/down are pressed.

>
> > Mute is working fine.  And on a separate topic, I simply couldn't get the
> > "mic" to work. Alsamixer reported these ...
>
> I wouldn't know what to do about that, but I bet someone on the thinkpad-ml
> does, so maybe you should ask there.  You did check that the mic-mute button
> is not active, I assume?

There's no option to unmute the mic. I've tried alsamixer, but
couldn't find it there.

Thanks,
Jeff
