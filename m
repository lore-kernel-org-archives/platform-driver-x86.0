From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 12/14] platform/x86: wmi: create character devices when
 requested by drivers
Date: Thu, 5 Oct 2017 14:35:43 +0000
Message-ID: <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
 <20171005071619.GA25960@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:29211 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751405AbdJEOfq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 10:35:46 -0400
In-Reply-To: <20171005071619.GA25960@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Thursday, October 5, 2017 2:16 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices=
 when
> requested by drivers
>=20
> On Wed, Oct 04, 2017 at 05:48:38PM -0500, Mario Limonciello wrote:
> > For WMI operations that are only Set or Query read or write sysfs
> > attributes created by WMI vendor drivers make sense.
> >
> > For other WMI operations that are run on Method, there needs to be a
> > way to guarantee to userspace that the results from the method call
> > belong to the data request to the method call.  Sysfs attributes don't
> > work well in this scenario because two userspace processes may be
> > competing at reading/writing an attribute and step on each other's
> > data.
>=20
> And you protect this from happening in the ioctl?  I didn't see it, but
> ok, I'll take your word for it :)

The ioctl does take a mutex.

>=20
> > When a WMI vendor driver declares an ioctl in a file_operations object
> > the WMI bus driver will create a character device that maps to those
> > file operations.
> >
> > That character device will correspond to this path:
> > /dev/wmi/$driver
> >
> > The WMI bus driver will interpret the IOCTL calls, test them for
> > a valid instance and pass them on to the vendor driver to run.
> >
> > This creates an implicit policy that only driver per character
> > device.  If a module matches multiple GUID's, the wmi_devices
> > will need to be all handled by the same wmi_driver if the same
> > character device is used.
>=20
> Interesting "way out" but ok, I can buy it...
>=20
> > The WMI vendor drivers will be responsible for managing access to
> > this character device and proper locking on it.
> >
> > When a WMI vendor driver is unloaded the WMI bus driver will clean
> > up the character device.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > ---
> >  MAINTAINERS                |  1 +
> >  drivers/platform/x86/wmi.c | 67
> +++++++++++++++++++++++++++++++++++++++++++++-
> >  include/linux/wmi.h        |  2 ++
> >  include/uapi/linux/wmi.h   | 10 +++++++
> >  4 files changed, 79 insertions(+), 1 deletion(-)
> >  create mode 100644 include/uapi/linux/wmi.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0357e9b1cfaf..6db1d84999bc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -372,6 +372,7 @@ ACPI WMI DRIVER
> >  L:	platform-driver-x86@vger.kernel.org
> >  S:	Orphan
> >  F:	drivers/platform/x86/wmi.c
> > +F:	include/uapi/linux/wmi.h
> >
> >  AD1889 ALSA SOUND DRIVER
> >  M:	Thibaut Varene <T-Bone@parisc-linux.org>
> > diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> > index bcb41c1c7f52..5aef052b4aab 100644
> > --- a/drivers/platform/x86/wmi.c
> > +++ b/drivers/platform/x86/wmi.c
> > @@ -38,6 +38,7 @@
> >  #include <linux/init.h>
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> > +#include <linux/miscdevice.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> > @@ -69,6 +70,7 @@ struct wmi_block {
> >  	struct wmi_device dev;
> >  	struct list_head list;
> >  	struct guid_block gblock;
> > +	struct miscdevice misc_dev;
> >  	struct acpi_device *acpi_device;
> >  	wmi_notify_handler handler;
> >  	void *handler_data;
> > @@ -765,22 +767,80 @@ static int wmi_dev_match(struct device *dev, stru=
ct
> device_driver *driver)
> >  	return 0;
> >  }
> >
> > +static long wmi_ioctl(struct file *filp, unsigned int cmd,
> > +		      unsigned long arg)
> > +{
> > +	struct wmi_driver *wdriver;
> > +	struct wmi_block *wblock;
> > +	const char *driver_name;
> > +	struct list_head *p;
> > +	bool found =3D false;
> > +
> > +	if (_IOC_TYPE(cmd) !=3D WMI_IOC)
> > +		return -ENOTTY;
> > +
> > +	driver_name =3D filp->f_path.dentry->d_iname;
> > +
> > +	list_for_each(p, &wmi_block_list) {
> > +		wblock =3D list_entry(p, struct wmi_block, list);
> > +		wdriver =3D container_of(wblock->dev.dev.driver,
> > +			struct wmi_driver, driver);
> > +		if (strcmp(driver_name, wdriver->driver.name) =3D=3D 0) {
> > +			found =3D true;
> > +			break;
> > +		}
> > +	}
>=20
> You can provide an open() call to handle this type of logic for you, so
> you don't have to do it on every ioctl() call, but I guess it's not
> really a big deal, right?
>=20
> > +	if (!found ||
> > +	    !wdriver->file_operations ||
> > +	    !wdriver->file_operations->unlocked_ioctl)
> > +		return -ENODEV;
>=20
> Shouldn't you check for unlocked_ioctl() already?  No need to check it
> here, right?

You're right.  I'll move the check earlier in the initialization.

>=20
> And if you are only passing down unlocked_ioctl, there's no need for a
> whole empty file_operations structure in the driver, right?  Just have
> an ioctl callback to make things smaller and simpler to understand.
>=20

> > +	/* make sure we're not calling a higher instance */
> > +	if (_IOC_NR(cmd) > wblock->gblock.instance_count)
> > +		return -EINVAL;
>=20
> What exactly does this protect from?

I'll clarify the comment, but essentially if userspace tries to make
an ioctl call on an instance that doesn't exist it should fail.

>=20
> > +	/* driver wants a character device made */
> > +	if (wdriver->file_operations) {
>=20
> Check for unlocked_ioctl here, actually, drop the file_operations
> entirely, and just have that one callback.

OK.

>=20
> > +		buf =3D kmalloc(strlen(wdriver->driver.name) + 4, GFP_KERNEL);
> > +		if (!buf)
> > +			return -ENOMEM;
>=20
> No unwinding of other logic needed?

There shouldn't be.  The stuff earlier is optional.

>=20
> > +		strcpy(buf, "wmi/");
> > +		strcpy(buf + 4, wdriver->driver.name);
> > +		wblock->misc_dev.minor =3D MISC_DYNAMIC_MINOR;
> > +		wblock->misc_dev.name =3D buf;
> > +		wblock->misc_dev.fops =3D &wmi_fops;
> > +		ret =3D misc_register(&wblock->misc_dev);
> > +		if (ret) {
> > +			dev_warn(dev, "failed to register char dev: %d", ret);
> > +			kfree(buf);
>=20
> Again, no unwinding needed?  Error message value returned?

It comes down to if the character device should be considered optional.  I'=
ll
make it fail if it can't create it.

>=20
> > +		}
> > +	}
> > +
> >  	if (wdriver->probe) {
> >  		ret =3D wdriver->probe(dev_to_wdev(dev));
> >  		if (ret !=3D 0 && ACPI_FAILURE(wmi_method_enable(wblock, 0)))
> >  			dev_warn(dev, "failed to disable device\n");
> >  	}
> > -
> >  	return ret;
> >  }
> >
> > @@ -791,6 +851,11 @@ static int wmi_dev_remove(struct device *dev)
> >  		container_of(dev->driver, struct wmi_driver, driver);
> >  	int ret =3D 0;
> >
> > +	if (wdriver->file_operations) {
> > +		kfree(wblock->misc_dev.name);
> > +		misc_deregister(&wblock->misc_dev);
>=20
> Unregister before freeing the device name, right?

Well if you unregister and then free the name you'll have lost the pointer.
So isn't that the right order?

>=20
> > --- /dev/null
> > +++ b/include/uapi/linux/wmi.h
> > @@ -0,0 +1,10 @@
> > +#ifndef _UAPI_LINUX_WMI_H
> > +#define _UAPI_LINUX_WMI_H
> > +
> > +#define WMI_IOC 'W'
> > +#define WMI_IO(instance)	_IO(WMI_IOC, instance)
> > +#define WMI_IOR(instance)	_IOR(WMI_IOC, instance, void*)
> > +#define WMI_IOW(instance)	_IOW(WMI_IOC, instance, void*)
> > +#define WMI_IOWR(instance)	_IOWR(WMI_IOC, instance, void*)
>=20
> Ugh, void *, this is going to be "fun"...
>=20
> My comments on just how fun is left for the actual driver that attempted
> to implement these...
>=20

So until in kernel MOF parsing is available you can't predict the format of
what an individual ACPI method will expect for its input.  Even when the in
kernel MOF parsing is made available the data types may be complex structur=
es.
