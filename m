From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v5 14/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Sat, 7 Oct 2017 12:15:18 +0000
Message-ID: <6e3e2c8163ad4576b029eb4c17b4add1@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507350554.git.mario.limonciello@dell.com>
 <cb39307b0d44321cb168331c308e0fbee11b385c.1507350554.git.mario.limonciello@dell.com>
 <20171007074132.GB25755@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:53449 "EHLO
        esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750891AbdJGMPU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Oct 2017 08:15:20 -0400
In-Reply-To: <20171007074132.GB25755@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Saturday, October 7, 2017 2:42 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v5 14/14] platform/x86: dell-smbios-wmi: introduce
> userspace interface
>=20
> On Fri, Oct 06, 2017 at 11:59:58PM -0500, Mario Limonciello wrote:
> > It's important for the driver to provide a R/W ioctl to ensure that
> > two competing userspace processes don't race to provide or read each
> > others data.
> >
> > This userspace character device will be used to perform SMBIOS calls
> > from any applications.
> >
> > It provides an ioctl that will allow passing the WMI calling
> > interface buffer between userspace and kernel space.
> >
> > This character device is intended to deprecate the dcdbas kernel module
> > and the interface that it provides to userspace.
> >
> > To use the character device the buffer needed for the machine will
> > also be needed.  This information is exported to a sysfs attribute.
> >
> > The API for interacting with this interface is defined in documentation
> > as well as a uapi header provides the format of the structures.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > ---
> >  Documentation/ABI/testing/dell-smbios-wmi          |  41 ++++++++
> >  .../ABI/testing/sysfs-platform-dell-smbios-wmi     |  10 ++
> >  MAINTAINERS                                        |   1 +
> >  drivers/platform/x86/dell-smbios-wmi.c             | 104 +++++++++++++=
+++++---
> >  drivers/platform/x86/dell-smbios.h                 |  11 +--
> >  include/uapi/linux/dell-smbios.h                   |  42 +++++++++
> >  6 files changed, 188 insertions(+), 21 deletions(-)
> >  create mode 100644 Documentation/ABI/testing/dell-smbios-wmi
> >  create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-smbio=
s-
> wmi
> >  create mode 100644 include/uapi/linux/dell-smbios.h
> >
> > diff --git a/Documentation/ABI/testing/dell-smbios-wmi
> b/Documentation/ABI/testing/dell-smbios-wmi
> > new file mode 100644
> > index 000000000000..e067e955fcc9
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/dell-smbios-wmi
> > @@ -0,0 +1,41 @@
> > +What:		/dev/wmi/dell-smbios
> > +Date:		November 2017
> > +KernelVersion:	4.15
> > +Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
> > +Description:
> > +		Perform SMBIOS calls on supported Dell machines.
> > +		through the Dell ACPI-WMI interface.
> > +
> > +		IOCTL's and buffer formats are defined in:
> > +		<uapi/linux/dell-smbios.h>
> > +
> > +		1) To perform a call from userspace, you'll need to first
> > +		determine the minimum size of the calling interface buffer
> > +		for your machine.
> > +		Platforms that contain larger buffers can return larger
> > +		objects from the system firmware.
> > +		Commonly this size is either 4k or 32k.
> > +
> > +		To determine the size of the buffer, refer to:
> > +		sysfs-platform-dell-smbios-wmi
> > +
> > +		2) After you've determined the minimum size of the calling
> > +		interface buffer, you can allocate a structure that represents
> > +		the structure documented above.
> > +
> > +		3) In the 'length' object store the size of the buffer you
> > +		determined above and allocated.
> > +
> > +		4) In this buffer object, prepare as necessary for the SMBIOS
> > +		call you're interested in.  Typically SMBIOS buffers have
> > +		"class", "select", and "input" defined to values that coincide
> > +		with the data you are interested in.
> > +		Documenting class/select/input values is outside of the scope
> > +		of this documentation. Check with the libsmbios project for
> > +		further documentation on these values.
> > +
> > +		6) Run the call by using ioctl() as described in the header.
> > +
> > +		7) The output will be returned in the buffer object.
> > +
> > +		8) Be sure to free up your allocated object.
> > diff --git a/Documentation/ABI/testing/sysfs-platform-dell-smbios-wmi
> b/Documentation/ABI/testing/sysfs-platform-dell-smbios-wmi
> > new file mode 100644
> > index 000000000000..6a0513703a3c
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-platform-dell-smbios-wmi
> > @@ -0,0 +1,10 @@
> > +What:		/sys/devices/platform/<platform>/buffer_size
> > +Date:		November 2017
> > +KernelVersion:	4.15
> > +Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
> > +Description:
> > +		A read-only description of the size of a calling
> > +		interface buffer that can be passed to Dell
> > +		firmware.
> > +
> > +		Commonly this size is either 4k or 32k.
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2a99ee9fd883..4940f3c7481b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3986,6 +3986,7 @@ M:	Mario Limonciello <mario.limonciello@dell.com>
> >  L:	platform-driver-x86@vger.kernel.org
> >  S:	Maintained
> >  F:	drivers/platform/x86/dell-smbios-wmi.c
> > +F:	include/uapi/linux/dell-smbios.h
> >
> >  DELL LAPTOP DRIVER
> >  M:	Matthew Garrett <mjg59@srcf.ucam.org>
> > diff --git a/drivers/platform/x86/dell-smbios-wmi.c
> b/drivers/platform/x86/dell-smbios-wmi.c
> > index 3de8abea38f8..2b78aba68755 100644
> > --- a/drivers/platform/x86/dell-smbios-wmi.c
> > +++ b/drivers/platform/x86/dell-smbios-wmi.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/wmi.h>
> > +#include <uapi/linux/dell-smbios.h>
> >  #include "dell-smbios.h"
> >  #include "dell-wmi-descriptor.h"
> >  static DEFINE_MUTEX(call_mutex);
> > @@ -29,19 +30,9 @@ struct misc_bios_flags_structure {
> >
> >  #define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-
> B622A1EF5492"
> >
> > -struct wmi_extensions {
> > -	__u32 argattrib;
> > -	__u32 blength;
> > -	__u8 data[];
> > -} __packed;
> > -
> > -struct wmi_smbios_buffer {
> > -	struct calling_interface_buffer std;
> > -	struct wmi_extensions ext;
> > -} __packed;
> > -
> >  struct wmi_smbios_priv {
> >  	struct wmi_smbios_buffer *buf;
> > +	struct device_attribute buffer_size_attr;
> >  	struct list_head list;
> >  	struct wmi_device *wdev;
> >  	struct device *child;
> > @@ -113,6 +104,78 @@ int dell_smbios_wmi_call(struct
> calling_interface_buffer *buffer)
> >  	return ret;
> >  }
> >
> > +static long dell_smbios_wmi_ioctl(struct wmi_device *wdev, unsigned in=
t
> cmd,
> > +				  unsigned long arg)
> > +{
> > +	struct wmi_smbios_buffer __user *input =3D
> > +					(struct wmi_smbios_buffer __user *) arg;
>=20
> Why not just always define arg as "struct wmi_smbios_buffer __user *"?
> No need to pass down a vague type here, right?
>=20
> Unless you need to better name your structure to show that it is a dell
> type only :)

Great idea thanks.

>=20
> > +	struct wmi_smbios_priv *priv;
> > +	int ret =3D 0;
> > +	size_t size;
> > +
> > +	switch (cmd) {
> > +	case DELL_WMI_SMBIOS_CMD:
> > +		priv =3D dev_get_drvdata(&wdev->dev);
> > +		if (!priv)
> > +			return -ENODEV;
> > +		size =3D sizeof(struct wmi_smbios_buffer);
> > +		mutex_lock(&call_mutex);
> > +		if (copy_from_user(priv->buf, input, size)) {
> > +			dev_dbg(&wdev->dev, "Copy %lu from user failed\n",
> > +				size);
> > +			ret =3D -EFAULT;
> > +			goto fail_smbios_cmd;
> > +		}
> > +		if (priv->buf->length < priv->buffer_size) {
> > +			dev_err(&wdev->dev,
> > +				"Buffer %lld too small, need at least %d\n",
> > +				priv->buf->length, priv->buffer_size);
> > +			ret =3D -EINVAL;
> > +			goto fail_smbios_cmd;
> > +		}
>=20
> No checking for too big of a length?  Any other fields you should check
> for validity?  Like too small?

Too big is actually intentionally ignored.
I split the copy into two segments to check for this. =20
1. First copy the size of the structure=20
(if userspace didn't allocate at least sizeof(struct wmi_smbios_buffer) tha=
t's a problem)
2. Verify the size claimed is "at least" what we internally are looking for=
.
3. Copy the rest of the size internally needed.  If userspace sent more it'=
s just not copied.
4. When sending it back I only send back up to the "at least" internal size=
.

>=20
> > +		if (dell_smbios_call_filter(&wdev->dev, &priv->buf->std)) {
> > +			dev_err(&wdev->dev, "Invalid call %d/%d:%8x\n",
> > +				priv->buf->std.class, priv->buf->std.select,
> > +				priv->buf->std.input[0]);
> > +			ret =3D -EFAULT;
> > +			goto fail_smbios_cmd;
> > +		}
> > +		size =3D priv->buffer_size - sizeof(struct wmi_smbios_buffer);
>=20
> What if size just went too small and wrapped around?  :(
>=20
> Remember, "All input is evil".  Go print that out and put it on the wall
> when you are designing this user/kernel api.  You can trust no one, you
> have to validate _everything_.

priv->buffer_size can't be set by userspace.

>=20
> > --- /dev/null
> > +++ b/include/uapi/linux/dell-smbios.h
> > @@ -0,0 +1,42 @@
> > +/*
> > + *  User API for WMI methods for use with dell-smbios
> > + *
> > + *  Copyright (c) 2017 Dell Inc.
> > + *
> > + *  This program is free software; you can redistribute it and/or modi=
fy
> > + *  it under the terms of the GNU General Public License version 2 as
> > + *  published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef _UAPI_DELL_SMBIOS_H_
> > +#define _UAPI_DELL_SMBIOS_H_
> > +
> > +#include <linux/ioctl.h>
> > +#include <linux/wmi.h>
> > +
> > +/* This structure may be modified by the firmware when we enter
> > + * system management mode through SMM, hence the volatiles
> > + */
> > +struct calling_interface_buffer {
> > +	__u16 class;
> > +	__u16 select;
> > +	volatile __u32 input[4];
> > +	volatile __u32 output[4];
> > +} __packed;
>=20
> I still don't buy the use of volatile, but oh well, I'm assuming you
> properly tested this?

If I wasn't hanging onto the SMM legacy driver I'd drop this, but it's
used when the SMM driver works on this structure.

I've tested it with both the SMM and WMI drivers though, yes.

>=20
> > +struct wmi_extensions {
> > +	__u32 argattrib;
> > +	__u32 blength;
> > +	__u8 data[];
> > +} __packed;
> > +
> > +struct wmi_smbios_buffer {
> > +	__u64 length;
> > +	struct calling_interface_buffer std;
> > +	struct wmi_extensions		ext;
> > +} __packed;
>=20
> Much better, right?  Now why do you feel you need a compat ioctl for
> this structure?  If you do, where is that logic?
Yes, thank you this is much cleaner.

Other "newish" drivers provide both stubs even if they point to the same
function.
Eg:
https://github.com/torvalds/linux/commit/2521ea3e0d1b285cea371a38772d3eefa0=
490c71

I did check that as things are in v5 it works both in 32 and 64 application=
s.
