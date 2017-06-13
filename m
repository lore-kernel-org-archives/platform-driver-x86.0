From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 18:52:47 +0200
Message-ID: <20170613165247.GA32546@kroah.com>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
 <20170613153857.GC27850@fury>
 <20170613155000.GA24483@kroah.com>
 <20170613162242.GF27850@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51302 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751989AbdFMQwz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 12:52:55 -0400
Content-Disposition: inline
In-Reply-To: <20170613162242.GF27850@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 09:22:42AM -0700, Darren Hart wrote:
> On Tue, Jun 13, 2017 at 05:50:00PM +0200, Greg Kroah-Hartman wrote:
> > > The patch is trivial, but the process is time consuming. Two to Three
> > > months to see an ID added and released is big blocker for contemporary
> > > life cycles.
> > 
> > Wait, what?  Please explain.
> > 
> > Yes, it could take worse case 2-3 months to add a new device id, but
> > does it really?  I take new device ids up until 2 weeks before a -final
> > kernel is released.  And once they are in Linus's tree it's usually only
> > a single week before they end up in all stable kernel releases.
> 
> Up to 2-3 months, the average would be shorter of course, as you say.
> 
> > 
> > But that's upstream, no device ships with upstream, they ship a distro
> > kernel.  Look at the pre-installs from SuSE and Canonical, to get a new
> > device id into their kernels takes what, a day or two?  And that is what
> > really matters as that is what goes out the door for their device.
> 
> I'd be very interested to hear more accounts of timeline to distro
> inclusion - if it is truly 1-2 days, I need to re-evaluate my position
> on this. I don't see how it could be without that being done out of band
> with mainline, which would in turn accrue technical debt which had to
> be managed each release.

Of course you do it out-of-band for mainline.  You send it upstream and
to the distro at the same time.  The team responsible for getting the
platform up and running for the preinstall merges it into the distro
kernel that gets shipped with the device, and all is well.  The next
update that the device gets, the patch is still there and when the
kernel gets updated, it's already merged.

This is what companies do all the time, they aren't running mainline on
a preinstall :)

> > At least that is the process for when _I_ used to work on pre-installed
> > Linux on devices, maybe things have gotten a lot worse since I left that
> > business, but I would sure hope it wouldn't get magnitudes worse.
> > 
> > So 2-3 months seems really long to me.
> 
> As a concrete example, Dell has specifically made the request that we
> work on a solution that doesn't require them to come back to the kernel
> community each time they add a WMI GUID to their BIOS. They would like
> to see those GUIDs automatically exposed.

What do you mean exactly by "exposed"?  What do they do with these?  Why
isn't the Dell pre-install team sending patches for this like the
Windows preinstall team is doing for their hacked-to-hell copy of
Windows?  :)

Do you have an example patch of something that was needed to get a Dell
laptop working for a new device id that didn't work this way?

thanks,

greg k-h
