From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: dell-wmi -  question concerning battery charge key functionality
Date: Fri, 12 Nov 2010 11:53:22 -0800
Message-ID: <20101112195322.GB1299@core.coreip.homeip.net>
References: <4CDD1603.808@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:54597 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755084Ab0KLTx3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 12 Nov 2010 14:53:29 -0500
Received: by iwn10 with SMTP id 10so3844827iwn.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Nov 2010 11:53:28 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <4CDD1603.808@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Gubenko <gubenko.dmitry@googlemail.com>
Cc: Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Platform Driver x86 <platform-driver-x86@vger.kernel.org>

Hi Dmitry,

On Fri, Nov 12, 2010 at 11:25:07AM +0100, Dmitry Gubenko wrote:
> Hello,
> i hope this is the correct way of contacting you (i'm not really
> familiar with communication internae of the linux kernel development
> community).
> 
> I'm using  dell_wmi on my laptop (Dell Latitude e4300) which has
> keybinds for toggling battery charging if AC adapter is available
> (Fn+F2 and Fn+F3).
> As far as i understand this functionality is not available as of now.
> I get
> dell-wmi: Received unknown WMI event (0x11)

Looking at the code we are only prepared to handle 0x10 events. Rezwanul
Kabir added the code to handle newer Dells so he might have an idea what
event 0x11 is (CCed).

> when pressing Fn+F2 and no reaction when pressing Fn+F3.
> 

If you locate evtest utility and run it against the event device
corresponding to dell-wmi, does it show any events? It might be that the
driver is working but we missing userspace plumbing to react to the
events.

> My question is if there are plans to add this functionality at some point.
> Also if there are any other information ressources about the status
> of dell-wmi (apart from mentions in the kernel changelog) i'd be
> grateful if you'd point me towards those.
> 

Generally such question is better asked on platform-driver-x86@vger.kernel.org
mailing list (CCed) as they would have better idea.

-- 
Dmitry
