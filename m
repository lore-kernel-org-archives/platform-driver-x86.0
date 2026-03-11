Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB372E62C4
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 19:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256195; cv=none; b=qADN8bB2w5yeTbjNJIpCqX7U9GpvwD+mrn5RdWQCGyMELZrFTtmcs3mKo2+uYAxYEr2if3+mFxuqocTAzugRKIlIeabJPWkLjKJASF/dd3fQtDQxtCzKvRd5eoZTOEh2oqRe97GekP7lW9PwWFK/mhCEbK1EuHlBMR0qwYxdnSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256195; c=relaxed/simple;
	bh=rvllrl8pEusFhI/ukWIThKEcQ2l9TA0jmUztxBhAlHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXBa+mXDCGKOkr9j44768GaiVyh/oVaOYZ6IMb2V344gE2lYP0TfWQWG+Arpy9CwxZkSWZsUyVdcyQRmbE4wMPhWT0cls/KXsZkifAwpoYq6qh9woKFdmC2Z0W6Yd85gJ3ScI8DAeg53mSwS4B+5kng/BgR10TUPpqK4xSrYI8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=cZ0xYYm/; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="cZ0xYYm/"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id E82F947C8F
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 21:09:44 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 78E8D47C97
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 21:09:42 +0200 (EET)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 7896D201C3D
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 21:09:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1773256182;
	bh=VTlKLIH/ZVu19mgX8vEM1XyGjqS1V55uUaOJd6PEMB0=;
	h=Received:From:Subject:To;
	b=cZ0xYYm/h6Ljd3M8tvZ1CGTzeTcdgk3c6rRLxxns1W/MTE34iyww7AoJcCULiZGgG
	 NrGe/9Scgn3YHHBMhn5VInyD6/BbcrxU7O9TvBpzcPYMm8m8NXmeS78LlPVtdS2KHN
	 n/y6WRA3m8nibizKTSontzheX8JXXyYjxYWI0avwKuRryZxVhkN4e7vyeXnGufdTf4
	 E0td8wQDpE2lZqUVqE/swMvGHVTwvf49m4sXUkYoomKp/DYleS7qvbd9SBI5vTPhk2
	 fGfiChra76kzZBS57ZEk/B6n7CgZuNRqVwVUVnfssmGATqTCG+GzR9/gXYtGou8iGA
	 dPr7SqkPX4EVw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.42) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f42.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3598df39444so120454a91.2
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 11 Mar 2026 12:09:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW0nsLB45uKKDKJ7/AxTADCGCCMNpvyxb3iP7L+wn4VgRWEqTfeHmKsHjiFWddfx6tePToEJjNS7u8r3aTgbSy/R3uH@vger.kernel.org
X-Gm-Message-State: AOJu0YxO1lO6IHXZ/aUcyfOPIy4ijm9rBg28C5Atgxih0fsuljy8B8+m
	wcbcJXsreAuhn1xh0pnpqnS0kfXojBpn8hOGXxDXH2sXusN3CJ6ArzH7pq5X/u6agDc2jJVw2E8
	7P/wTgCBzy7Av57TJvj9s27Q97FOfYR8=
X-Received: by 2002:a17:90b:2681:b0:356:2872:9c4e with SMTP id
 98e67ed59e1d1-35a0124cf8fmr3467524a91.13.1773256179939; Wed, 11 Mar 2026
 12:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309205125.293148-1-lkml@antheas.dev>
 <20260309205125.293148-3-lkml@antheas.dev>
 <23ee46ed-6978-40a0-9447-e7f527ec7c11@amd.com>
 <CAGwozwFn0nUHWrF6nmba1N9-jbDx7ZpLRe8GcYJAZsQ1MO0y1w@mail.gmail.com>
 <9a9e441c-850a-44fb-b659-f4bc135beabe@amd.com>
In-Reply-To: <9a9e441c-850a-44fb-b659-f4bc135beabe@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 11 Mar 2026 20:09:25 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwE9yn0fQxUPxZa70CyTajjvyWZjRDfWRs15fa_Xtf0sGg@mail.gmail.com>
X-Gm-Features: AaiRm53sp3GoO6MqWOXPHYcFCXLFK0Y9vol1Pjvm-OJuZ9EnF-3pd8-QcwWpoL0
Message-ID: 
 <CAGwozwE9yn0fQxUPxZa70CyTajjvyWZjRDfWRs15fa_Xtf0sGg@mail.gmail.com>
Subject: Re: [RFC v4 2/4] platform/x86/amd: dptc: Add AMD DPTCi driver
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
	derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177325618189.3615498.4765121689821411138@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 10 Mar 2026 at 17:26, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 3/10/26 3:02 AM, Antheas Kapenekakis wrote:
