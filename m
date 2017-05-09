From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Tue, 9 May 2017 09:47:34 -0700
Message-ID: <20170509164734.GB17858@fury>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:52375 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751956AbdEIQrl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2017 12:47:41 -0400
Content-Disposition: inline
In-Reply-To: <20170509093524.GA19713@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 09, 2017 at 11:35:24AM +0200, Michał Kępień wrote:
> > On Sat, May 06, 2017 at 02:45:16PM +0200, Michał Kępień wrote:
> > > > Just to make sure we are all on the same page here, choosing the "two
> > > > separate modules, each with one driver for one ACPI device" approach
> > > > would mean ending up with two modules:
> > > > 
> > > >   - fujitsu-laptop, binding to the FUJ02E3 ACPI device, handling
> > > >     everything _except_ backlight,
> > > > 
> > > >   - fujitsu-backlight, binding to the FUJ02B1 ACPI device, handling
> > > >     backlight and depending on fujitsu-laptop.
> > > > 
> > > > We would need to export one function from fujitsu-laptop, namely
> > > > fext_backlight().  I understand this would require creating a separate
> > > > header file which would then be included in fujitsu-backlight.
> > > > 
> > > > fext_backlight() causes the FUNC method of the FUJ02E3 ACPI device to be
> > > > called.  This method is marked as Serialized, which AFAIU means we do
> > > > not need a separate lock in kernel code because all calls to this method
> > > > are implicitly serialized by firmware itself.
> > > > 
> > > > I do not see anything "unnatural" in this approach, but I would love to
> > > > be corrected if I am wrong.
> > > 
> > > To be fair, one thing that may be "unnatural" with this approach is that
> > > even though fujitsu-backlight would depend on fujitsu-laptop, it would
> > > still have to get a handle to FUJ02E3 using:
> > > 
> > >     acpi_get_handle(NULL, "\\_SB.FEXT", ...)
> > >     
> > > because call_fext_func() - and thus fext_backlight() - needs to be
> > > passed a handle to FUJ02E3 and the two ACPI devices (FUJ02B1 handled by
> > > fujitsu-backlight and FUJ02E3 handled by fujitsu-laptop) are not related
> > > from the perspective of the ACPI device hierarchy.  Unless there is a
> > > better way of implementing this, in which case I am open to suggestions.
> > 
> > At a high level, I would consider the handle to be private data which should be
> > encapsulated in fujitsu_laptop. Or... where is FEXT in the ACPI hierarchy
> > relative to FUJ02E3?
> 
> FEXT *is* FUJ02E3:
> 
> Device (FEXT)
> {
>     Name (_HID, "FUJ02E3")  // _HID: Hardware ID
>     ...
>     Method (FUNC, 4, Serialized)
>     {
>         ...
>     }
>     ...
> }
> 
> See also below.
> 
> > Assuming FEXT is below FUJ02E3, the we appear to be making an assumption that
> > there is only one FUJ02E3 on the system. While I think this is perfectly
> > reasonable, it does contradict the argumentation from some of the other patches
> > in this series.
> 
> Exactly.  The whole purpose of this patch series is to stop using
> module-wide data.  We have a different situation here than in the case
> of e.g. dell-smbios, which coordinates access to a module-wide buffer it
> allocates.  
> 
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

This is very concise and describes the problem clearly, thank you!

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

Rafael's take on this would be useful.

> 
> Finally, perhaps the approach I took in my patch series is simply too
> zealous.  Maybe the simplest solution is to just keep using module-wide
> data, but then we are left with a single module with two intertwined
> ACPI drivers inside that need to be registered in the correct order.  It
> feels a bit brittle.

Perhaps so (overly zealous). Regarding the globals, let's be clear on the
motivation. We want to follow good sw engineering practice, use data
encapsulation, etc. However, using an explicit path to an ACPI device to avoid
having a static file-level global doesn't really improve encapsulation in any
way - it just shifts the blame :-)

Another reason to eliminate globals is to allow one driver to handle multiple
devices - all device-specific data must be bound to the device, not the driver.
In our case, there literally cannot be more than one _SB.FEXT. While there could
theoretically be more than one FUJ02E3, I think we all agree that is highly
improbable - and if it did happen, the explicit ACPI path approach would also be
broken.

The motivation to divide the drivers was to provide functional encapsulation,
accurately represent the system in the device tree, and to improve readability
and maintainability of the driver code. So long as we can keep coupling to a
minimum, I still think this makes sense.

So - static global variable for a driver with exactly one device that needs
offer services to another driver... not really all that horrible.

You could accomplish this by making call_fext_func() not static and calling it
from fujitsu-backlight. Or, you could further restrict it by exporting a
fujitsu_backlight_power() function which wraps call_fext_func() providing a
specific interface for fujitsu-backlight. This makes the ownership very explicit
and ensures the usage doesn't grow without explicit changes to fujitsu-laptop.

That is probably the most practical solution IFF we still feel it is worth
splitting the driver into two separate modules. We need to develop a more robust
and objective decision making process on module granularity (when to split, when
to keep together). Will continue to give this more thought.

-- 
Darren Hart
VMware Open Source Technology Center
