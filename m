From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Thu, 5 Oct 2017 20:47:28 +0200
Message-ID: <20171005184728.GB9713@kroah.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
 <20171005071619.GA25960@kroah.com>
 <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
 <20171005154214.GB29347@kroah.com>
 <20171005155156.GZ10938@pali>
 <20171005162628.GA4993@kroah.com>
 <20171005173925.GD31452@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50233 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751421AbdJESrU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 14:47:20 -0400
Content-Disposition: inline
In-Reply-To: <20171005173925.GD31452@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Mario.Limonciello@dell.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Thu, Oct 05, 2017 at 10:39:25AM -0700, Darren Hart wrote:
> > It does, thanks.  And as we now understand it (I'm guessing it had to be
> > semi-understood in the older wmi drivers already), validating it
> > properly seems to be the key for creating an interface that we "know" to
> > be safe.
> > 
> 
> We don't use the MOF data in any of the existing wmi drivers, because
> they are all oddities which map to kernel managed subsystems (hotkeys,
> LED control, RF Kill switches) rather than what WMI (Windows
> Manageability Interface) was designed for. The intent of these patches
> to enable that management aspect of the platform.
> 
> This is the biggest hurdle for WMI support.
> 
> WMI was designed to bypass the OS, and is used in consumer devices
> intended to run Windows. This leads to an interface that is very vendor
> specific and not consistently broken up into nice functional blocks.
> 
> Vendors would like to use this interface in Linux as it is being used in
> Windows. Specifically, they want to be able to have a generic system in
> the kernel which allows the WMI mechanism to be used by userspace,
> without the need to patch the kernel for every platform.

And how _exactly_ is this interface exposed in Windows?  Is it ad-hoc
with custom kernel drivers written by each vendor?  Or does the OS
provide a "sane" interface for it?

> This conflicts with the Linux approach, and I've worked with Mario,
> Pali, and others to try to bridge this gap with something more
> acceptable.
> 
> MOF parsing is typically done in userspace, but by doing it in the
> kernel, we can do at least some amount of message auditing within the
> kernel in a generic way. So long as vendors continue using the same
> GUIDs and provide proper MOF data, the kernel wouldn't need to be
> changed. New GUIDs require new drivers, which must create the function
> ops to get the char device created.
> 
> I thought this served as a pragmatic bridge between the two approaches.

The code as-is isn't a bridge at all, it's a pass-through tunnel with no
tollbooth.  No parsing is being done that I can see here (if it is,
where exactly was it done?)

> This particular driver, doesn't have the benefit of the MOF data. It is
> a halfway point intended to eliminate the SMI access to SMBIOS and
> replace it with the WMI access, which uses an op region instead of
> passing a physical memory pointer to SMM - but doesn't improve on the
> message audit of the existing mechanism (but it shouldn't make it any
> worse either).

Again, it looks just to be a pass-through, no validation happening at
all, with a random "blob" appended that userspace knows all about, and
the BIOS knows about, but the kernel has no clue.  Given that the kernel
is what is there to protect the BIOS from userspace, that feels really
wrong.

Again, I like my TPM to work, and I don't want a random rootkit exploit
to be able to destroy it :)

thanks,

greg k-h
