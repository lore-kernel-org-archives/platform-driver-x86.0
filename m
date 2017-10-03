From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce character
 device for userspace
Date: Tue, 3 Oct 2017 15:49:04 +0000
Message-ID: <5cbdbc85d3e14880a187dfb8f76b1745@ausx13mpc120.AMER.DELL.COM>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <4a91eb76afa9cce7060bc30f5313d64bd51b66ca.1506571188.git.mario.limonciello@dell.com>
 <20171003092611.GC13295@kroah.com> <20171003152010.GB14523@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:31172 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751132AbdJCPtK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Oct 2017 11:49:10 -0400
In-Reply-To: <20171003152010.GB14523@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, greg@kroah.com
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Tuesday, October 3, 2017 10:20 AM
> To: Greg KH <greg@kroah.com>
> Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>; Andy Shevchenko
> <andy.shevchenko@gmail.com>; LKML <linux-kernel@vger.kernel.org>;
> platform-driver-x86@vger.kernel.org; Andy Lutomirski <luto@kernel.org>;
> quasisec@google.com; pali.rohar@gmail.com
> Subject: Re: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce char=
acter
> device for userspace
>=20
> On Tue, Oct 03, 2017 at 11:26:11AM +0200, Greg KH wrote:
> > On Wed, Sep 27, 2017 at 11:02:17PM -0500, Mario Limonciello wrote:
> > > +static int dell_wmi_smbios_open(struct inode *inode, struct file *fi=
le)
> > > +{
> > > +	return nonseekable_open(inode, file);
> > > +}
> > > +
> > > +static int dell_wmi_smbios_release(struct inode *inode, struct file =
*file)
> > > +{
> > > +	return 0;
> > > +}
> >
> > Why even declare an open/release if you don't do anything with them?
> > Just leave them empty.
> >
> > > +static long dell_wmi_smbios_ioctl(struct file *filp, unsigned int cm=
d,
> > > +	unsigned long arg)
> > > +{
> > > +	void __user *p =3D (void __user *) arg;
> > > +	size_t size;
> > > +	int ret =3D 0;
> > > +
> > > +	if (_IOC_TYPE(cmd) !=3D DELL_WMI_SMBIOS_IOC)
> > > +		return -ENOTTY;
> > > +
> > > +	switch (cmd) {
> > > +	case DELL_WMI_SMBIOS_CALL_CMD:
> > > +		size =3D sizeof(struct wmi_calling_interface_buffer);
> > > +		mutex_lock(&buffer_mutex);
> > > +		if (copy_from_user(devfs_buffer, p, size)) {
> > > +			ret =3D -EFAULT;
> > > +			goto fail_smbios_cmd;
> > > +		}
> > > +		ret =3D run_wmi_smbios_call(devfs_buffer);
> >
> > You _are_ checking that your structures are valid here, right?  I didn'=
t
> > see you really were, so I'll let you go audit your code paths for the
> > next set of patches.
> >
> > But really, ugh, this seems horrible.  It's a huge vague data blob goin=
g
> > both ways, this feels ripe for abuse and other bad things.  Do you have
> > a working userspace implementation for all of this to publish at the
> > same time?
> >
>=20
> This is the general challenge with WMI support, as it was designed to
> provide userspace with a way to talk to the firmware.
>=20
> For the more general case going forward the intent is to perform the MOF
> parsing in the kernel, which will make it possible to do some automated
> buffer validation.
>=20
> This particular driver is an intermediate step improving on the
> mechanism used for existing devices (libsmbios -> dcdbas -> SMM) to use
> the safer WMI entry point (using an op region instead of passing a
> physical memory pointer to SMM).
>=20
> But, that said... Mario, in lieu of the MOF description of the buffer,
> we should be able to do some driver specific validation of this buffer
> here.
>=20

As the WMI interface exists today even the MOF doesn't describe the=20
Content of the buffer either.  It's a buffer passed from userspace to BIOS =
and
back.  I described it as the struct, but I'm not really sure how that can
be further validated by the Linux kernel without a checksum.
This is no different than how dell-smbios and dcdbas operates.

New interfaces will have description that is parsable by MOF.
