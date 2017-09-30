From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce character
 device for userspace
Date: Sat, 30 Sep 2017 19:45:09 +0000
Message-ID: <88e11f3c0df44cb8bc436b1d11fe4f81@ausx13mpc120.AMER.DELL.COM>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <4a91eb76afa9cce7060bc30f5313d64bd51b66ca.1506571188.git.mario.limonciello@dell.com>
 <20170930020607.GD13307@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa5.dell-outbound.iphmx.com ([68.232.153.95]:3039 "EHLO
        esa5.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751099AbdI3TpL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Sep 2017 15:45:11 -0400
In-Reply-To: <20170930020607.GD13307@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, September 29, 2017 9:06 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy Lutomi=
rski
> <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.com
> Subject: Re: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce char=
acter
> device for userspace
>=20
> On Wed, Sep 27, 2017 at 11:02:17PM -0500, Mario Limonciello wrote:
> > This userspace character device will be used to perform SMBIOS calls
> > from any applications.
> >
> > It provides an ioctl that will allow passing the 32k WMI calling
> > interface buffer between userspace and kernel space.
> >
> > This character device is intended to deprecate the dcdbas kernel module
> > and the interface that it provides to userspace.
> >
> > It's important for the driver to provide a R/W ioctl to ensure that
> > two competing userspace processes don't race to provide or read each
> > others data.
> >
> > The character device will only be created if the WMI interface was
> > found.
> >
> > The API for interacting with this interface is defined in documentation
> > as well as a uapi header provides the format of the structures.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > ---
> >  Documentation/ABI/testing/dell-wmi-smbios |  11 ++++
> >  drivers/platform/x86/dell-smbios.c        | 100 ++++++++++++++++++++++=
++---
> ---
> >  drivers/platform/x86/dell-smbios.h        |  19 +-----
> >  include/uapi/linux/dell-wmi-smbios.h      |  30 +++++++++
> >  4 files changed, 124 insertions(+), 36 deletions(-)
> >  create mode 100644 Documentation/ABI/testing/dell-wmi-smbios
> >  create mode 100644 include/uapi/linux/dell-wmi-smbios.h
> >
> > diff --git a/Documentation/ABI/testing/dell-wmi-smbios
> b/Documentation/ABI/testing/dell-wmi-smbios
> > new file mode 100644
> > index 000000000000..0a4200688cb0
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/dell-wmi-smbios
> > @@ -0,0 +1,11 @@
> > +What:		/dev/wmi-dell-wmi-smbios
>=20
> /dev/wmi/dell-smbios
>=20
> > +Date:		October 2017
> > +KernelVersion:	4.15
> > +Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
> > +Description:
> > +		Perform SMBIOS calls on supported Dell machines.
> > +		through the Dell ACPI-WMI interface.
> > +
> > +		IOCTL's and buffer formats are defined in:
> > +		<uapi/linux/dell-wmi-smbios.h>
> > +
> > diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-
> smbios.c
> > index 5d793b012e5e..4174afbade13 100644
> > --- a/drivers/platform/x86/dell-smbios.c
> > +++ b/drivers/platform/x86/dell-smbios.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/io.h>
> >  #include <linux/wmi.h>
> > +#include <linux/uaccess.h>
> >  #include "dell-smbios.h"
> >
> >  #ifdef CONFIG_DCDBAS
> > @@ -41,8 +42,9 @@ struct calling_interface_structure {
> >  	struct calling_interface_token tokens[];
> >  } __packed;
> >
> > -static void *buffer;
> > -static size_t bufferlen;
> > +static void *internal_buffer;
> > +static size_t internal_bufferlen;
>=20
> A large portion of this changeset is dedicated to renaming these two vari=
ables,
> but it isn't clear why, and not mentioned in the changelog. Seems like
> unnecessary churn. Or if we really should rename it... can it be done ear=
lier in
> the series when we're working with those buffers for functional reasons?
>=20
So the main reason for renaming was to make it easier to distinguish betwee=
n
the character device buffer and internal buffer.  With my current (in proce=
ss)
change it's much easier to distinguish.  I'll drop the renaming.
