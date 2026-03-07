Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AA835BDCB;
	Sat,  7 Mar 2026 21:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772920567; cv=pass; b=ek0zEaxH1iWs90Qx/VdAfopr3pREL1BudLcLXBpBTlEaq3XU38X2dTNTmuN0sW1D80BF/5O8wNLCcYxWDfVlpK8HeCkl/88qqBV46537Ow7WxwdfQBQTyz8cCe/vRiExuyHErAQ+uwQPtd9JwbAZQpCeHgpLX0evOd8WBKZJ1mQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772920567; c=relaxed/simple;
	bh=MeMIZeod9KYJvXzgMwV4YnXdVN+PtyomffCTcS6B6xY=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cS0BPAawQfjfgJnsyxbjRKxuHp44GAry6OXcjj+T0yNFaBuDeszFFgOtaJAN9oI+HWpHqRcXR6L62hCkzUZkGQFjlPenpogCIOIMs3NquHFea8BJqG8yX004p3wzAuLk6P0FRGeJH1T1JIhzjStkKTZv/I120q+X/+6nPTlBxCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Tn5T5tJ7; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Tn5T5tJ7"
ARC-Seal: i=1; a=rsa-sha256; t=1772920548; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eAUseIapB+WvEYez5e0cQJN9m839ZuLHBkiuPfVpSsZ/3NIC8o31c7ZE6ejI/chK83bjFCYYRPqNlRL8HNtjV8+rRbds3tCy3PppAWSPKq5/3K8KODACDmi11eyhEziI5eaMr0AP61YZOu0q5Sp7tV4ivIihEYUo+p7NHa2fZrI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772920548; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TzDT7wSWfi/0Il8SRLYtVQparFnIacGqxSZIigExzpU=; 
	b=KKkYLekABAPjsnOwVe0l8yhmdFNhYyU7tIEWwhsXVoyBW6sDE8/QWbma7OgzVYrUMou5Zlzf2nR9VqSpYxa99/E+2eRq4/zxB0vKAh+EPPtbLAji9+RHqaL3l2liM8moJHK0EtR0R4TSltxJrH6gGqrq2NrHBXDBLQzfHQabbLc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772920548;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=TzDT7wSWfi/0Il8SRLYtVQparFnIacGqxSZIigExzpU=;
	b=Tn5T5tJ7Y+7UjP3kTox/DE1GYsgfOHEjn0dVB+rfxU94MZx0EowH+fusexqLe64S
	MYi1uz7H8HTw2uPMo062kuv9SodkPDCMpiyKjJ7eAw8++2wMP3FcUicIUOYIm8fRa8P
	LaJxulst3KvTQpf7g9Nt6zeLnrRPL53i3bvABxfTJSbjQsSswq5gMXaLv/+TrRy5ejQ
	ZOhf5mkRq0cqbDvWdxVofh7t9Ll31TbTABOxgHO3e4wbit4YAa+dRGzLp7zgfD0P/C8
	cY4ip0CJRre3ly9o8QDxjuGx5lvKJSL8OOBpIVRJtgtrzL/hGT0xaZkpLuYMhT9o9rO
	1f9+uJgSOg==
Received: by mx.zohomail.com with SMTPS id 1772920546227499.2664469231777;
	Sat, 7 Mar 2026 13:55:46 -0800 (PST)
Message-ID: <40d0a4a2946a675a1836a576119d27d3113f2f8c.camel@rong.moe>
Subject: Re: [RFC v3 2/4] platform/x86/amd: dptc: Add AMD DPTCi driver
From: Rong Zhang <i@rong.moe>
To: Antheas Kapenekakis <lkml@antheas.dev>, Mario.Limonciello@amd.com
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com, 
	derekjohn.clark@gmail.com, denis.benato@linux.dev,
 linux-kernel@vger.kernel.org, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <20260307115516.26892-3-lkml@antheas.dev>
References: <20260307115516.26892-1-lkml@antheas.dev>
	 <20260307115516.26892-3-lkml@antheas.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Mar 2026 05:50:40 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Antheas,

Thanks for working on it.

I think this driver is useful for me and I will see if I can test it on
my devices once I find some time. They're not handhelds but I am sure
at least one of them has the ALIB method. It'd better if a module
option can be used to bypass the quirk table so that testing against a
new device will be easier. Such an option should taint the kernel ofc.

That being said, I have some review comments. Please see below and my
following replies.

