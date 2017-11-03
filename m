From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v12 00/16] Introduce support for Dell SMBIOS over WMI
Date: Fri, 3 Nov 2017 21:02:17 +0000
Message-ID: <4b6dc569c44b4e60a1a3ba6bfe784653@ausx13mpc124.AMER.DELL.COM>
References: <cover.1509561822.git.mario.limonciello@dell.com>
 <20171103005025.GA7971@fury>
 <3ee790eeb8e242f2a064905074777674@ausx13mpc124.AMER.DELL.COM>
 <20171103210035.GA21142@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:46359 "EHLO
        esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752284AbdKCVCV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2017 17:02:21 -0400
In-Reply-To: <20171103210035.GA21142@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com, gnomes@lxorguk.ukuu.org.uk

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, November 3, 2017 4:01 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: andy.shevchenko@gmail.com; linux-kernel@vger.kernel.org; platform-dri=
ver-
> x86@vger.kernel.org; luto@kernel.org; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de;
> greg@kroah.com; gnomes@lxorguk.ukuu.org.uk
> Subject: Re: [PATCH v12 00/16] Introduce support for Dell SMBIOS over WMI
>=20
> On Fri, Nov 03, 2017 at 04:30:13PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Darren Hart [mailto:dvhart@infradead.org]
> > > Sent: Thursday, November 2, 2017 7:50 PM
> > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> > > kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy
> Lutomirski
> > > <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.com;
> > > rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Greg KH
> <greg@kroah.com>;
> > > Alan Cox <gnomes@lxorguk.ukuu.org.uk>
> > > Subject: Re: [PATCH v12 00/16] Introduce support for Dell SMBIOS over=
 WMI
> > >
> > > On Wed, Nov 01, 2017 at 02:25:21PM -0500, Mario Limonciello wrote:
> > > > The existing way that the dell-smbios helper module and associated
> > > > other drivers (dell-laptop, dell-wmi) communicate with the platform
> > > > really isn't secure.  It requires creating a buffer in physical
> > > > DMA32 memory space and passing that to the platform via SMM.
> > > >
> > > > Since the platform got a physical memory pointer, you've just got
> > > > to trust that the platform has only modified (and accessed) memory
> > > > within that buffer.
> > > >
> > > > Dell Platform designers recognize this security risk and offer a
> > > > safer way to communicate with the platform over ACPI.  This is
> > > > in turn exposed via a WMI interface to the OS.
> > > >
> > > > When communicating over WMI-ACPI the communication doesn't occur
> > > > with physical memory pointers.  When the ASL is invoked, the fixed
> > > > length ACPI buffer is copied to a small operating region.  The ASL
> > > > will invoke the SMI, and SMM will only have access to this operatin=
g
> > > > region.  When the ASL returns the buffer is copied back for the OS
> > > > to process.
> > > >
> > > > This method of communication should also deprecate the usage of the
> > > > dcdbas kernel module and software dependent upon it's interface.
> > > > Instead offer a character device interface for communicating with t=
his
> > > > ASL method to allow userspace to use instead.
> > > >
> > > > To faciliate that this patch series introduces a generic way for WM=
I
> > > > drivers to be able to create discoverable character devices with
> > > > a predictable IOCTL interface through the WMI bus when desired.
> > > > Requiring WMI drivers to explicitly ask for this functionality will
> > > > act as an effective vendor whitelist to character device creation.
> > > >
> > > > Some of this work is the basis for what will be a proper interprete=
r
> > > > of MOF in the kernel and controls for what drivers will be able to
> > > > do with that MOF.
> > > >
> > > > NOTE: This patch series is intended to go on top of platform-driver=
s-x86
> > > > linux-next.
> > > >
> > > > For convenience the entire series including those is also available=
 here:
> > > > https://github.com/dell/linux/tree/wmi-smbios
> > >
> > > Queued for testing, thanks Mario.
> > >
> > > --
> > > Darren Hart
> > > VMware Open Source Technology Center
> >
> > Thanks Darren.  BTW Did you forget to push?  I didn't see it at the tes=
ting branch:
> > http://git.infradead.org/users/dvhart/linux-platform-drivers-
> x86.git/shortlog/refs/heads/testing
> >
> > Thanks,
> >
>=20
> The workflow currently goes first to review-dvhart, which 0-day will pull=
 from,
> then to testing for integration, then to for-next. I plan to move it to t=
esting
> today.

Gotcha, thanks.
