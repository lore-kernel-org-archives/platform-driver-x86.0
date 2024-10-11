Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EF42141AE
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Oct 2024 11:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645702; cv=none; b=YrKqzNA270S0y28TlVIrEv5lHQPQQQUWHa01ectPkZJu2Q5bfev2fqPh171EQMJZJRYyXb28SUNKrAmP48EFq1KOAmFqdhIPpL34ysNlcoXcqlSVesVMLHOyHxAGcMdLBV5Uz7XC8gg4S17QFoAyuOqX5RpqPSOAg0GhTA8Wzo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645702; c=relaxed/simple;
	bh=wE1Ey99Dsp+T7sFQ9u7Tpv5Faz4WcKn43lFzLI1jK8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkBSrsssln98z8pACZLxCXIBqvEsUDbYnvAxxlWW2OYj3r2yr9wSIfE0M9zandO57y+EudpRq+Mb0kRbZgFWkIUALQH7wSNN8gghLCGRH7p3EW53NAcL8F1pYWqgae8HGpIsZIQc2r1Vzte/YlZ9i9nV49F2tmpqjiR0v/IGNLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Zq/PRkao; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Zq/PRkao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728645686; x=1729250486; i=w_armin@gmx.de;
	bh=MlFdMfUtMZU7NDE+3sGvT9AMuiAqfj7PHXm/ioD6TLU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Zq/PRkaoyoCQXsg/E9F4EJ6pKJfmW5DsjoRw46yJi0xiipfZhHbynjcAm5298LxS
	 ncTO0hLZt6UdkEaWU9L5fHaZGvIITLXeMCgMMjYLeLO4Mr4UeKd8eEskU1lAfq4iz
	 4yNQzhrtAt9K7ArKJGzGWKIyrLZaVHZd+zqUelJjoF7Gr4MBHSM/occiEocFRaKdp
	 4nRcqaBpApROI2dxGNu+UIk1q4sSigVw/C3OH9Hqdlodb1MZCIblmaD/mU8iaDjNk
	 xQpalIk6IY6yid3jFU5em2hpvywb9JdPwl9xaRJZNitBopfyZcm4B/n+wisNeQc5E
	 sSX8Owc658aFfVcX6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.154.201] ([141.76.185.172]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrQJ5-1tnBVC46yt-00j7Tq; Fri, 11
 Oct 2024 13:21:26 +0200
Message-ID: <4bb99ff4-6c05-4087-9915-3420c36b15f2@gmx.de>
Date: Fri, 11 Oct 2024 13:21:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache
 optimizer driver
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com
References: <20241010094252.3892406-1-Basavaraj.Natikar@amd.com>
 <20241010094252.3892406-2-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241010094252.3892406-2-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:msulJ9jsF6UFEPrzwyBEJom/ddmja02NPQRaof+TROWaDi8ZXeK
 +OyBQgIx5IuP0Br8ytRhN77Fz4BFOPW9hDQadpgMP/TPVM/kTL76ErroRlgwyCA66P7D9BW
 /u+xjyYXO529IqUKRuSfwZbxs8h3sRAJB7qswHETsOWUdnuuOGK/uuK+y+s+RiovPnx7VvU
 T84aw+Rg+0vDNl4HjhIQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/j/VaHzKdss=;E843qaeTxgzYwADcYCl2uWT2wAl
 mJveTYVhJB1KOKrWGuBgMSWQHIkUupmiQQqoLxpfzLiqznT1vXYxv9qMCOwlbJ+U9uZAI0Foi
 jps8tzJv2sUAybC/rEgQPM4lsDszUX5hto6uJG9DRGevYmAjv09JNq5/m/eUTk/v25ofxue5P
 P/eX0upJl4dVWgHi0+PvCI70Jmc0c/n7dLakmgYp4jpO9YyWIheX+bjOWFciAODx5O63fdH/A
 nQcOSCbJE7oJL3sJNJyLeiEYcFqSNtaEbiFIMM3Z5xrVShss4cGQNdN0GWj3vkKRILtDkgoOP
 jK4vOOGjsuV8rNjCnLoAugoJ3oQt+ayiOi5nMus/ibiKt1yCPSfX+5CyvgyHoSJbQeyLnPI05
 kxRMJBeTO4nSpRMq8ToHgn6FRz+GKB/mI/bz2PY1jXIWrrLv12u6UnTEK2E8EmT/IS9nGEOca
 tmgBxZ2PbAud/clpyYFeaxR2fVYQe152SK8mhniE4XkSZeXpuUfabDQzdLTbCf9ZfYAnUxXjL
 i5vOhlC3Qk4m/T76WccADsEQjdWkmWqg/UO4iYrRcOABu6JzOMLBrcLGOI1X6NrB7BAzRJgzr
 vkrmF64/SSBB/F3AHB/CBc5sNZPgeeQN1UJTF4glBaYFDKhIuty7/Gh7GRDaEj19M9N/wWG9u
 fZiI3sun+fjpq/N7UIdAkfCMDn7mphPZ2Vh619VrLsrWYfnQe0uAhnJGIqf/+D4aFVIvgEzyo
 rt7kHyFF9ck8zWDXgkcb01ANHQV/5ks42UvB9LAbRZ6c5eo9qTmIAB5Se9SCLD7ULornwxXBt
 fUhnraKuxBmBRRpI8wmFJLMFdfwwISPPIMpNE86v6pJa0=

Am 10.10.24 um 11:42 schrieb Basavaraj Natikar:

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
>   MAINTAINERS                           |   7 +
>   drivers/platform/x86/amd/Kconfig      |  12 ++
>   drivers/platform/x86/amd/Makefile     |   2 +
>   drivers/platform/x86/amd/x3d_vcache.c | 193 ++++++++++++++++++++++++++
>   4 files changed, 214 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/x3d_vcache.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a097afd76ded..61cb6a294f4c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -972,6 +972,13 @@ Q:	https://patchwork.kernel.org/project/linux-rdma/=
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
> index 000000000000..679613d02b9a
> --- /dev/null
> +++ b/drivers/platform/x86/amd/x3d_vcache.c
> @@ -0,0 +1,193 @@
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
> +MODULE_PARM_DESC(x3d_mode, "Initial 3D-VCache mode; 'frequency' (defaul=
t) or 'cache'");
> +
> +#define DSM_REVISION_ID			0
> +#define DSM_GET_FUNCS_SUPPORTED		0
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
> +	ACPI_FREE(out);

Hi,

please use kfree() instead of ACPI_FREE().

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
> +		return ret;
> +	}
> +
> +	ret =3D amd_x3d_mode_switch(data, ret);
> +
> +	return ret ? ret : count;

