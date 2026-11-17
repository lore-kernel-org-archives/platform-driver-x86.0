Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953850;
	b=cKE60cox4DNQqpFO1nGSN0weW9Q/5KeMnnwI8sFiyQd9+6gFXa8zS3DXpN53q7QPsm/w
	 +hnsIIUS3F5+oda/7Pr+XvVJW9phq7vTFRQcNndqyZ9ehRnweI3CQAJuIDTKth0iaFYkc
	 K9P2i8YxILjhNSBn25OHUz+SbB3vezPKls2G3Wrpd6CRS0fs6trfdzmOsVvJ/zIbksB7M
	 4PwNNxktfPzGvB67nxLQsaib0e5sxBYPeX9YHPvlixWf96lUyPDV5i0oUIme1+n7xECeH
	 6/mMim0oOBH4n6eMDrOK3R97hXcYhKgkJC05QSN2g7zCUuXVTdluZhqO9KV+bHlnmqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953850;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:
	 Content-ID;
	bh=MivSvc4Nf2OzFTNQZl9WdRbEQYv0IMvjbFUs6mhYVfQ=;
	b=OUGG+dbkZkWDs13uoftDy6RMoDHUuzJAzfBHpUyawgjYC9uECp0+zjiftHc4xzigwhee
	 Jac7RcRZMlJU/IYmwGFsMdpuYdxqkTX2X6jFSkuy7X+P1bmISSKfgRb4IyYyVppekfwtN
	 plxWP+GUfTdkcuGkUFBVpNKIaUXLXGC/T5Sho1WkgqIAXPEgnmzDvAtFY+1Pe5NQ3kwBj
	 8bESBogZpekIlUu5T5hiIUvh1XMDXVKjYG+mArWo6RN54YosvicIOYEASXiu53QKWxp/v
	 T9sSYwFtQqaXioYHiflndCyyOhwgqu7IsNTQZoy4+n1jSFNCbhiSLM5lFV59MXbT+lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fos+30Ip;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3324606A31C;
	Tue, 17 Nov 2026 22:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3324606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fos+30Ip
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794953850; x=1826489850;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=uaphQ5UnawxxlCKOE09SJL2jZtSHaJ692MLKDna+3wk=;
  b=fos+30IpyhBL0iHmoBz06r46bywVf6bRiWnoi2cHAw2RnQdruji4M2GR
   XHwjPmiU7UmnBwn6P5w21s0V8h+k1Ui09ApsfWOyE2PGk8+TArOrNaozy
   QAiYy//XowQiVdmc3H0/QSyyxrpXZV34lkX6/1rC1OVf2y+kMOtUjUxB3
   JQ35BP3Eac7tdFzNz9VXb9WYBAx6ugHgtBVi+SdkPfAp8nmUa+l+5IhbO
   DR48VgRlq2dSdnsUU3c2WIA5YYkX6vTA7G6SW2Y3wX/c07SNRd2Lr9BOF
   v5d6mE/7jWqJvGTWD99GxnZd0heqL+me1KNi6pCa1sHmKuJeODQOSXUC4
   Q==;
X-CSE-ConnectionGUID: ZPUXdO4YTVeOTiZl1LU2VA==
X-CSE-MsgGUID: K3xGY21aQTiH9L8c7IzFIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3608922"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3608922"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 14:17:29 -0800
X-CSE-ConnectionGUID: 0A0OrMACSj6Rc7Fouu0AWg==
X-CSE-MsgGUID: vwyLd5tKSxuj4wGNbnriGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10208993"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.79])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 14:17:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Nov 2026 00:17:23 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, teolyub@gmail.com
Subject: Re: [PATCH 1/2] platform/x86: dell: Add new dell-wmi-pega driver
In-Reply-To: <20261117214604.397131-1-W_Armin@gmx.de>
Message-ID: <f71860dd-cf85-ddd9-8e47-7279205f46ab@linux.intel.com>
References: <20261117214604.397131-1-W_Armin@gmx.de>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1615295483-1794953506=:1563"
Content-ID: <ad817e31-766b-288e-cb05-5d50e236df29@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1615295483-1794953506=:1563
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <a9584a08-9ef5-a92f-f1d7-dc1c8fea553c@linux.intel.com>

