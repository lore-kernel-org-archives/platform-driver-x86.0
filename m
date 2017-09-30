From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 0/8] Introduce support for Dell SMBIOS over WMI
Date: Sat, 30 Sep 2017 19:56:33 +0000
Message-ID: <bff1f575d2d44b79ba9636433f19df9d@ausx13mpc120.AMER.DELL.COM>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <20170930021657.GF13307@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa8.dell-outbound.iphmx.com ([68.232.149.218]:48176 "EHLO
        esa8.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751099AbdI3T4u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Sep 2017 15:56:50 -0400
In-Reply-To: <20170930021657.GF13307@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, September 29, 2017 9:17 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy Lutomi=
rski
> <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.com
> Subject: Re: [PATCH v3 0/8] Introduce support for Dell SMBIOS over WMI
>=20
> On Wed, Sep 27, 2017 at 11:02:12PM -0500, Mario Limonciello wrote:
> > The existing way that the dell-smbios helper module and associated
> > other drivers (dell-laptop, dell-wmi) communicate with the platform
> > really isn't secure.  It requires creating a buffer in physical
> > DMA32 memory space and passing that to the platform via SMM.
> >
> > Since the platform got a physical memory pointer, you've just got
> > to trust that the platform has only modified (and accessed) memory
> > within that buffer.
> >
> > Dell Platform designers recognize this security risk and offer a
> > safer way to communicate with the platform over ACPI.  This is
> > in turn exposed via a WMI interface to the OS.
> >
> > When communicating over WMI-ACPI the communication doesn't occur
> > with physical memory pointers.  When the ASL is invoked, the fixed
> > length ACPI buffer is copied to a small operating region.  The ASL
> > will invoke the SMI, and SMM will only have access to this operating
> > region.  When the ASL returns the buffer is copied back for the OS
> > to process.
> >
> > This method of communication should also deprecate the usage of the
> > dcdbas kernel module and software dependent upon it's interface.
> > Instead offer a character device interface for communicating with this
> > ASL method to allow userspace to use instead.
> >
> > To faciliate that this patch series introduces a generic way for WMI
> > drivers to be able to create discoverable character devices through
> > the WMI bus when desired.
> > Requiring WMI drivers to explicitly ask for this functionality will
> > act as an effective vendor whitelist to character device creation.
> >
>=20
> Mario,
>=20
> Looking pretty good in general.
Darren,

Thanks.

>=20
> My biggest concern is around the dell-smbios.c "buffer" logic which is
> starting to look really hacked together as it tries to deal with the
> existing interface and the new WMI interface. Really seems like we
> should be able to introduce one level of abstraction that would clean it
> up. If not - can you explain your rationale in that patch?
>=20

I've got some changes that I'm working out issues with still that do it lik=
e
one of Pali's proposals.  It creates the WMI buffer associated to the WMI
device in a private memory structure.  Then the WMI remove function
will be responsible to clean it up.  So on unload no if/else magic.
During initialization I am reading a different flag from SMBIOS tables=20
to tell if we'll support WMI or not even if the WMI device hasn't yet
been enumerated.  This approach will allow unbinding and rebinding
WMI without causing problems.

Does that sound better?  If not, can you please give me some more
direction on what you mean by one level of abstraction?  The "decision"
of which to handle will have to live somewhere so there's going to have
to be some if/else logic to know which way to go even if you abstract
further up.

> My other concern is the freeform structure around creating the file
> operations in each driver for the chardev IOCTL. It seems like we need
> some kind of defined mapping from METHOD index to IOCTL number, or else
> some way to advertise what it is?
>=20

I was originally thinking it would be a good way to do this cleanly too, bu=
t my=20
main concern is this one character device may handle multiple methods probl=
em.
If you map method instance (index) to ioctl number you will most likely run=
 into=20
clashes.  So maybe it's worth not allowing that?

So I've got another idea.  How about instead of a variety of freeform ioctl=
 per driver,
provide three ioctl functions for all the character devices that come in th=
rough
the WMI bus to use (say IOC 'W') with either read, write or write/read.  Th=
e WMI bus
should be able to know which driver to pass it on to by the character devic=
e used.

That example I mentioned the one character device for a driver with 3 diffe=
rent GUIDs
that could contain methods would require then splitting it up into say 3 di=
fferent drivers
with 3 different character devices.

Otherwise this might still require some creative thinking.