ret =3D amd_x3d_mode_switch(data, ret);
if (ret < 0)
	return ret;

return count;

> +}
> +
> +static ssize_t amd_x3d_mode_show(struct device *dev, struct device_attr=
ibute *attr, char *buf)
> +{
> +	struct amd_x3d_dev *data =3D dev_get_drvdata(dev);
> +
> +	if (data->curr_mode > MODE_INDEX_CACHE || data->curr_mode < MODE_INDEX=
_FREQ)
> +		return -EINVAL;

Can curr_mode ever leave this range of values?

> +
> +	return sysfs_emit(buf, "%s\n", amd_x3d_mode_strings[data->curr_mode]);
> +}
> +static DEVICE_ATTR_RW(amd_x3d_mode);
> +
> +static struct attribute *amd_x3d_attrs[] =3D {
> +	&dev_attr_amd_x3d_mode.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(amd_x3d);
> +
> +static int amd_x3d_supported(struct amd_x3d_dev *data)
> +{
> +	union acpi_object *out;
> +
> +	out =3D acpi_evaluate_dsm(data->ahandle, &x3d_guid, DSM_REVISION_ID,
> +				DSM_GET_FUNCS_SUPPORTED, NULL);

Please use acpi_check_dsm().

> +	if (!out) {
> +		dev_err(data->dev, "failed to evaluate _DSM\n");
> +		return -ENODEV;
> +	}
> +
> +	if (out->type !=3D ACPI_TYPE_BUFFER) {
> +		dev_err(data->dev, "invalid type %d\n", out->type);
> +		ACPI_FREE(out);
> +		return -EINVAL;
> +	}
> +
> +	ACPI_FREE(out);
> +	return 0;
> +}
> +
> +static const struct acpi_device_id amd_x3d_acpi_ids[] =3D {
> +	{"AMDI0101"},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_x3d_acpi_ids);
> +
> +static void amd_x3d_remove(void *context)
> +{
> +	struct amd_x3d_dev *data =3D context;
> +
> +	mutex_destroy(&data->lock);

Please use devm_mutex_init().

> +}
> +
> +static int amd_x3d_probe(struct platform_device *pdev)
> +{
> +	const struct acpi_device_id *id;
> +	struct amd_x3d_dev *data;
> +	acpi_handle handle;
> +	int ret;
> +
> +	handle =3D ACPI_HANDLE(&pdev->dev);
> +	if (!handle)
> +		return -ENODEV;
> +
> +	id =3D acpi_match_device(amd_x3d_acpi_ids, &pdev->dev);
> +	if (!id)
> +		dev_err_probe(&pdev->dev, -ENODEV, "unable to match ACPI ID and data\=
n");

The driver core already takes care of that, please remove.

> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev =3D &pdev->dev;
> +	data->ahandle =3D handle;
> +	platform_set_drvdata(pdev, data);
> +
> +	ret =3D amd_x3d_supported(data);
> +	if (ret)
> +		dev_err_probe(&pdev->dev, ret, "not supported on this platform\n");
> +
> +	ret =3D match_string(amd_x3d_mode_strings, ARRAY_SIZE(amd_x3d_mode_str=
ings), x3d_mode);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode %s\n", x3d_mo=
de);
> +
> +	mutex_init(&data->lock);
> +
> +	ret =3D amd_x3d_mode_switch(data, ret);
> +	if (ret < 0)
> +		return ret;

You forgot to call mutex_destroy() here in case of an error. Using devm_mu=
tex_init() would solve that.

Thanks,
Armin Wolf

> +
> +	return devm_add_action_or_reset(&pdev->dev, amd_x3d_remove, data);
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