On Sat, 2026-03-07 at 12:55 +0100, Antheas Kapenekakis wrote:
> Add a driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
> Thermal Configuration interface (DPTCi). This exposes TDP and thermal
> parameters for AMD APU-based handheld devices via the
> firmware-attributes sysfs ABI.
>=20
> Parameters are staged and atomically committed through ALIB. The driver
> supports two save modes: "single" (apply immediately on write) and
> "bulk" (stage values, then commit with "save"). An "expanded_limits"
> toggle widens the allowed parameter ranges beyond device defaults.
>=20
> Initial device support: GPD Win 5 (AMD Ryzen AI MAX).
>=20
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  MAINTAINERS                       |   6 +
>  drivers/platform/x86/amd/Kconfig  |  14 +
>  drivers/platform/x86/amd/Makefile |   2 +
>  drivers/platform/x86/amd/dptc.c   | 747 ++++++++++++++++++++++++++++++
>  4 files changed, 769 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/dptc.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e08767323763..915293594641 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1096,6 +1096,12 @@ S:	Supported
>  F:	drivers/gpu/drm/amd/display/dc/dml/
>  F:	drivers/gpu/drm/amd/display/dc/dml2_0/
> =20
> +AMD DPTC DRIVER
> +M:	Antheas Kapenekakis <lkml@antheas.dev>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/amd/dptc.c
> +
>  AMD FAM15H PROCESSOR POWER MONITORING DRIVER
>  M:	Huang Rui <ray.huang@amd.com>
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/=
Kconfig
> index b813f9265368..d610092467fc 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -44,3 +44,17 @@ config AMD_ISP_PLATFORM
> =20
>  	  This driver can also be built as a module. If so, the module
>  	  will be called amd_isp4.
> +
> +config AMD_DPTC
> +	tristate "AMD Dynamic Power and Thermal Configuration Interface (DPTCi)=
"
> +	depends on X86_64 && ACPI && DMI
> +	select FIRMWARE_ATTRIBUTES_CLASS
> +	help
> +	  Driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
> +	  Thermal Configuration Interface (DPTCi). Exposes TDP and thermal
> +	  parameters for AMD APU-based handheld devices via the
> +	  firmware-attributes sysfs ABI, allowing userspace tools to stage
> +	  and atomically commit power limit settings. Requires a DMI match
> +	  for the device and a recognized AMD SoC.
> +
> +	  If built as a module, the module will be called amd_dptc.
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd=
/Makefile
> index f6ff0c837f34..862a609bfe38 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -12,3 +12,5 @@ obj-$(CONFIG_AMD_PMF)		+=3D pmf/
>  obj-$(CONFIG_AMD_WBRF)		+=3D wbrf.o
>  obj-$(CONFIG_AMD_ISP_PLATFORM)	+=3D amd_isp4.o
>  obj-$(CONFIG_AMD_HFI)		+=3D hfi/
> +obj-$(CONFIG_AMD_DPTC)		+=3D amd_dptc.o
> +amd_dptc-y			:=3D dptc.o
> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/d=
ptc.c
> new file mode 100644
> index 000000000000..acfe9cc01bab
> --- /dev/null
> +++ b/drivers/platform/x86/amd/dptc.c
> @@ -0,0 +1,747 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * AMD Dynamic Power and Thermal Configuration Interface (DPTCi) driver
> + *
> + * Exposes AMD APU power and thermal parameters via the firmware-attribu=
tes
> + * sysfs ABI. Parameters are staged and atomically committed through the
> + * AGESA ALIB Function 0x0C (Dynamic Power and Thermal Configuration
> + * interface).
> + *
> + * Reference: AMD AGESA Publication #44065, Appendix E.5
> + *            https://docs.amd.com/v/u/en-US/44065_Arch2008
> + *
> + * Copyright (C) 2026 Antheas Kapenekakis <lkml@antheas.dev>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/dmi.h>
> +#include <linux/init.h>
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/processor.h>
> +#include <linux/sysfs.h>
> +#include <linux/unaligned.h>
> +
> +#include "../firmware_attributes_class.h"
> +
> +#define DRIVER_NAME		"amd-dptc"
> +
> +#define ALIB_FUNC_DPTC		0x0C
> +#define ALIB_PATH		"\\_SB.ALIB"
> +
> +#define ALIB_ID_TEMP_TARGET	0x03
> +#define ALIB_ID_STAPM_LIMIT	0x05
> +#define ALIB_ID_FAST_LIMIT	0x06
> +#define ALIB_ID_SLOW_LIMIT	0x07
> +#define ALIB_ID_SKIN_LIMIT	0x2E
> +
> +enum dptc_param_idx {
> +	DPTC_PPT_PL1_SPL,	/* STAPM + skin limit (set together) */
> +	DPTC_PPT_PL2_SPPT,	/* slow PPT limit */
> +	DPTC_PPT_PL3_FPPT,	/* fast PPT limit */
> +	DPTC_CPU_TEMP,		/* thermal control target */
> +	DPTC_NUM_PARAMS,
> +};
> +
> +struct dptc_param_limits {
> +	u32 expanded_min;
> +	u32 device_min;
> +	u32 def;
> +	u32 device_max;
> +	u32 expanded_max;
> +};
> +
> +struct dptc_device_limits {
> +	struct dptc_param_limits params[DPTC_NUM_PARAMS];
> +};
> +
> +struct dptc_param_desc {
> +	const char *name;
> +	const char *display_name;
> +	u16 scale;	/* sysfs-to-ALIB multiplier (e.g. 1000 for W->mW) */
> +	u8 param_id;
> +	u8 param_id2;	/* secondary ALIB ID, 0 if none */
> +};
> +
> +static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] =3D {
> +	[DPTC_PPT_PL1_SPL]  =3D { "ppt_pl1_spl",  "Sustained power limit (W)",
> +		1000, ALIB_ID_STAPM_LIMIT, ALIB_ID_SKIN_LIMIT },
> +	[DPTC_PPT_PL2_SPPT] =3D { "ppt_pl2_sppt", "Slow PPT limit (W)",
> +		1000, ALIB_ID_SLOW_LIMIT },
> +	[DPTC_PPT_PL3_FPPT] =3D { "ppt_pl3_fppt", "Fast PPT limit (W)",
> +		1000, ALIB_ID_FAST_LIMIT },
> +	[DPTC_CPU_TEMP]     =3D { "cpu_temp",     "Thermal control limit (C)",
> +		   1, ALIB_ID_TEMP_TARGET },
> +};

