From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce character
 device for userspace
Date: Thu, 5 Oct 2017 15:10:01 +0000
Message-ID: <07c7532f9cb44aa3a0999644d6aadacc@ausx13mpc120.AMER.DELL.COM>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <4a91eb76afa9cce7060bc30f5313d64bd51b66ca.1506571188.git.mario.limonciello@dell.com>
 <20171003092611.GC13295@kroah.com> <20171003152010.GB14523@fury>
 <5cbdbc85d3e14880a187dfb8f76b1745@ausx13mpc120.AMER.DELL.COM>
 <20171005000235.GA25018@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:62698 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750965AbdJEPKD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 11:10:03 -0400
In-Reply-To: <20171005000235.GA25018@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: greg@kroah.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, October 4, 2017 7:03 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: greg@kroah.com; andy.shevchenko@gmail.com; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; luto@kernel.=
org;
> quasisec@google.com; pali.rohar@gmail.com
> Subject: Re: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce char=
acter
> device for userspace
>=20
> On Tue, Oct 03, 2017 at 03:49:04PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Darren Hart [mailto:dvhart@infradead.org]
> > > Sent: Tuesday, October 3, 2017 10:20 AM
> > > To: Greg KH <greg@kroah.com>
> > > Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>; Andy Shevchenko
> > > <andy.shevchenko@gmail.com>; LKML <linux-kernel@vger.kernel.org>;
> > > platform-driver-x86@vger.kernel.org; Andy Lutomirski <luto@kernel.org=
>;
> > > quasisec@google.com; pali.rohar@gmail.com
> > > Subject: Re: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce
> character
> > > device for userspace
> > >
> > > On Tue, Oct 03, 2017 at 11:26:11AM +0200, Greg KH wrote:
> > > > On Wed, Sep 27, 2017 at 11:02:17PM -0500, Mario Limonciello wrote:
> > > > > +static int dell_wmi_smbios_open(struct inode *inode, struct file=
 *file)
> > > > > +{
> > > > > +	return nonseekable_open(inode, file);
> > > > > +}
> > > > > +
> > > > > +static int dell_wmi_smbios_release(struct inode *inode, struct f=
ile *file)
> > > > > +{
> > > > > +	return 0;
> > > > > +}
> > > >
> > > > Why even declare an open/release if you don't do anything with them=
?
> > > > Just leave them empty.
> > > >
> > > > > +static long dell_wmi_smbios_ioctl(struct file *filp, unsigned in=
t cmd,
> > > > > +	unsigned long arg)
> > > > > +{
> > > > > +	void __user *p =3D (void __user *) arg;
> > > > > +	size_t size;
> > > > > +	int ret =3D 0;
> > > > > +
> > > > > +	if (_IOC_TYPE(cmd) !=3D DELL_WMI_SMBIOS_IOC)
> > > > > +		return -ENOTTY;
> > > > > +
> > > > > +	switch (cmd) {
> > > > > +	case DELL_WMI_SMBIOS_CALL_CMD:
> > > > > +		size =3D sizeof(struct wmi_calling_interface_buffer);
> > > > > +		mutex_lock(&buffer_mutex);
> > > > > +		if (copy_from_user(devfs_buffer, p, size)) {
> > > > > +			ret =3D -EFAULT;
> > > > > +			goto fail_smbios_cmd;
> > > > > +		}
> > > > > +		ret =3D run_wmi_smbios_call(devfs_buffer);
> > > >
> > > > You _are_ checking that your structures are valid here, right?  I d=
idn't
> > > > see you really were, so I'll let you go audit your code paths for t=
he
> > > > next set of patches.
> > > >
> > > > But really, ugh, this seems horrible.  It's a huge vague data blob =
going
> > > > both ways, this feels ripe for abuse and other bad things.  Do you =
have
> > > > a working userspace implementation for all of this to publish at th=
e
> > > > same time?
> > > >
> > >
> > > This is the general challenge with WMI support, as it was designed to
> > > provide userspace with a way to talk to the firmware.
> > >
> > > For the more general case going forward the intent is to perform the =
MOF
> > > parsing in the kernel, which will make it possible to do some automat=
ed
> > > buffer validation.
> > >
> > > This particular driver is an intermediate step improving on the
> > > mechanism used for existing devices (libsmbios -> dcdbas -> SMM) to u=
se
> > > the safer WMI entry point (using an op region instead of passing a
> > > physical memory pointer to SMM).
> > >
> > > But, that said... Mario, in lieu of the MOF description of the buffer=
,
> > > we should be able to do some driver specific validation of this buffe=
r
> > > here.
> > >
> >
> > As the WMI interface exists today even the MOF doesn't describe the
> > Content of the buffer either.  It's a buffer passed from userspace to B=
IOS and
> > back.  I described it as the struct, but I'm not really sure how that c=
an
> > be further validated by the Linux kernel without a checksum.
> > This is no different than how dell-smbios and dcdbas operates.
>=20
> The notation about equivalence with the dell-smbios and dcdbas
> implementation is a valid one. If all we do is move this to a WMI
> managed access to SMBIOS and move away from the SMI based one, this is
> still an improvement for difference in how memory is passed around as
> described above.
>=20
> I don't think a checksum will help with the concerns Greg is raising. A
> userspace generated checksum only tells the kernel that what is in the
> buffer is what userpsace intended. Similarly for the buffer coming back
> from SMM.
>=20
> Generally speaking, the kernel would want to validate data passing to
> and from userspace and firmware - which WMI was designed to circumvent.
>=20
> Mario:
> Are there no specific bits that can be sanity checked? No reserved bits
> in the buffer format? No Command Codes with a known range of values?
>=20
Looking through the spec, I think I should be able to let the kernel check =
if=20
the particular class is supported on the system when the call is made. =20
Assuming that works I'll add something in v5.

This might also be useful for something like dell-laptop to check if the cl=
asses
its using are supported (and soften the blow up when new WMI interfaces
are introduced).

> > New interfaces will have description that is parsable by MOF.
>=20
> And to elaborate here. The above is about an improvement to the
> dell-smbios driver for existing platforms which do not have available
> MOF data. For platforms that do provide MOF data, we're working toward
> moving the MOF parser into the kernel (rather than leaving it in
> userspace as it was designed to be) which will afford the kernel more
> oversight of these messages.
>=20
> This series is an incremental improvement until the above is ready - but
> it does lay out some of the ground work which we want to get agreement
> on, mostly from patch 4 of 8 in the series:
>=20
> 1) The char dev IOCTL model for calling WMI methods
>=20
> 2) The /dev/wmi/<driver> path for the char dev
>=20
> 3) The function ops approach for WMI drivers to request the char dev
>    from the WMI bus
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
