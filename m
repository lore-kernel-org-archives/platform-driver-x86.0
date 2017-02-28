From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Tue, 28 Feb 2017 21:44:26 +1030
Message-ID: <20170228111426.GA31575@marvin.atrad.com.au>
References: <20170113110240.622-1-kernel@kempniu.pl>
 <20170113121758.GA9036@marvin.atrad.com.au>
 <20170113131915.GA745@ozzy.nask.waw.pl>
 <20170203140507.GB11947@ozzy.nask.waw.pl>
 <20170227071909.GA9386@ozzy.nask.waw.pl>
 <20170228061755.GA4228@fedora>
 <20170228080704.GA32366@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170228080704.GA32366@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Darren Hart <dvhart@infradead.org>, Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 28, 2017 at 09:07:04AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 27, 2017 at 10:17:55PM -0800, Darren Hart wrote:
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

I have now had a chance to revisit the historical background, especially as
it relates to the three sysfs attributes mentioned (brightness_changed,
lcd_level, max_brightness).  It seems to me that these are most likely left
overs from a very early version of fujitsu-laptop, originally out-of-tree,
merged to mainline by myself and others.  Like Michael I doubt there is any
userspace utility which makes use of these.  Checking the scripts which I
personally use on my S7020 I see that I only ever use the attributes
provided under/sys/devices/virtual/backlight/fujitsu-laptop when controlling
the backlight.  Like Michael said, it's impossible to completely rule out
the possiblity of an obscure Fujitsu-only utility somewhere in the universe
which makes use of the /sys/devices/platform/fujitsu-laptop/ backlight
attributes but I think the probability of such a thing existing is
vanishingly small.  Even if there was, there is a mostly trivial mapping
from old to new (lcd_level -> brightness, max_brightness -> max_brightness). 
Only brightness_changed isn't replicated but I'm sure something could be
hooked if necessary.

What this means is that from my perspective it is highly unlikely that
removing the three sysfs attributes as proposed by Michael
(brightness_changed, lcd_level, max_brightness) will break userspace in a
practical sense.  Instead, it will improve the structure of the
fujitsu-laptop driver and make it more consistent with other platform
drivers.  Putting all this together, I have no objections to the removal as
proposed by Michael: there appears to be far more gains than losses.

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

This isn't really a move in the true sense of the word.  The equivalent
standard backlight attributes have existed in
/sys/devices/virtual/backlight/fujitsu-laptop/ probably since the very
beginning and I suspect these are the ones people would be using since they
hook into the standard backlight subsystem.  Michael's proposal is to remove
the brightness_changed, lcd_level and max_brightness from
/sys/devices/platform/fujitsu-laptop on the basis that the backlight
equivalents are what people should be using and most likely are.  The
attributes provided by fujitsu-laptop via the backlight subsystem would
continue to exist (assuming I've understood Michael's proposal correctly).

> And I really don't like putting random device attributes on "parent"
> devices.  I know Dmitry Torokhov disagrees about this though, his
> subsystem does like doing that.  But whatever you do, you should at
> least try to be consistent.
> 
> But, as you can't be consistent here, don't break userspace please, I'd
> recommend just leaving it alone for now.

Ultimately I'm happy to defer to the direction given by Darren, GregKH et
al.  For what it's worth, from my point of view I would be happy for the
deletions to occur for the reasons stated above.  If however the need to
retain these old (most likely unused) sysfs attributes is never-the-less
immutable then they have obviously to stay.

Regards
  jonathan
