Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676261F8F1E
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729519817; cv=none; b=IONLCXzdjo668C4FG39UqUV/OCNALXrUqNOnP9btpW7QA+hovwzxJEqDG64USj5NwUfA4YAPhPDpGoTIteLMzrcpI6QZx/+m4H+nXTu7TmC0UTIaNiyfVust0IgvxyP1/i4iM9iPTLfJGrSHWkV6qA/KrCvOz8SiGT6jwI/XP04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729519817; c=relaxed/simple;
	bh=wYFgAKtbuu1V4pUBOAD6b69cSryMs/+mURkV83QRfs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVUc58B7fAxdNzsDhe5/Pb84S0u9ZF8jAXXgN7/N/JEy8h5lhjI64o92+xJSKUReTjPw5Nl2g+XR4nShEv+QEntcyytm9Db6I4Is+Fx+KvawZD+dLxolbeah/+qe35jOhJlI27PjYffv1ibNqDFvwd97w+JiGbexNI9zcSu/WpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=HNqdUwdz; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HNqdUwdz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729519803; x=1730124603; i=w_armin@gmx.de;
	bh=EKVSyo7qO4KzCbGWG6y4rhO8MGZnjuKLQw8U3+VPBhY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HNqdUwdzGICESmdGwz/JrfDJZbHFyCwO/z6QjHy33JUMWC1p9u9xqPp+aUry8R1B
	 7C6hFmxy/3m9mGVvUk2cnovRPXByt2YjaQfJJegrD/nx9nTxwDlkMza91H5/AKF0I
	 sDv9f+NOkX5l312RecN0Z4Z+1D7LCWAdCP9atchmsISM+cWmHgUGUT5W2Y42b0Oxn
	 6/OTCiIK0nx7c1KuGEuYORFXeR5y+1/cj4slza5D5jqxFdIMrn5APhCWFqH6yL9S8
	 DScZ4rECYWDRyP1yE8JzW1lHFeGpc+fBC+PqdC1qs0BjJF0KBNcQrsNBv/oOaK76g
	 75WJmki5OX5tXd+PtQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1Ycl-1t4pBA23P1-0034EX; Mon, 21
 Oct 2024 16:10:03 +0200
Message-ID: <83951889-daa2-4a26-98f6-361fd3d22019@gmx.de>
Date: Mon, 21 Oct 2024 16:10:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com
References: <20241021134654.337368-1-Basavaraj.Natikar@amd.com>
 <20241021134654.337368-2-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241021134654.337368-2-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PC4zS4Jk1CGa3rRjN2baa0tAAZSZ5rXc29nD19cmyfg8BvBTgr1
 EyeSIO/iqCnhEf5YzsZNP15Q0UFW3vjHcZBbIpf4N86Q4hDDw1KGwAVAFkTNGtEXDuqP2ig
 olppG8FGbbmI+wgtHT1HrwZ42GdRFC6PDeRQBV8M5RyLvaQhfJIriiKqUbDvVxAM033jRVR
 RV1NuXOZh/oM5m5V4HgPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:88+9ThnN8Oo=;k97j553+QztJq/ZRIEvZkXHgozr
 EAN3pT+wOkCAtnzJrTgZgpkGPmPmQsyO4J502WAfCxw1oiEyhrynmbvJUzXwxGFbuEYICgOP+
 Z1VIadisduRRN9UbiDXHNOxrKUIuLB22yf8BAmXpmWBKH39R0ntfPheokbj+vxlW4woqWuLM7
 Oh0ymgwxB/YbemivHG5A7u33Bcyip3RamN0Y+zNaMtZ3XDWbyZ4tzC2t5t+gg/TW8376od1ND
 oSuF3yHAAbfOgxQUBXM96cBaPp8NaUYLAaX22n/+E+XHpNWMnXG6mUge8oZPRQLzFPj4lOEef
 iJUJ5INy58RbK0MwBqIiSQnvXrxJJfiYGG/d6t6KE9UU61XNNs7xyVvV3YjVrVDnY22mwMuwU
 KGxyISDupw2O73fHjmDN1eBmaCHYjm1itbB/PfKPxGBa6JFTWwG1/JkIBc9HEw+HbMlgCiDDR
 3JqhpDbALs5J8kGKXZ7r4+O4u1l/aC8OoeGszn+D6vAAOvkTTVapdufKNze8YnoLBzsWZaQok
 MdjfQ3oAXAwUyIv4O2j/BWN2Wo0lK+laIEQnBzUurP2CyRVrJyTQKzBlFY+z8SUascGLOTCWi
 NbKg0ARVAQ66+CKbC1wBKQsgVFdq5FKK9sO3/a2mYYRuiDfOOARPqO4p/VxIi5voBtvg8rPz6
 8IhgKzfBoFcOnne7r6flsWGNM3S6QFfAkuxqw1goQO/x3Ybble3MHinVLt4lS4K4FLYV6issJ
 YJ40KUYicRss3ElXeTZIsIPOXvLIVR3RClIoBM6idNjAvZ/CnkOXVtPSpy6JpjWKFZGT4/y9J
 ENxFyiPAPWCQ4SFgpMOQ7RItf5gmOyjgJKOrCpdt8QW+Q=

