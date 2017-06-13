From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 17:50:00 +0200
Message-ID: <20170613155000.GA24483@kroah.com>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
 <20170613153857.GC27850@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42406 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752167AbdFMPuI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 11:50:08 -0400
Content-Disposition: inline
In-Reply-To: <20170613153857.GC27850@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 08:38:57AM -0700, Darren Hart wrote:
> On Tue, Jun 13, 2017 at 12:05:35AM -0700, Christoph Hellwig wrote:
> > Hi Darren,
> > 
> > first - can you please properly trim your replies and don't write
> > more than 7 characters per line?
> 
> Sure... (although I think you've done all the necessary pruning for this
> response). 70 I presume you mean? I usually have tw set to 72...
> apparently I dropped that setting at some point. Will correct.
> 
> > 
> > On Mon, Jun 12, 2017 at 06:24:35PM -0700, Darren Hart wrote:
> > > This is a big topic for sure. Speed and scale of platform enabling is something
> > > I would like to see us support better. The barrier to entry to kernel
> > > changes is high, especially for trivial things, like adding IDs, GUIDs, etc.
> > > which would ideally, IMHO, be in the hands of the OEMs.
> > 
> > It's not.  It's a trivial patch, and you cover all Linux users.  Very
> > much unlike say the windows world where you are stuck with installing
> > a vendor specific set of drivers forever.
> > 
> 
> The patch is trivial, but the process is time consuming. Two to Three
> months to see an ID added and released is big blocker for contemporary
> life cycles.

Wait, what?  Please explain.

Yes, it could take worse case 2-3 months to add a new device id, but
does it really?  I take new device ids up until 2 weeks before a -final
kernel is released.  And once they are in Linus's tree it's usually only
a single week before they end up in all stable kernel releases.

But that's upstream, no device ships with upstream, they ship a distro
kernel.  Look at the pre-installs from SuSE and Canonical, to get a new
device id into their kernels takes what, a day or two?  And that is what
really matters as that is what goes out the door for their device.

At least that is the process for when _I_ used to work on pre-installed
Linux on devices, maybe things have gotten a lot worse since I left that
business, but I would sure hope it wouldn't get magnitudes worse.

So 2-3 months seems really long to me.

thanks,

greg k-h
