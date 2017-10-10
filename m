From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v6 13/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Tue, 10 Oct 2017 15:57:43 +0200
Message-ID: <20171010135743.GC8662@kroah.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <897883f9b8c45dc2cb24de1bb4642513734852d3.1507589249.git.mario.limonciello@dell.com>
 <20171010110637.GB16994@kroah.com>
 <db8c80d86c7045fd95e8f91f777cd680@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <db8c80d86c7045fd95e8f91f777cd680@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 10, 2017 at 01:41:45PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Greg KH [mailto:greg@kroah.com]
> > Sent: Tuesday, October 10, 2017 6:07 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> > Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> > pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> > Subject: Re: [PATCH v6 13/14] platform/x86: wmi: create character devices when
> > requested by drivers
> > 
> > On Mon, Oct 09, 2017 at 05:51:51PM -0500, Mario Limonciello wrote:
> > > --- /dev/null
> > > +++ b/include/uapi/linux/wmi.h
> > > @@ -0,0 +1,19 @@
> > > +/*
> > > + *  User API methods for ACPI-WMI mapping driver
> > > + *
> > > + *  Copyright (C) 2017 Dell, Inc.
> > > + *
> > > + *  This program is free software; you can redistribute it and/or modify
> > > + *  it under the terms of the GNU General Public License version 2 as
> > > + *  published by the Free Software Foundation.
> > > + */
> > > +#ifndef _UAPI_LINUX_WMI_H
> > > +#define _UAPI_LINUX_WMI_H
> > > +
> > > +#define WMI_IOC 'W'
> > > +#define WMI_IO(instance)		_IO(WMI_IOC, instance)
> > > +#define WMI_IOR(instance, type)		_IOR(WMI_IOC, instance, type)
> > > +#define WMI_IOW(instance, type)		_IOW(WMI_IOC, instance, type)
> > > +#define WMI_IOWR(instance, type)	_IOWR(WMI_IOC, instance, type)
> > 
> > Are these really needed in a uapi .h file?  Who needs them?  And why not
> > just use a "normal" ioctl macro in your individual driver .h file?  Do
> > these really help?
> > 
> Since this is setting precedent that WMI drivers will use the IOC 'W' and the WMI
> bus driver will dispatch calls to the proper drivers, I think they make sense to include.

But who will use those macros?  Those drivers?

As the individual drivers have to define the correct "instance, type",
this seems like a header file that is wrapping things unnecessarily.
Why not just put all of the needed WMI ioctls in a single file, one for
all of the drivers?  No need to have special per-driver ioctl .h files,
right?

thanks,

greg k-h
