From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Tue, 26 Sep 2017 15:02:47 +0930
Message-ID: <20170926053246.GC27920@marvin.atrad.com.au>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170923000048.GC20327@fury>
 <20170926044908.GA9170@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:58792 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934482AbdIZFdm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2017 01:33:42 -0400
Content-Disposition: inline
In-Reply-To: <20170926044908.GA9170@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Ville Syrjala <ville.syrjala@linux.intel.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

Hi Michal

On Tue, Sep 26, 2017 at 06:49:08AM +0200, Micha?? K??pie?? wrote:
> > Finally, it seems a proper fix would be to either not register the
> > backlight device if !fext or to check for !fext inside call_fext_func.
> 
> My draft patch series which splits off fujitsu-backlight includes the
> NULL check for fext inside the functions exposed by fujitsu-laptop.
> Sadly, I have not got round to submitting it yet.

It's probably similar to the patch I proposed earlier this week as an
alterative to the one posted by Ville.  I think we should push at least one
of these fixes out as soon as possible because we do currently have a
regression as a result of the oversight in the current code.  This would
then allow the draft patch series to be completed when you have the time,
rather than rushing it through now.

> Speaking of which, I just noticed that my S7020 can control its LCD
> brightness just fine without fujitsu-laptop being loaded.  Heck, it even
> works when booted with "noacpi".  It seems to me that on this model, LCD
> brightness control works at the firmware level and an ACPI-based driver
> is just another possible way of getting/setting LCD brightness level.
> Jonathan, IIRC you have an S7020 as well, could you please test that?
> You know better than me why this driver was needed in the first place.

You're really testing my memory now. :-)

My recollection is that back in the day the brightness buttons did work
without fujitsu-laptop loaded, so your report here doesn't suprise me. 
However, the fujitsu-laptop driver was required to make it possible for
*software* to control the LCD brightness and power.  Like you, I think I
concluded at the time that the hardware buttons worked at the firmware level
and the OS had no opportunity to participate in the activity.  There may
have also been a suspend-to-ram issue with LCD power which the driver helped
with, but I would have to go back through my notes from the time to see if
this was really the case.

To summarise, the driver was originally written to provide a way for Linux
to interact with the LCD so the brightness and power could be controlled by
Linux, and so Linux could find out what the LCD state was.

Regards
  jonathan
