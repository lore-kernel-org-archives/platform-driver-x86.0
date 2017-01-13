From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Fri, 13 Jan 2017 22:47:58 +1030
Message-ID: <20170113121758.GA9036@marvin.atrad.com.au>
References: <20170113110240.622-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:36124 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751621AbdAMMSz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2017 07:18:55 -0500
Content-Disposition: inline
In-Reply-To: <20170113110240.622-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 13, 2017 at 12:02:36PM +0100, Micha?? K??pie?? wrote:
> These patches should make fujitsu_init() a bit more palatable.  I
> intentionally stopped after four patches, because they should do no harm
> and the next steps require some discussion.

I will review these as soon as I can, which might have to be after LCA2017.
That is, there could be a delay of just over a week before I can get to
this.

> The problem I have with this driver is that it is generally oblivious to
> the user's chosen backlight provider.  It was written before acpi_video
> support for backlight control was automatically detected by the kernel
> and as such it required a fix which was allegedly provided by
> 7d5c89a615c5 ("fujitsu-laptop: fingers off backlight if video.ko is
> serving this functionality").  However, that fix was superficial as the
> module still registered its vendor-specific ACPI driver for backlight
> control.  That in turn caused SBLL/SBL2 to be called when brightness
> hotkeys were pressed even when acpi_video was supposed to handle
> brightness changes, which is exactly what that patch was hoping to
> prevent.

I suspect this is going to get messy fairly quickly.  The problem that this
module was orginally written to solve was that on certain Fujitsu laptops
(the S7020 for example) the standard ACPI video functionality was not able
to control the backlight (even after acpi_video gained its automatic
capabilities).  The non-standard manipulations done by fujitsu-laptop were
required for these machines or else it was completely impossible for the
backlight to be controlled by software.  I would have to go digging through
some ancient notes to verifiy this, but I think there was also an issue
whereby the brightness buttons on these laptops didn't work without the
fujitsu-laptop brightness functions being called in response to the button
presses.  Or something like that - it was a long time ago.

With this in mind, I think what we're starting to see now is a conflict
between the requirements of newer machines (which do sane things with regard
to ACPI video and backlight, and therefore only really need the standard
approach offered by acpi_video) and the older hardware which simply doesn't
work with acpi_video or the standard backlight approach.

> Moreover, the module unconditionally exports backlight-related
> sysfs attributes which enable userspace to change the brightness level,
> which should also only be possible when vendor backlight control is
> used.  Fast forward several years and on modern Fujitsu machines (e.g.
> Lifebook E744), the kernel automatically detects that native backlight
> control [1] should be used and SBLL becomes a noop [2].  This creates
> confusion, because the driver claims that it can get/set LCD brightness
> level via the platform device's sysfs attributes, but it actually
> cannot.  It gets even more confusing on Skylake machines on which the
> FUJ02B1 ACPI device is not present at all.

Again, what I think this highlights is that the older hardware requires code
which turns out to break (or at least significantly complicate) things on
modern hardware.  There were some older fujitsu systems where vendor
backlight control was the only option.

That said, there is clearly merit in suppressing the backlight sysfs
attributes on systems where they are not functional.

> The proposal I put forward in regard to the above is to remove the three
> backlight-related attributes (brightness_changed, lcd_level,
> max_brightness) from the platform driver's sysfs tree.  I believe the
> functions they implement should only be exposed through the backlight
> device, because the latter is only created when the user explicitly
> selects vendor backlight control or it is automatically selected by the
> kernel (this should be the case for older machines).

I will need to do some more digging into the historical developments.  At
face value I'm not sure how machines like the S7020 would end up controlling
the backlight if these sysfs attributes were removed because on this machine
(at least last time I checked) the standard backlight/video drivers could
not effect brightness control on this hardware.  Or is there a side effect
that I have forgotten?

> That would leave us with the remaining three sysfs attributes of the
> platform device, namely dock, lid and radios.  These all depend on the
> FUJ02E3 ACPI device.  Which begs the question: shall we reassign them to
> that ACPI device and drop the platform device altogether?  This would
> logically be the correct thing to do (panasonic-laptop and toshiba_acpi
> already assign extra sysfs attributes to ACPI nodes).  But I understand
> that this would break an 8-year-old userspace interface as functions
> previously exposed through /sys/devices/platform/fujitsu-laptop would be
> moved to /sys/bus/acpi/devices/FUJ02E3:00.  If that is unacceptable, the
> least we can (and should) do is to move platform device registration to
> acpi_fujitsu_hotkey_add().  What the driver currently does may create
> confusion in the future, because the platform device is registered
> unconditionally while it clearly depends on FUJ02E3 being present.  I do
> not know whether FUJ02E3 is present on all Fujitsu devices today without
> exception, but I do know that if Fujitsu ever decides to drop that
> device from its firmware, we would again (see above) expose a userspace
> interface (dock, lid, radios) which simply will not be able to function
> properly.

There is a significant misalignment of names in the fujitsu-laptop driver
which is probably adding to the overall confusion.  Back in 2009 Alan
Jenkins proposed a series of patches to clean this up.  Unfortunately these
came at a bad time for me and I wasn't able to evaluate them on my hardware,
so they langished.  I have been meaning to resurrect those patches ever
since but have never quite had the time to do so.  Most recently I was
planning to do it over the New Year break, but something else came up which
prevented that. :-(

It might be worth glancing through these because the resulting renames in
particular definitely improved the clarity of the driver:

  Date: Thu, 17 Sep 2009
  From: Alan Jenkins
  Subject: [PATCH 1/4] fujitsu-laptop: renames and cleanup
           [PATCH 2/4] fujitsu-laptop: restructure initialisation
           [PATCH 3/4] fujitsu-laptop: autodetect lcd interface on unknown models
           [PATCH 4/4] fujitsu-laptop: simplify modalias (autoload)

Unfortunately I do not have access to recent Fujitsu hardware so I cannot
comment as to whether FUJ02E3 is ubiquitous.

Regarding the movement of sysfs attributes, it is my understanding that
breaking the userspace API in this way is frowned upon.  Personally I could
argue that given the relatively specialised nature of these attributes and
their consequential low rate of use in the wild, such a move might be
justifiable.  However, the kernel tends to hold userspace interfaces to be
perpetual so I can't see how such a change would get up in this case. 
Darren may like to comment on this.

> I am happy to provide patches for whatever solution gets chosen, but
> first I would really appreciate if you (and anyone interested) could
> comment on the issues I described above.

As mentioned I will need to dig up information from 2007/8 to identify the
precise issues encountered with hardware from that time.  I am fairly
certain that the old hardware required the custom backlight control
implementation or else it was simply not functional.  There was also an
issue that the hardware did not turn the backlight on coming out of
hibernation: it was necessary to arrange for this to be fixed by software. 
When the unified ACPI video and backlight drivers eventuated they did not
seem capable of controlling the backlight on this hardware, which is why the
fujitsu-laptop backlight control remained in place.

Perhaps we might have to consider splitting fujitsu-laptop such that it
provides two distinct and indepentent functions: the old backlight interface
which is loaded only for the older hardware which requires it, and support
for the other devices where needed.  The need for this obviously depends on
the requirements of the hardware.

I am in no way opposed to a clean up of the driver.  However, it must be
done in a way which preserves functionality on the older hardware. 
Disclaimer: I have an S7020 which is still in active service, and I don't
want to loose software control over the backlight.

Regards
  jonathan
