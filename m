From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Mon, 27 Feb 2017 22:17:55 -0800
Message-ID: <20170228061755.GA4228@fedora>
References: <20170113110240.622-1-kernel@kempniu.pl>
 <20170113121758.GA9036@marvin.atrad.com.au>
 <20170113131915.GA745@ozzy.nask.waw.pl>
 <20170203140507.GB11947@ozzy.nask.waw.pl>
 <20170227071909.GA9386@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:43845 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751055AbdB1GTw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Feb 2017 01:19:52 -0500
Content-Disposition: inline
In-Reply-To: <20170227071909.GA9386@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Greg, question for you below, see "GregKH"...

On Mon, Feb 27, 2017 at 08:19:09AM +0100, Michał Kępień wrote:
> > Darren, Andy,
> > 
> > Please drop this patch series for now.  I will send a rebased v2 after a
> > long overdue patch series from Alan Jenkins gets applied in a reworked
> > form.
> > 
> > However, your input is still essential for determining the future shape
> > of fujitsu-laptop.  I quoted the essential parts of my discussion with
> > Jonathan below.

Very sorry for the delay, I've lost context on this, let me see if I can pick it
up with your summary below...

> > 
> > > > > The problem I have with this driver is that it is generally oblivious to
> > > > > the user's chosen backlight provider.  It was written before acpi_video
> > > > > support for backlight control was automatically detected by the kernel 
> > > > > and as such it required a fix which was allegedly provided by          
> > > > > 7d5c89a615c5 ("fujitsu-laptop: fingers off backlight if video.ko is    
> > > > > serving this functionality").  However, that fix was superficial as the
> > > > > module still registered its vendor-specific ACPI driver for backlight  
> > > > > control.  That in turn caused SBLL/SBL2 to be called when brightness   
> > > > > hotkeys were pressed even when acpi_video was supposed to handle       
> > > > > brightness changes, which is exactly what that patch was hoping to     
> > > > > prevent.  Moreover, the module unconditionally exports backlight-related
> > > > > sysfs attributes which enable userspace to change the brightness level,
> > > > > which should also only be possible when vendor backlight control is    
> > > > > used.  Fast forward several years and on modern Fujitsu machines (e.g. 
> > > > > Lifebook E744), the kernel automatically detects that native backlight 
> > > > > control [1] should be used and SBLL becomes a noop [2].  This creates  
> > > > > confusion, because the driver claims that it can get/set LCD brightness
> > > > > level via the platform device's sysfs attributes, but it actually      
> > > > > cannot.  It gets even more confusing on Skylake machines on which the  
> > > > > FUJ02B1 ACPI device is not present at all.                           

Right, evolved.... time to take a step back and clean it up.

> > > > > The proposal I put forward in regard to the above is to remove the three
> > > > > backlight-related attributes (brightness_changed, lcd_level,
> > > > > max_brightness) from the platform driver's sysfs tree.  I believe the
> > > > > functions they implement should only be exposed through the backlight
> > > > > device, because the latter is only created when the user explicitly
> > > > > selects vendor backlight control or it is automatically selected by the
> > > > > kernel (this should be the case for older machines).

This seems to be a good approach as in combination with the discussion below re
the ACPI device, it eliminates the sysfs attributes from the platform device
completely and makes the driver more consistent with others in the subsystem.

> > > > I will need to do some more digging into the historical developments.  At
> > > > face value I'm not sure how machines like the S7020 would end up controlling
> > > > the backlight if these sysfs attributes were removed because on this machine
> > > > (at least last time I checked) the standard backlight/video drivers could
> > > > not effect brightness control on this hardware.  Or is there a side effect
> > > > that I have forgotten?
> > > 
> > > Let us not confuse three separate things that fujitsu-laptop enables:
> > > 
> > >   * changing LCD brightness using the keyboard,
> > >   * changing LCD brightness from userspace, using the backlight device,
> > >   * changing LCD brightness from userspace, using sysfs attributes.
> > > 
> > > I have nothing against the first two, apart from the notion that they
> > > should be more tightly coupled (i.e. one should not be enabled without
> > > the other one and vice versa).
> > > 
> > > I am all against the last one.  IMHO it is a duplicate, misplaced
> > > feature which only makes clean separation of components inside the
> > > driver hard.
> > > 
> > > > > That would leave us with the remaining three sysfs attributes of the
> > > > > platform device, namely dock, lid and radios.  These all depend on the
> > > > > FUJ02E3 ACPI device.  Which begs the question: shall we reassign them to
> > > > > that ACPI device and drop the platform device altogether?  This would
> > > > > logically be the correct thing to do (panasonic-laptop and toshiba_acpi
> > > > > already assign extra sysfs attributes to ACPI nodes).  But I understand
> > > > > that this would break an 8-year-old userspace interface as functions
> > > > > previously exposed through /sys/devices/platform/fujitsu-laptop would be
> > > > > moved to /sys/bus/acpi/devices/FUJ02E3:00.  If that is unacceptable, the

We can change the device sysfs attributes using versioning. We should of course
do our due diligence to discover if there are any users of this sysfs interface,
and if so, if they have strong objections to changing. But, if someone screams,
we can always revert.

GregKH - Can you please confirm the above? Moving an attribute is different than
the format and contents, which is what I explicitly documented in
Documentation/admin-guide/sysfs-rules.rst (last section).

> > > > > least we can (and should) do is to move platform device registration to
> > > > > acpi_fujitsu_hotkey_add().  What the driver currently does may create
> > > > > confusion in the future, because the platform device is registered
> > > > > unconditionally while it clearly depends on FUJ02E3 being present.  I do
> > > > > not know whether FUJ02E3 is present on all Fujitsu devices today without
> > > > > exception, but I do know that if Fujitsu ever decides to drop that
> > > > > device from its firmware, we would again (see above) expose a userspace
> > > > > interface (dock, lid, radios) which simply will not be able to function
> > > > > properly.
> > 
> > []
> > 
> > > > Regarding the movement of sysfs attributes, it is my understanding that
> > > > breaking the userspace API in this way is frowned upon.

Yes, but... It is less of a concern for a specific device or platform, than it
is for a common kernel feature. I believe there is good argumentation above for
why this driver and it's attributes need to be cleaned up.

> > > 
> > > This is my understanding as well, which is why this is only a proposal
> > > and not a patch.
> > > 
> > > > Personally I could
> > > > argue that given the relatively specialised nature of these attributes and
> > > > their consequential low rate of use in the wild, such a move might be
> > > > justifiable.  However, the kernel tends to hold userspace interfaces to be
> > > > perpetual so I can't see how such a change would get up in this case. 
> > > > Darren may like to comment on this.
> > > 
> > > Yes, this definitely needs input from subsystem maintainers.
> > > 
> > > Let me just emphasize once again that I believe backlight-related sysfs
> > > attributes belonging to the platform driver are a misplaced feature.
> > > Backlight-related features belong in backlight devices.  The only
> > > situation I can think of that someone will get hurt by these getting
> > > removed is that they have some custom script which uses the platform
> > > device instead of the backlight device to control LCD brightness.
> > > Removing these attributes has no effect on whether brightness-related
> > > keys on the keyboard work or not.
> > > 
> > > Nevertheless, if the consensus is that these should stay where they are,
> > > they need to be added conditionally, only when acpi_backlight=vendor.
> > > Otherwise they simply do not work on modern hardware and cause
> > > confusion.
> > 
> > In regard to the above, please let me know what you think about:
> > 
> >   - removing backlight-related attributes from the platform device,
> > 
> >   - removing the platform device altogether and attaching
> >     laptop-specific attributes to the ACPI device instead.

Unless GregKH objects, I would prefer to see the second option.

> 
> Darren, Andy,
> 
> As six weeks have passed since I originally asked for your comments, I
> hope another gentle reminder is okay.  Your advice is needed before I
> can post further cleanups for fujitsu-laptop.

My sincere apologies. Please always feel free to nag if more than 2 weeks go by.
6 weeks is totally unacceptable.

-- 
Darren Hart
Intel Open Source Technology Center