The indent here just made me crazy :-/

Align the contents after line breaks to the left braces.

> +
> +/* AI MAX Handheld class: GPD Win 5 */
> +static const struct dptc_device_limits limits_maxhh =3D { .params =3D {

Please don't save a line by zipping braces like this. It's hard to read
and likely to be missed when glancing the code (that's what happened to
me and it really confused me).

I found you did the same in [PATCH v3 3/4] for `.profiles'. That should
be avoided too.

> +	[DPTC_PPT_PL1_SPL]  =3D {  0,  4, 25,  80, 100 },
> +	[DPTC_PPT_PL2_SPPT] =3D {  0,  4, 27,  82, 100 },
> +	[DPTC_PPT_PL3_FPPT] =3D {  0,  4, 40,  85, 100 },
> +	[DPTC_CPU_TEMP]     =3D { 60, 70, 95,  95, 100 },
> +}};
> +
> +/* Substring matches against boot_cpu_data.x86_model_id; order matters. =
*/
> +static const char * const dptc_soc_table[] =3D {
> +	/* AI MAX */
> +	"AMD RYZEN AI MAX+ 395",
> +	"AMD RYZEN AI MAX+ 385",
> +	"AMD RYZEN AI MAX 380",
> +	NULL,
> +};
> +
> +static const struct dmi_system_id dptc_dmi_table[] =3D {
> +	/* GPD */
> +	{
> +		.ident =3D "GPD Win 5",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1618-05"),
> +		},
> +		.driver_data =3D (void *)&limits_maxhh,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
> +
> +struct dptc_priv;
> +
> +struct dptc_attr_sysfs {
> +	struct dptc_priv *priv;
> +	struct kobj_attribute current_value;
> +	struct kobj_attribute default_value;
> +	struct kobj_attribute min_value;
> +	struct kobj_attribute max_value;
> +	struct kobj_attribute scalar_increment;
> +	struct kobj_attribute display_name;
> +	struct kobj_attribute type;
> +	struct attribute *attrs[8];
> +	struct attribute_group group;
> +	int idx;
> +};
> +
> +struct dptc_priv {
> +	struct device *fw_attr_dev;
> +	struct kset *fw_attr_kset;
> +
> +	const struct dptc_device_limits *dev_limits;
> +
> +	bool expanded;
> +
> +	enum dptc_save_mode { SAVE_SINGLE, SAVE_BULK } save_mode;

Defining the enumeration separately will improve readability.

> +
> +	u32 staged[DPTC_NUM_PARAMS];
> +	bool has_staged[DPTC_NUM_PARAMS];
> +
> +	/* Protects mutable driver state */

The comment is nonsense. To make it helpful, it should be "Protects
members above/below" with properly arranged structure layout.

> +	struct mutex lock;
> +
> +	struct dptc_attr_sysfs params[DPTC_NUM_PARAMS];
> +	struct dptc_attr_sysfs expanded_attr;
> +	struct kobj_attribute save_settings_attr;
> +};
> +
> +static struct platform_device *dptc_pdev;
> +
> +static u32 dptc_get_min(struct dptc_priv *dptc, int idx)
> +{
> +	return dptc->expanded ? dptc->dev_limits->params[idx].expanded_min
> +			      : dptc->dev_limits->params[idx].device_min;
> +}
> +
> +static u32 dptc_get_max(struct dptc_priv *dptc, int idx)
> +{
> +	return dptc->expanded ? dptc->dev_limits->params[idx].expanded_max
> +			      : dptc->dev_limits->params[idx].device_max;
> +}
> +
> +static u32 dptc_get_default(struct dptc_priv *dptc, int idx)
> +{
> +	return dptc->dev_limits->params[idx].def;
> +}
> +
> +static int dptc_alib_call(const u8 *ids, const u32 *vals, int count)
> +{
> +	union acpi_object in_params[2];
> +	struct acpi_object_list input;
> +	acpi_status status;
> +	u32 buf_size;
> +	int i, off;
> +	u8 *buf;
> +
> +	if (count =3D=3D 0)
> +		return -EINVAL;

Return -ENOENT as think-lmi does (see its save_settings_store()) and
update the documentation accordingly.

> +
> +	/* Buffer layout: WORD total_size + count * (BYTE id + DWORD value) */
> +	buf_size =3D 2 + count * 5;
> +	buf =3D kzalloc(buf_size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	put_unaligned_le16(buf_size, buf);
> +
> +	for (i =3D 0; i < count; i++) {
> +		off  =3D 2 + i * 5;
> +		buf[off] =3D ids[i];
> +		put_unaligned_le32(vals[i], buf + off + 1);

put_unaligned_le32(vals[i], &buf[off + 1]);

> +	}
> +
> +	in_params[0].type          =3D ACPI_TYPE_INTEGER;
> +	in_params[0].integer.value =3D ALIB_FUNC_DPTC;
> +	in_params[1].type          =3D ACPI_TYPE_BUFFER;
> +	in_params[1].buffer.length  =3D buf_size;
> +	in_params[1].buffer.pointer =3D buf;

Misaligned `=3D'.

> +
> +	input.count   =3D 2;
> +	input.pointer =3D in_params;
> +
> +	status =3D acpi_evaluate_object(NULL, ALIB_PATH, &input, NULL);
> +	kfree(buf);
> +
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("ALIB call failed: %s\n",
> +		       acpi_format_exception(status));
> +		return -EIO;
> +	}
> +
> +	pr_debug("sent %d ALIB parameter(s)\n", count);
> +	return 0;
> +}
> +
> +static int dptc_alib_send_one(int idx, u32 val)
> +{
> +	u32 hw_val =3D val * dptc_params[idx].scale;
> +	u32 vals[2];
> +	u8 ids[2];
> +	int count =3D 0;
> +
> +	ids[count]  =3D dptc_params[idx].param_id;
> +	vals[count] =3D hw_val;
> +	count++;
> +	if (dptc_params[idx].param_id2) {
> +		ids[count]  =3D dptc_params[idx].param_id2;
> +		vals[count] =3D hw_val;
> +		count++;
> +	}
> +
> +	return dptc_alib_call(ids, vals, count);
> +}
> +
> +static int dptc_alib_save(struct dptc_priv *dptc)
> +{
> +	u32 vals[DPTC_NUM_PARAMS * 2];
> +	u8 ids[DPTC_NUM_PARAMS * 2];
> +	int i, count =3D 0;
> +	u32 hw_val;
> +
> +	for (i =3D 0; i < DPTC_NUM_PARAMS; i++) {
> +		if (!dptc->has_staged[i])
> +			continue;
> +
> +		hw_val =3D dptc->staged[i] * dptc_params[i].scale;
> +		ids[count]  =3D dptc_params[i].param_id;
> +		vals[count] =3D hw_val;
> +		count++;
> +		if (dptc_params[i].param_id2) {
> +			ids[count]  =3D dptc_params[i].param_id2;
> +			vals[count] =3D hw_val;
> +			count++;
> +		}

I could imagine a helper function to prevent replicating the same code
patterns twice:

static size_t dptc_alib_fill_param(u8 *ids, u32 *vals, size_t offset,
				   enum dptc_param_idx param, u32 val)
{
	u32 hw_val =3D val * dptc_params[param].scale;

	ids[offset]    =3D dptc_params[param].param_id;
	vals[offset++] =3D hw_val;

	if (dptc_params[param].param_id2) {
		ids[offset]    =3D dptc_params[param].param_id2;
		vals[offset++] =3D hw_val;
	}

	return offset;
}

> +	}
> +
> +	return dptc_alib_call(ids, vals, count);
> +}
> +
> +/* Sysfs callbacks */
> +
> +static ssize_t dptc_current_value_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =3D
> +		container_of(attr, struct dptc_attr_sysfs, current_value);
> +	struct dptc_priv *dptc =3D ps->priv;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	if (!dptc->has_staged[ps->idx])
> +		return sysfs_emit(buf, "\n");
> +	return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
> +}
> +
> +static ssize_t dptc_current_value_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct dptc_attr_sysfs *ps =3D
> +		container_of(attr, struct dptc_attr_sysfs, current_value);
> +	struct dptc_priv *dptc =3D ps->priv;
> +	u32 val, min, max;
> +	int ret;
> +
> +	if (count =3D=3D 1 && buf[0] =3D=3D '\n') {
> +		guard(mutex)(&dptc->lock);
> +
> +		dptc->has_staged[ps->idx] =3D false;
> +		return count;
> +	}
> +
> +	ret =3D kstrtou32(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	min =3D dptc_get_min(dptc, ps->idx);
> +	max =3D dptc_get_max(dptc, ps->idx);
> +	if (val < min || (max && val > max))
> +		return -EINVAL;
> +	dptc->staged[ps->idx]    =3D val;
> +	dptc->has_staged[ps->idx] =3D true;
> +	if (dptc->save_mode =3D=3D SAVE_SINGLE)
> +		ret =3D dptc_alib_send_one(ps->idx, val);
> +
> +	return ret ? ret : count;
> +}
> +
> +static ssize_t dptc_default_value_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =3D
> +		container_of(attr, struct dptc_attr_sysfs, default_value);
> +
> +	return sysfs_emit(buf, "%u\n", dptc_get_default(ps->priv, ps->idx));
> +}
> +
> +static ssize_t dptc_min_value_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =3D
> +		container_of(attr, struct dptc_attr_sysfs, min_value);
> +	struct dptc_priv *dptc =3D ps->priv;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	return sysfs_emit(buf, "%u\n", dptc_get_min(dptc, ps->idx));
> +}
> +
> +static ssize_t dptc_max_value_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =3D
> +		container_of(attr, struct dptc_attr_sysfs, max_value);
> +	struct dptc_priv *dptc =3D ps->priv;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	return sysfs_emit(buf, "%u\n", dptc_get_max(dptc, ps->idx));
> +}
> +
> +static ssize_t dptc_scalar_increment_show(struct kobject *kobj,
> +					  struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +
> +static ssize_t dptc_display_name_show(struct kobject *kobj,
> +				      struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =3D
> +		container_of(attr, struct dptc_attr_sysfs, display_name);
> +	return sysfs_emit(buf, "%s\n", dptc_params[ps->idx].display_name);
> +}
> +
> +static ssize_t dptc_type_show(struct kobject *kobj,
> +			      struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "integer\n");
> +}
> +
> +static ssize_t dptc_save_settings_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_priv *dptc =3D
> +		container_of(attr, struct dptc_priv, save_settings_attr);
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	if (dptc->save_mode =3D=3D SAVE_SINGLE)
> +		return sysfs_emit(buf, "single\n");
> +	return sysfs_emit(buf, "bulk\n");
> +}
> +
> +static ssize_t dptc_save_settings_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct dptc_priv *dptc =3D
> +		container_of(attr, struct dptc_priv, save_settings_attr);
> +	int ret =3D 0;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	if (sysfs_streq(buf, "save"))

