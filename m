Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517B214F132
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 19:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731351850; cv=none; b=dVNyveQDQC482I1J9BrtryCCJWYqmOBWbQT0ZsGMAjT+u61JpQ7PQWDOhHqyY5v7JnZfWJoYWc5JMZ1PU561vU3mpUxPvAIMeht+i/RfCs0RkPuepUdNKDK7TU+CSRaq2MO29f4eO1Hsp8MgqadZ4QvSc+dxAEUmxQQyddtJKjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731351850; c=relaxed/simple;
	bh=vVU+aPoNh/5erBQOyoITa8eVXICmjz5GSArcfEBrOgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttSpiGLO1xBq8znuW99hieYKp9DDq/RgmWOxj2ILS8DScVVVBq3y95T/AnuN9WUNVx13n3qUDLUWwSlNqEkTjoUE/qRhSeZboL8f1XW8DkDGT9erV7hLXW9kcw9tcLZDPyuNRs+MWKdD7FxFXzE6ThD4KGReUiCv2eumpod6Lyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=VpModbQx; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="VpModbQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731351835; x=1731956635; i=w_armin@gmx.de;
	bh=Nwj1wDlcyctS2kfhbSjJIHkPSTHdDwRN1v2h6zAIW/o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VpModbQxNJGXxf2ZqLTxgqRI4rJrkkhulelbxaI3OjAu6W/CRRkwUl9eozSzfrT7
	 75FKeecoO7PLyAp1CP8W0TR8xtkxb6A3duPcg6L0wVLvuuGxGlqIhdjM+H4vfigrx
	 qmhjHUj5sK3jHc3j6YMu37nwcUOLoipC8P8M1m4QwA+EvwSmu9uc2e0694zofA6tu
	 cX5Ocu7fgM7JpemekQPC6LRVu6L6zq2hHPtvB14KeZjfamFzgPaqdcE2uhaOHo7PW
	 VZhZAylWIvHEOZ+Iz2q5qUBJST/Z04JWwep04ZLB8VaIopHFAMjUIixRy1pKQ+PiY
	 AHUl5AyYQDs42fIiFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6ux-1tYfBI0JA3-00n8k0; Mon, 11
 Nov 2024 20:03:55 +0100
Message-ID: <5df7ee6f-91e4-45b8-b329-3171445fd0f1@gmx.de>
Date: Mon, 11 Nov 2024 20:03:53 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com
References: <20241111104632.2213773-1-Basavaraj.Natikar@amd.com>
 <20241111104632.2213773-2-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241111104632.2213773-2-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:23VQdLRKuniSsWG8xMHZ7UOZKz23tvXqQnCDWnd5fS4lcsnHm46
 CI9NmhbYOu4SUq8kYsex0bd30NbS4+1x4iMUjgS7fL63ScGmHzuLBN8o7THjUVQObWKOfEH
 VONy+KbjMu0wzelIze8vgJzbmlibC1w63C4CQKxJXHFw4/FrSLSOhxJIgvJ1k6ZtgN1f/Sd
 Nur0LLfck2H2LydXsYdmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:68l4eL4kEjE=;iYj3zUKcdK8KJpZHen7iMiUwrV6
 gJoUTNsdhtB2xOtSYOs6NcvMaUIyPtVne47O8QHvk4PJsHl4s6bQKyxuSy2TrRqO2EGpqIIh2
 57LfM1KljrWQzXEwjm5NY4ITufMzbaE7+mceOxR3HQlFNybYa4nPcfp8/0PInLEQBbbtuZlfp
 MmHoB5hpRKOnjQMVG40YAIyT8INhYrcYy1Wiq0Yu4ZleRQlBky96o5Mgx01ZLTdTJR8J7xsCb
 1wcz6HQRc0Rhp1HshqYYYBui9/65qn661PRKKRxnqI6RkFn39potk8kASP/tJNZr23WqdcIgc
 7E7l6EFBSU+L+DoOYq4ESt/rd6+t6mX4aKtO3yrwchzTIEv8Gsnj/a5uwhJnmanj+vDheUVxx
 olUYdoYggHFBJXmeDzKBENxMYYdWLPl9LyjAy57z+VSHozeJOmxumMvJBbhapp0xNxxlXQRUc
 j6ObugmeGLUp32Om79QiPVEDE3yME0Qh/ei45nUciLF8q0qdgED5rQnvq8RjqmuLXWqGJexH8
 NS+V/EjyCZMphPjZFOpS35uXNtD0omRRgADZ71dTMmFOdzqLmLNcENIQJBtS1i4XWldBJiXR+
 ccvYhfyejZGGVZuIuIoY6/OVhCDxtAS4ThIeRJFQmWu2ADKGp6SpbR0kELPlZwQYu14BJicIv
 AFQ9l6FTDhIrIQUu2/U9YBQOZDUV32vq0nHLOUEwszcVwE8MC9kIjwvwxQukA9EvZUb4M8pbZ
 qN+OSMmIoJ6KNHaV5ixTGtZ3CA4pVXNqNirGb2g/4OQ1DXWUaEAAPefxsYXnDj0VPu9OV4Jmc
 1ODYOwC3sg/npf1LMSWVB0RFJOZXQzQsBgUT3koYqGIURUlqORL5Ee69DavzXITwIQEnH4rNu
 3egiUPnKSkGtYpnJtOy3GZpwlV1eAlGMeEuaDMLLCqbwnpjS/0lNscoUw

