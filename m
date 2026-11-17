Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954668;
	b=W6bAohTAmo5aTeP4VU9INPwvyxQBTmtHa8PrJnGd/KhLro3wbB785Hp0537p28lJR9H/
	 z0STItfCX2XI8F47C3aX+YD6uOGaWTivg/rkxdhKgB0J1+E8QelpZQcsvHKvPZcoQufaI
	 6LmRBth13x1j5lHET9lAQCZUbE7IQ2jIRLoFMI//BaxWrzho7urZi7mTPeVpd51Hg82CQ
	 199OtHciKu0mHMLicJXo4FUkXwpM66lBgavx1wDMwJKnrQvmCcGWp3DqUBqwRbC4E9NEp
	 Eun4xTgcd8mZpsBcWLzCDvv57KZrpDqzQAraB0BQZWe7eeORVU7g939V2F2ORKJ+WAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954668;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=y+e9NIyLZ99372VSzEOimXUz7LwYtjzQkyF/ebKtfOo=;
	b=KBaf5VWoXsG/cP1fdX0ueDUFC18IKjC0plLPG+Ul/0/lf0WTyr7FCobFqooAq+v41wS5
	 XX7IV9TFM7CQlbzE3YLGegpkFkmlaUSF7BLeWINHAKr8dmDkp7th5A37h/kpgZiC/F8nJ
	 Qpl8G2LYd5cCJAlVW/Ai1Vq/7bZpIwmtf+8C71fmNUIoEmYjuCO1aDi0hTXyCPbueHmaI
	 0d8KTYoSUm8LwjmWhC9tDd+OssbuXWPVPbcjeeIjRjwDQ+kbVc3i2RDSOhHG1MFnRZKVf
	 fD9oNokyp/LpfmQRe39M2yYmRl91QqNvBM2H5bb7FPmkICTDQ+9uvi+SVhQwEV/xOxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ibL71rS6;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2280606A332
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 22:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2280606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ibL71rS6
DKIM2-Signature:  i=1; m=1; t=1794954665;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:WsN3k2I7KbUEa4weUAHNpe7ZMM57
   1pTnGcxJBOy38OR+NXjRfhwG4TRvzqt11j3GmtCJJvTaaBwfrOWqaKDPMC5ZWX/Jsx8y4qH1A/D
   3XahKKTkYdW6pgLyb232ztjBV+y4HutC01uRcQRVC2GRXEGagAdEgJG0hUUqoImXYMsQU8kDEa1
   TGZcexEMG4s5HtZuKYaSgr0+osvRRI1vlX5QP13B2DHObivG/0GOE7TaHCVLHUXjPvp0m//JgDF
   QAzVzQnlMY56BrngyZmcYgIHDZaPYX1BSIZ9NAs0rEvj+c8JgjdaENUNv0q0sgtOFYLNgT5/+En
   zcsTuAb360k6cQ==;
Message-Instance:  m=1;
 h=sha256:
   EuDouZKNy8J7EMUL9ISZHz2EoJ6V54Cy6Ns7tShDPh0=:
   Ep8FroOW4fNT1t+S65CCditT8kkrTbMuEGLWWWWHZVg=,
  sha512:
   sjXdJPWs8rcO993N3pWXe/ogRwDolzHsOAEKVu2wiH3LMV3TVcxfMRwoO+Ojtfga3TtCuj62cDmaCD6fPaR+2Q==:
   7+rjqT3jJ4YmAee9jzYgAtpuhJFU7JAL3gF0ayRSgQ2c58cnJLzFAwBd6PJpis8F/LvAn9PMDBteLaUf4nqBkg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794954654; x=1795559454; i=w_armin@gmx.de;
	bh=y+e9NIyLZ99372VSzEOimXUz7LwYtjzQkyF/ebKtfOo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ibL71rS6MuuSU1mfNA4RZ7FXyVs+1fDUnQiz44HXJsThm8WzW19tpLxfW9rfYnU0
	 xV4+X3Gp+sPenwcjFcEjQ8SbYAV9J85RRYrrVTB4N+YpfT+L5vtP5XJeYpn/QRRhk
	 M8wcS0prA79bwDBlgmAk/fq6pM0K7lW4fnKm2A62Bp1VgdL0veqZWIMn3HXTLlpeW
	 jbF0EhxaT3NrGgiH+5f0PJAis39S0QGKbNSOxJyAbeABp85jIx+2hyYMUDalthvth
	 N1e8vhLT75o0fjeLnteKS2IaPA92I+28i5LqVRR1FhmScnyeqJJq5MOnZaBxxsW/P
	 iAtmTmjeTSUDapQp8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0Fxf-1wXkPC3pCx-00vpGF; Tue, 17
 Nov 2026 23:30:53 +0100
