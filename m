From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v6 13/14] platform/x86: wmi: create character devices when
 requested by drivers
Date: Tue, 10 Oct 2017 13:41:45 +0000
Message-ID: <db8c80d86c7045fd95e8f91f777cd680@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <897883f9b8c45dc2cb24de1bb4642513734852d3.1507589249.git.mario.limonciello@dell.com>
 <20171010110637.GB16994@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:13827 "EHLO
        esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755919AbdJJNls (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 09:41:48 -0400
In-Reply-To: <20171010110637.GB16994@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Tuesday, October 10, 2017 6:07 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v6 13/14] platform/x86: wmi: create character devices=
 when
> requested by drivers
>=20
> On Mon, Oct 09, 2017 at 05:51:51PM -0500, Mario Limonciello wrote:
> > --- /dev/null
> > +++ b/include/uapi/linux/wmi.h
> > @@ -0,0 +1,19 @@
> > +/*
> > + *  User API methods for ACPI-WMI mapping driver
> > + *
> > + *  Copyright (C) 2017 Dell, Inc.
> > + *
> > + *  This program is free software; you can redistribute it and/or modi=
fy
> > + *  it under the terms of the GNU General Public License version 2 as
> > + *  published by the Free Software Foundation.
> > + */
> > +#ifndef _UAPI_LINUX_WMI_H
> > +#define _UAPI_LINUX_WMI_H
> > +
> > +#define WMI_IOC 'W'
> > +#define WMI_IO(instance)		_IO(WMI_IOC, instance)
> > +#define WMI_IOR(instance, type)		_IOR(WMI_IOC, instance, type)
> > +#define WMI_IOW(instance, type)		_IOW(WMI_IOC, instance, type)
> > +#define WMI_IOWR(instance, type)	_IOWR(WMI_IOC, instance, type)
>=20
> Are these really needed in a uapi .h file?  Who needs them?  And why not
> just use a "normal" ioctl macro in your individual driver .h file?  Do
> these really help?
>=20
Since this is setting precedent that WMI drivers will use the IOC 'W' and t=
he WMI
bus driver will dispatch calls to the proper drivers, I think they make sen=
se to include.

I'm a little unclear - do you disagree?  Or do you just think I need to inc=
lude a comment
in the header file with this information?

Thanks,