Am 11.11.24 um 11:46 schrieb Basavaraj Natikar:

> AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
> Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
> switching between Frequency and Cache modes. To optimize performance,
> implement the AMD 3D V-Cache Optimizer, which allows selecting either:
>
> Frequency mode: cores within the faster CCD are prioritized before
> those in the slower CCD.
>
> Cache mode: cores within the larger L3 CCD are prioritized before
> those in the smaller L3 CCD.
>
> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   MAINTAINERS                           |   7 ++
>   drivers/platform/x86/amd/Kconfig      |  12 ++
>   drivers/platform/x86/amd/Makefile     |   2 +
>   drivers/platform/x86/amd/x3d_vcache.c | 173 ++++++++++++++++++++++++++
>   4 files changed, 194 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/x3d_vcache.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 21fdaa19229a..429ac6496f42 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -965,6 +965,13 @@ Q:	https://patchwork.kernel.org/project/linux-rdma/=
list/
>   F:	drivers/infiniband/hw/efa/
>   F:	include/uapi/rdma/efa-abi.h
>
> +AMD 3D V-CACHE PERFORMANCE OPTIMIZER DRIVER
> +M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> +R:	Mario Limonciello <mario.limonciello@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	drivers/platform/x86/amd/x3d_vcache.c
> +
>   AMD ADDRESS TRANSLATION LIBRARY (ATL)
>   M:	Yazen Ghannam <Yazen.Ghannam@amd.com>
>   L:	linux-edac@vger.kernel.org
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd=
/Kconfig
> index f88682d36447..d73f691020d0 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -6,6 +6,18 @@
>   source "drivers/platform/x86/amd/pmf/Kconfig"
>   source "drivers/platform/x86/amd/pmc/Kconfig"
>
> +config AMD_3D_VCACHE
> +	tristate "AMD 3D V-Cache Performance Optimizer Driver"
> +	depends on X86_64 && ACPI
> +	help
> +	  The driver provides a sysfs interface, enabling the setting of a bia=
s
> +	  that alters CPU core reordering. This bias prefers cores with higher
> +	  frequencies or larger L3 caches on processors supporting AMD 3D V-Ca=
che
> +	  technology.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_3d_vcache.
> +
>   config AMD_HSMP
>   	tristate "AMD HSMP Driver"
>   	depends on AMD_NB && X86_64 && ACPI
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/am=
d/Makefile
> index dcec0a46f8af..16e4cce02242 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -4,6 +4,8 @@
>   # AMD x86 Platform-Specific Drivers
>   #
>
> +obj-$(CONFIG_AMD_3D_VCACHE)     +=3D amd_3d_vcache.o
> +amd_3d_vcache-objs              :=3D x3d_vcache.o
>   obj-$(CONFIG_AMD_PMC)		+=3D pmc/
>   amd_hsmp-y			:=3D hsmp.o
>   obj-$(CONFIG_AMD_HSMP)		+=3D amd_hsmp.o
> diff --git a/drivers/platform/x86/amd/x3d_vcache.c b/drivers/platform/x8=
6/amd/x3d_vcache.c
> new file mode 100644
> index 000000000000..a1a147277814
> --- /dev/null
> +++ b/drivers/platform/x86/amd/x3d_vcache.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD 3D V-Cache Performance Optimizer Driver
> + *
> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> + *          Perry Yuan <perry.yuan@amd.com>
> + *          Mario Limonciello <mario.limonciello@amd.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/array_size.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/sysfs.h>
> +#include <linux/uuid.h>
> +
> +static char *x3d_mode =3D "frequency";
> +module_param(x3d_mode, charp, 0);
> +MODULE_PARM_DESC(x3d_mode, "Initial 3D-VCache mode; 'frequency' (defaul=
t) or 'cache'");
> +
> +#define DSM_REVISION_ID			0
> +#define DSM_SET_X3D_MODE		1
> +
> +static guid_t x3d_guid =3D GUID_INIT(0xdff8e55f, 0xbcfd, 0x46fb, 0xba, =
0x0a,
> +				   0xef, 0xd0, 0x45, 0x0f, 0x34, 0xee);
> +
> +enum amd_x3d_mode_type {
> +	MODE_INDEX_FREQ,
> +	MODE_INDEX_CACHE,
> +};
> +
> +static const char * const amd_x3d_mode_strings[] =3D {
> +	[MODE_INDEX_FREQ] =3D "frequency",
> +	[MODE_INDEX_CACHE] =3D "cache",
> +};
> +
> +struct amd_x3d_dev {
> +	struct device *dev;
> +	acpi_handle ahandle;
> +	/* To protect x3d mode setting */
> +	struct mutex lock;
> +	enum amd_x3d_mode_type curr_mode;
> +};
> +
> +static int amd_x3d_get_mode(struct amd_x3d_dev *data)
> +{
> +	guard(mutex)(&data->lock);
> +
> +	return data->curr_mode;
> +}
> +
> +static int amd_x3d_mode_switch(struct amd_x3d_dev *data, int new_state)
> +{
> +	union acpi_object *out, argv;
> +
> +	guard(mutex)(&data->lock);
> +	argv.type =3D ACPI_TYPE_INTEGER;
> +	argv.integer.value =3D new_state;
> +
> +	out =3D acpi_evaluate_dsm(data->ahandle, &x3d_guid, DSM_REVISION_ID,
> +				DSM_SET_X3D_MODE, &argv);
> +	if (!out) {
> +		dev_err(data->dev, "failed to evaluate _DSM\n");
> +		return -EINVAL;
> +	}
> +
> +	data->curr_mode =3D new_state;
> +
> +	kfree(out);
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_x3d_mode_store(struct device *dev, struct device_att=
ribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct amd_x3d_dev *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D sysfs_match_string(amd_x3d_mode_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D amd_x3d_mode_switch(data, ret);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t amd_x3d_mode_show(struct device *dev, struct device_attr=
ibute *attr, char *buf)
> +{
> +	struct amd_x3d_dev *data =3D dev_get_drvdata(dev);
> +	int mode =3D amd_x3d_get_mode(data);
> +
> +	return sysfs_emit(buf, "%s\n", amd_x3d_mode_strings[mode]);
> +}
> +static DEVICE_ATTR_RW(amd_x3d_mode);
> +
> +static struct attribute *amd_x3d_attrs[] =3D {
> +	&dev_attr_amd_x3d_mode.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(amd_x3d);
> +
> +static int amd_x3d_resume_handler(struct device *dev)
> +{
> +	struct amd_x3d_dev *data =3D dev_get_drvdata(dev);
> +	int ret =3D amd_x3d_get_mode(data);
> +
> +	return amd_x3d_mode_switch(data, ret);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(amd_x3d_pm, NULL, amd_x3d_resume_handle=
r);
> +
> +static const struct acpi_device_id amd_x3d_acpi_ids[] =3D {
> +	{"AMDI0101"},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_x3d_acpi_ids);
> +
> +static int amd_x3d_probe(struct platform_device *pdev)
> +{
> +	struct amd_x3d_dev *data;
> +	acpi_handle handle;
> +	int ret;
> +
> +	handle =3D ACPI_HANDLE(&pdev->dev);
> +	if (!handle)
> +		return -ENODEV;
> +
> +	if (!acpi_check_dsm(handle, &x3d_guid, DSM_REVISION_ID, BIT(DSM_SET_X3=
D_MODE)))
> +		return -ENODEV;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev =3D &pdev->dev;
> +	data->ahandle =3D handle;
> +	platform_set_drvdata(pdev, data);
> +
> +	ret =3D match_string(amd_x3d_mode_strings, ARRAY_SIZE(amd_x3d_mode_str=
ings), x3d_mode);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode %s\n", x3d_mo=
de);
> +
> +	devm_mutex_init(data->dev, &data->lock);

Hi,

it could be that i overlooked this in my previous review, but devm_mutex_i=
nit() can fail, so
you need to do some error checking here.

Otherwise the driver looks good to me :).

Thanks,
Armin Wolf

> +
> +	return amd_x3d_mode_switch(data, ret);
> +}
> +
> +static struct platform_driver amd_3d_vcache_driver =3D {
> +	.driver =3D {
> +		.name =3D "amd_x3d_vcache",
> +		.dev_groups =3D amd_x3d_groups,
> +		.acpi_match_table =3D amd_x3d_acpi_ids,
> +		.pm =3D pm_sleep_ptr(&amd_x3d_pm),
> +	},
> +	.probe =3D amd_x3d_probe,
> +};
> +module_platform_driver(amd_3d_vcache_driver);
> +
> +MODULE_DESCRIPTION("AMD 3D V-Cache Performance Optimizer Driver");
> +MODULE_LICENSE("GPL");
