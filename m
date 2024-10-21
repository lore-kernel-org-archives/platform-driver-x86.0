Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88A11E573E
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729520415; cv=none; b=qknCzjV1MUWOkljyfZJTFW4IPbVHDcIyJlcuysOyvjfVd277xWGXL6MxiAN9d+fe68tNRM7oSso9TuNpCfnul0TXhhWKiHCKoGZyZPTbB/OUttfow3IC9njM5YI86w8CYogqYEzSCIkPpk7cDwdjDGAnhWCtS66OQjhILoewajs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729520415; c=relaxed/simple;
	bh=hyNAEC3s65PhqRnrf4uD2v85gM82oiyhzSEx5NJ2zRc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=I+++pkCZVCA71/ZNaVF35UI99WwMedwAiNKmPY3U0X8nZFhHKQC0mBgYwK3NFUKb8/esfgKai4hmczfRdSf7qOwgJNk1yz5Vfq6UzjeH3Aul9D5Rm5gbKKKHNd5RL1yLPZU+Nn/RDGayIlr6gZMjc+umV0CmP4I8FrcMKdiIvds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Bj3AEraW; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Bj3AEraW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729520402; x=1730125202; i=w_armin@gmx.de;
	bh=hyNAEC3s65PhqRnrf4uD2v85gM82oiyhzSEx5NJ2zRc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Bj3AEraWRyuVDYQsMV+ztWswHBZF3jgYjnEaXJf7K+LZCxnTtx4lsjo8BwZRopbb
	 xubndu03ZGVt2WwrE+s6LUi0IonkCVH9SpMOJidaySXsnAhnTFY9+tdO+QGd5yOXb
	 VHZeIzfBr2cB2OrDBNjqYCjacw6F3yj13v/kxThWQHK0QDqhcXkOak5m8jCeeh9Dt
	 srRMDLFMt4rUr2r+c5s9pZBTmVrttEtxR17TPJQpzJyiv20YEkDsNYy3soIzgNGjY
	 WgYqSMzPv3277dBZX/9UBi3n9qZo3e93usYTbBYM/bsigTTt+WdUznQNuAxSVDO7q
	 bMrBVoEI7OZU+hO4dw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8obG-1twUWi2p54-015s9X; Mon, 21
 Oct 2024 16:20:02 +0200
Message-ID: <2a7efb5a-0db7-4787-b215-1bf865c2710c@gmx.de>
Date: Mon, 21 Oct 2024 16:20:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
From: Armin Wolf <W_Armin@gmx.de>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com
References: <20241021134654.337368-1-Basavaraj.Natikar@amd.com>
 <20241021134654.337368-2-Basavaraj.Natikar@amd.com>
 <83951889-daa2-4a26-98f6-361fd3d22019@gmx.de>
Content-Language: en-US
In-Reply-To: <83951889-daa2-4a26-98f6-361fd3d22019@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X8U2zy7GxYRKWvwPODjMukSrzNCjfFkmAaGbXBrXC1L5ttsZW6F
 8QhTz/IRUc+p72sj5r3ZpWk1iH+w6XaW6GUIc5iiT9pxuLcZPdRm5LCdOwuFR99QVPnLg+1
 PZKDJpBcfStjBoaZBHKjqkVHTAFk4G1/ZD7wdRw32LnQ2PfwyJTOdQd8W6eTIfPRYOQHf5n
 yBHeMFvhP4d6NwPOe63LQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xNCY4GswDq4=;SeXAP18GC/+d/ANgY/rqUtTl2GP
 V/jkKQsm5C7XJKnnUtgI0RLsDMBYchgRMurMsFeRn9jUHYa0YavQxOYIFhMdXFbZU4uM0xb55
 YuMeganDM27LMCGVmBlMBL+KeJubS6r4ci51Aa8oCz8Y4w5m5R3FMouPCzQH1MXxvGxJLqwX8
 bJpCui6B8YGL60+BSlhx65Q3lqTKUjDtJoAfgRWsBxZkihaeEPk5zzWNOD7x9lSpTZ0O3Z+KH
 Xk1rh2j8Gprt/OGT7NRMqKBOw8Afh7dFdDfHnj8Cd96/Eva2Ltpn1jB1eFrN7VcMtm4QhFt3V
 18rdYFcUbMvorS5rJQzrdlD2Rgvg7SnBiNbt9+QiPAmEWq3/9hq7KoQoiKkbeujGHZKmxplHX
 QZjVPPMbH8xKeEm1RLPbpuqUfqDRNXskzaRqGeHHoafihTi76wX1Bo85bjmQdQHvzx+YmXZ28
 jMjxTZ7LoF9lBjeBL7J8QOlTqi7KsgRIVFHakLjoeFPxWxIkLD8NZMOZmRNmS7vF9ohTJb+Ee
 HH2NmJcWnSGpm0OzyYnEuH5HcDX1fnjZHwGHa0Ma0JHR91pEtbwmD1Hw3KBLvgcfPrEs99LSQ
 02jfyAsBQcyZZ8WoSIpaU3Ybi3J2exBOuO9iuQ1YqL7BG+TQ0SE/+5KgeHe/bD0qaArtWumIf
 odxSKflCGQmlkxyJh3f7gmeTUEU3bMQeHMajbvSciJXuGrxJuO1ykc5ujx8LlwGTAzERBkDlr
 oiEaMe9QmIGJte+balI5CMHF4oWtkk9aNbQspE1CHg1xZuCsM0RWBy5oNGCDw4wCm9/8Ta7Iz
 z5tpZTlAWqoytTgb94P3NWJp+jshnjlo4yIxgwLlnGU3c=

