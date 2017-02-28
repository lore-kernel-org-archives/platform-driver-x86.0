From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Tue, 28 Feb 2017 13:33:00 +0100
Message-ID: <20170228123300.GB31751@kroah.com>
References: <20170113110240.622-1-kernel@kempniu.pl>
 <20170113121758.GA9036@marvin.atrad.com.au>
 <20170113131915.GA745@ozzy.nask.waw.pl>
 <20170203140507.GB11947@ozzy.nask.waw.pl>
 <20170227071909.GA9386@ozzy.nask.waw.pl>
 <20170228061755.GA4228@fedora>
 <20170228080704.GA32366@kroah.com>
 <20170228111426.GA31575@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:39494 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751441AbdB1Mfo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Feb 2017 07:35:44 -0500
Content-Disposition: inline
In-Reply-To: <20170228111426.GA31575@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 28, 2017 at 09:44:26PM +1030, Jonathan Woithe wrote:
> On Tue, Feb 28, 2017 at 09:07:04AM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Feb 27, 2017 at 10:17:55PM -0800, Darren Hart wrote:
> > > > > > > > The problem I have with this driver is that it is generally oblivious to
> > > > > > > > the user's chosen backlight provider.  It was written before acpi_video
> > > > > > > > support for backlight control was automatically detected by the kernel 
> > > > > > > > and as such it required a fix which was allegedly provided by          
> > > > > > > > 7d5c89a615c5 ("fujitsu-laptop: fingers off backlight if video.ko is    
> > > > > > > > serving this functionality").  However, that fix was superficial as the
> > > > > > > > module still registered its vendor-specific ACPI driver for backlight  
> > > > > > > > control.  That in turn caused SBLL/SBL2 to be called when brightness   
> > > > > > > > hotkeys were pressed even when acpi_video was supposed to handle       
> > > > > > > > brightness changes, which is exactly what that patch was hoping to     
> > > > > > > > prevent.  Moreover, the module unconditionally exports backlight-related
> > > > > > > > sysfs attributes which enable userspace to change the brightness level,
> > > > > > > > which should also only be possible when vendor backlight control is    
> > > > > > > > used.  Fast forward several years and on modern Fujitsu machines (e.g. 
> > > > > > > > Lifebook E744), the kernel automatically detects that native backlight 
> > > > > > > > control [1] should be used and SBLL becomes a noop [2].  This creates  
> > > > > > > > confusion, because the driver claims that it can get/set LCD brightness
> > > > > > > > level via the platform device's sysfs attributes, but it actually      
> > > > > > > > cannot.  It gets even more confusing on Skylake machines on which the  
> > > > > > > > FUJ02B1 ACPI device is not present at all.                           
> > > 
> > > Right, evolved.... time to take a step back and clean it up.
> > > 
> > > > > > > > The proposal I put forward in regard to the above is to remove the three
> > > > > > > > backlight-related attributes (brightness_changed, lcd_level,
> > > > > > > > max_brightness) from the platform driver's sysfs tree.  I believe the
> > > > > > > > functions they implement should only be exposed through the backlight
> > > > > > > > device, because the latter is only created when the user explicitly
> > > > > > > > selects vendor backlight control or it is automatically selected by the
> > > > > > > > kernel (this should be the case for older machines).
> > > 
> > > This seems to be a good approach as in combination with the discussion below re
> > > the ACPI device, it eliminates the sysfs attributes from the platform device
> > > completely and makes the driver more consistent with others in the subsystem.
> 
> I have now had a chance to revisit the historical background, especially as
> it relates to the three sysfs attributes mentioned (brightness_changed,
> lcd_level, max_brightness).  It seems to me that these are most likely left
> overs from a very early version of fujitsu-laptop, originally out-of-tree,
> merged to mainline by myself and others.  Like Michael I doubt there is any
> userspace utility which makes use of these.  Checking the scripts which I
> personally use on my S7020 I see that I only ever use the attributes
> provided under/sys/devices/virtual/backlight/fujitsu-laptop when controlling
> the backlight.  Like Michael said, it's impossible to completely rule out
> the possiblity of an obscure Fujitsu-only utility somewhere in the universe
> which makes use of the /sys/devices/platform/fujitsu-laptop/ backlight
> attributes but I think the probability of such a thing existing is
> vanishingly small.  Even if there was, there is a mostly trivial mapping
> from old to new (lcd_level -> brightness, max_brightness -> max_brightness). 
> Only brightness_changed isn't replicated but I'm sure something could be
> hooked if necessary.
> 
> What this means is that from my perspective it is highly unlikely that
> removing the three sysfs attributes as proposed by Michael
> (brightness_changed, lcd_level, max_brightness) will break userspace in a
> practical sense.  Instead, it will improve the structure of the
> fujitsu-laptop driver and make it more consistent with other platform
> drivers.  Putting all this together, I have no objections to the removal as
> proposed by Michael: there appears to be far more gains than losses.

As the person who wrote the original driver, for Fujitsu, I can almost
guarantee that there is no specific "fujitsu utility" that uses that
platform driver.  We just used the "normal" backlight/led interface
instead, so all should be fine there.

thanks,

greg k-h
