Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A54D27E049;
	Wed, 29 Apr 2026 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454264; cv=none; b=N9SsrZ0wbH9J1Yt2Ij2ZyMjwjp3mhQn+plwCkcYxUpE4qlgOAjHlEDn0UjAzhG906C7GAEGDIi/4HkVNBGCrQQFB7pwr0WNZxD0icCbcEetGg+UWsRG6QcnSTQl7FxZJArkvJVMuaKC1KraFH9TAZGB2WiRVhYDO3GrY5css1LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454264; c=relaxed/simple;
	bh=W3zpXZSjtkcN34mXKkD0469dD+Kql8YDBhcrH/5USTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqNgmMeWXiLakhpvxBWNL293B1edvSm7Im/MJggJoflIDEX0Nb6ceBAkI4cl9rbt6AXgCc1Vb4JzyVYCggbAJkvGV9emf3ExuJ7IwysPLXi/U/0i1NjUsW7RQtgEzNhUyewBwf6g7G+tL4GVGnw5Prvqz/Gelgnmqq7xRjtD5VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=YxiJVpn8; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="YxiJVpn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777454250; x=1778059050; i=w_armin@gmx.de;
	bh=rYwlNp1q5R0CZa3DslcMQJt3QNd0EQTsLcTXlqNk948=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YxiJVpn8eViItRWnd9Xsh0GnDGEM0KWIaq2KUht/OLWC9Gg1forAxKxglAOhxh9y
	 lb23Z/AgiTqS/9EsYvQ3a3WsWSNvQ2MRku5gLNmMJcm2R9dj5BW8c41gulya7HIHI
	 Ig7gMItSEcAPFazgXcg3U4x5QaflfoHrp5dp6hBexACtWCqzgBh4GRLxn290aR3QV
	 HSKKdUwKHteuXpmIL0c4HFFmpbL73zwHGA37et9FquibWQ+mgnrLc3+im4utvSWy8
	 +u4jnAz/MWDTD46bd7gqmAjHGIx+zoClzrsfvx03Mn6Ygabp+sB7R8anbx3i6bF7R
	 5w4dbPTZmhwwrdmJyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoN2-1w6W3I1t1a-0059Wu; Wed, 29
 Apr 2026 11:17:30 +0200
Message-ID: <f4578401-1182-45bd-bdab-c1d0e310ad1a@gmx.de>
Date: Wed, 29 Apr 2026 11:17:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
To: Jack Wu <wojackbb@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mario Limonciello <superm1@kernel.org>
References: <20260429060643.2367630-1-jackbb_wu@compal.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260429060643.2367630-1-jackbb_wu@compal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5tiuLPqynrfOCYUny4VHtbAAUc+vXsCd1l5JFe6Vg/kkoLMIvER
 qIr7zmrxE646KvY0Z4uarVH9YHwxtYsNxHm6DQANs5w9LKRCpkLMdSHko0vh/GIqvdkjrX6
 y6/vym74AfC1cFosloxh8vgge3v/x+qq5vjmRQrkHrPsTyYQo+bYsLW+W8O3tysEc13QxRt
 CLirbGqh5fScOGHlZLcNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vX6LL/ZFdA0=;plg6/AyhXmkzsGwjsY0wsuIlFS0
 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
 My3NINxRUSKbREDvh16hBQx1VOs=

Am 29.04.26 um 08:06 schrieb Jack Wu:
> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI=
.
>=20
> E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset
>=20
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
> v5:
>    - Use BIT() for the DSM method
> v4:
>    - Fix version of the ABI documentation to 7.2
>    - Add include linux/types.h
> v3:
>    - Rename sysfs attribute from "pldr" to "wwan_reset" for clarity
>    - Add ABI documentation for the wwan_reset sysfs interface
>    - Validate _DSM method availability in probe using acpi_check_dsm()
> v2:
>    - Remove extra empty line
>    - Add missing includes and Remove unnecessary includes, sort includes=
 alphabetically
