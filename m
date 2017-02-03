From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 2/4][RFC v2] fujitsu-laptop: fujitsu-laptop: restructure
 initialisation
Date: Sat, 4 Feb 2017 10:00:57 +1030
Message-ID: <20170203233057.GB12248@marvin.atrad.com.au>
References: <20170131130904.GC6218@marvin.atrad.com.au>
 <20170203144619.GD11947@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:55532 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752816AbdBCXbG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Feb 2017 18:31:06 -0500
Content-Disposition: inline
In-Reply-To: <20170203144619.GD11947@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: platform-driver-x86@vger.kernel.org

On Fri, Feb 03, 2017 at 03:46:19PM +0100, Micha?? K??pie?? wrote:
> > Don't register backlight and platform devices on non-fujitsu hardware
> >  - bail out instead.
> > 
> > Register the backlight driver _after_ the main acpi driver.
> 
> Something went wrong (during the rebase?) as after this patch is
> applied, acpi_bus_register_driver() is never called for
> acpi_fujitsu_bl_driver, rendering the latter useless.

Obviously that needs to be addressed.  Did you want me to look into it?

After looking at the original patches it appears that contrary to my
original assumptions, I don't thimk they were CCed to the list.  Would it
help you to see the originals?  It is probably not good to post them to the
list so as to avoid confusion, but I could forward them to you if you think
they might be of use.

Regards
  jonathan

PS: thanks for the git primer you sent the other day.