Please don't rely on the `count =3D=3D 0' check in dptc_alib_call(). `dptc-
>save_mode =3D=3D SAVE_SINGLE' should result in -EOPNOTSUPP to maintain
consistency with think-lmi (update the documentation accordingly).

> +		ret =3D dptc_alib_save(dptc);
> +	else if (sysfs_streq(buf, "single"))
> +		dptc->save_mode =3D SAVE_SINGLE;
> +	else if (sysfs_streq(buf, "bulk"))
> +		dptc->save_mode =3D SAVE_BULK;
> +	else
> +		return -EINVAL;
> +
> +	return ret ? ret : count;
> +}
> +
> +static ssize_t dptc_expanded_current_value_show(struct kobject *kobj,
> +						struct kobj_attribute *attr,
> +						char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =3D
> +		container_of(attr, struct dptc_attr_sysfs, current_value);
> +	struct dptc_priv *dptc =3D ps->priv;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	return sysfs_emit(buf, "%d\n", dptc->expanded);
> +}
> +
> +static ssize_t dptc_expanded_current_value_store(struct kobject *kobj,
> +						 struct kobj_attribute *attr,
> +						 const char *buf, size_t count)
> +{
> +	struct dptc_attr_sysfs *ps =3D
> +		container_of(attr, struct dptc_attr_sysfs, current_value);
> +	struct dptc_priv *dptc =3D ps->priv;
> +	bool val;
> +	int ret;
> +
> +	ret =3D kstrtobool(buf, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	dptc->expanded =3D val;
> +	/* Clear staged values: limits changed, old values may be out of range =
*/
> +	memset(dptc->has_staged, 0, sizeof(dptc->has_staged));

I'd prefer using a bitmap so that you don't need to use memset() to
clear them. It also saves some memory if more parameters are added in
the future.

> +
> +	return count;
> +}
> +
> +static ssize_t dptc_expanded_default_value_show(struct kobject *kobj,
> +						struct kobj_attribute *attr,
> +						char *buf)
> +{
> +	return sysfs_emit(buf, "0\n");
> +}
> +
> +static ssize_t dptc_expanded_min_value_show(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    char *buf)
> +{
> +	return sysfs_emit(buf, "0\n");
> +}
> +
> +static ssize_t dptc_expanded_max_value_show(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +
> +static ssize_t dptc_expanded_scalar_increment_show(struct kobject *kobj,
> +						   struct kobj_attribute *attr,
> +						   char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +
> +static ssize_t dptc_expanded_display_name_show(struct kobject *kobj,
> +					       struct kobj_attribute *attr,
> +					       char *buf)
> +{
> +	return sysfs_emit(buf, "Expanded Limits\n");
> +}
> +
> +static ssize_t dptc_expanded_type_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "integer\n");
> +}
> +
> +/* Sysfs setup */
> +
> +static void dptc_setup_param_sysfs(struct dptc_priv *dptc,
> +				   struct dptc_attr_sysfs *ps, int idx)
> +{
> +	ps->priv =3D dptc;
> +	ps->idx =3D idx;
> +
> +	sysfs_attr_init(&ps->current_value.attr);
> +	ps->current_value.attr.name  =3D "current_value";
> +	ps->current_value.attr.mode  =3D 0644;
> +	ps->current_value.show       =3D dptc_current_value_show;
> +	ps->current_value.store      =3D dptc_current_value_store;
> +
> +	sysfs_attr_init(&ps->default_value.attr);
> +	ps->default_value.attr.name  =3D "default_value";
> +	ps->default_value.attr.mode  =3D 0444;
> +	ps->default_value.show       =3D dptc_default_value_show;
> +
> +	sysfs_attr_init(&ps->min_value.attr);
> +	ps->min_value.attr.name      =3D "min_value";
> +	ps->min_value.attr.mode      =3D 0444;
> +	ps->min_value.show           =3D dptc_min_value_show;
> +
> +	sysfs_attr_init(&ps->max_value.attr);
> +	ps->max_value.attr.name      =3D "max_value";
> +	ps->max_value.attr.mode      =3D 0444;
> +	ps->max_value.show           =3D dptc_max_value_show;
> +
> +	sysfs_attr_init(&ps->scalar_increment.attr);
> +	ps->scalar_increment.attr.name =3D "scalar_increment";
> +	ps->scalar_increment.attr.mode =3D 0444;
> +	ps->scalar_increment.show      =3D dptc_scalar_increment_show;
> +
> +	sysfs_attr_init(&ps->display_name.attr);
> +	ps->display_name.attr.name   =3D "display_name";
> +	ps->display_name.attr.mode   =3D 0444;
> +	ps->display_name.show        =3D dptc_display_name_show;
> +
> +	sysfs_attr_init(&ps->type.attr);
> +	ps->type.attr.name           =3D "type";
> +	ps->type.attr.mode           =3D 0444;
> +	ps->type.show                =3D dptc_type_show;
> +
> +	ps->attrs[0] =3D &ps->current_value.attr;
> +	ps->attrs[1] =3D &ps->default_value.attr;
> +	ps->attrs[2] =3D &ps->min_value.attr;
> +	ps->attrs[3] =3D &ps->max_value.attr;
> +	ps->attrs[4] =3D &ps->scalar_increment.attr;
> +	ps->attrs[5] =3D &ps->display_name.attr;
> +	ps->attrs[6] =3D &ps->type.attr;
> +	ps->attrs[7] =3D NULL;
> +
> +	ps->group.name  =3D dptc_params[idx].name;
> +	ps->group.attrs =3D ps->attrs;
> +}
> +
> +static void dptc_setup_expanded_sysfs(struct dptc_priv *dptc,
> +				      struct dptc_attr_sysfs *ps)
> +{
> +	ps->priv =3D dptc;
> +	sysfs_attr_init(&ps->current_value.attr);
> +	ps->current_value.attr.name  =3D "current_value";
> +	ps->current_value.attr.mode  =3D 0644;
> +	ps->current_value.show       =3D dptc_expanded_current_value_show;
> +	ps->current_value.store      =3D dptc_expanded_current_value_store;
> +
> +	sysfs_attr_init(&ps->default_value.attr);
> +	ps->default_value.attr.name  =3D "default_value";
> +	ps->default_value.attr.mode  =3D 0444;
> +	ps->default_value.show       =3D dptc_expanded_default_value_show;
> +
> +	sysfs_attr_init(&ps->min_value.attr);
> +	ps->min_value.attr.name      =3D "min_value";
> +	ps->min_value.attr.mode      =3D 0444;
> +	ps->min_value.show           =3D dptc_expanded_min_value_show;
> +
> +	sysfs_attr_init(&ps->max_value.attr);
> +	ps->max_value.attr.name      =3D "max_value";
> +	ps->max_value.attr.mode      =3D 0444;
> +	ps->max_value.show           =3D dptc_expanded_max_value_show;
> +
> +	sysfs_attr_init(&ps->scalar_increment.attr);
> +	ps->scalar_increment.attr.name =3D "scalar_increment";
> +	ps->scalar_increment.attr.mode =3D 0444;
> +	ps->scalar_increment.show      =3D dptc_expanded_scalar_increment_show;
> +
> +	sysfs_attr_init(&ps->display_name.attr);
> +	ps->display_name.attr.name   =3D "display_name";
> +	ps->display_name.attr.mode   =3D 0444;
> +	ps->display_name.show        =3D dptc_expanded_display_name_show;
> +
> +	sysfs_attr_init(&ps->type.attr);
> +	ps->type.attr.name           =3D "type";
> +	ps->type.attr.mode           =3D 0444;
> +	ps->type.show                =3D dptc_expanded_type_show;
> +
> +	ps->attrs[0] =3D &ps->current_value.attr;
> +	ps->attrs[1] =3D &ps->default_value.attr;
> +	ps->attrs[2] =3D &ps->min_value.attr;
> +	ps->attrs[3] =3D &ps->max_value.attr;
> +	ps->attrs[4] =3D &ps->scalar_increment.attr;
> +	ps->attrs[5] =3D &ps->display_name.attr;
> +	ps->attrs[6] =3D &ps->type.attr;
> +	ps->attrs[7] =3D NULL;
> +
> +	ps->group.name  =3D "expanded_limits";
> +	ps->group.attrs =3D ps->attrs;
> +}

As Derek has said in v2, use macros to rearrange them.

It's painful to read all these things as I'll need to scroll the screen
quite a lot just to read something with a low information density.
That's why there are numerous macros defined in include/linux/sysfs.h.
I could imagine defining macros like DPTC{,_EXPANDED}_ATTR_{RO,RW}.

Meanwhile, I am not very sure why you would have to dynamically
initialize all these attributes. I haven't notice a blocker of defining
them statically at the module-level (see how lenovo-wmi-other did). Am
I missing anything?

> +
> +static void dptc_fw_dev_unregister(void *data)
> +{
> +	device_unregister(data);
> +}
> +
> +static void dptc_kset_unregister(void *data)
> +{
> +	kset_unregister(data);
> +}
> +
> +static int dptc_resume(struct device *dev)
> +{
> +	struct dptc_priv *dptc =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	if (dptc->save_mode =3D=3D SAVE_SINGLE)
> +		ret =3D dptc_alib_save(dptc);

I don't see why bulk mode and single mode should have divergence on
resuming behavior.

Thanks,
Rong

> +	else
> +		ret =3D 0;
> +
> +	if (ret)
> +		dev_warn(dev, "failed to restore settings on resume: %d\n", ret);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(dptc_pm_ops, NULL, dptc_resume);
> +
> +static int dptc_probe(struct platform_device *pdev)
> +{
> +	const struct dmi_system_id *dmi_match =3D dev_get_platdata(&pdev->dev);
> +	struct device *dev =3D &pdev->dev;
> +	struct dptc_priv *dptc;
> +	int i, ret;
> +
> +	dptc =3D devm_kzalloc(dev, sizeof(*dptc), GFP_KERNEL);
> +	if (!dptc)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, dptc);
> +
> +	ret =3D devm_mutex_init(dev, &dptc->lock);
> +	if (ret)
> +		return ret;
> +
> +	dptc->dev_limits =3D dmi_match->driver_data;
> +	dev_info(dev, "%s (%s)\n", dmi_match->ident,
> +		 boot_cpu_data.x86_model_id);
> +
> +	dptc->fw_attr_dev =3D device_create(&firmware_attributes_class,
> +					  NULL, MKDEV(0, 0), NULL,
> +					  DRIVER_NAME);
> +	if (IS_ERR(dptc->fw_attr_dev))
> +		return PTR_ERR(dptc->fw_attr_dev);
> +
> +	ret =3D devm_add_action_or_reset(dev, dptc_fw_dev_unregister,
> +				       dptc->fw_attr_dev);
> +	if (ret)
> +		return ret;
> +
> +	dptc->fw_attr_kset =3D kset_create_and_add("attributes", NULL,
> +						 &dptc->fw_attr_dev->kobj);
> +	if (!dptc->fw_attr_kset)
> +		return -ENOMEM;
> +
> +	ret =3D devm_add_action_or_reset(dev, dptc_kset_unregister,
> +				       dptc->fw_attr_kset);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < DPTC_NUM_PARAMS; i++) {
> +		dptc_setup_param_sysfs(dptc, &dptc->params[i], i);
> +		ret =3D sysfs_create_group(&dptc->fw_attr_kset->kobj,
> +					 &dptc->params[i].group);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	dptc_setup_expanded_sysfs(dptc, &dptc->expanded_attr);
> +	ret =3D sysfs_create_group(&dptc->fw_attr_kset->kobj,
> +				 &dptc->expanded_attr.group);
> +	if (ret)
> +		return ret;
> +
> +	sysfs_attr_init(&dptc->save_settings_attr.attr);
> +	dptc->save_settings_attr.attr.name  =3D "save_settings";
> +	dptc->save_settings_attr.attr.mode  =3D 0644;
> +	dptc->save_settings_attr.show       =3D dptc_save_settings_show;
> +	dptc->save_settings_attr.store      =3D dptc_save_settings_store;
> +	ret =3D sysfs_create_file(&dptc->fw_attr_kset->kobj,
> +				&dptc->save_settings_attr.attr);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static struct platform_driver dptc_driver =3D {
> +	.driver =3D {
> +		.name =3D DRIVER_NAME,
> +		.pm   =3D pm_sleep_ptr(&dptc_pm_ops),
> +	},
> +	.probe  =3D dptc_probe,
> +};
> +
> +static int __init dptc_init(void)
> +{
> +	const struct dmi_system_id *match;
> +	bool soc_found =3D false;
> +	int i, ret;
> +
> +	match =3D dmi_first_match(dptc_dmi_table);
> +	if (!match)
> +		return -ENODEV;
> +
> +	if (!acpi_has_method(NULL, ALIB_PATH)) {
> +		pr_warn("ALIB method not present\n");
> +		return -ENODEV;
> +	}
> +
> +	for (i =3D 0; dptc_soc_table[i]; i++) {
> +		if (strstr(boot_cpu_data.x86_model_id,
> +			   dptc_soc_table[i])) {
> +			soc_found =3D true;
> +			break;
> +		}
> +	}
> +	if (!soc_found) {
> +		pr_warn("unrecognized SoC '%s'\n",
> +			boot_cpu_data.x86_model_id);
> +		return -ENODEV;
> +	}
> +
> +	dptc_pdev =3D platform_device_register_data(NULL, DRIVER_NAME, -1,
> +						  match, sizeof(*match));
> +	if (IS_ERR(dptc_pdev))
> +		return PTR_ERR(dptc_pdev);
> +
> +	ret =3D platform_driver_register(&dptc_driver);
> +	if (ret) {
> +		platform_device_unregister(dptc_pdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit dptc_exit(void)
> +{
> +	platform_driver_unregister(&dptc_driver);
> +	platform_device_unregister(dptc_pdev);
> +}
> +
> +module_init(dptc_init);
> +module_exit(dptc_exit);
> +
> +MODULE_AUTHOR("Antheas Kapenekakis <lkml@antheas.dev>");
> +MODULE_DESCRIPTION("AMD DPTCi ACPI Driver");
> +MODULE_LICENSE("GPL");