Message-ID: <848ebb18-b9bf-4747-9403-fa8da4fba2ad@gmx.de>
Date: Tue, 17 Nov 2026 23:30:52 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: dell: Add new dell-wmi-pega driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, teolyub@gmail.com
References: <20261117214604.397131-1-W_Armin@gmx.de>
 <f71860dd-cf85-ddd9-8e47-7279205f46ab@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <f71860dd-cf85-ddd9-8e47-7279205f46ab@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jb0Gi/eTDiz0/yX6Lxsdh1pyhuAGRBtqLkIry5RTmnVE+AOcNHw
 z+V0zpnKJTAKQ2SDCEykr3xC294R4sMAmlnv4uN62WFCFVQCt2yGyzS7LNCC2CMOpckTKOY
 W4BM255toslAcN+Nnx/7ZxOlALtecKVJfIAetVvR1Sv0hlcif4T57JXCxT7u3SYysMlO0NH
 tOUEHuZoYUKm7WcjjIY5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ioUPAb53sIA=;gb09tFxIM77Iuh7QygFCAH+WbdA
 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
 V2/723HTFlqzY=

Am 17.11.26 um 23:17 schrieb Ilpo J=C3=A4rvinen:
> On Tue, 17 Nov 2026, Armin Wolf wrote:
>=20
>> A user has reported that the WMI hotkey events on Dell All-In-One
>> machines need to be manually enabled on some models thru a separate
>> WMI device. This WMI device seems to be present on many other models
>> but has no effect on them.
>=20
> Can you rephrase this to not textually depend on "user" or "user's
> report", just state what the problem is, not how you became aware of it.
>=20
>> Add a small driver for enabling support for this WMI device. This
>> enables the HDMI Input key on the Dell OptiPlex 7400 All-in-One
>> machine.
>>
>> Reported-by: Teodora <teolyub@gmail.com>
>> Closes: https://lore.kernel.org/platform-driver-x86/0TZENT.54P2IBFQRED2=
2@gmail.com
>> Tested-by: Teodora <teolyub@gmail.com>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   Documentation/wmi/devices/dell-wmi-pega.rst | 82 ++++++++++++++++++
>>   MAINTAINERS                                 |  6 ++
>>   drivers/platform/x86/dell/Kconfig           | 13 +++
>>   drivers/platform/x86/dell/Makefile          |  1 +
>>   drivers/platform/x86/dell/dell-wmi-pega.c   | 93 ++++++++++++++++++++=
+
>>   5 files changed, 195 insertions(+)
>>   create mode 100644 Documentation/wmi/devices/dell-wmi-pega.rst
>>   create mode 100644 drivers/platform/x86/dell/dell-wmi-pega.c
>>
>> diff --git a/Documentation/wmi/devices/dell-wmi-pega.rst b/Documentatio=
n/wmi/devices/dell-wmi-pega.rst
>> new file mode 100644
>> index 000000000000..935c8511594b
>> --- /dev/null
>> +++ b/Documentation/wmi/devices/dell-wmi-pega.rst
>> @@ -0,0 +1,82 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Dell All-In-One Series Platform Integration (dell-wmi-pega)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Introduction
>> +------------
>> +
>> +Many Dell All-In-One devices contain a WMI device for notifying the un=
derlying platform
>> +of various OS-specific events like power up, shutdown and backlight br=
ightness control.
>> +
>> +Not implementing support for this WMI device might prevent hotkeys exp=
osed over WMI from
>> +working on some models.
>> +
>> +WMI interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> +
>> +The WMI interface description can be decoded from the embedded binary =
MOF (bmof)
>> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>> +
>> +::
>> +
>> + [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>> +  Description("Class used to operate method - WMBC"),
>> +  guid("{2D703EE8-36AC-4F88-BDB5-7556CE6B2946}") : ToInstance]
>> + class AcpiOSD_WMBC_method : WMIMethod {
>> +
>> +   [key, read]
>> +   string InstanceName;
>> +
>> +   [read]
>> +   boolean Active;
>> +
>> +   [WmiMethodId(1), Implemented, read, write,
>> +    Description("Invoked by AP when system up.")]
>> +   void PegaOemNotificationStartUp([out, Description("Return Value")] =
uint32 RetVal);
>> +
>> +   [WmiMethodId(2), Implemented, read, write,
>> +    Description("Invoked by AP when system is going to off state.")]
>> +   void PegaOemNotificationStop([out, Description("Return Value")] uin=
t32 RetVal);
>> +
>> +   [WmiMethodId(3), Implemented, read, write,
>> +    Description("Invoked by Application to tune up brightness.")]
>> +   void PegaOemNotificationBrightnessUP([out, Description("Return Valu=
e")] uint32 RetVal);
>> +
>> +   [WmiMethodId(4), Implemented, read, write,
>> +    Description("Invoked by Application to tune down brightness.")]
>> +   void PegaOemNotificationBrightnessDown([out, Description("Return Va=
lue")] uint32 RetVal);
>> +
>> +   [WmiMethodId(5), Implemented, read, write, Description("Reserved.")=
]
>> +   void PegaOemNotificationRSVD1([out, Description("Return Value")] ui=
nt32 RetVal);
>> +
>> +   [WmiMethodId(6), Implemented, read, write, Description("Reserved.")=
]
>> +   void PegaOemNotificationRSVD2([out, Description("Return Value")] ui=
nt32 RetVal);
>> + };
>> +
>> +The return value of each WMI method should be equal to the WMI method =
ID.
>> +
>> +WMI method PegaOemNotificationStartUp()
>> +---------------------------------------
>> +
>> +Notifies the platform that the OS is operational. On some models this =
WMI method also enables
>> +reporting of hotkey events over WMI.
>> +
>> +WMI method PegaOemNotificationStop()
>> +------------------------------------
>> +
>> +Notifies the platform that the OS is shutting down.
>> +
>> +WMI method PegaOemNotificationBrightnessUP()
>> +--------------------------------------------
>> +
>> +Notifies the platform that the user wants to increase the backlight br=
ightness. This WMI method
>> +usually only forwards this request to the acpi-video driver, so the de=
ll-wmi-pega driver does
>> +not use it.
>=20
> Could these paragraphs be reflowed to 80 chars as long textual lines are
> harder to read (eye movement required).

Sure, will do.

>> +WMI method PegaOemNotificationBrightnessDown()
>> +----------------------------------------------
>> +
>> +Notifies the platform that the user wants to decrease the backlight br=
ightness. See
>> +``PegaOemNotificationBrightnessUP()`` for details.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index bd31e734669e..fb9a80f96900 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7534,6 +7534,12 @@ M:	Pali Roh=C3=A1r <pali@kernel.org>
>>   S:	Maintained
>>   F:	drivers/platform/x86/dell/dell-wmi-base.c
>>  =20
>> +DELL WMI PEGA DRIVER
>> +M:	Armin Wolf <W_Armin@gmx.de>
>> +S:	Odd Fixes
>> +F:	Documentation/wmi/devices/dell-wmi-pega.rst
>> +F:	drivers/platform/x86/dell/dell-wmi-pega.c
>> +
>>   DELL WMI SYSMAN DRIVER
>>   M:	Prasanth Ksr <prasanth.ksr@dell.com>
>>   L:	Dell.Client.Kernel@dell.com
>> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/d=
ell/Kconfig
>> index 9f0016056d7e..289379383ccb 100644
>> --- a/drivers/platform/x86/dell/Kconfig
>> +++ b/drivers/platform/x86/dell/Kconfig
>> @@ -228,6 +228,7 @@ config DELL_WMI_AIO
>>   	depends on ACPI_WMI
>>   	depends on INPUT
>>   	select INPUT_SPARSEKMAP
>> +	imply DELL_WMI_PEGA
>>   	help
>>   	  Say Y here if you want to support WMI-based hotkeys on Dell
>>   	  All-In-One machines.
>> @@ -262,6 +263,18 @@ config DELL_WMI_LED
>>   	  This adds support for the Latitude 2100 and similar
>>   	  notebooks that have an external LED.
>>  =20
>> +config DELL_WMI_PEGA
>> +	tristate "Dell WMI AIO Platform Support"
>> +	default m
>> +	depends on ACPI_WMI
>> +	help
>> +	  This option adds support for WMI-based platform integration on Dell=
 All-In-One machines.
>> +	  This driver is necessary for enabling the delivery of hotkey events=
 to the dell-wmi-aio
>> +	  driver on some machines.
>> +
>> +	  To compile this drivers as a module, choose M here: the module will=
 be called
>> +	  dell-wmi-pega.
>> +
>>   config DELL_WMI_SYSMAN
>>   	tristate "Dell WMI-based Systems management driver"
>>   	default m
>> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/=
dell/Makefile
>> index 470874c6e6e6..46c91c240a2c 100644
>> --- a/drivers/platform/x86/dell/Makefile
>> +++ b/drivers/platform/x86/dell/Makefile
>> @@ -27,5 +27,6 @@ obj-$(CONFIG_DELL_WMI_AIO)			+=3D dell-wmi-aio.o
>>   obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+=3D dell-wmi-descriptor.o
>>   obj-$(CONFIG_DELL_WMI_DDV)			+=3D dell-wmi-ddv.o
>>   obj-$(CONFIG_DELL_WMI_LED)			+=3D dell-wmi-led.o
>> +obj-$(CONFIG_DELL_WMI_PEGA)			+=3D dell-wmi-pega.o
>>   obj-$(CONFIG_DELL_WMI_SYSMAN)			+=3D dell-wmi-sysman/
>>   obj-$(CONFIG_DELL_DW5826E_RESET)		+=3D dell-dw5826e-reset.o
>> diff --git a/drivers/platform/x86/dell/dell-wmi-pega.c b/drivers/platfo=
rm/x86/dell/dell-wmi-pega.c
>> new file mode 100644
>> index 000000000000..ddb1b6cc6b1c
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell/dell-wmi-pega.c
>> @@ -0,0 +1,93 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * WMI platform integration for Dell All-In-One series.
>> + *
>> + * Copyright (C) 2026 Armin Wolf <W_Armin@gmx.de>
>> + *
>> + * Based on earlier work by Teodora <teolyub@gmail.com>.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/device.h>
>> +#include <linux/device/driver.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/kernel.h>
>=20
> What for is this?
>=20
> I suspect direct device.h include isn't necessary either (and it's
> anyway guaranteed to come through wmi.h).

Good question, i copied it from one of the other WMI drivers.

I will remove both includes in the next revision.

>=20
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +#include <linux/wmi.h>
>> +
>> +#define PEGA_GUID	"2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
>> +
>> +enum dell_pega_method {
>> +	DELL_PEGA_NOTIFICATION_STARTUP		=3D 0x01,
>> +	DELL_PEGA_NOTIFICATION_STOP		=3D 0x02,
>> +	DELL_PEGA_NOTIFICATION_BRIGHTNESS_UP	=3D 0x03,
>> +	DELL_PEGA_NOTIFICATION_BRIGHTNESS_DOWN	=3D 0x04,
>> +	DELL_PEGA_NOTIFICATION_RESERVED_1	=3D 0x05,
>> +	DELL_PEGA_NOTIFICATION_RESERVED_2	=3D 0x06,
>> +};
>> +
>> +static int dell_wmi_pega_invoke(struct wmi_device *wdev, enum dell_peg=
a_method method)
>> +{
>> +	struct wmi_buffer input =3D { };
>> +	struct wmi_buffer output;
>> +	int ret;
>> +
>> +	ret =3D wmidev_invoke_method(wdev, 0x0, method, &input, &output, size=
of(__le32));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	__le32 *result __free(kfree) =3D output.data;
>> +	/* The return value should always be equal to the WMI method ID */
>> +	if (le32_to_cpu(*result) !=3D method)
>=20
> Include for le32_to_cpu()

What would be the correct include for this?

>=20
>> +		return -EIO;
>> +
>> +	return 0;
>> +}
>> +
>> +static int dell_wmi_pega_probe(struct wmi_device *wdev, const void *co=
ntext)
>> +{
>> +	int ret;
>> +
>> +	ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STARTUP);
>> +	if (ret < 0)
>> +		dev_err(&wdev->dev,
>> +			"Failed to notify platform of startup, some hotkeys might not work\=
n");
>=20
> braces for multiline constructs.
>=20
>> +
>> +	return ret;
>> +}
>> +
>> +static void dell_wmi_pega_shutdown(struct wmi_device *wdev)
>> +{
>> +	int ret;
>> +
>> +	ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STOP);
>> +	if (ret < 0)
>> +		dev_warn(&wdev->dev, "Failed to notify platform of shutdown\n");
>> +}
>> +
>> +static const struct wmi_device_id dell_wmi_pega_id_table[] =3D {
>> +	{ PEGA_GUID, NULL },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(wmi, dell_wmi_pega_id_table);
>> +
>> +static struct wmi_driver dell_wmi_pega_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "dell-wmi-pega",
>> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>> +	},
>> +	.id_table =3D dell_wmi_pega_id_table,
>> +	.probe =3D dell_wmi_pega_probe,
>> +	.remove =3D dell_wmi_pega_shutdown,
>> +	.shutdown =3D dell_wmi_pega_shutdown,
>> +	.no_singleton =3D true,
>> +};
>> +module_wmi_driver(dell_wmi_pega_driver);
>> +
>> +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
>> +MODULE_DESCRIPTION("Dell All-In-One series platform integration");
>> +MODULE_LICENSE("GPL");
>=20
> Just the mandatory nitpicking :-), seems fine otherwise.

Thanks,

i will wait with sending a v2 until Teodora has tested the second patch.

Thanks,
Armin Wolf