Am 21.10.24 um 16:10 schrieb Armin Wolf:

> Am 21.10.24 um 15:46 schrieb Basavaraj Natikar:
>
>> AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
>> Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
>> switching between Frequency and Cache modes. To optimize performance,
>> implement the AMD 3D V-Cache Optimizer, which allows selecting either:
>>
>> Frequency mode: cores within the faster CCD are prioritized before
>> those in the slower CCD.
>>
>> Cache mode: cores within the larger L3 CCD are prioritized before
>> those in the smaller L3 CCD.
>>
>> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
>> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 ++
>> =C2=A0 drivers/platform/x86/amd/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 12 ++
>> =C2=A0 drivers/platform/x86/amd/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
>> =C2=A0 drivers/platform/x86/amd/x3d_vcache.c | 160 ++++++++++++++++++++=
++++++
>> =C2=A0 4 files changed, 181 insertions(+)
>> =C2=A0 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e9659a5a7fb3..11b829956499 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -965,6 +965,13 @@ Q:
>> https://patchwork.kernel.org/project/linux-rdma/list/
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 drivers/infiniband/hw/efa/
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 include/uapi/rdma/efa-abi.h
>>
>> +AMD 3D V-CACHE PERFORMANCE OPTIMIZER DRIVER
>> +M:=C2=A0=C2=A0=C2=A0 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> +R:=C2=A0=C2=A0=C2=A0 Mario Limonciello <mario.limonciello@amd.com>
>> +L:=C2=A0=C2=A0=C2=A0 platform-driver-x86@vger.kernel.org
>> +S:=C2=A0=C2=A0=C2=A0 Supported
>> +F:=C2=A0=C2=A0=C2=A0 drivers/platform/x86/amd/x3d_vcache.c
>> +
>> =C2=A0 AMD ADDRESS TRANSLATION LIBRARY (ATL)
>> =C2=A0 M:=C2=A0=C2=A0=C2=A0 Yazen Ghannam <Yazen.Ghannam@amd.com>
>> =C2=A0 L:=C2=A0=C2=A0=C2=A0 linux-edac@vger.kernel.org
>> diff --git a/drivers/platform/x86/amd/Kconfig
>> b/drivers/platform/x86/amd/Kconfig
>> index f88682d36447..d73f691020d0 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -6,6 +6,18 @@
>> =C2=A0 source "drivers/platform/x86/amd/pmf/Kconfig"
>> =C2=A0 source "drivers/platform/x86/amd/pmc/Kconfig"
>>
>> +config AMD_3D_VCACHE
>> +=C2=A0=C2=A0=C2=A0 tristate "AMD 3D V-Cache Performance Optimizer Driv=
er"
>> +=C2=A0=C2=A0=C2=A0 depends on X86_64 && ACPI
>> +=C2=A0=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The driver provides a sysfs interface, =
enabling the setting of
>> a bias
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that alters CPU core reordering. This b=
ias prefers cores with
>> higher
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frequencies or larger L3 caches on proc=
essors supporting AMD
>> 3D V-Cache
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 technology.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If you choose to compile this driver as=
 a module the module
