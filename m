From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Thu, 5 Oct 2017 10:39:25 -0700
Message-ID: <20171005173925.GD31452@fury>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
 <20171005071619.GA25960@kroah.com>
 <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
 <20171005154214.GB29347@kroah.com>
 <20171005155156.GZ10938@pali>
 <20171005162628.GA4993@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171005162628.GA4993@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Mario.Limonciello@dell.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 05, 2017 at 06:26:28PM +0200, Greg KH wrote:
> On Thu, Oct 05, 2017 at 05:51:56PM +0200, Pali Rohár wrote:
> > On Thursday 05 October 2017 17:42:14 Greg KH wrote:
> > > > > > --- /dev/null
> > > > > > +++ b/include/uapi/linux/wmi.h
> > > > > > @@ -0,0 +1,10 @@
> > > > > > +#ifndef _UAPI_LINUX_WMI_H
> > > > > > +#define _UAPI_LINUX_WMI_H
> > > > > > +
> > > > > > +#define WMI_IOC 'W'
> > > > > > +#define WMI_IO(instance)	_IO(WMI_IOC, instance)
> > > > > > +#define WMI_IOR(instance)	_IOR(WMI_IOC, instance, void*)
> > > > > > +#define WMI_IOW(instance)	_IOW(WMI_IOC, instance, void*)
> > > > > > +#define WMI_IOWR(instance)	_IOWR(WMI_IOC, instance, void*)
> > > > > 
> > > > > Ugh, void *, this is going to be "fun"...
> > > > > 
> > > > > My comments on just how fun is left for the actual driver that attempted
> > > > > to implement these...
> > > > > 
> > > > 
> > > > So until in kernel MOF parsing is available you can't predict the format of
> > > > what an individual ACPI method will expect for its input.  Even when the in
> > > > kernel MOF parsing is made available the data types may be complex structures.
> > > 
> > > 
> > > I have no idea what MOF is, what "parsing" is involved, or how in the
> > > world ACPI got involved here...
> > > 
> > > good luck!
> > > 
> > > greg k-h
> > 
> > Hi Greg! Simple description: In ACPI is stored binary MOF buffer which
> > describe format (function name, parameters, sizeof and type of
> > parameters, etc) for all those calls.
> > 
> > Basically it is what should be used for checking if userspace pass
> > correct "buffer" via ioctl to WMI.
> > 
> > But that binary MOF is undocumented, invented by Microsoft... and
> > present in every one ACPI BIOS notebook (which uses WMI). It is
> > de-facto industrial standard, just tools for encoding/decoding it are
> > only for Microsoft Windows systems.
> > 
> > I was able to decipher that format and wrote simple userspace parser:
> > https://github.com/pali/bmfdec
> > 
> > Funny part is that format is not encrypted, but compressed by DMSDOS
> > compatible compression algorithm :-) You probably would remember old
> > FAT16 days with compression...
> > 
> > Hope that it helps you to understand it.
> 
> It does, thanks.  And as we now understand it (I'm guessing it had to be
> semi-understood in the older wmi drivers already), validating it
> properly seems to be the key for creating an interface that we "know" to
> be safe.
> 

We don't use the MOF data in any of the existing wmi drivers, because
they are all oddities which map to kernel managed subsystems (hotkeys,
LED control, RF Kill switches) rather than what WMI (Windows
Manageability Interface) was designed for. The intent of these patches
to enable that management aspect of the platform.

This is the biggest hurdle for WMI support.

WMI was designed to bypass the OS, and is used in consumer devices
intended to run Windows. This leads to an interface that is very vendor
specific and not consistently broken up into nice functional blocks.

Vendors would like to use this interface in Linux as it is being used in
Windows. Specifically, they want to be able to have a generic system in
the kernel which allows the WMI mechanism to be used by userspace,
without the need to patch the kernel for every platform.

This conflicts with the Linux approach, and I've worked with Mario,
Pali, and others to try to bridge this gap with something more
acceptable.

MOF parsing is typically done in userspace, but by doing it in the
kernel, we can do at least some amount of message auditing within the
kernel in a generic way. So long as vendors continue using the same
GUIDs and provide proper MOF data, the kernel wouldn't need to be
changed. New GUIDs require new drivers, which must create the function
ops to get the char device created.

I thought this served as a pragmatic bridge between the two approaches.

This particular driver, doesn't have the benefit of the MOF data. It is
a halfway point intended to eliminate the SMI access to SMBIOS and
replace it with the WMI access, which uses an op region instead of
passing a physical memory pointer to SMM - but doesn't improve on the
message audit of the existing mechanism (but it shouldn't make it any
worse either).

-- 
Darren Hart
VMware Open Source Technology Center
