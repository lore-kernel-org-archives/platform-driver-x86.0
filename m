From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Thu, 11 May 2017 15:52:11 +0200
Message-ID: <20170511135211.GB1166@ozzy.nask.waw.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170509093524.GA19713@ozzy.nask.waw.pl>
 <20170509164734.GB17858@fury>
 <2402801.hhjSWhyBjd@aspire.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2402801.hhjSWhyBjd@aspire.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Darren Hart <dvhart@infradead.org>, Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> On Tuesday, May 09, 2017 09:47:34 AM Darren Hart wrote:
> > On Tue, May 09, 2017 at 11:35:24AM +0200, Michał Kępień wrote:
> > > > On Sat, May 06, 2017 at 02:45:16PM +0200, Michał Kępień wrote:
> > > > > > Just to make sure we are all on the same page here, choosing the "two
> > > > > > separate modules, each with one driver for one ACPI device" approach
> > > > > > would mean ending up with two modules:
> > > > > > 
> > > > > >   - fujitsu-laptop, binding to the FUJ02E3 ACPI device, handling
> > > > > >     everything _except_ backlight,
> > > > > > 
> > > > > >   - fujitsu-backlight, binding to the FUJ02B1 ACPI device, handling
> > > > > >     backlight and depending on fujitsu-laptop.
> > > > > > 
> > > > > > We would need to export one function from fujitsu-laptop, namely
> > > > > > fext_backlight().  I understand this would require creating a separate
> > > > > > header file which would then be included in fujitsu-backlight.
> > > > > > 
> > > > > > fext_backlight() causes the FUNC method of the FUJ02E3 ACPI device to be
> > > > > > called.  This method is marked as Serialized, which AFAIU means we do
> > > > > > not need a separate lock in kernel code because all calls to this method
> > > > > > are implicitly serialized by firmware itself.
> > > > > > 
> > > > > > I do not see anything "unnatural" in this approach, but I would love to
> > > > > > be corrected if I am wrong.
> > > > > 
> > > > > To be fair, one thing that may be "unnatural" with this approach is that
> > > > > even though fujitsu-backlight would depend on fujitsu-laptop, it would
> > > > > still have to get a handle to FUJ02E3 using:
> > > > > 
> > > > >     acpi_get_handle(NULL, "\\_SB.FEXT", ...)
> > > > >     
> > > > > because call_fext_func() - and thus fext_backlight() - needs to be
> > > > > passed a handle to FUJ02E3 and the two ACPI devices (FUJ02B1 handled by
> > > > > fujitsu-backlight and FUJ02E3 handled by fujitsu-laptop) are not related
> > > > > from the perspective of the ACPI device hierarchy.  Unless there is a
> > > > > better way of implementing this, in which case I am open to suggestions.
> > > > 
> > > > At a high level, I would consider the handle to be private data which should be
> > > > encapsulated in fujitsu_laptop. Or... where is FEXT in the ACPI hierarchy
> > > > relative to FUJ02E3?
> > > 
> > > FEXT *is* FUJ02E3:
> > > 
> > > Device (FEXT)
> > > {
> > >     Name (_HID, "FUJ02E3")  // _HID: Hardware ID
> > >     ...
> > >     Method (FUNC, 4, Serialized)
> > >     {
> > >         ...
> > >     }
> > >     ...
> > > }
> > > 
> > > See also below.
> > > 
> > > > Assuming FEXT is below FUJ02E3, the we appear to be making an assumption that
> > > > there is only one FUJ02E3 on the system. While I think this is perfectly
> > > > reasonable, it does contradict the argumentation from some of the other patches
> > > > in this series.
> > > 
> > > Exactly.  The whole purpose of this patch series is to stop using
> > > module-wide data.  We have a different situation here than in the case
> > > of e.g. dell-smbios, which coordinates access to a module-wide buffer it
> > > allocates.  
> > > 
> > > > If FEXT is not below fujitsu laptop... then it is a shared function which either
> > > > one of them can own and serialize (or not if fw indeed handles that).
> > > > 
> > > > Either way, the owning driver should abstract away the private data and present
> > > > an interface the other can use with only the "public" information.
> > > 
> > > I feel the problem at hand needs a fresh explanation.  I will be as
> > > concise as possible.
> > > 
> > > We are considering two ACPI devices present on Fujitsu laptops:
> > > 
> > >   - FJEX:
> > >       * path: \_SB_.PCI0.LPCB.FJEX
> > >       * HID: FUJ02B1
> > >       * methods invoked by kernel: GBLL, RBLL, SBLL, SBL2
> > >       * handles: backlight level (LCD brightness)
> > > 
> > >   - FEXT:
> > >       * path: \_SB_.FEXT
> > >       * HID: FUJ02E3
> > >       * methods invoked by kernel: FUNC
> > >       * handles: hotkey, LEDs, platform attributes, backlight power
> > >                                                     ^^^^^^^^^^^^^^^
> > 
> > This is very concise and describes the problem clearly, thank you!
> > 
> > > 
> > > The problem is that if we split the ACPI drivers for those two devices
> > > into separate modules, the FJEX driver will need to access the FUNC
> > > method of device FEXT, handled by another driver in another module.
> > > 
> > > One way of solving this cleanly is to store a handle to the most
> > > recently found FEXT instance (there should always be at most one anyway)
> > > in a module-wide variable inside the FEXT driver, but that defeats the
> > > purpose of this series.
> > > 
> > > Another solution is proposed by patch 04/10 of this series: make the
> > > FJEX driver independently grab a handle to FEXT using the absolute ACPI
> > > path to the latter.  It feels unnatural (AFAICT only one driver outside
> > > drivers/acpi, namely pcc-cpufreq, does that), but it is safe and allows
> > > us to drop all module-wide data.
> > 
> > Rafael's take on this would be useful.
> 
> Well, can you point me to patch [04/10] then?

Here is a link:

    https://www.spinics.net/lists/platform-driver-x86/msg11412.html

However, please note that in light of what Darren wrote, this specific
patch is likely to be dropped from v2.  Thus, there may be no point in
reviewing it after all, though your feedback would certainly be
appreciated for future reference.

> Or better resend the whole series with a CC to linux-acpi (which it should go
> to to start with IMO).

I did not think of that as this ten-patch series mostly revolves around
data encapsulation.  However, I think it might be worthwhile to CC
linux-acpi for the series that will split fujitsu-laptop in two, shall
it ever be posted.

-- 
Best regards,
Michał Kępień