>> will be
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 called amd_3d_vcache.
>> +
>> =C2=A0 config AMD_HSMP
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "AMD HSMP Driver"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on AMD_NB && X86_64 && ACPI
>> diff --git a/drivers/platform/x86/amd/Makefile
>> b/drivers/platform/x86/amd/Makefile
>> index dcec0a46f8af..16e4cce02242 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -4,6 +4,8 @@
>> =C2=A0 # AMD x86 Platform-Specific Drivers
>> =C2=A0 #
>>
>> +obj-$(CONFIG_AMD_3D_VCACHE)=C2=A0=C2=A0=C2=A0=C2=A0 +=3D amd_3d_vcache=
.o
>> +amd_3d_vcache-objs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D x3d_vcache.o
>> =C2=A0 obj-$(CONFIG_AMD_PMC)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
+=3D pmc/
>> =C2=A0 amd_hsmp-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 :=3D hsmp.o
>> =C2=A0 obj-$(CONFIG_AMD_HSMP)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +=3D amd_hsmp.o
>> diff --git a/drivers/platform/x86/amd/x3d_vcache.c
>> b/drivers/platform/x86/amd/x3d_vcache.c
>> new file mode 100644
>> index 000000000000..ec861e7b5e1e
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/x3d_vcache.c
>> @@ -0,0 +1,160 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * AMD 3D V-Cache Performance Optimizer Driver
>> + *
>> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Authors: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Perry Yuan <p=
erry.yuan@amd.com>
>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mario Limonci=
ello <mario.limonciello@amd.com>
>> + *
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +
>> +static char *x3d_mode =3D "frequency";
>> +module_param(x3d_mode, charp, 0444);
>
> Hi,
>
> does userspace really need to know the value of this modparam? If no,
> then please
> change the visibility to 0.
>
>> +MODULE_PARM_DESC(x3d_mode, "Initial 3D-VCache mode; 'frequency'
>> (default) or 'cache'");
>> +
>> +#define DSM_REVISION_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0
>> +#define DSM_SET_X3D_MODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
>> +
>> +static guid_t x3d_guid =3D GUID_INIT(0xdff8e55f, 0xbcfd, 0x46fb, 0xba,
>> 0x0a,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xef, 0xd0, 0x45, 0x0f, 0x34, 0xee=
);
>> +
>> +enum amd_x3d_mode_type {
>> +=C2=A0=C2=A0=C2=A0 MODE_INDEX_FREQ,
>> +=C2=A0=C2=A0=C2=A0 MODE_INDEX_CACHE,
>> +};
>> +
>> +static const char * const amd_x3d_mode_strings[] =3D {
>> +=C2=A0=C2=A0=C2=A0 [MODE_INDEX_FREQ] =3D "frequency",
>> +=C2=A0=C2=A0=C2=A0 [MODE_INDEX_CACHE] =3D "cache",
>> +};
>> +
>> +struct amd_x3d_dev {
>> +=C2=A0=C2=A0=C2=A0 struct device *dev;
>> +=C2=A0=C2=A0=C2=A0 acpi_handle ahandle;
>> +=C2=A0=C2=A0=C2=A0 /* To protect x3d mode setting */
>> +=C2=A0=C2=A0=C2=A0 struct mutex lock;
>> +=C2=A0=C2=A0=C2=A0 enum amd_x3d_mode_type curr_mode;
>> +};
>> +
>> +static int amd_x3d_mode_switch(struct amd_x3d_dev *data, int new_state=
)
>> +{
>> +=C2=A0=C2=A0=C2=A0 union acpi_object *out, argv;
>> +
>> +=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->lock);
>> +=C2=A0=C2=A0=C2=A0 argv.type =3D ACPI_TYPE_INTEGER;
>> +=C2=A0=C2=A0=C2=A0 argv.integer.value =3D new_state;
>> +
>> +=C2=A0=C2=A0=C2=A0 out =3D acpi_evaluate_dsm(data->ahandle, &x3d_guid,
>> DSM_REVISION_ID, DSM_SET_X3D_MODE,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 &argv);
>> +=C2=A0=C2=A0=C2=A0 if (!out) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(data->dev, "failed =
to evaluate _DSM\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 data->curr_mode =3D new_state;
>> +
>> +=C2=A0=C2=A0=C2=A0 kfree(out);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static ssize_t amd_x3d_mode_store(struct device *dev, struct
>> device_attribute *attr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct amd_x3d_dev *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D sysfs_match_string(amd_x3d_mode_strings, bu=
f);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "no matching m=
ode to set %s\n", buf);
>
> Maybe just return ret here without printing anything. Otherwise
> userspace could spam
> the kernel log by continuously writing invalid strings.
>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D amd_x3d_mode_switch(data, ret);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return count;
>> +}
>> +
>> +static ssize_t amd_x3d_mode_show(struct device *dev, struct
>> device_attribute *attr, char *buf)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct amd_x3d_dev *data =3D dev_get_drvdata(dev);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!(data->curr_mode =3D=3D MODE_INDEX_CACHE || da=
ta->curr_mode =3D=3D
>> MODE_INDEX_FREQ))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>
> Can this error condition even be triggered?
>
>> +
>> +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%s\n",
>> amd_x3d_mode_strings[data->curr_mode]);
>
> Please use data->lock here to protect accesses to data->curr_mode.
>
>> +}
>> +static DEVICE_ATTR_RW(amd_x3d_mode);
>> +
>> +static struct attribute *amd_x3d_attrs[] =3D {
>> +=C2=A0=C2=A0=C2=A0 &dev_attr_amd_x3d_mode.attr,
>> +=C2=A0=C2=A0=C2=A0 NULL
>> +};
>> +ATTRIBUTE_GROUPS(amd_x3d);
>> +
>> +static const struct acpi_device_id amd_x3d_acpi_ids[] =3D {
>> +=C2=A0=C2=A0=C2=A0 {"AMDI0101"},
>> +=C2=A0=C2=A0=C2=A0 { },
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amd_x3d_acpi_ids);
>> +
>> +static int amd_x3d_probe(struct platform_device *pdev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct amd_x3d_dev *data;
>> +=C2=A0=C2=A0=C2=A0 acpi_handle handle;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 handle =3D ACPI_HANDLE(&pdev->dev);
>> +=C2=A0=C2=A0=C2=A0 if (!handle)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> +
>> +=C2=A0=C2=A0=C2=A0 data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GF=
P_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 if (!data)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> +
>> +=C2=A0=C2=A0=C2=A0 data->dev =3D &pdev->dev;
>> +=C2=A0=C2=A0=C2=A0 data->ahandle =3D handle;
>> +=C2=A0=C2=A0=C2=A0 platform_set_drvdata(pdev, data);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!acpi_check_dsm(handle, &x3d_guid, DSM_REVISION=
_ID,
>> BIT(DSM_SET_X3D_MODE)))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(&pdev-=
>dev, -ENODEV, "not supported on
>> this platform\n");
>
> Please do this check before allocating anything, because the driver
> should bail out as soon as possible
> when encountering unsupported hardware.
>
> Also maybe being silent and just returning -ENODEV is better as this
> error message serves no purpose.
>
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D match_string(amd_x3d_mode_strings,
>> ARRAY_SIZE(amd_x3d_mode_strings), x3d_mode);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(&pdev-=
>dev, -EINVAL, "invalid mode
>> %s\n", x3d_mode);
>> +
>> +=C2=A0=C2=A0=C2=A0 devm_mutex_init(data->dev, &data->lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D amd_x3d_mode_switch(data, ret);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(&pdev-=
>dev, ret, "mode switch failed\n");
>
> amd_x3d_mode_switch() already prints an error when failing, so please
> just return the result directly:
>
> =C2=A0=C2=A0=C2=A0=C2=A0return amd_x3d_mode_switch(data, ret);
>
> Other than that the driver look good.
>
> Thanks,
> Armin Wolf

I think i missed something: Maybe the setting should be reapplied after su=
spend/resume?
You certainly need to do this for S4 and maybe even for S3, depending whet=
her or not this
value is guaranteed to to remain stable during suspend.

Thanks,
Armin Wolf

>
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static struct platform_driver amd_3d_vcache_driver =3D {
>> +=C2=A0=C2=A0=C2=A0 .driver =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "amd_x3d_vcache",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dev_groups =3D amd_x3d_gro=
ups,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .acpi_match_table =3D amd_x=
3d_acpi_ids,
>> +=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0 .probe =3D amd_x3d_probe,
>> +};
>> +module_platform_driver(amd_3d_vcache_driver);
>> +
>> +MODULE_DESCRIPTION("AMD 3D V-Cache Performance Optimizer Driver");
>> +MODULE_LICENSE("GPL");
>
