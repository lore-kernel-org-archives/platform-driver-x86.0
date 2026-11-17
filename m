Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956965;
	b=446/Ta5ILhhqXRest0ELYtoQ8khT+wq9iU99lh9tjI2bLmHlTRLftx1f1roqRGdIIjr1
	 GkCq34dJM2ULncluFR6BtyFj+CeTv0gMxSqc7XR/tZh4CZ6srwAyE/rqjVqF2gDZlaxdS
	 sPB5CkbmZ1rzTk4rhJDsvNXDNwnh+LcjTrHvRzKv+uwJkaIp39L4DTgoLyz+8XPVcwQFz
	 5eNxv5LOfKl7zyp7T8gWkCJKrycULnVBksMtbxfQ1U8DGKf2SqDt9Qu51UOD8ICFqc8Hu
	 A0MCoQoY1uyxT2kGqidGfq5mGrarNetokSZ+rf1br8hkczo3Gz72GVYKNNXjQlcoxpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956965;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=dFkPeqI1YsZpwMuujURc1wVh0W1MRwBf/9b3hgnBI8M=;
	b=BfGhRseVTSo7A5Y28ZcXHNm6j87FJjb4EmEMmy6aTF7+UwqTHyScEpQPdkUzG1Lj94IS
	 SngSCDtxnMz8A1aV3kcEEuYGETPJjRdDYg8pmBD6BI/Gvy9QpqazbHGsKXRLAlwXEHV53
	 /7hgV/9FTGpok0QntpU42I3rDfcX3pOjQz3Rimldbe5kfXkeekA2gFlGWujQnBkMknLIC
	 Nxc0iVD9ABmfe60qWh7KjrD7oJJwZtnthdBjHsxLc1URv2zq5QuaIQDI7gSNMLgcfOY7i
	 QRNiIq7qISO9FDmn/qSuwPF7ioNe9Ftstj9G0NSpekPOJ69oxsXL8W4Jz+brP2/HRmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U0V3eQPb;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4161606A31C;
	Tue, 17 Nov 2026 23:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4161606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U0V3eQPb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794956965; x=1826492965;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ibKdoUuCga2+n4HXehZ/zu9gXI8pFOg/f+UavUylCEk=;
  b=U0V3eQPbZngUyWZz7DjYfxeE7cMhPJw9cC3CZLdjtUKzTm2XTOLxB1A0
   GmbDH9XxyiXjxMp9mZk2GpyQLB3HtKR37KtMEdqYFJ/laxm06wFmUoLjt
   yyf4Y7Lks2C/J1d3dizyDV5HwWbW+dua8NZvNcR8/Po/cvGLHG80d8wEj
   rQz2VZdBgAHaXDCNd3RAA0K950muUW7GUaXlKlKqHs8JBrEZulawrOkk6
   q9ztQbLWiETUGpS+I1hSYNnIkWHoinslmw3iZB6Zw8Re5K2Igy+QWcH7G
   gOZCfqnLiqRAAHl4NgQaWQEdvwqQeLoM28zPIpnniF7uFnfdFFVYLTgVf
   Q==;
X-CSE-ConnectionGUID: 0vLjLevnRpSau51iC5GOZQ==
X-CSE-MsgGUID: Zdc3Tc5ZRmGe7XWHfQUvng==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3633081"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3633081"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 15:09:23 -0800
X-CSE-ConnectionGUID: oo2SD/NsTM6za1MGSbWH6Q==
X-CSE-MsgGUID: pDsslFIHTye8x2DeCOgHyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11780726"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.79])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 15:09:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Nov 2026 01:09:17 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, teolyub@gmail.com
Subject: Re: [PATCH 1/2] platform/x86: dell: Add new dell-wmi-pega driver
In-Reply-To: <848ebb18-b9bf-4747-9403-fa8da4fba2ad@gmx.de>
Message-ID: <25490090-1d6e-725b-04e1-659faec01db2@linux.intel.com>
References: <20261117214604.397131-1-W_Armin@gmx.de> <f71860dd-cf85-ddd9-8e47-7279205f46ab@linux.intel.com> <848ebb18-b9bf-4747-9403-fa8da4fba2ad@gmx.de>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-122444894-1794956957=:1563"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-122444894-1794956957=:1563
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 17 Nov 2026, Armin Wolf wrote:

