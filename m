From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 08:38:57 -0700
Message-ID: <20170613153857.GC27850@fury>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:49423 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750899AbdFMPjF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 11:39:05 -0400
Content-Disposition: inline
In-Reply-To: <20170613070535.GA13252@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 12:05:35AM -0700, Christoph Hellwig wrote:
> Hi Darren,
> 
> first - can you please properly trim your replies and don't write
> more than 7 characters per line?

Sure... (although I think you've done all the necessary pruning for this
response). 70 I presume you mean? I usually have tw set to 72...
apparently I dropped that setting at some point. Will correct.

> 
> On Mon, Jun 12, 2017 at 06:24:35PM -0700, Darren Hart wrote:
> > This is a big topic for sure. Speed and scale of platform enabling is something
> > I would like to see us support better. The barrier to entry to kernel
> > changes is high, especially for trivial things, like adding IDs, GUIDs, etc.
> > which would ideally, IMHO, be in the hands of the OEMs.
> 
> It's not.  It's a trivial patch, and you cover all Linux users.  Very
> much unlike say the windows world where you are stuck with installing
> a vendor specific set of drivers forever.
> 

The patch is trivial, but the process is time consuming. Two to Three
months to see an ID added and released is big blocker for contemporary
life cycles.

> > Ideally, we would provide a generic way for users/OEMs/vendors to successfully
> > support and maintain their own platforms, ideally with as little kernel changes
> > as possible. If we can get closer to that than we are today with this WMI work,
> > I think that is worth the effort.
> 
> Hell no!  The last thing we need on Linux is systems that once support
> us added don't just work out of the box because you're missing your
> vendor blob.

I thought more about this overnight and changed my thinking a bit. While
I still stand by the position that we should be making it easier for
users/OEMs/vendors to support their platforms (note that I had included
users in there, and I'm specifically referring to many of the people
reporting bugs on laptops who would be more likely to fix the issue if
it could be done outside of the kernel).

I'll mention this again I suspect in this thread, but rather than a "WMI
filter" we can implement a "WMI proxy". If a kernel driver needs to own
certain WMI calls for LED or Radio management, for example, all such
calls can be proxied through that driver. It can do the necessary work
to update its own state, and still perform the requested funtion,
transparent to the userspace caller. This should accommodate the
addition of new drivers and features to kernel drivers, without
precluding the development of userspace management or platform daemons.

> > > And filter layer which will accept only WMI calls which are safe for 
> > > currently loaded/used kernel modules seems like a sane idea to ensure 
> > > functionality of kernel plus allow userspace to do other things.
> > 
> > My biggest concern with this approach is maintenance. Because we would be doing
> > something unforeseen by the specification, the various vendor implemented WMI
> > APIs are not likely to be amenable to filtering. I can see these filters
> > getting extremely complicated. They are "high touch", by which I mean each
> > generation of platform may require subtle tweaks, which will be difficult to
> > verify they don't break past generations.
> 
> Agreed.  As mentioned before I think the only sensible approach is
> white listing GUIDs that have a valid userspace use case.  And use
> the dynamic IDs approach to add them for debugging and reverse
> engineering.

The issue with whitelisting GUIDs is that, for the same reasons as
above, they are not going to be nicely partitioned into functional
chunks that make sense from a kernel perspective. They aren't going to
see it through a subsystems lense, "LEDs, Radios, Hotkeys, BIOS
Management". Much like the fujitsu ACPI devices have nonsensical
interdependencies, these GUIDs and the methods they contain are not
granular enough for filtering.

As to dynamic IDs... to make sure I'm thinking the same thing you are...
you are referring to passing device IDs from userspace, through sysfs,
to a driver at runtime to allow it to bind to an ID it doesn't already
know about? If I have this right, it also addresses my concern above for
adding new IDs taking too long as this can provide an intermediate
solution.

> 
> > There are certainly pros and cons. While this approach results in duplication of
> > effort, it also allows vendors to "own their own destiny" and innovate and
> > support their platforms independently. It also minimizes the amount of dead code
> > accumulating for platforms that just don't exist for very long.
> 
> Bullshit alert..
> 

I probably need to add "innovate" to my bad words dictionary as it gets
this knee jerk response. But what specifically do you object to?
Supporting vendors in product development? Or not accumulating dead code
in the kernel?

-- 
Darren Hart
VMware Open Source Technology Center