On Tue, 17 Nov 2026, Armin Wolf wrote:

> A user has reported that the WMI hotkey events on Dell All-In-One
> machines need to be manually enabled on some models thru a separate
> WMI device. This WMI device seems to be present on many other models
> but has no effect on them.

Can you rephrase this to not textually depend on "user" or "user's=20
report", just state what the problem is, not how you became aware of it.

> Add a small driver for enabling support for this WMI device. This
> enables the HDMI Input key on the Dell OptiPlex 7400 All-in-One
> machine.
>=20
> Reported-by: Teodora <teolyub@gmail.com>
> Closes: https://lore.kernel.org/platform-driver-x86/0TZENT.54P2IBFQRED22@=
gmail.com
> Tested-by: Teodora <teolyub@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  Documentation/wmi/devices/dell-wmi-pega.rst | 82 ++++++++++++++++++
>  MAINTAINERS                                 |  6 ++
>  drivers/platform/x86/dell/Kconfig           | 13 +++
>  drivers/platform/x86/dell/Makefile          |  1 +
>  drivers/platform/x86/dell/dell-wmi-pega.c   | 93 +++++++++++++++++++++
>  5 files changed, 195 insertions(+)
>  create mode 100644 Documentation/wmi/devices/dell-wmi-pega.rst
>  create mode 100644 drivers/platform/x86/dell/dell-wmi-pega.c
>=20
> diff --git a/Documentation/wmi/devices/dell-wmi-pega.rst b/Documentation/=
wmi/devices/dell-wmi-pega.rst
> new file mode 100644
> index 000000000000..935c8511594b
> --- /dev/null
> +++ b/Documentation/wmi/devices/dell-wmi-pega.rst
> @@ -0,0 +1,82 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Dell All-In-One Series Platform Integration (dell-wmi-pega)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +------------
> +
> +Many Dell All-In-One devices contain a WMI device for notifying the unde=
rlying platform
> +of various OS-specific events like power up, shutdown and backlight brig=
htness control.
> +
> +Not implementing support for this WMI device might prevent hotkeys expos=
ed over WMI from
> +working on some models.
> +
> +WMI interface description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +The WMI interface description can be decoded from the embedded binary MO=
F (bmof)
> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> +
> +::
> +
> + [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> +  Description("Class used to operate method - WMBC"),
> +  guid("{2D703EE8-36AC-4F88-BDB5-7556CE6B2946}") : ToInstance]
> + class AcpiOSD_WMBC_method : WMIMethod {
> +
> +   [key, read]
> +   string InstanceName;
> +
> +   [read]
> +   boolean Active;
> +
> +   [WmiMethodId(1), Implemented, read, write,
> +    Description("Invoked by AP when system up.")]
> +   void PegaOemNotificationStartUp([out, Description("Return Value")] ui=
nt32 RetVal);
> +
> +   [WmiMethodId(2), Implemented, read, write,
> +    Description("Invoked by AP when system is going to off state.")]
> +   void PegaOemNotificationStop([out, Description("Return Value")] uint3=
2 RetVal);
> +
> +   [WmiMethodId(3), Implemented, read, write,
> +    Description("Invoked by Application to tune up brightness.")]
> +   void PegaOemNotificationBrightnessUP([out, Description("Return Value"=
)] uint32 RetVal);
> +
> +   [WmiMethodId(4), Implemented, read, write,
> +    Description("Invoked by Application to tune down brightness.")]
> +   void PegaOemNotificationBrightnessDown([out, Description("Return Valu=
e")] uint32 RetVal);
> +
> +   [WmiMethodId(5), Implemented, read, write, Description("Reserved.")]
> +   void PegaOemNotificationRSVD1([out, Description("Return Value")] uint=
32 RetVal);
> +
> +   [WmiMethodId(6), Implemented, read, write, Description("Reserved.")]
> +   void PegaOemNotificationRSVD2([out, Description("Return Value")] uint=
32 RetVal);
> + };
> +
> +The return value of each WMI method should be equal to the WMI method ID=
=2E
> +
> +WMI method PegaOemNotificationStartUp()
> +---------------------------------------
> +
> +Notifies the platform that the OS is operational. On some models this WM=
I method also enables
> +reporting of hotkey events over WMI.
> +
> +WMI method PegaOemNotificationStop()
> +------------------------------------
> +
> +Notifies the platform that the OS is shutting down.
> +
> +WMI method PegaOemNotificationBrightnessUP()
> +--------------------------------------------
> +
> +Notifies the platform that the user wants to increase the backlight brig=
htness. This WMI method
> +usually only forwards this request to the acpi-video driver, so the dell=
-wmi-pega driver does
> +not use it.

Could these paragraphs be reflowed to 80 chars as long textual lines are=20
harder to read (eye movement required).

> +WMI method PegaOemNotificationBrightnessDown()
> +----------------------------------------------
> +
> +Notifies the platform that the user wants to decrease the backlight brig=
htness. See
> +``PegaOemNotificationBrightnessUP()`` for details.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd31e734669e..fb9a80f96900 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7534,6 +7534,12 @@ M:=09Pali Roh=E1r <pali@kernel.org>
>  S:=09Maintained
>  F:=09drivers/platform/x86/dell/dell-wmi-base.c
> =20
> +DELL WMI PEGA DRIVER
> +M:=09Armin Wolf <W_Armin@gmx.de>
> +S:=09Odd Fixes
> +F:=09Documentation/wmi/devices/dell-wmi-pega.rst
> +F:=09drivers/platform/x86/dell/dell-wmi-pega.c
> +
>  DELL WMI SYSMAN DRIVER
>  M:=09Prasanth Ksr <prasanth.ksr@dell.com>
>  L:=09Dell.Client.Kernel@dell.com
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/del=
l/Kconfig
> index 9f0016056d7e..289379383ccb 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -228,6 +228,7 @@ config DELL_WMI_AIO
>  =09depends on ACPI_WMI
>  =09depends on INPUT
>  =09select INPUT_SPARSEKMAP
> +=09imply DELL_WMI_PEGA
>  =09help
>  =09  Say Y here if you want to support WMI-based hotkeys on Dell
>  =09  All-In-One machines.
> @@ -262,6 +263,18 @@ config DELL_WMI_LED
>  =09  This adds support for the Latitude 2100 and similar
>  =09  notebooks that have an external LED.
> =20
> +config DELL_WMI_PEGA
> +=09tristate "Dell WMI AIO Platform Support"
> +=09default m
> +=09depends on ACPI_WMI
> +=09help
> +=09  This option adds support for WMI-based platform integration on Dell=
 All-In-One machines.
> +=09  This driver is necessary for enabling the delivery of hotkey events=
 to the dell-wmi-aio
> +=09  driver on some machines.
> +
> +=09  To compile this drivers as a module, choose M here: the module will=
 be called
> +=09  dell-wmi-pega.
> +
>  config DELL_WMI_SYSMAN
>  =09tristate "Dell WMI-based Systems management driver"
>  =09default m
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/de=
ll/Makefile
> index 470874c6e6e6..46c91c240a2c 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -27,5 +27,6 @@ obj-$(CONFIG_DELL_WMI_AIO)=09=09=09+=3D dell-wmi-aio.o
>  obj-$(CONFIG_DELL_WMI_DESCRIPTOR)=09=09+=3D dell-wmi-descriptor.o
>  obj-$(CONFIG_DELL_WMI_DDV)=09=09=09+=3D dell-wmi-ddv.o
>  obj-$(CONFIG_DELL_WMI_LED)=09=09=09+=3D dell-wmi-led.o
> +obj-$(CONFIG_DELL_WMI_PEGA)=09=09=09+=3D dell-wmi-pega.o
>  obj-$(CONFIG_DELL_WMI_SYSMAN)=09=09=09+=3D dell-wmi-sysman/
>  obj-$(CONFIG_DELL_DW5826E_RESET)=09=09+=3D dell-dw5826e-reset.o
> diff --git a/drivers/platform/x86/dell/dell-wmi-pega.c b/drivers/platform=
/x86/dell/dell-wmi-pega.c
> new file mode 100644
> index 000000000000..ddb1b6cc6b1c
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-wmi-pega.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * WMI platform integration for Dell All-In-One series.
> + *
> + * Copyright (C) 2026 Armin Wolf <W_Armin@gmx.de>
> + *
> + * Based on earlier work by Teodora <teolyub@gmail.com>.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/device/driver.h>
> +#include <linux/dev_printk.h>
> +#include <linux/kernel.h>

What for is this?

I suspect direct device.h include isn't necessary either (and it's=20
anyway guaranteed to come through wmi.h).

> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#define PEGA_GUID=09"2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
> +
> +enum dell_pega_method {
> +=09DELL_PEGA_NOTIFICATION_STARTUP=09=09=3D 0x01,
> +=09DELL_PEGA_NOTIFICATION_STOP=09=09=3D 0x02,
> +=09DELL_PEGA_NOTIFICATION_BRIGHTNESS_UP=09=3D 0x03,
> +=09DELL_PEGA_NOTIFICATION_BRIGHTNESS_DOWN=09=3D 0x04,
> +=09DELL_PEGA_NOTIFICATION_RESERVED_1=09=3D 0x05,
> +=09DELL_PEGA_NOTIFICATION_RESERVED_2=09=3D 0x06,
> +};
> +
> +static int dell_wmi_pega_invoke(struct wmi_device *wdev, enum dell_pega_=
method method)
> +{
> +=09struct wmi_buffer input =3D { };
> +=09struct wmi_buffer output;
> +=09int ret;
> +
> +=09ret =3D wmidev_invoke_method(wdev, 0x0, method, &input, &output, size=
of(__le32));
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09__le32 *result __free(kfree) =3D output.data;
> +=09/* The return value should always be equal to the WMI method ID */
> +=09if (le32_to_cpu(*result) !=3D method)

Include for le32_to_cpu()=20

> +=09=09return -EIO;
> +
> +=09return 0;
> +}
> +
> +static int dell_wmi_pega_probe(struct wmi_device *wdev, const void *cont=
ext)
> +{
> +=09int ret;
> +
> +=09ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STARTUP);
> +=09if (ret < 0)
> +=09=09dev_err(&wdev->dev,
> +=09=09=09"Failed to notify platform of startup, some hotkeys might not w=
ork\n");

braces for multiline constructs.

> +
> +=09return ret;
> +}
> +
> +static void dell_wmi_pega_shutdown(struct wmi_device *wdev)
> +{
> +=09int ret;
> +
> +=09ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STOP);
> +=09if (ret < 0)
> +=09=09dev_warn(&wdev->dev, "Failed to notify platform of shutdown\n");
> +}
> +
> +static const struct wmi_device_id dell_wmi_pega_id_table[] =3D {
> +=09{ PEGA_GUID, NULL },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, dell_wmi_pega_id_table);
> +
> +static struct wmi_driver dell_wmi_pega_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "dell-wmi-pega",
> +=09=09.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +=09},
> +=09.id_table =3D dell_wmi_pega_id_table,
> +=09.probe =3D dell_wmi_pega_probe,
> +=09.remove =3D dell_wmi_pega_shutdown,
> +=09.shutdown =3D dell_wmi_pega_shutdown,
> +=09.no_singleton =3D true,
> +};
> +module_wmi_driver(dell_wmi_pega_driver);
> +
> +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
> +MODULE_DESCRIPTION("Dell All-In-One series platform integration");
> +MODULE_LICENSE("GPL");

Just the mandatory nitpicking :-), seems fine otherwise.


--=20
 i.
--8323328-1615295483-1794953506=:1563--
