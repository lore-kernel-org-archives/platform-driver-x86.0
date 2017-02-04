From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 2/4][RFC v2] fujitsu-laptop: fujitsu-laptop: restructure
 initialisation
Date: Sat, 4 Feb 2017 07:26:09 +0100
Message-ID: <20170204062609.GB2058@kmp-mobile.hq.kempniu.pl>
References: <20170131130904.GC6218@marvin.atrad.com.au>
 <20170203144619.GD11947@ozzy.nask.waw.pl>
 <20170203233057.GB12248@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36107 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753553AbdBDG0N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Feb 2017 01:26:13 -0500
Received: by mail-lf0-f67.google.com with SMTP id h65so3047136lfi.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Feb 2017 22:26:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170203233057.GB12248@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

> On Fri, Feb 03, 2017 at 03:46:19PM +0100, Micha?? K??pie?? wrote:
> > > Don't register backlight and platform devices on non-fujitsu hardware
> > >  - bail out instead.
> > > 
> > > Register the backlight driver _after_ the main acpi driver.
> > 
> > Something went wrong (during the rebase?) as after this patch is
> > applied, acpi_bus_register_driver() is never called for
> > acpi_fujitsu_bl_driver, rendering the latter useless.
> 
> Obviously that needs to be addressed.  Did you want me to look into it?
> 
> After looking at the original patches it appears that contrary to my
> original assumptions, I don't thimk they were CCed to the list.  Would it
> help you to see the originals?  It is probably not good to post them to the
> list so as to avoid confusion, but I could forward them to you if you think
> they might be of use.

Yes, please send them to me off-list, in their original form.  That way
I will not have to assume anything and I should be able to tell what
Alan's intention was regarding driver registration order.  Thanks!

> PS: thanks for the git primer you sent the other day.

You are welcome, I hope it was useful.

-- 
Best regards,
Michał Kępień
