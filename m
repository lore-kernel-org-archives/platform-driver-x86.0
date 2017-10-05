From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Thu, 5 Oct 2017 17:51:56 +0200
Message-ID: <20171005155156.GZ10938@pali>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
 <20171005071619.GA25960@kroah.com>
 <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
 <20171005154214.GB29347@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:47092 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751369AbdJEPwA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 11:52:00 -0400
Content-Disposition: inline
In-Reply-To: <20171005154214.GB29347@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Mario.Limonciello@dell.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Thursday 05 October 2017 17:42:14 Greg KH wrote:
> > > > --- /dev/null
> > > > +++ b/include/uapi/linux/wmi.h
> > > > @@ -0,0 +1,10 @@
> > > > +#ifndef _UAPI_LINUX_WMI_H
> > > > +#define _UAPI_LINUX_WMI_H
> > > > +
> > > > +#define WMI_IOC 'W'
> > > > +#define WMI_IO(instance)	_IO(WMI_IOC, instance)
> > > > +#define WMI_IOR(instance)	_IOR(WMI_IOC, instance, void*)
> > > > +#define WMI_IOW(instance)	_IOW(WMI_IOC, instance, void*)
> > > > +#define WMI_IOWR(instance)	_IOWR(WMI_IOC, instance, void*)
> > > 
> > > Ugh, void *, this is going to be "fun"...
> > > 
> > > My comments on just how fun is left for the actual driver that attempted
> > > to implement these...
> > > 
> > 
> > So until in kernel MOF parsing is available you can't predict the format of
> > what an individual ACPI method will expect for its input.  Even when the in
> > kernel MOF parsing is made available the data types may be complex structures.
> 
> 
> I have no idea what MOF is, what "parsing" is involved, or how in the
> world ACPI got involved here...
> 
> good luck!
> 
> greg k-h

Hi Greg! Simple description: In ACPI is stored binary MOF buffer which
describe format (function name, parameters, sizeof and type of
parameters, etc) for all those calls.

Basically it is what should be used for checking if userspace pass
correct "buffer" via ioctl to WMI.

But that binary MOF is undocumented, invented by Microsoft... and
present in every one ACPI BIOS notebook (which uses WMI). It is
de-facto industrial standard, just tools for encoding/decoding it are
only for Microsoft Windows systems.

I was able to decipher that format and wrote simple userspace parser:
https://github.com/pali/bmfdec

Funny part is that format is not encrypted, but compressed by DMSDOS
compatible compression algorithm :-) You probably would remember old
FAT16 days with compression...

Hope that it helps you to understand it.

-- 
Pali Rohár
pali.rohar@gmail.com