Am 21.10.24 um 15:46 schrieb Basavaraj Natikar:

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
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   MAINTAINERS                           |   7 ++
>   drivers/platform/x86/amd/Kconfig      |  12 ++
>   drivers/platform/x86/amd/Makefile     |   2 +
>   drivers/platform/x86/amd/x3d_vcache.c | 160 ++++++++++++++++++++++++++
>   4 files changed, 181 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/x3d_vcache.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9659a5a7fb3..11b829956499 100644
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
> index 000000000000..ec861e7b5e1e
> --- /dev/null
> +++ b/drivers/platform/x86/amd/x3d_vcache.c
> @@ -0,0 +1,160 @@
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
> + *
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +static char *x3d_mode =3D "frequency";
> +module_param(x3d_mode, charp, 0444);

Hi,

does userspace really need to know the value of this modparam? If no, then=
 please
change the visibility to 0.

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
> +static int amd_x3d_mode_switch(struct amd_x3d_dev *data, int new_state)
> +{
> +	union acpi_object *out, argv;
> +
> +	guard(mutex)(&data->lock);
> +	argv.type =3D ACPI_TYPE_INTEGER;
> +	argv.integer.value =3D new_state;
> +
> +	out =3D acpi_evaluate_dsm(data->ahandle, &x3d_guid, DSM_REVISION_ID, D=
SM_SET_X3D_MODE,
> +				&argv);
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
> +	if (ret < 0) {
> +		dev_err(dev, "no matching mode to set %s\n", buf);

Maybe just return ret here without printing anything. Otherwise userspace =
could spam
the kernel log by continuously writing invalid strings.

> +		return ret;
> +	}
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
> +
> +	if (!(data->curr_mode =3D=3D MODE_INDEX_CACHE || data->curr_mode =3D=
=3D MODE_INDEX_FREQ))
> +		return -EINVAL;

Can this error condition even be triggered?

> +
> +	return sysfs_emit(buf, "%s\n", amd_x3d_mode_strings[data->curr_mode]);

Please use data->lock here to protect accesses to data->curr_mode.

> +}
> +static DEVICE_ATTR_RW(amd_x3d_mode);
> +
> +static struct attribute *amd_x3d_attrs[] =3D {
> +	&dev_attr_amd_x3d_mode.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(amd_x3d);
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
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev =3D &pdev->dev;
> +	data->ahandle =3D handle;
> +	platform_set_drvdata(pdev, data);
> +
> +	if (!acpi_check_dsm(handle, &x3d_guid, DSM_REVISION_ID, BIT(DSM_SET_X3=
D_MODE)))
> +		return dev_err_probe(&pdev->dev, -ENODEV, "not supported on this plat=
form\n");

Please do this check before allocating anything, because the driver should=
 bail out as soon as possible
when encountering unsupported hardware.

Also maybe being silent and just returning -ENODEV is better as this error=
 message serves no purpose.

> +
> +	ret =3D match_string(amd_x3d_mode_strings, ARRAY_SIZE(amd_x3d_mode_str=
ings), x3d_mode);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode %s\n", x3d_mo=
de);
> +
> +	devm_mutex_init(data->dev, &data->lock);
> +
> +	ret =3D amd_x3d_mode_switch(data, ret);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "mode switch failed\n");

amd_x3d_mode_switch() already prints an error when failing, so please just=
 return the result directly:

	return amd_x3d_mode_switch(data, ret);

Other than that the driver look good.

Thanks,
Armin Wolf

> +
> +	return 0;
> +}
> +
> +static struct platform_driver amd_3d_vcache_driver =3D {
> +	.driver =3D {
> +		.name =3D "amd_x3d_vcache",
> +		.dev_groups =3D amd_x3d_groups,
> +		.acpi_match_table =3D amd_x3d_acpi_ids,
> +	},
> +	.probe =3D amd_x3d_probe,
> +};
> +module_platform_driver(amd_3d_vcache_driver);
> +
> +MODULE_DESCRIPTION("AMD 3D V-Cache Performance Optimizer Driver");
> +MODULE_LICENSE("GPL");
