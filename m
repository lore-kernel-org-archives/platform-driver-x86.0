From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Tue, 9 May 2017 21:43:10 +0930
Message-ID: <20170509121310.GA28098@marvin.atrad.com.au>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170501130536.GA25546@marvin.atrad.com.au>
 <20170502132144.GA6808@ozzy.nask.waw.pl>
 <20170504234058.GC21562@marvin.atrad.com.au>
 <20170505161556.GC4793@fury>
 <20170506123107.GA2516@kmp-mobile.hq.kempniu.pl>
 <20170506124516.GA1075@kmp-mobile.hq.kempniu.pl>
 <20170508160102.GE17700@fury>
 <20170509093524.GA19713@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:40036 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752038AbdEIMOT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2017 08:14:19 -0400
Content-Disposition: inline
In-Reply-To: <20170509093524.GA19713@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 09, 2017 at 11:35:24AM +0200, Micha?? K??pie?? wrote:
> > If FEXT is not below fujitsu laptop... then it is a shared function which either
> > one of them can own and serialize (or not if fw indeed handles that).
> > 
> > Either way, the owning driver should abstract away the private data and present
> > an interface the other can use with only the "public" information.
> 
> I feel the problem at hand needs a fresh explanation.  I will be as
> concise as possible.
> 
> We are considering two ACPI devices present on Fujitsu laptops:
> 
>   - FJEX:
>       * path: \_SB_.PCI0.LPCB.FJEX
>       * HID: FUJ02B1
>       * methods invoked by kernel: GBLL, RBLL, SBLL, SBL2
>       * handles: backlight level (LCD brightness)
> 
>   - FEXT:
>       * path: \_SB_.FEXT
>       * HID: FUJ02E3
>       * methods invoked by kernel: FUNC
>       * handles: hotkey, LEDs, platform attributes, backlight power
>                                                     ^^^^^^^^^^^^^^^
> 
> The problem is that if we split the ACPI drivers for those two devices
> into separate modules, the FJEX driver will need to access the FUNC
> method of device FEXT, handled by another driver in another module.
> 
> One way of solving this cleanly is to store a handle to the most
> recently found FEXT instance (there should always be at most one anyway)
> in a module-wide variable inside the FEXT driver, but that defeats the
> purpose of this series.
> 
> Another solution is proposed by patch 04/10 of this series: make the
> FJEX driver independently grab a handle to FEXT using the absolute ACPI
> path to the latter.  It feels unnatural (AFAICT only one driver outside
> drivers/acpi, namely pcc-cpufreq, does that), but it is safe and allows
> us to drop all module-wide data.
> 
> Finally, perhaps the approach I took in my patch series is simply too
> zealous.  Maybe the simplest solution is to just keep using module-wide
> data, but then we are left with a single module with two intertwined
> ACPI drivers inside that need to be registered in the correct order.  It
> feels a bit brittle.

I think this revised summary is a good description of the situation.

> > I suggest investigating the various mechanisms Andy pointed at and revisiting
> > this after that.
> 
> For now, these yield no immediate silver bullets for me.  But I will dig
> a bit deeper and report back.  Meanwhile, if anyone feels like sharing
> their thoughts after reading the summary I wrote above, I am all ears.

I appreciate you taking the time to continue pondering the situation - the
best approach is certainly not immediately obvious.  From where I sit I
suspect that whichever solution we eventually adopt there are going to be
wrinkles.  The trick is to identify the approach which has the fewest rough
edges and where the resulting code is the easiest to follow in future.  At
this point in time I cannot come up with an argument which definitively
supports one particular option over the others.  It may come down to
personal taste.

Regards
  jonathan
