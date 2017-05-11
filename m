From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Thu, 11 May 2017 08:38:48 -0700
Message-ID: <20170511153848.GF11404@fury>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <2402801.hhjSWhyBjd@aspire.rjw.lan>
 <20170511135211.GB1166@ozzy.nask.waw.pl>
 <2351586.Dq8uyyCcAZ@aspire.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:53727 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756924AbdEKPiy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 May 2017 11:38:54 -0400
Content-Disposition: inline
In-Reply-To: <2351586.Dq8uyyCcAZ@aspire.rjw.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 11, 2017 at 04:37:30PM +0200, Rafael Wysocki wrote:
> On Thursday, May 11, 2017 03:52:11 PM Michał Kępień wrote:
> > > On Tuesday, May 09, 2017 09:47:34 AM Darren Hart wrote:
> > > > On Tue, May 09, 2017 at 11:35:24AM +0200, Michał Kępień wrote:
> > > > > > On Sat, May 06, 2017 at 02:45:16PM +0200, Michał Kępień wrote:
...
> > > > > I feel the problem at hand needs a fresh explanation.  I will be as
> > > > > concise as possible.
> > > > > 
> > > > > We are considering two ACPI devices present on Fujitsu laptops:
> > > > > 
> > > > >   - FJEX:
> > > > >       * path: \_SB_.PCI0.LPCB.FJEX
> > > > >       * HID: FUJ02B1
> > > > >       * methods invoked by kernel: GBLL, RBLL, SBLL, SBL2
> > > > >       * handles: backlight level (LCD brightness)
> > > > > 
> > > > >   - FEXT:
> > > > >       * path: \_SB_.FEXT
> > > > >       * HID: FUJ02E3
> > > > >       * methods invoked by kernel: FUNC
> > > > >       * handles: hotkey, LEDs, platform attributes, backlight power
> > > > >                                                     ^^^^^^^^^^^^^^^
> > > > 
> > > > This is very concise and describes the problem clearly, thank you!
> > > > 
> > > > > 
> > > > > The problem is that if we split the ACPI drivers for those two devices
> > > > > into separate modules, the FJEX driver will need to access the FUNC
> > > > > method of device FEXT, handled by another driver in another module.
> > > > > 
> > > > > One way of solving this cleanly is to store a handle to the most
> > > > > recently found FEXT instance (there should always be at most one anyway)
> > > > > in a module-wide variable inside the FEXT driver, but that defeats the
> > > > > purpose of this series.
> > > > > 
> > > > > Another solution is proposed by patch 04/10 of this series: make the
> > > > > FJEX driver independently grab a handle to FEXT using the absolute ACPI
> > > > > path to the latter.  It feels unnatural (AFAICT only one driver outside
> > > > > drivers/acpi, namely pcc-cpufreq, does that), but it is safe and allows
> > > > > us to drop all module-wide data.
> > > > 
> > > > Rafael's take on this would be useful.
> > > 
> > > Well, can you point me to patch [04/10] then?
> > 
> > Here is a link:
> > 
> >     https://www.spinics.net/lists/platform-driver-x86/msg11412.html
> 
> Thanks!
> 
> > However, please note that in light of what Darren wrote, this specific
> > patch is likely to be dropped from v2.  Thus, there may be no point in
> > reviewing it after all, though your feedback would certainly be
> > appreciated for future reference.
> 
> OK

Rafael's take on balancing one driver per device, versus a single driver with
interdependent ACPI devices, even if one of them doesn't show up in the device
hierarchy, as well as one driver calling into another one, all from his
experience with ACPI device drivers would be valuable, and could sway my advice
above.

> 
> > > Or better resend the whole series with a CC to linux-acpi (which it should go
> > > to to start with IMO).
> > 
> > I did not think of that as this ten-patch series mostly revolves around
> > data encapsulation.  However, I think it might be worthwhile to CC
> > linux-acpi for the series that will split fujitsu-laptop in two, shall
> > it ever be posted.
> 
> OK, but as a rule of thumb, it is better to CC everything touching ACPI to
> linux-acpi just to let people know what you're doing if nothing else.
> 
> And if there are ACPI-related questions down the road, the context is there
> aleady, so it is generally easier to answer them then.
> 

Agreed. Unfortunately, we don't have a good way to make this clear in
MAINTAINERS without enumerating every driver. I'll try to make sure the regular
contributors know this, but new folks will continue to miss it unless we can
find a better way to make it obvious.


-- 
Darren Hart
VMware Open Source Technology Center