> Am 17.11.26 um 23:17 schrieb Ilpo J=C3=A4rvinen:
> > On Tue, 17 Nov 2026, Armin Wolf wrote:
> >=20
> > > A user has reported that the WMI hotkey events on Dell All-In-One
> > > machines need to be manually enabled on some models thru a separate
> > > WMI device. This WMI device seems to be present on many other models
> > > but has no effect on them.
> >=20
> > Can you rephrase this to not textually depend on "user" or "user's
> > report", just state what the problem is, not how you became aware of it=
=2E
> >=20
> > > Add a small driver for enabling support for this WMI device. This
> > > enables the HDMI Input key on the Dell OptiPlex 7400 All-in-One
> > > machine.
> > >=20
> > > Reported-by: Teodora <teolyub@gmail.com>
> > > Closes:
> > > https://lore.kernel.org/platform-driver-x86/0TZENT.54P2IBFQRED22@gmai=
l.com
> > > Tested-by: Teodora <teolyub@gmail.com>
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   Documentation/wmi/devices/dell-wmi-pega.rst | 82 ++++++++++++++++++
> > >   MAINTAINERS                                 |  6 ++
> > >   drivers/platform/x86/dell/Kconfig           | 13 +++
> > >   drivers/platform/x86/dell/Makefile          |  1 +
> > >   drivers/platform/x86/dell/dell-wmi-pega.c   | 93 ++++++++++++++++++=
+++
> > >   5 files changed, 195 insertions(+)
> > >   create mode 100644 Documentation/wmi/devices/dell-wmi-pega.rst
> > >   create mode 100644 drivers/platform/x86/dell/dell-wmi-pega.c
> > >=20
> > > diff --git a/Documentation/wmi/devices/dell-wmi-pega.rst
> > > b/Documentation/wmi/devices/dell-wmi-pega.rst
> > > new file mode 100644
> > > index 000000000000..935c8511594b
> > > --- /dev/null
> > > +++ b/Documentation/wmi/devices/dell-wmi-pega.rst
> > > @@ -0,0 +1,82 @@
> > > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +Dell All-In-One Series Platform Integration (dell-wmi-pega)
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Introduction
> > > +------------
> > > +
> > > +Many Dell All-In-One devices contain a WMI device for notifying the
> > > underlying platform
> > > +of various OS-specific events like power up, shutdown and backlight
> > > brightness control.
> > > +
> > > +Not implementing support for this WMI device might prevent hotkeys
> > > exposed over WMI from
> > > +working on some models.
> > > +
> > > +WMI interface description
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > +
> > > +The WMI interface description can be decoded from the embedded binar=
y MOF
> > > (bmof)
> > > +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> > > +
> > > +::
> > > +
> > > + [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> > > +  Description("Class used to operate method - WMBC"),
> > > +  guid("{2D703EE8-36AC-4F88-BDB5-7556CE6B2946}") : ToInstance]
> > > + class AcpiOSD_WMBC_method : WMIMethod {
> > > +
> > > +   [key, read]
> > > +   string InstanceName;
> > > +
> > > +   [read]
> > > +   boolean Active;
> > > +
> > > +   [WmiMethodId(1), Implemented, read, write,
> > > +    Description("Invoked by AP when system up.")]
> > > +   void PegaOemNotificationStartUp([out, Description("Return Value")=
]
> > > uint32 RetVal);
> > > +
> > > +   [WmiMethodId(2), Implemented, read, write,
> > > +    Description("Invoked by AP when system is going to off state.")]
> > > +   void PegaOemNotificationStop([out, Description("Return Value")] u=
int32
> > > RetVal);
> > > +
> > > +   [WmiMethodId(3), Implemented, read, write,
> > > +    Description("Invoked by Application to tune up brightness.")]
> > > +   void PegaOemNotificationBrightnessUP([out, Description("Return
> > > Value")] uint32 RetVal);
> > > +
> > > +   [WmiMethodId(4), Implemented, read, write,
> > > +    Description("Invoked by Application to tune down brightness.")]
> > > +   void PegaOemNotificationBrightnessDown([out, Description("Return
> > > Value")] uint32 RetVal);
> > > +
> > > +   [WmiMethodId(5), Implemented, read, write, Description("Reserved.=
")]
> > > +   void PegaOemNotificationRSVD1([out, Description("Return Value")]
> > > uint32 RetVal);
> > > +
> > > +   [WmiMethodId(6), Implemented, read, write, Description("Reserved.=
")]
> > > +   void PegaOemNotificationRSVD2([out, Description("Return Value")]
> > > uint32 RetVal);
> > > + };
> > > +
> > > +The return value of each WMI method should be equal to the WMI metho=
d ID.
> > > +
> > > +WMI method PegaOemNotificationStartUp()
> > > +---------------------------------------
> > > +
> > > +Notifies the platform that the OS is operational. On some models thi=
s WMI
> > > method also enables
> > > +reporting of hotkey events over WMI.
> > > +
> > > +WMI method PegaOemNotificationStop()
> > > +------------------------------------
> > > +
> > > +Notifies the platform that the OS is shutting down.
> > > +
> > > +WMI method PegaOemNotificationBrightnessUP()
> > > +--------------------------------------------
> > > +
> > > +Notifies the platform that the user wants to increase the backlight
> > > brightness. This WMI method
> > > +usually only forwards this request to the acpi-video driver, so the
> > > dell-wmi-pega driver does
> > > +not use it.
> >=20
> > Could these paragraphs be reflowed to 80 chars as long textual lines ar=
e
> > harder to read (eye movement required).
>=20
> Sure, will do.
>=20
> > > +WMI method PegaOemNotificationBrightnessDown()
> > > +----------------------------------------------
> > > +
> > > +Notifies the platform that the user wants to decrease the backlight
> > > brightness. See
> > > +``PegaOemNotificationBrightnessUP()`` for details.
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index bd31e734669e..fb9a80f96900 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7534,6 +7534,12 @@ M:=09Pali Roh=C3=A1r <pali@kernel.org>
> > >   S:=09Maintained
> > >   F:=09drivers/platform/x86/dell/dell-wmi-base.c
> > >   +DELL WMI PEGA DRIVER
> > > +M:=09Armin Wolf <W_Armin@gmx.de>
> > > +S:=09Odd Fixes
> > > +F:=09Documentation/wmi/devices/dell-wmi-pega.rst
> > > +F:=09drivers/platform/x86/dell/dell-wmi-pega.c
> > > +
> > >   DELL WMI SYSMAN DRIVER
> > >   M:=09Prasanth Ksr <prasanth.ksr@dell.com>
> > >   L:=09Dell.Client.Kernel@dell.com
> > > diff --git a/drivers/platform/x86/dell/Kconfig
> > > b/drivers/platform/x86/dell/Kconfig
> > > index 9f0016056d7e..289379383ccb 100644
> > > --- a/drivers/platform/x86/dell/Kconfig
> > > +++ b/drivers/platform/x86/dell/Kconfig
> > > @@ -228,6 +228,7 @@ config DELL_WMI_AIO
> > >   =09depends on ACPI_WMI
> > >   =09depends on INPUT
> > >   =09select INPUT_SPARSEKMAP
> > > +=09imply DELL_WMI_PEGA
> > >   =09help
> > >   =09  Say Y here if you want to support WMI-based hotkeys on Dell
> > >   =09  All-In-One machines.
> > > @@ -262,6 +263,18 @@ config DELL_WMI_LED
> > >   =09  This adds support for the Latitude 2100 and similar
> > >   =09  notebooks that have an external LED.
> > >   +config DELL_WMI_PEGA
> > > +=09tristate "Dell WMI AIO Platform Support"
> > > +=09default m
> > > +=09depends on ACPI_WMI
> > > +=09help
> > > +=09  This option adds support for WMI-based platform integration on =
Dell
> > > All-In-One machines.
> > > +=09  This driver is necessary for enabling the delivery of hotkey ev=
ents
> > > to the dell-wmi-aio
> > > +=09  driver on some machines.
> > > +
> > > +=09  To compile this drivers as a module, choose M here: the module =
will
> > > be called
> > > +=09  dell-wmi-pega.
> > > +
> > >   config DELL_WMI_SYSMAN
> > >   =09tristate "Dell WMI-based Systems management driver"
> > >   =09default m
> > > diff --git a/drivers/platform/x86/dell/Makefile
> > > b/drivers/platform/x86/dell/Makefile
> > > index 470874c6e6e6..46c91c240a2c 100644
> > > --- a/drivers/platform/x86/dell/Makefile
> > > +++ b/drivers/platform/x86/dell/Makefile
> > > @@ -27,5 +27,6 @@ obj-$(CONFIG_DELL_WMI_AIO)=09=09=09+=3D
> > > dell-wmi-aio.o
> > >   obj-$(CONFIG_DELL_WMI_DESCRIPTOR)=09=09+=3D dell-wmi-descriptor.o
> > >   obj-$(CONFIG_DELL_WMI_DDV)=09=09=09+=3D dell-wmi-ddv.o
> > >   obj-$(CONFIG_DELL_WMI_LED)=09=09=09+=3D dell-wmi-led.o
> > > +obj-$(CONFIG_DELL_WMI_PEGA)=09=09=09+=3D dell-wmi-pega.o
> > >   obj-$(CONFIG_DELL_WMI_SYSMAN)=09=09=09+=3D dell-wmi-sysman/
> > >   obj-$(CONFIG_DELL_DW5826E_RESET)=09=09+=3D dell-dw5826e-reset.o
> > > diff --git a/drivers/platform/x86/dell/dell-wmi-pega.c
> > > b/drivers/platform/x86/dell/dell-wmi-pega.c
> > > new file mode 100644
> > > index 000000000000..ddb1b6cc6b1c
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/dell/dell-wmi-pega.c
> > > @@ -0,0 +1,93 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * WMI platform integration for Dell All-In-One series.
> > > + *
> > > + * Copyright (C) 2026 Armin Wolf <W_Armin@gmx.de>
> > > + *
> > > + * Based on earlier work by Teodora <teolyub@gmail.com>.
> > > + */
> > > +
> > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > +
> > > +#include <linux/cleanup.h>
> > > +#include <linux/device.h>
> > > +#include <linux/device/driver.h>
> > > +#include <linux/dev_printk.h>
> > > +#include <linux/kernel.h>
> >=20
> > What for is this?
> >=20
> > I suspect direct device.h include isn't necessary either (and it's
> > anyway guaranteed to come through wmi.h).
>=20
> Good question, i copied it from one of the other WMI drivers.

Thanks how they usually end up everywhere. kernel.h is very rarely=20
needed these days.

> I will remove both includes in the next revision.
>=20
> >=20
> > > +#include <linux/module.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/types.h>
> > > +#include <linux/wmi.h>
> > > +
> > > +#define PEGA_GUID=09"2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
> > > +
> > > +enum dell_pega_method {
> > > +=09DELL_PEGA_NOTIFICATION_STARTUP=09=09=3D 0x01,
> > > +=09DELL_PEGA_NOTIFICATION_STOP=09=09=3D 0x02,
> > > +=09DELL_PEGA_NOTIFICATION_BRIGHTNESS_UP=09=3D 0x03,
> > > +=09DELL_PEGA_NOTIFICATION_BRIGHTNESS_DOWN=09=3D 0x04,
> > > +=09DELL_PEGA_NOTIFICATION_RESERVED_1=09=3D 0x05,
> > > +=09DELL_PEGA_NOTIFICATION_RESERVED_2=09=3D 0x06,
> > > +};
> > > +
> > > +static int dell_wmi_pega_invoke(struct wmi_device *wdev, enum
> > > dell_pega_method method)
> > > +{
> > > +=09struct wmi_buffer input =3D { };
> > > +=09struct wmi_buffer output;
> > > +=09int ret;
> > > +
> > > +=09ret =3D wmidev_invoke_method(wdev, 0x0, method, &input, &output,
> > > sizeof(__le32));
> > > +=09if (ret < 0)
> > > +=09=09return ret;
> > > +
> > > +=09__le32 *result __free(kfree) =3D output.data;
> > > +=09/* The return value should always be equal to the WMI method ID *=
/
> > > +=09if (le32_to_cpu(*result) !=3D method)
> >=20
> > Include for le32_to_cpu()
>=20
> What would be the correct include for this?

linux/byteorder/generic.h

--=20
 i.

> > > +=09=09return -EIO;
> > > +
> > > +=09return 0;
> > > +}
> > > +
> > > +static int dell_wmi_pega_probe(struct wmi_device *wdev, const void
> > > *context)
> > > +{
> > > +=09int ret;
> > > +
> > > +=09ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STARTUP=
);
> > > +=09if (ret < 0)
> > > +=09=09dev_err(&wdev->dev,
> > > +=09=09=09"Failed to notify platform of startup, some hotkeys
> > > might not work\n");
> >=20
> > braces for multiline constructs.
> >=20
> > > +
> > > +=09return ret;
> > > +}
> > > +
> > > +static void dell_wmi_pega_shutdown(struct wmi_device *wdev)
> > > +{
> > > +=09int ret;
> > > +
> > > +=09ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STOP);
> > > +=09if (ret < 0)
> > > +=09=09dev_warn(&wdev->dev, "Failed to notify platform of
> > > shutdown\n");
> > > +}
> > > +
> > > +static const struct wmi_device_id dell_wmi_pega_id_table[] =3D {
> > > +=09{ PEGA_GUID, NULL },
> > > +=09{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(wmi, dell_wmi_pega_id_table);
> > > +
> > > +static struct wmi_driver dell_wmi_pega_driver =3D {
> > > +=09.driver =3D {
> > > +=09=09.name =3D "dell-wmi-pega",
> > > +=09=09.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > > +=09},
> > > +=09.id_table =3D dell_wmi_pega_id_table,
> > > +=09.probe =3D dell_wmi_pega_probe,
> > > +=09.remove =3D dell_wmi_pega_shutdown,
> > > +=09.shutdown =3D dell_wmi_pega_shutdown,
> > > +=09.no_singleton =3D true,
> > > +};
> > > +module_wmi_driver(dell_wmi_pega_driver);
> > > +
> > > +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
> > > +MODULE_DESCRIPTION("Dell All-In-One series platform integration");
> > > +MODULE_LICENSE("GPL");
> >=20
> > Just the mandatory nitpicking :-), seems fine otherwise.
>=20
> Thanks,
>=20
> i will wait with sending a v2 until Teodora has tested the second patch.
>=20
> Thanks,
> Armin Wolf
>=20

--8323328-122444894-1794956957=:1563--
