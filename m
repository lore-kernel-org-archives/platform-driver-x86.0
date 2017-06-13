From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 10:07:19 -0700
Message-ID: <20170613170719.GK27850@fury>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
 <20170613153857.GC27850@fury>
 <20170613155000.GA24483@kroah.com>
 <20170613162242.GF27850@fury>
 <20170613165247.GA32546@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:32803 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751805AbdFMRHY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 13:07:24 -0400
Content-Disposition: inline
In-Reply-To: <20170613165247.GA32546@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 06:52:47PM +0200, Greg Kroah-Hartman wrote:
> > As a concrete example, Dell has specifically made the request that we
> > work on a solution that doesn't require them to come back to the kernel
> > community each time they add a WMI GUID to their BIOS. They would like
> > to see those GUIDs automatically exposed.
> 
> What do you mean exactly by "exposed"?  What do they do with these?  Why

By exposed I meant: the chardev for the WMI GUID is created

The idea being the kernel maps WMI GUIDs to chardevs and shepherds the
userspace calls through to the ACPI method evaluation and back. But the
kernel wmi driver doesn't, in general, have specific knowledge of the
methods or input and output formats.

The existing drivers being the exception to "specific knowledge", and
the cause of all this filter/proxy discussion. I think we have enough
that we can put together an initial patch series, and then discuss it
there.

> isn't the Dell pre-install team sending patches for this like the
> Windows preinstall team is doing for their hacked-to-hell copy of
> Windows?  :)
> 
> Do you have an example patch of something that was needed to get a Dell
> laptop working for a new device id that didn't work this way?

Per Mario's comment, it sounds like they are and it does work this way.
It takes 8 weeks, and they don't see a reason to go through this for WMI
GUIDs.

-- 
Darren Hart
VMware Open Source Technology Center
