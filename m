From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v5 14/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Sat, 7 Oct 2017 13:13:55 +0000
Message-ID: <eb2ce05f6e594864af9f4928abfe547d@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507350554.git.mario.limonciello@dell.com>
 <cb39307b0d44321cb168331c308e0fbee11b385c.1507350554.git.mario.limonciello@dell.com>
 <20171007074132.GB25755@kroah.com>
 <6e3e2c8163ad4576b029eb4c17b4add1@ausx13mpc120.AMER.DELL.COM>
 <20171007123656.GA5667@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa4.dell-outbound.iphmx.com ([68.232.149.214]:7334 "EHLO
        esa4.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751119AbdJGNN6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Oct 2017 09:13:58 -0400
In-Reply-To: <20171007123656.GA5667@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Saturday, October 7, 2017 7:37 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; andy.shevchenko@gmail.com; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; luto@kernel.=
org;
> quasisec@google.com; pali.rohar@gmail.com; rjw@rjwysocki.net;
> mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v5 14/14] platform/x86: dell-smbios-wmi: introduce
> userspace interface
>=20
> On Sat, Oct 07, 2017 at 12:15:18PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > > +	struct wmi_smbios_priv *priv;
> > > > +	int ret =3D 0;
> > > > +	size_t size;
> > > > +
> > > > +	switch (cmd) {
> > > > +	case DELL_WMI_SMBIOS_CMD:
> > > > +		priv =3D dev_get_drvdata(&wdev->dev);
> > > > +		if (!priv)
> > > > +			return -ENODEV;
> > > > +		size =3D sizeof(struct wmi_smbios_buffer);
> > > > +		mutex_lock(&call_mutex);
> > > > +		if (copy_from_user(priv->buf, input, size)) {
>=20
> Wait, how do you know that input is size big?

How can you check this?  I guess just read the first u64 for the data first=
 (where length
is stored).  Or is there a better way?

>=20
> > > > +			dev_dbg(&wdev->dev, "Copy %lu from user failed\n",
> > > > +				size);
> > > > +			ret =3D -EFAULT;
> > > > +			goto fail_smbios_cmd;
> > > > +		}
> > > > +		if (priv->buf->length < priv->buffer_size) {
> > > > +			dev_err(&wdev->dev,
> > > > +				"Buffer %lld too small, need at least %d\n",
> > > > +				priv->buf->length, priv->buffer_size);
> > > > +			ret =3D -EINVAL;
> > > > +			goto fail_smbios_cmd;
> > > > +		}
> > >
> > > No checking for too big of a length?  Any other fields you should che=
ck
> > > for validity?  Like too small?
> >
> > Too big is actually intentionally ignored.
>=20
> That seems "odd"...
>=20
> > I split the copy into two segments to check for this.
> > 1. First copy the size of the structure
> > (if userspace didn't allocate at least sizeof(struct wmi_smbios_buffer)=
 that's a
> problem)
> > 2. Verify the size claimed is "at least" what we internally are looking=
 for.
> > 3. Copy the rest of the size internally needed.  If userspace sent more=
 it's just
> not copied.
> > 4. When sending it back I only send back up to the "at least" internal =
size.
>=20
> That feels strange, are you sure this is correct?  Why the odd two step
> process here?
>=20
> What if 'length' is set to an invalid value (too big or small), will you
> catch that correctly here?

Too small is definitely caught, too big won't cause problems due to above l=
ogic.

The remaining problem is if length doesn't really represent how much memory
Userspace allocated.  I'm not sure how you can actually check that.

>=20
> > > > +		if (dell_smbios_call_filter(&wdev->dev, &priv->buf->std)) {
> > > > +			dev_err(&wdev->dev, "Invalid call %d/%d:%8x\n",
> > > > +				priv->buf->std.class, priv->buf->std.select,
> > > > +				priv->buf->std.input[0]);
> > > > +			ret =3D -EFAULT;
> > > > +			goto fail_smbios_cmd;
> > > > +		}
> > > > +		size =3D priv->buffer_size - sizeof(struct wmi_smbios_buffer);
> > >
> > > What if size just went too small and wrapped around?  :(
> > >
> > > Remember, "All input is evil".  Go print that out and put it on the w=
all
> > > when you are designing this user/kernel api.  You can trust no one, y=
ou
> > > have to validate _everything_.
> >
> > priv->buffer_size can't be set by userspace.
>=20
> Who sets it?  Your structure naming here doesn't make it obvious which
> data is from the kernel and which from userspace, making this very hard
> to audit :(

It's set during the probe routine.  I'll rename it to something more obviou=
s.
I'll also add some comments to the ioctl so it's more apparent.
