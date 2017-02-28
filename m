From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Tue, 28 Feb 2017 09:33:28 +0100
Message-ID: <20170228083328.GA3277@ozzy.nask.waw.pl>
References: <20170113110240.622-1-kernel@kempniu.pl>
 <20170113121758.GA9036@marvin.atrad.com.au>
 <20170113131915.GA745@ozzy.nask.waw.pl>
 <20170203140507.GB11947@ozzy.nask.waw.pl>
 <20170227071909.GA9386@ozzy.nask.waw.pl>
 <20170228061755.GA4228@fedora>
 <20170228080704.GA32366@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170228080704.GA32366@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> On Mon, Feb 27, 2017 at 10:17:55PM -0800, Darren Hart wrote:
> > Greg, question for you below, see "GregKH"...
> > 
> > On Mon, Feb 27, 2017 at 08:19:09AM +0100, Michał Kępień wrote:
> > > > Darren, Andy,
> > > > 
> > > > Please drop this patch series for now.  I will send a rebased v2 after a
> > > > long overdue patch series from Alan Jenkins gets applied in a reworked
> > > > form.
> > > > 
> > > > However, your input is still essential for determining the future shape
> > > > of fujitsu-laptop.  I quoted the essential parts of my discussion with
> > > > Jonathan below.
> > 
> > Very sorry for the delay, I've lost context on this, let me see if I can pick it
> > up with your summary below...
> > 
> > > > 
> > > > > > > The problem I have with this driver is that it is generally oblivious to
> > > > > > > the user's chosen backlight provider.  It was written before acpi_video
> > > > > > > support for backlight control was automatically detected by the kernel 
> > > > > > > and as such it required a fix which was allegedly provided by          
> > > > > > > 7d5c89a615c5 ("fujitsu-laptop: fingers off backlight if video.ko is    
> > > > > > > serving this functionality").  However, that fix was superficial as the
> > > > > > > module still registered its vendor-specific ACPI driver for backlight  
> > > > > > > control.  That in turn caused SBLL/SBL2 to be called when brightness   
> > > > > > > hotkeys were pressed even when acpi_video was supposed to handle       
> > > > > > > brightness changes, which is exactly what that patch was hoping to     
> > > > > > > prevent.  Moreover, the module unconditionally exports backlight-related
> > > > > > > sysfs attributes which enable userspace to change the brightness level,
> > > > > > > which should also only be possible when vendor backlight control is    
> > > > > > > used.  Fast forward several years and on modern Fujitsu machines (e.g. 
> > > > > > > Lifebook E744), the kernel automatically detects that native backlight 
> > > > > > > control [1] should be used and SBLL becomes a noop [2].  This creates  
> > > > > > > confusion, because the driver claims that it can get/set LCD brightness
> > > > > > > level via the platform device's sysfs attributes, but it actually      
> > > > > > > cannot.  It gets even more confusing on Skylake machines on which the  
> > > > > > > FUJ02B1 ACPI device is not present at all.                           
> > 
> > Right, evolved.... time to take a step back and clean it up.
> > 
> > > > > > > The proposal I put forward in regard to the above is to remove the three
> > > > > > > backlight-related attributes (brightness_changed, lcd_level,
> > > > > > > max_brightness) from the platform driver's sysfs tree.  I believe the
> > > > > > > functions they implement should only be exposed through the backlight
> > > > > > > device, because the latter is only created when the user explicitly
> > > > > > > selects vendor backlight control or it is automatically selected by the
> > > > > > > kernel (this should be the case for older machines).
> > 
> > This seems to be a good approach as in combination with the discussion below re
> > the ACPI device, it eliminates the sysfs attributes from the platform device
> > completely and makes the driver more consistent with others in the subsystem.
> > 
> > > > > > I will need to do some more digging into the historical developments.  At
> > > > > > face value I'm not sure how machines like the S7020 would end up controlling
> > > > > > the backlight if these sysfs attributes were removed because on this machine
> > > > > > (at least last time I checked) the standard backlight/video drivers could
> > > > > > not effect brightness control on this hardware.  Or is there a side effect
> > > > > > that I have forgotten?
> > > > > 
> > > > > Let us not confuse three separate things that fujitsu-laptop enables:
> > > > > 
> > > > >   * changing LCD brightness using the keyboard,
> > > > >   * changing LCD brightness from userspace, using the backlight device,
> > > > >   * changing LCD brightness from userspace, using sysfs attributes.
> > > > > 
> > > > > I have nothing against the first two, apart from the notion that they
> > > > > should be more tightly coupled (i.e. one should not be enabled without
> > > > > the other one and vice versa).
> > > > > 
> > > > > I am all against the last one.  IMHO it is a duplicate, misplaced
> > > > > feature which only makes clean separation of components inside the
> > > > > driver hard.
> > > > > 
> > > > > > > That would leave us with the remaining three sysfs attributes of the
> > > > > > > platform device, namely dock, lid and radios.  These all depend on the
> > > > > > > FUJ02E3 ACPI device.  Which begs the question: shall we reassign them to
> > > > > > > that ACPI device and drop the platform device altogether?  This would
> > > > > > > logically be the correct thing to do (panasonic-laptop and toshiba_acpi
> > > > > > > already assign extra sysfs attributes to ACPI nodes).  But I understand
> > > > > > > that this would break an 8-year-old userspace interface as functions
> > > > > > > previously exposed through /sys/devices/platform/fujitsu-laptop would be
> > > > > > > moved to /sys/bus/acpi/devices/FUJ02E3:00.  If that is unacceptable, the
> > 
> > We can change the device sysfs attributes using versioning. We should of course
> > do our due diligence to discover if there are any users of this sysfs interface,
> > and if so, if they have strong objections to changing. But, if someone screams,
> > we can always revert.
> > 
> > GregKH - Can you please confirm the above? Moving an attribute is different than
> > the format and contents, which is what I explicitly documented in
> > Documentation/admin-guide/sysfs-rules.rst (last section).
> 
> Moving an attribute to a different device structure is usually a bad
> idea, if the userspace tool counting on it to be present in a specific
> place breaks.

Yes, I am familiar with that premise.  Here is the thing though: I am
unaware of any userspace tool which uses these attributes.  Though,
obviously, that does not mean such tools do not exist.

> And I really don't like putting random device attributes on "parent"
> devices.  I know Dmitry Torokhov disagrees about this though, his
> subsystem does like doing that.  But whatever you do, you should at
> least try to be consistent.

This is tricky, too.  The x86 platform driver subsystem currently mixes
both approaches, i.e. some drivers register a separate platform device
while others just attach sysfs attributes directly to ACPI device nodes.

> But, as you can't be consistent here, don't break userspace please, I'd
> recommend just leaving it alone for now.

Darren, in the light of the above I will be awaiting your final call on
this before posting any further patches touching this area.  My number
one priority was to drop the broken backlight-related attributes,
because leaving the other attributes where they currently are does not
prevent achieving a clean split between the two drivers registered by
fujitsu-laptop, which is the ultimate objective of all these cleanups.

-- 
Best regards,
Michał Kępień