> > On Tue, 10 Mar 2026 at 05:01, Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >>
> >>
> >> On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
> >>> Add a driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
> >>> Thermal Configuration interface (DPTCi). This exposes TDP and thermal
> >>> parameters for AMD APU-based handheld devices via the
> >>> firmware-attributes sysfs ABI.
> >>>
> >>> Parameters are staged and atomically committed through ALIB. The driver
> >>> supports two save modes: "single" (apply immediately on write) and
> >>> "bulk" (stage values, then commit with "save"). An "expanded_limits"
> >>> toggle widens the allowed parameter ranges beyond device defaults.
> >>>
> >>> Initial device support: GPD Win 5 (AMD Ryzen AI MAX).
> >>>
> >>> Assisted-by: Claude:claude-opus-4-6
> >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>> ---
> >>>    MAINTAINERS                       |   6 +
> >>>    drivers/platform/x86/amd/Kconfig  |  14 +
> >>>    drivers/platform/x86/amd/Makefile |   2 +
> >>>    drivers/platform/x86/amd/dptc.c   | 746 ++++++++++++++++++++++++++++++
> >>>    4 files changed, 768 insertions(+)
> >>>    create mode 100644 drivers/platform/x86/amd/dptc.c
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 89007f9ed35e..ebda8e82bf35 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -1103,6 +1103,12 @@ S:     Supported
> >>>    F:  drivers/gpu/drm/amd/display/dc/dml/
> >>>    F:  drivers/gpu/drm/amd/display/dc/dml2_0/
> >>>
> >>> +AMD DPTC DRIVER
> >>> +M:   Antheas Kapenekakis <lkml@antheas.dev>
> >>> +L:   platform-driver-x86@vger.kernel.org
> >>> +S:   Maintained
> >>> +F:   drivers/platform/x86/amd/dptc.c
> >>> +
> >>>    AMD FAM15H PROCESSOR POWER MONITORING DRIVER
> >>>    M:  Huang Rui <ray.huang@amd.com>
> >>>    L:  linux-hwmon@vger.kernel.org
> >>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> >>> index b813f9265368..d610092467fc 100644
> >>> --- a/drivers/platform/x86/amd/Kconfig
> >>> +++ b/drivers/platform/x86/amd/Kconfig
> >>> @@ -44,3 +44,17 @@ config AMD_ISP_PLATFORM
> >>>
> >>>          This driver can also be built as a module. If so, the module
> >>>          will be called amd_isp4.
> >>> +
> >>> +config AMD_DPTC
> >>> +     tristate "AMD Dynamic Power and Thermal Configuration Interface (DPTCi)"
> >>> +     depends on X86_64 && ACPI && DMI
> >>> +     select FIRMWARE_ATTRIBUTES_CLASS
> >>> +     help
> >>> +       Driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
> >>> +       Thermal Configuration Interface (DPTCi). Exposes TDP and thermal
> >>> +       parameters for AMD APU-based handheld devices via the
> >>> +       firmware-attributes sysfs ABI, allowing userspace tools to stage
> >>> +       and atomically commit power limit settings. Requires a DMI match
> >>> +       for the device and a recognized AMD SoC.
> >>> +
> >>> +       If built as a module, the module will be called amd_dptc.
> >>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> >>> index f6ff0c837f34..862a609bfe38 100644
> >>> --- a/drivers/platform/x86/amd/Makefile
> >>> +++ b/drivers/platform/x86/amd/Makefile
> >>> @@ -12,3 +12,5 @@ obj-$(CONFIG_AMD_PMF)               += pmf/
> >>>    obj-$(CONFIG_AMD_WBRF)              += wbrf.o
> >>>    obj-$(CONFIG_AMD_ISP_PLATFORM)      += amd_isp4.o
> >>>    obj-$(CONFIG_AMD_HFI)               += hfi/
> >>> +obj-$(CONFIG_AMD_DPTC)               += amd_dptc.o
> >>> +amd_dptc-y                   := dptc.o
> >>> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
> >>> new file mode 100644
> >>> index 000000000000..b884cdfa3f82
> >>> --- /dev/null
> >>> +++ b/drivers/platform/x86/amd/dptc.c
> >>> @@ -0,0 +1,746 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/*
> >>> + * AMD Dynamic Power and Thermal Configuration Interface (DPTCi) driver
> >>> + *
> >>> + * Exposes AMD APU power and thermal parameters via the firmware-attributes
> >>> + * sysfs ABI. Parameters are staged and atomically committed through the
> >>> + * AGESA ALIB Function 0x0C (Dynamic Power and Thermal Configuration
> >>> + * interface).
> >>> + *
> >>> + * Reference: AMD AGESA Publication #44065, Appendix E.5
> >>> + *            https://docs.amd.com/v/u/en-US/44065_Arch2008
> >>> + *
> >>> + * Copyright (C) 2026 Antheas Kapenekakis <lkml@antheas.dev>
> >>> + */
> >>> +
> >>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >>> +
> >>> +#include <linux/acpi.h>
> >>> +#include <linux/cleanup.h>
> >>> +#include <linux/dmi.h>
> >>> +#include <linux/init.h>
> >>> +#include <linux/kobject.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/mutex.h>
> >>> +#include <linux/platform_device.h>
> >>> +#include <linux/processor.h>
> >>> +#include <linux/sysfs.h>
> >>> +#include <linux/unaligned.h>
> >>> +
> >>> +#include "../firmware_attributes_class.h"
> >>> +
> >>> +#define DRIVER_NAME          "amd-dptc"
> >>> +
> >>> +#define ALIB_FUNC_DPTC               0x0C
> >>> +#define ALIB_PATH            "\\_SB.ALIB"
> >>> +
> >>> +#define ALIB_ID_TEMP_TARGET  0x03
> >>> +#define ALIB_ID_STAPM_LIMIT  0x05
> >>> +#define ALIB_ID_FAST_LIMIT   0x06
> >>> +#define ALIB_ID_SLOW_LIMIT   0x07
> >>> +#define ALIB_ID_SKIN_LIMIT   0x2E
> >>> +
> >>> +enum dptc_param_idx {
> >>> +     DPTC_PPT_PL1_SPL,       /* STAPM + skin limit (set together) */
> >>> +     DPTC_PPT_PL2_SPPT,      /* slow PPT limit */
> >>> +     DPTC_PPT_PL3_FPPT,      /* fast PPT limit */
> >>> +     DPTC_CPU_TEMP,          /* thermal control target */
> >>> +     DPTC_NUM_PARAMS,
> >>> +};
> >>> +
> >>> +struct dptc_param_limits {
> >>> +     u32 expanded_min;
> >>> +     u32 device_min;
> >>> +     u32 def;
> >>> +     u32 device_max;
> >>> +     u32 expanded_max;
> >>> +};
> >>> +
> >>> +struct dptc_device_limits {
> >>> +     struct dptc_param_limits params[DPTC_NUM_PARAMS];
> >>> +};
> >>> +
> >>> +struct dptc_param_desc {
> >>> +     const char *name;
> >>> +     const char *display_name;
> >>> +     u16 scale;      /* sysfs-to-ALIB multiplier (e.g. 1000 for W->mW) */
> >>> +     u8 param_id;
> >>> +     u8 param_id2;   /* secondary ALIB ID, 0 if none */
> >>> +};
> >>> +
> >>> +static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] = {
> >>> +     [DPTC_PPT_PL1_SPL]  = { "ppt_pl1_spl", "Sustained power limit (W)",
> >>> +                              1000, ALIB_ID_STAPM_LIMIT,
> >>> +                              ALIB_ID_SKIN_LIMIT },
> >>> +     [DPTC_PPT_PL2_SPPT] = { "ppt_pl2_sppt", "Slow PPT limit (W)",
> >>> +                              1000, ALIB_ID_SLOW_LIMIT },
> >>> +     [DPTC_PPT_PL3_FPPT] = { "ppt_pl3_fppt", "Fast PPT limit (W)",
> >>> +                              1000, ALIB_ID_FAST_LIMIT },
> >>> +     [DPTC_CPU_TEMP]     = { "cpu_temp", "Thermal control limit (C)",
> >>> +                              1, ALIB_ID_TEMP_TARGET },
> >>> +};
> >>> +
> >>> +/* AI MAX Handheld class: GPD Win 5 */
> >>> +static const struct dptc_device_limits limits_maxhh = {
> >>> +     .params = {
> >>> +             [DPTC_PPT_PL1_SPL]  = {  1,  4, 25,  80, 100 },
> >>> +             [DPTC_PPT_PL2_SPPT] = {  1,  4, 27,  82, 100 },
> >>> +             [DPTC_PPT_PL3_FPPT] = {  1,  4, 40,  85, 100 },
> >>> +             [DPTC_CPU_TEMP]     = { 60, 70, 95,  95, 100 },
> >>> +     },
> >>> +};
> >>> +
> >>> +/* Substring matches against boot_cpu_data.x86_model_id; order matters. */
> >>> +static const char * const dptc_soc_table[] = {
> >>> +     /* AI MAX */
> >>> +     "AMD RYZEN AI MAX+ 395",
> >>> +     "AMD RYZEN AI MAX+ 385",
> >>> +     "AMD RYZEN AI MAX 380",
> >>> +     NULL,
> >>> +};
> >>
> >> I feel like I commented this before; but I don't really understand the
> >> purpose of this table.
> >>
> >> If you have a system that is quirked already, why would you need to
> >> cross reference this table?
> >
> > Yes, and I addressed it on a reply.
> >
> > It is an additional safety feature. A lot of these devices ship
> > different SoC SKUs with the same DMI. Most of them actually. But it is
> > not needed beyond that, it can be removed. I will defer to you.
> >
>
> Exact same SMBIOS?  There are a lot of fields that can be keyed off.
> Can you share a dmidecode from two such systems?

