Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCFE40DFD5;
	Mon, 13 Apr 2026 06:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061316; cv=none; b=oxg8Iy4vLwQDgXliR/yM9orsctTrfYzzglrsX/mnhkr001+SGUMAw4VUpj0759rvxOOAVdBGjauN6qswS9Nj+BrgYU8JbcxbRGIpmyREmcynOAtggF3T9W2tgMSN7ua+CO0nouf35xN/Ckf5Zs1w69R5hDxclWe6u4YZOqIgzOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061316; c=relaxed/simple;
	bh=TsXnY8FaxDv/8tK9XjJXiSK8z147G6X0whCAoHAz2RU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1dpU+HR/45ynoe41JyOIxHSq7CU3mIeCXjFd3HNt/BqnrpbJZTrmcYW7qhG5gBLP1cfQZrFrG1/EEEBDYajFBl9bO8siTn9wkzHBYqvzIlKV7oMV3/iYZ3NSqx4jxy4eaxh960gvaKBcQCnZHVzWDATpOqVZg2EqCkUo7V6HwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MMCHR7MB; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MMCHR7MB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776061312; x=1776666112; i=w_armin@gmx.de;
	bh=+eQFQt0Pi0KzeFqYz/XOcAzx4GL+74551ShC213zUKs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MMCHR7MBUpOCkoTwCEwNFJgIdEr5LhvijvmBDvSz9EA07cnLH+9+/8QqRAizkj+w
	 gDdEqq5upfkfBXyvj/0fr6zqBtn5C8tfbqlt75sY5Ob9N4z63oTrFL4M0Ti2TQXJG
	 dJByorNOSMpYQK1GuMoUpsAP+eJbGybFeTcnpV8mVm0XJbgIn/TfxROT3SVxou4ZC
	 cGBc+xoua5sVKjb7v9nLgEbo2Sj2163Q+kZXNanqjFRKJMm+4t4PfgAUuP2TDCdyq
	 92zOQz7B/JwearGJmLu6lnhm896nDj2fHZIJzS0oa+Ditil0vDrovztugUOQj6E0K
	 uL+LUnMix2dkxIxQiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4axg-1wBciU2Vde-003j4s; Mon, 13
 Apr 2026 08:21:52 +0200
Message-ID: <fd2d0fd7-b6ca-42e9-81cd-eb41b6b857ce@gmx.de>
Date: Mon, 13 Apr 2026 08:21:51 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
To: Jack Wu <wojackbb@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410093752.298067-1-jackbb_wu@compal.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260410093752.298067-1-jackbb_wu@compal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ww4OkxyhQ8RHCtFHdXdAr7YMyVdcjXrtienkACgdCyp08/wrMzT
 zQ9e8dSEpb90gsToKJemZqufk7roRxlvYwRhve1riN3/o+r+R/qXcRWaymne/qww2a9SGj2
 MXwDOggaVzWgATgRN5t44DNv9IjtEWJANvMO9QIZ/VPdL6cViRKveDzQGl0sP5Tly9hEyi/
 5/x0bNd6KtyU50/8HBDUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:g8gNBfTWrLw=;QYXlpRpwQIAiy8VfBODjPdj4Ryx
 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
 obh7Ffu2RW98rtr9Frnj/4QC3wYZc2PzniYA=

Am 10.04.26 um 11:37 schrieb Jack Wu:
> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI=
.
>=20
> E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/pldr
>=20
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
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
>   drivers/platform/x86/dell/Kconfig             |  6 ++
>   drivers/platform/x86/dell/Makefile            |  2 +
>   .../platform/x86/dell/dell-dw5826e-reset.c    | 83 +++++++++++++++++++
>   3 files changed, 91 insertions(+)
>   create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
>=20
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
> index 000000000000..52002578ed68
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> + *
> + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/uuid.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
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
> +	obj =3D acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, 1, NULL);
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
> +static ssize_t pldr_store(struct device *dev, struct device_attribute *=
attr,
> +			  const char *buf, size_t count)
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
> +static DEVICE_ATTR_WO(pldr);
> +
> +static struct attribute *palc_attrs[] =3D {
> +	&dev_attr_pldr.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(palc);
> +
> +static int palc_probe(struct platform_device *pdev)
> +{
> +	if (!ACPI_HANDLE(&pdev->dev))
> +		return -ENODEV;
> +

Hi, please check here if the _DSM method exists using acpi_check_dsm().

Thanks,
Armin Wolf

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

