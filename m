From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH] acer-wmi: check wireless capability on AMW0_GUID2 machines
Date: Mon, 09 Jan 2012 22:15:45 +0000
Message-ID: <4607313.aZXtt4raMe@valkyrie>
References: <1326090677-25942-1-git-send-email-jlee@suse.com> <3474148.WRXZ4siLlh@valkyrie> <1326103224.24116.282.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:55331 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933152Ab2AIWPv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Jan 2012 17:15:51 -0500
Received: by wibhm6 with SMTP id hm6so2956217wib.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Jan 2012 14:15:50 -0800 (PST)
In-Reply-To: <1326103224.24116.282.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

On Monday 09 Jan 2012 18:00:24 joeyli wrote:
> I just checked and found I also have no AMW0_GUID2 machines on my hand,
> now.
> I have some questions about AMW0_GUID2:
> 
>   + Why we enabled wireless capability in acer-wim if a non-acer machine has
> AMW0_GUID2 ?

IIRC, there were some bug reports on non-Acer hardware (I don't think this 
involved Acer hardware, but this was some time ago...) where the wireless 
detection wasn't working with this, but if we forced it on, it worked fine.

>   + I saw there have some magic number when you access AMW0_GUID1 (e.g.
> 0x9610, eax, ebx, ecx) Could you please kindly teach me how can grab those
> value for AMW0_GUID2? Does there have any useful dump or report log can
> provide by hardware owner?

Probably not. For AMW0_GUID1, I got the stuff by using the Windows Kernel 
Debugger remotely to see what my laptop was doing when changing things in 
Windows - unfortunately that relied on a firewire port on the laptop, which I 
suspect most people don't have.

The real problem is that I know almost nothing about AMW0_GUID2 - either what 
it's used for or what it actually does, nor how hardware detection works with 
it present (if at all).

-Carlos