Ah, it's difficult to verify currently, I don't have two spares and
varies per manufacturer.

What I can say for now is that it varies per manufactuer. E.g., GPD
only updates their DMI data only for major revisions. For example, all
GPD Win 4s, 3 years of device generations, have the same DMI (6800/
7840/ 8840u, hx 370). Same for the Win Minis, but for the 2025
generation GPD switched the ODM for the controller motherboard and I
assume more, so that one. However, the thermal differences are minimal
so its appropriate to use the same values for all. All chips can
handle more, the chassis is the limitation. Onexplayer typically
changes DMI per generation, but within the same generation they can
release multiple chip variants. It is unclear to me if they use the
same BIOS capsule. Ayaneo is also very similar. All Ayaneo 3s are
named Ayaneo 3. I have an 8840u but that device also came out with an
HX 370.

Antheas

> >
> >>> +
> >>> +static const struct dmi_system_id dptc_dmi_table[] = {
> >>> +     /* GPD */
> >>> +     {
> >>> +             .ident = "GPD Win 5",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1618-05"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_maxhh,
> >>> +     },
> >>> +     { }
> >>> +};
> >>> +MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
> >>> +
> >>> +enum dptc_save_mode { SAVE_SINGLE, SAVE_BULK };
> >>> +
> >>> +struct dptc_priv;
> >>> +
> >>> +struct dptc_attr_sysfs {
> >>> +     struct dptc_priv *priv;
> >>> +     struct kobj_attribute current_value;
> >>> +     struct kobj_attribute default_value;
> >>> +     struct kobj_attribute min_value;
> >>> +     struct kobj_attribute max_value;
> >>> +     struct kobj_attribute scalar_increment;
> >>> +     struct kobj_attribute display_name;
> >>> +     struct kobj_attribute type;
> >>> +     struct attribute *attrs[8];
> >>> +     struct attribute_group group;
> >>> +     int idx;
> >>> +};
> >>> +
> >>> +struct dptc_priv {
> >>> +     struct device *fw_attr_dev;
> >>> +     struct kset *fw_attr_kset;
> >>> +
> >>> +     const struct dptc_device_limits *dev_limits;
> >>> +
> >>> +     bool expanded;
> >>> +
> >>> +     enum dptc_save_mode save_mode;
> >>> +
> >>> +     u32 staged[DPTC_NUM_PARAMS];
> >>> +
> >>> +     /* Protects staged, expanded, and save_mode */
> >>> +     struct mutex lock;
> >>> +
> >>> +     struct dptc_attr_sysfs params[DPTC_NUM_PARAMS];
> >>> +     struct dptc_attr_sysfs expanded_attr;
> >>> +     struct kobj_attribute save_settings_attr;
> >>> +};
> >>> +
> >>> +static struct platform_device *dptc_pdev;
> >>> +
> >>> +static u32 dptc_get_min(struct dptc_priv *dptc, int idx)
> >>> +{
> >>> +     return dptc->expanded ? dptc->dev_limits->params[idx].expanded_min
> >>> +                           : dptc->dev_limits->params[idx].device_min;
> >>> +}
> >>> +
> >>> +static u32 dptc_get_max(struct dptc_priv *dptc, int idx)
> >>> +{
> >>> +     return dptc->expanded ? dptc->dev_limits->params[idx].expanded_max
> >>> +                           : dptc->dev_limits->params[idx].device_max;
> >>> +}
> >>> +
> >>> +static u32 dptc_get_default(struct dptc_priv *dptc, int idx)
> >>> +{
> >>> +     return dptc->dev_limits->params[idx].def;
> >>> +}
> >>> +
> >>> +static int dptc_alib_call(const u8 *ids, const u32 *vals, int count)
> >>> +{
> >>> +     union acpi_object in_params[2];
> >>> +     struct acpi_object_list input;
> >>> +     acpi_status status;
> >>> +     u32 buf_size;
> >>> +     int i, off;
> >>> +     u8 *buf;
> >>> +
> >>> +     if (count == 0)
> >>> +             return -ENOENT;
> >>> +
> >>> +     /* Buffer layout: WORD total_size + count * (BYTE id + DWORD value) */
> >>> +     buf_size = 2 + count * 5;
> >>> +     buf = kzalloc(buf_size, GFP_KERNEL);
> >>> +     if (!buf)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     put_unaligned_le16(buf_size, buf);
> >>> +
> >>> +     for (i = 0; i < count; i++) {
> >>> +             off  = 2 + i * 5;
> >>> +             buf[off] = ids[i];
> >>> +             put_unaligned_le32(vals[i], &buf[off + 1]);
> >>> +     }
> >>> +
> >>> +     in_params[0].type           = ACPI_TYPE_INTEGER;
> >>> +     in_params[0].integer.value  = ALIB_FUNC_DPTC;
> >>> +     in_params[1].type           = ACPI_TYPE_BUFFER;
> >>> +     in_params[1].buffer.length  = buf_size;
> >>> +     in_params[1].buffer.pointer = buf;
> >>> +
> >>> +     input.count   = 2;
> >>> +     input.pointer = in_params;
> >>> +
> >>> +     status = acpi_evaluate_object(NULL, ALIB_PATH, &input, NULL);
> >>> +     kfree(buf);
> >>> +
> >>> +     if (ACPI_FAILURE(status)) {
> >>> +             pr_err("ALIB call failed: %s\n",
> >>> +                    acpi_format_exception(status));
> >>> +             return -EIO;
> >>> +     }
> >>> +
> >>> +     pr_debug("sent %d ALIB parameter(s)\n", count);
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int dptc_alib_fill_param(u8 *ids, u32 *vals, int offset,
> >>> +                             enum dptc_param_idx param, u32 val)
> >>> +{
> >>> +     u32 hw_val = val * dptc_params[param].scale;
> >>> +
> >>> +     ids[offset]    = dptc_params[param].param_id;
> >>> +     vals[offset++] = hw_val;
> >>> +
> >>> +     if (dptc_params[param].param_id2) {
> >>> +             ids[offset]    = dptc_params[param].param_id2;
> >>> +             vals[offset++] = hw_val;
> >>> +     }
> >>> +
> >>> +     return offset;
> >>> +}
> >>> +
> >>> +static int dptc_alib_send_one(int idx, u32 val)
> >>> +{
> >>> +     u32 vals[2];
> >>> +     u8 ids[2];
> >>> +
> >>> +     return dptc_alib_call(ids, vals,
> >>> +                           dptc_alib_fill_param(ids, vals, 0, idx, val));
> >>> +}
> >>> +
> >>> +static int dptc_alib_save(struct dptc_priv *dptc)
> >>> +{
> >>> +     u32 vals[DPTC_NUM_PARAMS * 2];
> >>> +     u8 ids[DPTC_NUM_PARAMS * 2];
> >>> +     int count = 0;
> >>> +     int i;
> >>> +
> >>> +     for (i = 0; i < DPTC_NUM_PARAMS; i++) {
> >>> +             if (!dptc->staged[i])
> >>> +                     continue;
> >>> +             count = dptc_alib_fill_param(ids, vals, count, i,
> >>> +                                          dptc->staged[i]);
> >>> +     }
> >>> +
> >>> +     return dptc_alib_call(ids, vals, count);
> >>> +}
> >>> +
> >>> +/* Sysfs callbacks */
> >>> +
> >>> +static ssize_t dptc_current_value_show(struct kobject *kobj,
> >>> +                                    struct kobj_attribute *attr, char *buf)
> >>> +{
> >>> +     struct dptc_attr_sysfs *ps =
> >>> +             container_of(attr, struct dptc_attr_sysfs, current_value);
> >>> +     struct dptc_priv *dptc = ps->priv;
> >>> +
> >>> +     guard(mutex)(&dptc->lock);
> >>> +
> >>> +     if (!dptc->staged[ps->idx])
> >>> +             return sysfs_emit(buf, "\n");
> >>> +     return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
> >>> +}
> >>> +
> >>> +static ssize_t dptc_current_value_store(struct kobject *kobj,
> >>> +                                     struct kobj_attribute *attr,
> >>> +                                     const char *buf, size_t count)
> >>> +{
> >>> +     struct dptc_attr_sysfs *ps =
> >>> +             container_of(attr, struct dptc_attr_sysfs, current_value);
> >>> +     struct dptc_priv *dptc = ps->priv;
> >>> +     u32 val, min, max;
> >>> +     int ret;
> >>> +
> >>> +     guard(mutex)(&dptc->lock);
> >>> +
> >>> +     if (count == 1 && buf[0] == '\n') {
> >>> +             dptc->staged[ps->idx] = 0;
> >>> +             return count;
> >>> +     }
> >>> +
> >>> +     ret = kstrtou32(buf, 10, &val);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     min = dptc_get_min(dptc, ps->idx);
> >>> +     max = dptc_get_max(dptc, ps->idx);
> >>> +     if (val < min || (max && val > max))
> >>> +             return -EINVAL;
> >>> +     dptc->staged[ps->idx]    = val;
> >>> +     if (dptc->save_mode == SAVE_SINGLE)
> >>> +             ret = dptc_alib_send_one(ps->idx, val);
> >>> +
> >>> +     return ret ? ret : count;
> >>> +}
> >>> +
> >>> +static ssize_t dptc_default_value_show(struct kobject *kobj,
> >>> +                                    struct kobj_attribute *attr, char *buf)
> >>> +{
> >>> +     struct dptc_attr_sysfs *ps =
> >>> +             container_of(attr, struct dptc_attr_sysfs, default_value);
> >>> +
> >>> +     return sysfs_emit(buf, "%u\n", dptc_get_default(ps->priv, ps->idx));
> >>> +}
> >>> +
> >>> +static ssize_t dptc_min_value_show(struct kobject *kobj,
> >>> +                                struct kobj_attribute *attr, char *buf)
> >>> +{
> >>> +     struct dptc_attr_sysfs *ps =
> >>> +             container_of(attr, struct dptc_attr_sysfs, min_value);
> >>> +     struct dptc_priv *dptc = ps->priv;
> >>> +
> >>> +     guard(mutex)(&dptc->lock);
> >>> +
> >>> +     return sysfs_emit(buf, "%u\n", dptc_get_min(dptc, ps->idx));
> >>> +}
> >>> +
> >>> +static ssize_t dptc_max_value_show(struct kobject *kobj,
> >>> +                                struct kobj_attribute *attr, char *buf)
> >>> +{
> >>> +     struct dptc_attr_sysfs *ps =
> >>> +             container_of(attr, struct dptc_attr_sysfs, max_value);
> >>> +     struct dptc_priv *dptc = ps->priv;
> >>> +
> >>> +     guard(mutex)(&dptc->lock);
> >>> +
> >>> +     return sysfs_emit(buf, "%u\n", dptc_get_max(dptc, ps->idx));
> >>> +}
> >>> +
> >>> +static ssize_t dptc_scalar_increment_show(struct kobject *kobj,
> >>> +                                       struct kobj_attribute *attr, char *buf)
> >>> +{
> >>> +     return sysfs_emit(buf, "1\n");
> >>> +}
> >>> +
> >>> +static ssize_t dptc_display_name_show(struct kobject *kobj,
> >>> +                                   struct kobj_attribute *attr, char *buf)
> >>> +{
> >>> +     struct dptc_attr_sysfs *ps =
> >>> +             container_of(attr, struct dptc_attr_sysfs, display_name);
> >>> +     return sysfs_emit(buf, "%s\n", dptc_params[ps->idx].display_name);
> >>> +}
> >>> +
> >>> +static ssize_t dptc_type_show(struct kobject *kobj,
> >>> +                           struct kobj_attribute *attr, char *buf)
> >>> +{
> >>> +     return sysfs_emit(buf, "integer\n");
> >>> +}
> >>> +
> >>> +static ssize_t dptc_save_settings_show(struct kobject *kobj,
> >>> +                                    struct kobj_attribute *attr, char *buf)
> >>> +{
> >>> +     struct dptc_priv *dptc =
> >>> +             container_of(attr, struct dptc_priv, save_settings_attr);
> >>> +
> >>> +     guard(mutex)(&dptc->lock);
> >>> +
> >>> +     if (dptc->save_mode == SAVE_SINGLE)
> >>> +             return sysfs_emit(buf, "single\n");
> >>> +     return sysfs_emit(buf, "bulk\n");
> >>> +}
> >>> +
> >>> +static ssize_t dptc_save_settings_store(struct kobject *kobj,
> >>> +                                     struct kobj_attribute *attr,
> >>> +                                     const char *buf, size_t count)
> >>> +{
> >>> +     struct dptc_priv *dptc =
> >>> +             container_of(attr, struct dptc_priv, save_settings_attr);
> >>> +     int ret = 0;
> >>> +
> >>> +     guard(mutex)(&dptc->lock);
> >>> +
> >>> +     if (sysfs_streq(buf, "save"))
> >>> +             ret = dptc_alib_save(dptc);
> >>> +     else if (sysfs_streq(buf, "single"))
> >>> +             dptc->save_mode = SAVE_SINGLE;
> >>> +     else if (sysfs_streq(buf, "bulk"))
> >>> +             dptc->save_mode = SAVE_BULK;
> >>> +     else
> >>> +             return -EINVAL;
> >>> +
> >>> +     return ret ? ret : count;
> >>> +}
> >>> +
> >>> +static ssize_t dptc_expanded_current_value_show(struct kobject *kobj,
> >>> +                                             struct kobj_attribute *attr,
> >>> +                                             char *buf)
> >>> +{
> >>> +     struct dptc_attr_sysfs *ps =
> >>> +             container_of(attr, struct dptc_attr_sysfs, current_value);
> >>> +     struct dptc_priv *dptc = ps->priv;
> >>> +
> >>> +     guard(mutex)(&dptc->lock);
> >>> +
> >>> +     return sysfs_emit(buf, "%d\n", dptc->expanded);
> >>> +}
> >>> +
> >>> +static ssize_t dptc_expanded_current_value_store(struct kobject *kobj,
> >>> +                                              struct kobj_attribute *attr,
> >>> +                                              const char *buf, size_t count)
> >>> +{
> >>> +     struct dptc_attr_sysfs *ps =
> >>> +             container_of(attr, struct dptc_attr_sysfs, current_value);
> >>> +     struct dptc_priv *dptc = ps->priv;
> >>> +     bool val;
> >>> +     int ret;
> >>> +
> >>> +     ret = kstrtobool(buf, &val);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     guard(mutex)(&dptc->lock);
> >>> +
> >>> +     dptc->expanded = val;
> >>> +     /* Clear staged values: limits changed, old values may be out of range */
> >>> +     memset(dptc->staged, 0, sizeof(dptc->staged));
> >>> +
> >>> +     return count;
> >>> +}
> >>> +
> >>> +static ssize_t dptc_expanded_default_value_show(struct kobject *kobj,
> >>> +                                             struct kobj_attribute *attr,
> >>> +                                             char *buf)
> >>> +{
> >>> +     return sysfs_emit(buf, "0\n");
> >>> +}
> >>> +
> >>> +static ssize_t dptc_expanded_min_value_show(struct kobject *kobj,
> >>> +                                         struct kobj_attribute *attr,
> >>> +                                         char *buf)
> >>> +{
> >>> +     return sysfs_emit(buf, "0\n");
> >>> +}
> >>> +
> >>> +static ssize_t dptc_expanded_max_value_show(struct kobject *kobj,
> >>> +                                         struct kobj_attribute *attr,
> >>> +                                         char *buf)
> >>> +{
> >>> +     return sysfs_emit(buf, "1\n");
> >>> +}
> >>> +
> >>> +static ssize_t dptc_expanded_scalar_increment_show(struct kobject *kobj,
> >>> +                                                struct kobj_attribute *attr,
> >>> +                                                char *buf)
> >>> +{
> >>> +     return sysfs_emit(buf, "1\n");
> >>> +}
> >>> +
> >>> +static ssize_t dptc_expanded_display_name_show(struct kobject *kobj,
> >>> +                                            struct kobj_attribute *attr,
> >>> +                                            char *buf)
> >>> +{
> >>> +     return sysfs_emit(buf, "Expanded Limits\n");
> >>> +}
> >>> +
> >>> +static ssize_t dptc_expanded_type_show(struct kobject *kobj,
> >>> +                                    struct kobj_attribute *attr, char *buf)
> >>> +{
> >>> +     return sysfs_emit(buf, "integer\n");
> >>> +}
> >>> +
> >>> +/* Sysfs setup */
> >>> +
> >>> +static void dptc_setup_param_sysfs(struct dptc_priv *dptc,
> >>> +                                struct dptc_attr_sysfs *ps, int idx)
> >>> +{
> >>> +     ps->priv = dptc;
> >>> +     ps->idx = idx;
> >>> +
> >>> +     sysfs_attr_init(&ps->current_value.attr);
> >>> +     ps->current_value.attr.name  = "current_value";
> >>> +     ps->current_value.attr.mode  = 0644;
> >>> +     ps->current_value.show       = dptc_current_value_show;
> >>> +     ps->current_value.store      = dptc_current_value_store;
> >>> +
> >>> +     sysfs_attr_init(&ps->default_value.attr);
> >>> +     ps->default_value.attr.name  = "default_value";
> >>> +     ps->default_value.attr.mode  = 0444;
> >>> +     ps->default_value.show       = dptc_default_value_show;
> >>> +
> >>> +     sysfs_attr_init(&ps->min_value.attr);
> >>> +     ps->min_value.attr.name      = "min_value";
> >>> +     ps->min_value.attr.mode      = 0444;
> >>> +     ps->min_value.show           = dptc_min_value_show;
> >>> +
> >>> +     sysfs_attr_init(&ps->max_value.attr);
> >>> +     ps->max_value.attr.name      = "max_value";
> >>> +     ps->max_value.attr.mode      = 0444;
> >>> +     ps->max_value.show           = dptc_max_value_show;
> >>> +
> >>> +     sysfs_attr_init(&ps->scalar_increment.attr);
> >>> +     ps->scalar_increment.attr.name = "scalar_increment";
> >>> +     ps->scalar_increment.attr.mode = 0444;
> >>> +     ps->scalar_increment.show      = dptc_scalar_increment_show;
> >>> +
> >>> +     sysfs_attr_init(&ps->display_name.attr);
> >>> +     ps->display_name.attr.name   = "display_name";
> >>> +     ps->display_name.attr.mode   = 0444;
> >>> +     ps->display_name.show        = dptc_display_name_show;
> >>> +
> >>> +     sysfs_attr_init(&ps->type.attr);
> >>> +     ps->type.attr.name           = "type";
> >>> +     ps->type.attr.mode           = 0444;
> >>> +     ps->type.show                = dptc_type_show;
> >>> +
> >>> +     ps->attrs[0] = &ps->current_value.attr;
> >>> +     ps->attrs[1] = &ps->default_value.attr;
> >>> +     ps->attrs[2] = &ps->min_value.attr;
> >>> +     ps->attrs[3] = &ps->max_value.attr;
> >>> +     ps->attrs[4] = &ps->scalar_increment.attr;
> >>> +     ps->attrs[5] = &ps->display_name.attr;
> >>> +     ps->attrs[6] = &ps->type.attr;
> >>> +     ps->attrs[7] = NULL;
> >>> +
> >>> +     ps->group.name  = dptc_params[idx].name;
> >>> +     ps->group.attrs = ps->attrs;
> >>> +}
> >>> +
> >>> +static void dptc_setup_expanded_sysfs(struct dptc_priv *dptc,
> >>> +                                   struct dptc_attr_sysfs *ps)
> >>> +{
> >>> +     ps->priv = dptc;
> >>> +     sysfs_attr_init(&ps->current_value.attr);
> >>> +     ps->current_value.attr.name  = "current_value";
> >>> +     ps->current_value.attr.mode  = 0644;
> >>> +     ps->current_value.show       = dptc_expanded_current_value_show;
> >>> +     ps->current_value.store      = dptc_expanded_current_value_store;
> >>> +
> >>> +     sysfs_attr_init(&ps->default_value.attr);
> >>> +     ps->default_value.attr.name  = "default_value";
> >>> +     ps->default_value.attr.mode  = 0444;
> >>> +     ps->default_value.show       = dptc_expanded_default_value_show;
> >>> +
> >>> +     sysfs_attr_init(&ps->min_value.attr);
> >>> +     ps->min_value.attr.name      = "min_value";
> >>> +     ps->min_value.attr.mode      = 0444;
> >>> +     ps->min_value.show           = dptc_expanded_min_value_show;
> >>> +
> >>> +     sysfs_attr_init(&ps->max_value.attr);
> >>> +     ps->max_value.attr.name      = "max_value";
> >>> +     ps->max_value.attr.mode      = 0444;
> >>> +     ps->max_value.show           = dptc_expanded_max_value_show;
> >>> +
> >>> +     sysfs_attr_init(&ps->scalar_increment.attr);
> >>> +     ps->scalar_increment.attr.name = "scalar_increment";
> >>> +     ps->scalar_increment.attr.mode = 0444;
> >>> +     ps->scalar_increment.show      = dptc_expanded_scalar_increment_show;
> >>> +
> >>> +     sysfs_attr_init(&ps->display_name.attr);
> >>> +     ps->display_name.attr.name   = "display_name";
> >>> +     ps->display_name.attr.mode   = 0444;
> >>> +     ps->display_name.show        = dptc_expanded_display_name_show;
> >>> +
> >>> +     sysfs_attr_init(&ps->type.attr);
> >>> +     ps->type.attr.name           = "type";
> >>> +     ps->type.attr.mode           = 0444;
> >>> +     ps->type.show                = dptc_expanded_type_show;
> >>> +
> >>> +     ps->attrs[0] = &ps->current_value.attr;
> >>> +     ps->attrs[1] = &ps->default_value.attr;
> >>> +     ps->attrs[2] = &ps->min_value.attr;
> >>> +     ps->attrs[3] = &ps->max_value.attr;
> >>> +     ps->attrs[4] = &ps->scalar_increment.attr;
> >>> +     ps->attrs[5] = &ps->display_name.attr;
> >>> +     ps->attrs[6] = &ps->type.attr;
> >>> +     ps->attrs[7] = NULL;
> >>> +
> >>> +     ps->group.name  = "expanded_limits";
> >>> +     ps->group.attrs = ps->attrs;
> >>> +}
> >>> +
> >>> +static void dptc_fw_dev_unregister(void *data)
> >>> +{
> >>> +     device_unregister(data);
> >>> +}
> >>> +
> >>> +static void dptc_kset_unregister(void *data)
> >>> +{
> >>> +     kset_unregister(data);
> >>> +}
> >>> +
> >>> +static int dptc_resume(struct device *dev)
> >>> +{
> >>> +     struct dptc_priv *dptc = dev_get_drvdata(dev);
> >>> +     int ret;
> >>> +
> >>> +     guard(mutex)(&dptc->lock);
> >>> +
> >>> +     /* In bulk mode, do not use pm ops for userspace flexibility. */
> >>> +     if (dptc->save_mode == SAVE_SINGLE)
> >>> +             ret = dptc_alib_save(dptc);
> >>> +     else
> >>> +             ret = 0;
> >>> +
> >>> +     if (ret && ret != -ENOENT)
> >>> +             dev_warn(dev, "failed to restore settings on resume: %d\n", ret);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static DEFINE_SIMPLE_DEV_PM_OPS(dptc_pm_ops, NULL, dptc_resume);
> >>> +
> >>> +static int dptc_probe(struct platform_device *pdev)
> >>> +{
> >>> +     const struct dmi_system_id *dmi_match = dev_get_platdata(&pdev->dev);
> >>> +     struct device *dev = &pdev->dev;
> >>> +     struct dptc_priv *dptc;
> >>> +     int i, ret;
> >>> +
> >>> +     dptc = devm_kzalloc(dev, sizeof(*dptc), GFP_KERNEL);
> >>> +     if (!dptc)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     platform_set_drvdata(pdev, dptc);
> >>> +
> >>> +     ret = devm_mutex_init(dev, &dptc->lock);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     dptc->dev_limits = dmi_match->driver_data;
> >>> +     dev_info(dev, "%s (%s)\n", dmi_match->ident,
> >>> +              boot_cpu_data.x86_model_id);
> >>> +
> >>> +     dptc->fw_attr_dev = device_create(&firmware_attributes_class,
> >>> +                                       NULL, MKDEV(0, 0), NULL, DRIVER_NAME);
> >>> +     if (IS_ERR(dptc->fw_attr_dev))
> >>> +             return PTR_ERR(dptc->fw_attr_dev);
> >>> +
> >>> +     ret = devm_add_action_or_reset(dev, dptc_fw_dev_unregister,
> >>> +                                    dptc->fw_attr_dev);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     dptc->fw_attr_kset = kset_create_and_add("attributes", NULL,
> >>> +                                              &dptc->fw_attr_dev->kobj);
> >>> +     if (!dptc->fw_attr_kset)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     ret = devm_add_action_or_reset(dev, dptc_kset_unregister,
> >>> +                                    dptc->fw_attr_kset);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     for (i = 0; i < DPTC_NUM_PARAMS; i++) {
> >>> +             dptc_setup_param_sysfs(dptc, &dptc->params[i], i);
> >>> +             ret = sysfs_create_group(&dptc->fw_attr_kset->kobj,
> >>> +                                      &dptc->params[i].group);
> >>> +             if (ret)
> >>> +                     return ret;
> >>> +     }
> >>> +
> >>> +     dptc_setup_expanded_sysfs(dptc, &dptc->expanded_attr);
> >>> +     ret = sysfs_create_group(&dptc->fw_attr_kset->kobj,
> >>> +                              &dptc->expanded_attr.group);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     sysfs_attr_init(&dptc->save_settings_attr.attr);
> >>> +     dptc->save_settings_attr.attr.name  = "save_settings";
> >>> +     dptc->save_settings_attr.attr.mode  = 0644;
> >>> +     dptc->save_settings_attr.show       = dptc_save_settings_show;
> >>> +     dptc->save_settings_attr.store      = dptc_save_settings_store;
> >>> +     ret = sysfs_create_file(&dptc->fw_attr_kset->kobj,
> >>> +                             &dptc->save_settings_attr.attr);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static struct platform_driver dptc_driver = {
> >>> +     .driver = {
> >>> +             .name = DRIVER_NAME,
> >>> +             .pm   = pm_sleep_ptr(&dptc_pm_ops),
> >>> +     },
> >>> +     .probe  = dptc_probe,
> >>> +};
> >>> +
> >>> +static int __init dptc_init(void)
> >>> +{
> >>> +     const struct dmi_system_id *match;
> >>> +     bool soc_found = false;
> >>> +     int i, ret;
> >>> +
> >>> +     match = dmi_first_match(dptc_dmi_table);
> >>> +     if (!match)
> >>> +             return -ENODEV;
> >>> +
> >>> +     if (!acpi_has_method(NULL, ALIB_PATH)) {
> >>> +             pr_warn("ALIB method not present\n");
> >>> +             return -ENODEV;
> >>> +     }
> >>> +
> >>> +     for (i = 0; dptc_soc_table[i]; i++) {
> >>> +             if (strstr(boot_cpu_data.x86_model_id,
> >>> +                        dptc_soc_table[i])) {
> >>> +                     soc_found = true;
> >>> +                     break;
> >>> +             }
> >>> +     }
> >>> +     if (!soc_found) {
> >>> +             pr_warn("unrecognized SoC '%s'\n",
> >>> +                     boot_cpu_data.x86_model_id);
> >>> +             return -ENODEV;
> >>> +     }
> >>> +
> >>> +     dptc_pdev = platform_device_register_data(NULL, DRIVER_NAME, -1,
> >>> +                                               match, sizeof(*match));
> >>> +     if (IS_ERR(dptc_pdev))
> >>> +             return PTR_ERR(dptc_pdev);
> >>> +
> >>> +     ret = platform_driver_register(&dptc_driver);
> >>> +     if (ret) {
> >>> +             platform_device_unregister(dptc_pdev);
> >>> +             return ret;
> >>> +     }
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static void __exit dptc_exit(void)
> >>> +{
> >>> +     platform_driver_unregister(&dptc_driver);
> >>> +     platform_device_unregister(dptc_pdev);
> >>> +}
> >>> +
> >>> +module_init(dptc_init);
> >>> +module_exit(dptc_exit);
> >>> +
> >>> +MODULE_AUTHOR("Antheas Kapenekakis <lkml@antheas.dev>");
> >>> +MODULE_DESCRIPTION("AMD DPTCi ACPI Driver");
> >>> +MODULE_LICENSE("GPL");
> >>
> >>
> >
>
>

