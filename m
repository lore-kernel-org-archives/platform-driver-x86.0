From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Fri, 13 Jan 2017 14:19:15 +0100
Message-ID: <20170113131915.GA745@ozzy.nask.waw.pl>
References: <20170113110240.622-1-kernel@kempniu.pl>
 <20170113121758.GA9036@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35264 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751801AbdAMNTU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2017 08:19:20 -0500
Received: by mail-lf0-f68.google.com with SMTP id v186so5691903lfa.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jan 2017 05:19:19 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170113121758.GA9036@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> On Fri, Jan 13, 2017 at 12:02:36PM +0100, Micha?? K??pie?? wrote:
> > These patches should make fujitsu_init() a bit more palatable.  I
> > intentionally stopped after four patches, because they should do no harm
> > and the next steps require some discussion.
> 
> I will review these as soon as I can, which might have to be after LCA2017.
> That is, there could be a delay of just over a week before I can get to
> this.

No worries, take your time, there is no rush.

> > The problem I have with this driver is that it is generally oblivious to
> > the user's chosen backlight provider.  It was written before acpi_video
> > support for backlight control was automatically detected by the kernel
> > and as such it required a fix which was allegedly provided by
> > 7d5c89a615c5 ("fujitsu-laptop: fingers off backlight if video.ko is
> > serving this functionality").  However, that fix was superficial as the
> > module still registered its vendor-specific ACPI driver for backlight
> > control.  That in turn caused SBLL/SBL2 to be called when brightness
> > hotkeys were pressed even when acpi_video was supposed to handle
> > brightness changes, which is exactly what that patch was hoping to
> > prevent.
> 
> I suspect this is going to get messy fairly quickly.  The problem that this
> module was orginally written to solve was that on certain Fujitsu laptops
> (the S7020 for example) the standard ACPI video functionality was not able
> to control the backlight (even after acpi_video gained its automatic
> capabilities).  The non-standard manipulations done by fujitsu-laptop were
> required for these machines or else it was completely impossible for the
> backlight to be controlled by software.

That was exactly my reasoning after digging through the git log, which
is good because it means we are on the same page here.

> I would have to go digging through
> some ancient notes to verifiy this, but I think there was also an issue
> whereby the brightness buttons on these laptops didn't work without the
> fujitsu-laptop brightness functions being called in response to the button
> presses.  Or something like that - it was a long time ago.

Well, that sounds very likely, because pressing a brightness-related key
usually causes firmware to notify the OS about a brightness change
request.  Without the OS part to receive and process these notifications
(and no support from acpi_video), I do not see how these keys would
work.

> With this in mind, I think what we're starting to see now is a conflict
> between the requirements of newer machines (which do sane things with regard
> to ACPI video and backlight, and therefore only really need the standard
> approach offered by acpi_video) and the older hardware which simply doesn't
> work with acpi_video or the standard backlight approach.
> 
> > Moreover, the module unconditionally exports backlight-related
> > sysfs attributes which enable userspace to change the brightness level,
> > which should also only be possible when vendor backlight control is
> > used.  Fast forward several years and on modern Fujitsu machines (e.g.
> > Lifebook E744), the kernel automatically detects that native backlight
> > control [1] should be used and SBLL becomes a noop [2].  This creates
> > confusion, because the driver claims that it can get/set LCD brightness
> > level via the platform device's sysfs attributes, but it actually
> > cannot.  It gets even more confusing on Skylake machines on which the
> > FUJ02B1 ACPI device is not present at all.
> 
> Again, what I think this highlights is that the older hardware requires code
> which turns out to break (or at least significantly complicate) things on
> modern hardware.

Personally, I do not feel the complication is that much of a problem.
All that needs to be done is a reevaluation of under what circumstances
each part of the driver should be loaded.  Specifically, the backlight
part must not be enabled unless acpi_backlight=vendor.  What I tried to
demonstrate in the cover letter is that backlight-related sysfs
attributes belonging to the platform device make such a change hard to
introduce.  Sure, we could add them conditionally, but that would only
complicate things even more, which is where my suggestion to remove them
altogether stems from - I believe the driver should only expose
backlight functions through the backlight device.

> There were some older fujitsu systems where vendor
> backlight control was the only option.
> 
> That said, there is clearly merit in suppressing the backlight sysfs
> attributes on systems where they are not functional.
> 
> > The proposal I put forward in regard to the above is to remove the three
> > backlight-related attributes (brightness_changed, lcd_level,
> > max_brightness) from the platform driver's sysfs tree.  I believe the
> > functions they implement should only be exposed through the backlight
> > device, because the latter is only created when the user explicitly
> > selects vendor backlight control or it is automatically selected by the
> > kernel (this should be the case for older machines).
> 
> I will need to do some more digging into the historical developments.  At
> face value I'm not sure how machines like the S7020 would end up controlling
> the backlight if these sysfs attributes were removed because on this machine
> (at least last time I checked) the standard backlight/video drivers could
> not effect brightness control on this hardware.  Or is there a side effect
> that I have forgotten?

Let us not confuse three separate things that fujitsu-laptop enables:

  * changing LCD brightness using the keyboard,
  * changing LCD brightness from userspace, using the backlight device,
  * changing LCD brightness from userspace, using sysfs attributes.

I have nothing against the first two, apart from the notion that they
should be more tightly coupled (i.e. one should not be enabled without
the other one and vice versa).

I am all against the last one.  IMHO it is a duplicate, misplaced
feature which only makes clean separation of components inside the
driver hard.

> > That would leave us with the remaining three sysfs attributes of the
> > platform device, namely dock, lid and radios.  These all depend on the
> > FUJ02E3 ACPI device.  Which begs the question: shall we reassign them to
> > that ACPI device and drop the platform device altogether?  This would
> > logically be the correct thing to do (panasonic-laptop and toshiba_acpi
> > already assign extra sysfs attributes to ACPI nodes).  But I understand
> > that this would break an 8-year-old userspace interface as functions
> > previously exposed through /sys/devices/platform/fujitsu-laptop would be
> > moved to /sys/bus/acpi/devices/FUJ02E3:00.  If that is unacceptable, the
> > least we can (and should) do is to move platform device registration to
> > acpi_fujitsu_hotkey_add().  What the driver currently does may create
> > confusion in the future, because the platform device is registered
> > unconditionally while it clearly depends on FUJ02E3 being present.  I do
> > not know whether FUJ02E3 is present on all Fujitsu devices today without
> > exception, but I do know that if Fujitsu ever decides to drop that
> > device from its firmware, we would again (see above) expose a userspace
> > interface (dock, lid, radios) which simply will not be able to function
> > properly.
> 
> There is a significant misalignment of names in the fujitsu-laptop driver
> which is probably adding to the overall confusion.  Back in 2009 Alan
> Jenkins proposed a series of patches to clean this up.  Unfortunately these
> came at a bad time for me and I wasn't able to evaluate them on my hardware,
> so they langished.  I have been meaning to resurrect those patches ever
> since but have never quite had the time to do so.  Most recently I was
> planning to do it over the New Year break, but something else came up which
> prevented that. :-(
> 
> It might be worth glancing through these because the resulting renames in
> particular definitely improved the clarity of the driver:
> 
>   Date: Thu, 17 Sep 2009
>   From: Alan Jenkins
>   Subject: [PATCH 1/4] fujitsu-laptop: renames and cleanup
>            [PATCH 2/4] fujitsu-laptop: restructure initialisation
>            [PATCH 3/4] fujitsu-laptop: autodetect lcd interface on unknown models
>            [PATCH 4/4] fujitsu-laptop: simplify modalias (autoload)

These subjects suggest that it makes little sense for me to duplicate
Alan's work.  I have a lot more cleanups on my todo list, but the more I
change, the less sense Alan's patches will make.  I guess the most
reasonable course of action would be for you to go through Alan's series
after all so that I will only need to send fixes for whatever he has
missed.  Feel free to suggest otherwise, though.

> Unfortunately I do not have access to recent Fujitsu hardware so I cannot
> comment as to whether FUJ02E3 is ubiquitous.

This is a secondary issue, I only raised it to emphasize that the driver
*might* be erring as we speak, but it is *definitely* not future-proof.

> Regarding the movement of sysfs attributes, it is my understanding that
> breaking the userspace API in this way is frowned upon.

This is my understanding as well, which is why this is only a proposal
and not a patch.

> Personally I could
> argue that given the relatively specialised nature of these attributes and
> their consequential low rate of use in the wild, such a move might be
> justifiable.  However, the kernel tends to hold userspace interfaces to be
> perpetual so I can't see how such a change would get up in this case. 
> Darren may like to comment on this.

Yes, this definitely needs input from subsystem maintainers.

Let me just emphasize once again that I believe backlight-related sysfs
attributes belonging to the platform driver are a misplaced feature.
Backlight-related features belong in backlight devices.  The only
situation I can think of that someone will get hurt by these getting
removed is that they have some custom script which uses the platform
device instead of the backlight device to control LCD brightness.
Removing these attributes has no effect on whether brightness-related
keys on the keyboard work or not.

Nevertheless, if the consensus is that these should stay where they are,
they need to be added conditionally, only when acpi_backlight=vendor.
Otherwise they simply do not work on modern hardware and cause
confusion.

> > I am happy to provide patches for whatever solution gets chosen, but
> > first I would really appreciate if you (and anyone interested) could
> > comment on the issues I described above.
> 
> As mentioned I will need to dig up information from 2007/8 to identify the
> precise issues encountered with hardware from that time.  I am fairly
> certain that the old hardware required the custom backlight control
> implementation or else it was simply not functional.  There was also an
> issue that the hardware did not turn the backlight on coming out of
> hibernation: it was necessary to arrange for this to be fixed by software. 
> When the unified ACPI video and backlight drivers eventuated they did not
> seem capable of controlling the backlight on this hardware, which is why the
> fujitsu-laptop backlight control remained in place.
> 
> Perhaps we might have to consider splitting fujitsu-laptop such that it
> provides two distinct and indepentent functions: the old backlight interface
> which is loaded only for the older hardware which requires it, and support
> for the other devices where needed.  The need for this obviously depends on
> the requirements of the hardware.

I also thought about this and this might be a nice idea.

The problem I have with the source code in its current state is that it
took me a day to understand that we are looking at two cleanly separable
ACPI drivers which are needlessly intertwined by a redundant platform
device.

> I am in no way opposed to a clean up of the driver.  However, it must be
> done in a way which preserves functionality on the older hardware. 

I could not agree more.

> Disclaimer: I have an S7020 which is still in active service, and I don't
> want to loose software control over the backlight.

Great, then we have someone to test the upcoming patches! ;)

-- 
Best regards,
Michał Kępień
