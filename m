From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Thu, 5 Oct 2017 16:37:21 +0000
Message-ID: <035f715a865146278b7bc4a0a79caf45@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
 <20171005073324.GC25960@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005073324.GC25960@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Thursday, October 5, 2017 2:33 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
> userspace interface
>=20
> On Wed, Oct 04, 2017 at 05:48:39PM -0500, Mario Limonciello wrote:
> > +static long dell_smbios_wmi_ioctl(struct file *filp, unsigned int cmd,
> > +	unsigned long arg)
> > +{
> > +	void __user *p =3D (void __user *) arg;
> > +	struct wmi_smbios_ioctl *input;
> > +	struct wmi_smbios_priv *priv;
> > +	struct wmi_device *wdev;
> > +	size_t ioctl_size;
> > +	int ret =3D 0;
> > +
> > +	switch (cmd) {
> > +	/* we only operate on first instance */
> > +	case DELL_WMI_SMBIOS_CMD:
> > +		wdev =3D get_first_wmi_device();
> > +		if (!wdev) {
> > +			pr_err("No WMI devices bound\n");
>=20
> dev_err(), you are a driver, never use "raw" pr_ calls.
>
This particular error was if a device wasn't found.  It's a codepath I don'=
t
really know can happen from the ioctl, but wanted to be sure.  I'll just re=
move
this error message.
=20
> > +			return -ENODEV;
> > +		}
> > +		ioctl_size =3D sizeof(struct wmi_smbios_ioctl);
> > +		priv =3D dev_get_drvdata(&wdev->dev);
> > +		input =3D kmalloc(ioctl_size, GFP_KERNEL);
> > +		if (!input)
> > +			return -ENOMEM;
> > +		mutex_lock(&wmi_mutex);
> > +		if (!access_ok(VERIFY_READ, p, ioctl_size)) {
>=20
> Hm, any time I see an access_ok() call, I get scared.  You should almost
> never need to make that call if you are using the correct kernel apis.
>=20
> > +			pr_err("Unsafe userspace pointer passed\n");
>=20
> dev_err().
>

Yep got it.
=20
> > +			return -EFAULT;
>=20
> Memory leak!

Doh, thanks.

>=20
>=20
> > +		}
> > +		if (copy_from_user(input, p, ioctl_size)) {
> > +			ret =3D -EFAULT;
>=20
> So, why did you call access_ok() followed by copy_from_user()?
> copy_from/to() handle all of that for you automatically.
>=20

I wasn't aware access_ok was handled in copy_from/to.  I'll remove this.

> > +			goto fail_smbios_cmd;
> > +		}
> > +		if (input->length !=3D priv->buffer_size) {
> > +			pr_err("Got buffer size %d expected %d\n",
> > +				input->length, priv->buffer_size);
>=20
> length is user provided, it can be whatever anyone sets it to.  I don't
> understand this error.
>=20
> > +			ret =3D -EINVAL;
> > +			goto fail_smbios_cmd;
> > +		}
> > +		if (!access_ok(VERIFY_WRITE, input->buf, priv->buffer_size)) {
> > +			pr_err("Unsafe userspace pointer passed\n");
>=20
> Again, don't need this.
>=20
> > +			ret =3D -EFAULT;
> > +			goto fail_smbios_cmd;
> > +		}
> > +		if (copy_from_user(priv->buf, input->buf, priv->buffer_size)) {
>=20
> Wait, input->buf is a user pointer?  Ick, see my previous email about
> your crazy api here being a mess.  This should not be needed.
>=20
> And as you "know" the buffer size already, why do you have userspace
> specify it?  What good is it?

I mentioned this in the other mail, but the thing is buffer size is not con=
sistent
from machine to machine.

It's convenient that this change happened now because otherwise there would
have been assumptions about it always being 4k that needed to be thrown awa=
y.

>=20
> > +			ret =3D -EFAULT;
> > +			goto fail_smbios_cmd;
> > +		}
> > +		ret =3D run_smbios_call(wdev);
>=20
> No other checking of the values in the structure?  You just "trust"
> userspace to get it all right?  Hah!
>=20
> > +		if (ret !=3D 0)
> > +			goto fail_smbios_cmd;
>=20
> You didn't run this through checkpatch :(
>=20
I did..

$ ~/src/linux/scripts/checkpatch.pl 0013-platform-x86-dell-smbios-wmi-
introduce-userspace-int.patch=20
total: 0 errors, 0 warnings, 241 lines checked

0013-platform-x86-dell-smbios-wmi-introduce-userspace-int.patch has no obvi=
ous=20
style problems and is ready for submission.

>=20
> > +		if (copy_to_user(input->buf, priv->buf, priv->buffer_size))
> > +			ret =3D -EFAULT;
> > +fail_smbios_cmd:
> > +		kfree(input);
> > +		mutex_unlock(&wmi_mutex);
> > +		break;
> > +	default:
> > +		pr_err("unsupported ioctl: %d.\n", cmd);
> > +		ret =3D -ENOIOCTLCMD;
> > +	}
> > +	return ret;
> > +}
> > +
> > +static ssize_t buffer_size_show(struct device *dev,
> > +				struct device_attribute *attr, char *buf)
> > +{
> > +	struct wmi_smbios_priv *priv =3D dev_get_drvdata(dev);
> > +
> > +	return sprintf(buf, "%d\n", priv->buffer_size);
> > +}
> > +static DEVICE_ATTR_RO(buffer_size);
> > +
> > +static struct attribute *smbios_wmi_attrs[] =3D {
> > +	&dev_attr_buffer_size.attr,
> > +	NULL
> > +};
> > +
> > +static const struct attribute_group smbios_wmi_attribute_group =3D {
> > +	.attrs =3D smbios_wmi_attrs,
> > +};
> > +
> >  static int dell_smbios_wmi_probe(struct wmi_device *wdev)
> >  {
> >  	struct wmi_smbios_priv *priv;
> > @@ -127,6 +209,11 @@ static int dell_smbios_wmi_probe(struct wmi_device
> *wdev)
> >  	if (!priv->buf)
> >  		return -ENOMEM;
> >
> > +	ret =3D sysfs_create_group(&wdev->dev.kobj,
> > +				 &smbios_wmi_attribute_group);
>=20
> Hint, if a driver ever makes a call to sysfs_*(), something is wrong, it
> should never be needed.
>=20
> Also, you just raced with userspace and lost :(
>=20
> There is a way to fix all of this, in a simple way, I'll leave that as
> an exercise for the reader, I've reviewed enough of this code for
> today...
>=20

Thanks, I see what I should do instead, I'll make changes.

> > +static const struct file_operations dell_smbios_wmi_fops =3D {
> > +	.owner		=3D THIS_MODULE,
>=20
> And who uses that field?  Hint, no one is, which is another issue that I
> forgot to review in your previous patch where you use this structure.
> What is protecting this module from being unloaded while the ioctl call
> is running?  (hint, nothing...)
>=20

Thanks, I'll add locking.
