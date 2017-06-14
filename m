From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: WMI and Kernel:User interface
Date: Wed, 14 Jun 2017 06:38:53 +0200
Message-ID: <20170614043853.GE10146@kroah.com>
References: <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
 <20170613153857.GC27850@fury>
 <20170613155000.GA24483@kroah.com>
 <20170613162242.GF27850@fury>
 <20170613165247.GA32546@kroah.com>
 <20170613170719.GK27850@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:41144 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750728AbdFNEjD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Jun 2017 00:39:03 -0400
Content-Disposition: inline
In-Reply-To: <20170613170719.GK27850@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 10:07:19AM -0700, Darren Hart wrote:
> On Tue, Jun 13, 2017 at 06:52:47PM +0200, Greg Kroah-Hartman wrote:
> > > As a concrete example, Dell has specifically made the request that we
> > > work on a solution that doesn't require them to come back to the kernel
> > > community each time they add a WMI GUID to their BIOS. They would like
> > > to see those GUIDs automatically exposed.
> > 
> > What do you mean exactly by "exposed"?  What do they do with these?  Why
> 
> By exposed I meant: the chardev for the WMI GUID is created
> 
> The idea being the kernel maps WMI GUIDs to chardevs and shepherds the
> userspace calls through to the ACPI method evaluation and back. But the
> kernel wmi driver doesn't, in general, have specific knowledge of the
> methods or input and output formats.

Hah, and those people who insist on "secure boot" are going to allow
userspace access to ACPI methods like this?  Well, I guess as Windows
does it, it must be ok...

I'll shut up now and just wait for patches :)

thanks,

greg k-h
