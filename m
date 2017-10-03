From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce character
 device for userspace
Date: Tue, 3 Oct 2017 15:09:24 +0000
Message-ID: <8fba3d1db7914c4ca34750b7ff4cf9dc@ausx13mpc120.AMER.DELL.COM>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <4a91eb76afa9cce7060bc30f5313d64bd51b66ca.1506571188.git.mario.limonciello@dell.com>
 <20171003092611.GC13295@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171003092611.GC13295@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Tuesday, October 3, 2017 4:26 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> pali.rohar@gmail.com
> Subject: Re: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce char=
acter
> device for userspace
>=20
> On Wed, Sep 27, 2017 at 11:02:17PM -0500, Mario Limonciello wrote:
> > +static int dell_wmi_smbios_open(struct inode *inode, struct file *file=
)
> > +{
> > +	return nonseekable_open(inode, file);
> > +}
> > +
> > +static int dell_wmi_smbios_release(struct inode *inode, struct file *f=
ile)
> > +{
> > +	return 0;
> > +}
>=20
> Why even declare an open/release if you don't do anything with them?
> Just leave them empty.

Thanks, I'll modify that.

>=20
> > +static long dell_wmi_smbios_ioctl(struct file *filp, unsigned int cmd,
> > +	unsigned long arg)
> > +{
> > +	void __user *p =3D (void __user *) arg;
> > +	size_t size;
> > +	int ret =3D 0;
> > +
> > +	if (_IOC_TYPE(cmd) !=3D DELL_WMI_SMBIOS_IOC)
> > +		return -ENOTTY;
> > +
> > +	switch (cmd) {
> > +	case DELL_WMI_SMBIOS_CALL_CMD:
> > +		size =3D sizeof(struct wmi_calling_interface_buffer);
> > +		mutex_lock(&buffer_mutex);
> > +		if (copy_from_user(devfs_buffer, p, size)) {
> > +			ret =3D -EFAULT;
> > +			goto fail_smbios_cmd;
> > +		}
> > +		ret =3D run_wmi_smbios_call(devfs_buffer);
>=20
> You _are_ checking that your structures are valid here, right?  I didn't
> see you really were, so I'll let you go audit your code paths for the
> next set of patches.

From the Linux side there isn't much that can be done to verify the=20
structure.  It doesn't contain a checksum, valid data that looks like a sel=
ect
of 0 and class of 0 with a few input values looks the same as a few words
of the same length.

The validity of the structure is done by the system firmware.  If it's
invalid, appropriate return codes are set and consumers of it will be=20
able to read that.

>=20
> But really, ugh, this seems horrible.  It's a huge vague data blob going
> both ways, this feels ripe for abuse and other bad things.  Do you have
> a working userspace implementation for all of this to publish at the
> same time?
>=20

Yes, I've got some support into fwupd and fwupdate that use this interface
already.  I expect the fwupdate PR will be ready to go at this same time,
but I'm working through some issues with fwupd still.=20