>    - Remove noisy dev_info()
>    - Handle obj->type !=3D ACPI_TYPE_BUFFER as error with proper return =
code
>    - Replace miscdevice/file_operations with sysfs attribute (DEVICE_ATT=
R_WO) to reduce boilerplate
>    - Propagate trigger_palc_pldr() return code to userspace
>    - Convert from acpi_driver to platform_driver
> ---
> ---
>   .../testing/sysfs-driver-dell-dw5826e-reset   |  9 ++
>   drivers/platform/x86/dell/Kconfig             |  6 ++
>   drivers/platform/x86/dell/Makefile            |  2 +
>   .../platform/x86/dell/dell-dw5826e-reset.c    | 93 +++++++++++++++++++
>   4 files changed, 110 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e=
-reset
>   create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset b=
/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> new file mode 100644
> index 000000000000..a665e265633f
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/platform/devices/<PALC0001 device>/wwan_reset
> +Date:		April 2026
> +KernelVersion:	7.2
> +Contact:	Jackbb Wu <jackbb.wu@compal.com>
> +Description:
> +		Writing to this file triggers a Platform Level Device Reset
> +		(PLDR) of the Dell DW5826e WWAN module via an ACPI _DSM
> +		method. This can be used to recover the modem when it is in
> +		a frozen state and unable to respond to USB commands.
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/de=
ll/Kconfig
> index 738c108c2163..c4540c837a88 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -276,4 +276,10 @@ config DELL_WMI_SYSMAN
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called dell-wmi-sysman.
>  =20
> +config DELL_DW5826E_RESET
> +	tristate "Dell DW5826e PLDR reset support"
> +	default m
> +	depends on ACPI
> +	help
> +	  This adds support for the Dell DW5826e PLDR reset via ACPI
>   endif # X86_PLATFORM_DRIVERS_DELL
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/d=
ell/Makefile
> index c7501c25e627..8150283cfd1d 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -28,3 +28,5 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+=3D dell-wmi-descr=
iptor.o
>   obj-$(CONFIG_DELL_WMI_DDV)			+=3D dell-wmi-ddv.o
>   obj-$(CONFIG_DELL_WMI_LED)			+=3D dell-wmi-led.o
>   obj-$(CONFIG_DELL_WMI_SYSMAN)			+=3D dell-wmi-sysman/
> +obj-$(CONFIG_DELL_DW5826E_RESET)		+=3D dell-dw5826e-reset.o
> +
> diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/pl=
atform/x86/dell/dell-dw5826e-reset.c
> new file mode 100644
> index 000000000000..24b18062ae0e
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> + *
> + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +
> +#define PALC_DSM_FN_TRIGGER_PLDR    1
> +
> +static guid_t palc_dsm_guid =3D
> +	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0x=
fd, 0xfe, 0x59);
> +
> +static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
> +{
> +	union acpi_object *obj;
> +	int ret =3D 0;
> +
> +	obj =3D acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM_FN_T=
RIGGER_PLDR), NULL);
> +	if (!obj) {
> +		dev_err(dev, "Failed to evaluate _DSM\n");
> +		return -EIO;
> +	}
> +
> +	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +		dev_err(dev, "Unexpected _DSM return type: %d\n", obj->type);
> +		ret =3D -EINVAL;
> +	}
> +
> +	ACPI_FREE(obj);
> +	return ret;
> +}
> +
> +static ssize_t wwan_reset_store(struct device *dev, struct device_attri=
bute *attr,
> +				const char *buf, size_t count)
> +{
> +	acpi_handle handle =3D ACPI_HANDLE(dev);
> +	int ret;
> +
> +	ret =3D trigger_palc_pldr(dev, handle);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(wwan_reset);
> +
> +static struct attribute *palc_attrs[] =3D {
> +	&dev_attr_wwan_reset.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(palc);
> +
> +static int palc_probe(struct platform_device *pdev)
> +{
> +	acpi_handle handle;
> +
> +	handle =3D ACPI_HANDLE(&pdev->dev);
> +	if (!handle)
> +		return -ENODEV;
> +
> +	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(1)))
> +		return -ENODEV;

Nit: Use PALC_DSM_FN_TRIGGER_PLDR here too.

Other than that everything looks good to me.

Thanks,
Armin Wolf

> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id palc_acpi_ids[] =3D {
> +	{ "PALC0001", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
> +
> +static struct platform_driver palc_driver =3D {
> +	.driver =3D {
> +		.name =3D "dell-dw5826e-reset",
> +		.acpi_match_table =3D palc_acpi_ids,
> +		.dev_groups =3D palc_groups,
> +	},
> +	.probe  =3D palc_probe,
> +};
> +module_platform_driver(palc_driver);
> +
> +MODULE_DESCRIPTION("Dell DW5826e reset driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("JackBB Wu");

