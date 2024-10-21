Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17CA1DFE22
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 20:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542931; cv=none; b=Q1SqKOhws3D3nL93BvaAbqC2T1gO9BZLCKK1rhKswPu+9dOw+2sndZsmvGNqqX91khgrjNU/3uTw7APJMSz7qsK1P699QnVs+sFWZofxK8NxUZlqXv0F8YOgMRdmlnmZuvdz52tGo73x7UR0Hie+Zk2SI55JaGVfMraXNqE6Fl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542931; c=relaxed/simple;
	bh=ZG3Y4Z+Y5kHgBEBckCqaAufy0d0Q3Ju2BPi+gscm/78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fucuhpP8RVkmsnvwZe2k+aTw0qXz//SuhnPCJ8LCKp9uj2yI4m5tmpBPyOXoPGSeNri+pDEIccVxokto1IwiiIXRfsAcRchtZ+UfPQAkd08+lPRtaq/bw+4yjLh+2/TtnnFqSkSxUTyCwe6kq6MRHQZJlxyYNlHTgRdjIh2He4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OQgTDfhD; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OQgTDfhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729542918; x=1730147718; i=w_armin@gmx.de;
	bh=LBwBa0dfkedihT+olYyMMoIAZyJBH6xx+6uM59F3sFQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OQgTDfhD4SUuzqvVMhxhWvu7RSPvFvYcT7Bpv0VMiRG77wXwJGcfsilcKRW1h+Tx
	 +ONXuH8vth2s3DPFb5hsYoNGPkB7KNf8Pr3np0hxtchlbye4ONFV8eRoWzmSu7iC8
	 1YcUZAkP2CUxg37O9H9SdncX2XqZSNxGPBsF6SPqClIXHMWkbg9g80FOC5Zi3Jjie
	 KuTMEs1CTNPnaITRhhiyxYjvGiWrRVAjsGdskf45L1Wb6ib3IPhhFRZJPNTomQZlw
	 hyluQRLnqvhPBL/jdSK8vPuAl9FDpPc/JYiOCuemsF6u+KCJIhPcm56bX9UdwEEeF
	 QIM1UaK2MfGRSJsTQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpap-1tld0s4B2d-00mH1E; Mon, 21
 Oct 2024 22:35:18 +0200
Message-ID: <72c0b021-9778-4bbe-aa54-c7ef887c04fa@gmx.de>
Date: Mon, 21 Oct 2024 22:35:17 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com
References: <20241021165820.339567-1-Basavaraj.Natikar@amd.com>
 <20241021165820.339567-2-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241021165820.339567-2-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XxYcD4q2KnLvOjJJ287eBxj99whQwWc6cJL9LijOCElFTG+fATi
 ox+mdZuf6wxuLbpHGpI2iP1vMlSU5K+Hi09+SUIrq1Esqh4Hmem49t8kbVuFQQ7Dgv8+8ho
 +GMiDH3K3oDMHNxVspYrkjOEDczawxktILmL+GyUIPXT3lc8Eo68r81OWRH45gXSuExZ6eo
 S1LCaD0LyaWIRTlmkxP1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xhspTlHbvUc=;oEDMjCHOqQ1km8dPEs4YCo4/JUx
 6ge3WPFMVJodvQhbe/4ZZnP/wkma8irJzUD1AulQHoBAvHIcpmuVKb8kY0wQxPN+uMfLqoxJI
 de3Aw/TqTRaelBXfttdy8Wcq7PVjwUgTNKZn9vypgWfuLs+KX1KFQXUbSJrFVhzJTAVV5om2p
 Fuo8CGtMNw2Go6bSxBlc11xTF5NlBOLa3zYCUQzW5ahZuMcsW/z68MuRCsGbkGxNaSyhl8gc1
 ZSO+J+9rbN26CLUcaSP8H3cLasOoOXJu6WUGRyLC2kfNOnkppWzjCLkLi4X6Osr4UGmdAZZDd
 L7uslpVYgG2EvO973aFAwQDAc6qnAc/eHAo/r0sR4LWHTjXnJPn6vAcdOzzPOf9DYtk13doO1
 eDIiwr4sg6ViyVlxwXUNGszcRASK5dOlO2D1aj+sJPrCsNFkVOVRf3Ig3GRK/bbn3ukIf6w5S
 MbhnLzU2gYA7du9BjO4q6LuHqDt1o3hg4bX8VpjsSeDlQ5I1/XUFO/f6fc8WOT3F7IOuqTVI6
 DNRdf/9hx4IUZuR3vMYa+mGlpE3VqzWtsfKKTFZhYboqZXtW3vktz3ZOzwj8w9y+mTMXyIPR7
 RGtPm1Fal5ITGwjN2GXCSxnxe+/9Ik95LMYb9Ug3Eu1pR3/fau8jSYX6Sb6kmx7g2BWQM7bkH
 3AWXs/z4PudDqcpQLHTnsvG1/fJu66S72dFWdYI9oJ8/DEz7keNCEkKkh5fw6eha7NfOAt4JN
 bokgxg1NIHlePaZxj9G93EU2o8LXPEAw37i4leBJ3EoSdL1W0msype2JkUcpe6Gi3z/fS13gG
 UNO/uRLSDFBjQR4Kzf+A0yKrSD3XCHtfyCFE6IBEoX7zg=

Am 21.10.24 um 18:58 schrieb Basavaraj Natikar:

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
>   drivers/platform/x86/amd/x3d_vcache.c | 174 ++++++++++++++++++++++++++
>   4 files changed, 195 insertions(+)
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
> index 000000000000..833e7704e6f9
> --- /dev/null
> +++ b/drivers/platform/x86/amd/x3d_vcache.c
> @@ -0,0 +1,174 @@
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
> +	ret =3D amd_x3d_mode_switch(data, ret);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

Please directly return the result of amd_x3d_mode_switch() here.

Also i think that maybe there exists a way to avoid locking data->lock twi=
ce
during resume, but i will leave that to you.
Other than that:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

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
