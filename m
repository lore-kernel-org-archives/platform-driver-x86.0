From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Thu, 5 Oct 2017 18:26:28 +0200
Message-ID: <20171005162628.GA4993@kroah.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
 <20171005071619.GA25960@kroah.com>
 <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
 <20171005154214.GB29347@kroah.com>
 <20171005155156.GZ10938@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38045 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751144AbdJEQ0W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 12:26:22 -0400
Content-Disposition: inline
In-Reply-To: <20171005155156.GZ10938@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Mario.Limonciello@dell.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Thu, Oct 05, 2017 at 05:51:56PM +0200, Pali Rohár wrote:
> On Thursday 05 October 2017 17:42:14 Greg KH wrote:
> > > > > --- /dev/null
> > > > > +++ b/include/uapi/linux/wmi.h
> > > > > @@ -0,0 +1,10 @@
> > > > > +#ifndef _UAPI_LINUX_WMI_H
> > > > > +#define _UAPI_LINUX_WMI_H
> > > > > +
> > > > > +#define WMI_IOC 'W'
> > > > > +#define WMI_IO(instance)	_IO(WMI_IOC, instance)
> > > > > +#define WMI_IOR(instance)	_IOR(WMI_IOC, instance, void*)
> > > > > +#define WMI_IOW(instance)	_IOW(WMI_IOC, instance, void*)
> > > > > +#define WMI_IOWR(instance)	_IOWR(WMI_IOC, instance, void*)
> > > > 
> > > > Ugh, void *, this is going to be "fun"...
> > > > 
> > > > My comments on just how fun is left for the actual driver that attempted
> > > > to implement these...
> > > > 
> > > 
> > > So until in kernel MOF parsing is available you can't predict the format of
> > > what an individual ACPI method will expect for its input.  Even when the in
> > > kernel MOF parsing is made available the data types may be complex structures.
> > 
> > 
> > I have no idea what MOF is, what "parsing" is involved, or how in the
> > world ACPI got involved here...
> > 
> > good luck!
> > 
> > greg k-h
> 
> Hi Greg! Simple description: In ACPI is stored binary MOF buffer which
> describe format (function name, parameters, sizeof and type of
> parameters, etc) for all those calls.
> 
> Basically it is what should be used for checking if userspace pass
> correct "buffer" via ioctl to WMI.
> 
> But that binary MOF is undocumented, invented by Microsoft... and
> present in every one ACPI BIOS notebook (which uses WMI). It is
> de-facto industrial standard, just tools for encoding/decoding it are
> only for Microsoft Windows systems.
> 
> I was able to decipher that format and wrote simple userspace parser:
> https://github.com/pali/bmfdec
> 
> Funny part is that format is not encrypted, but compressed by DMSDOS
> compatible compression algorithm :-) You probably would remember old
> FAT16 days with compression...
> 
> Hope that it helps you to understand it.

It does, thanks.  And as we now understand it (I'm guessing it had to be
semi-understood in the older wmi drivers already), validating it
properly seems to be the key for creating an interface that we "know" to
be safe.

thanks,

greg k-h
