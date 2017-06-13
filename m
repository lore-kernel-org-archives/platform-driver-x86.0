From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 09:22:42 -0700
Message-ID: <20170613162242.GF27850@fury>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
 <20170613153857.GC27850@fury>
 <20170613155000.GA24483@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:46594 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751758AbdFMQWq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 12:22:46 -0400
Content-Disposition: inline
In-Reply-To: <20170613155000.GA24483@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 05:50:00PM +0200, Greg Kroah-Hartman wrote:
> > The patch is trivial, but the process is time consuming. Two to Three
> > months to see an ID added and released is big blocker for contemporary
> > life cycles.
> 
> Wait, what?  Please explain.
> 
> Yes, it could take worse case 2-3 months to add a new device id, but
> does it really?  I take new device ids up until 2 weeks before a -final
> kernel is released.  And once they are in Linus's tree it's usually only
> a single week before they end up in all stable kernel releases.

Up to 2-3 months, the average would be shorter of course, as you say.

> 
> But that's upstream, no device ships with upstream, they ship a distro
> kernel.  Look at the pre-installs from SuSE and Canonical, to get a new
> device id into their kernels takes what, a day or two?  And that is what
> really matters as that is what goes out the door for their device.

I'd be very interested to hear more accounts of timeline to distro
inclusion - if it is truly 1-2 days, I need to re-evaluate my position
on this. I don't see how it could be without that being done out of band
with mainline, which would in turn accrue technical debt which had to
be managed each release.

> 
> At least that is the process for when _I_ used to work on pre-installed
> Linux on devices, maybe things have gotten a lot worse since I left that
> business, but I would sure hope it wouldn't get magnitudes worse.
> 
> So 2-3 months seems really long to me.

As a concrete example, Dell has specifically made the request that we
work on a solution that doesn't require them to come back to the kernel
community each time they add a WMI GUID to their BIOS. They would like
to see those GUIDs automatically exposed.

Mario, can you provide any specific information about what the pain
points were that led to this request?

-- 
Darren Hart
VMware Open Source Technology Center
