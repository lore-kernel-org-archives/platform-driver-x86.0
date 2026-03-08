Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8BE32C317;
	Sun,  8 Mar 2026 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000377; cv=pass; b=ZQ/ETGM0iC8FioDQdyAWBS2c1umckUHtBHnaRIQe8MQhJwfULTJR6cjj1xw1pYREoNlvcg4w2XK+8X6REf0xM/GvvmGkPop8Y/wu7gbsDwZ+hwNzj9vWTysU3hhqERTYeJz9SxT0KvTd2h5Q0WJThFkJGCfvAPzZOAu7yq0/sL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000377; c=relaxed/simple;
	bh=eaudM6vKIoBdH4yDklqM0myD+/Ed35PZ/MA5/yjGs04=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DpSLgN/rPAsNDxu3NeQniLlATX+SoI8yWGyCNRr5wsdH4aOyeNsCrwr63I3WmEWWKKNL6v8YupdhFdOLXQUsQ+p6aY3aT31PCz/vtaZP+nuKy3sJ0Tx25SGP5rRiUWlT7A1t/pIthN17fA3eJ/VboK7Qtns2ayXf9FWKpw+UZR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=OVGGkwmL; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="OVGGkwmL"
ARC-Seal: i=1; a=rsa-sha256; t=1773000355; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CQr8o+Ojhx5F6nRS3N3z6JBcBGno8eBs5nNhxyvFCokM9rT87t29JJZ1gYfhV3ANTTxzmnIANGjnYw2cH5GOyeyHa5tvgHHzjyclGtFiJadA+YzCf/mT+bSuMGKWnTlwR1/wR3bU10jolsYnuuQSXSe+mO+Yv+iaHsRHW0pYj74=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773000355; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4ORnPtSwIEnURERwElFAoVx1B8FekI+QfED2Nj/fxPQ=; 
	b=T6nv7z2qoR75MRK8yensBiQV9AHlnV7YXrou7D6CMNIckHMN0Qf4dieYw0UD+9kOQc3MChr7Ll2vOkBvbNI+ZlZ79f+xU0xsTiOKd7MFmz2jaRHcMk81FYE0Z6OnOI+3vTipknPoY+hrUuKmLK+WiXymikVoqt6rOqMC80pmuVo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773000355;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=4ORnPtSwIEnURERwElFAoVx1B8FekI+QfED2Nj/fxPQ=;
	b=OVGGkwmLu3tfWZBpRKNEY/tR8g3nKQdrNRzkPBKmKNAqcIEaNXljS0e8DBM443g2
	Q/BibztdIOffa4eBJy4Qf1jbTRpFOG50SI7CB5KPVwnIM5hTf2rnPuZe/2DF+FQeMg2
	ZBH49WoFVm7gFaCb5LV8uWKGEigQrMvySFKMUCsvzLtCVlHRV7G6BhhheXMD+wVGmpa
	MfojChdCXRHzsp6iIgV5QsgUCAK2kMpMCWrCsXOahTU2/o+vSgGXpbV1IVdclZTyv0v
	L+OX2L5gik0MrkuhbRcQluGbu5P5ny3XE0DCz+aLmnSHf/AKOI8yo7oDgRH9D6P1BD7
	nxDheKbHFw==
Received: by mx.zohomail.com with SMTPS id 1773000352016666.5927930198804;
	Sun, 8 Mar 2026 13:05:52 -0700 (PDT)
Message-ID: <ecef0159e5f2b973c818f5cce1a4a8daf750da22.camel@rong.moe>
Subject: Re: [RFC v3 2/4] platform/x86/amd: dptc: Add AMD DPTCi driver
From: Rong Zhang <i@rong.moe>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Mario.Limonciello@amd.com, W_Armin@gmx.de, sashal@kernel.org, 
	Shyam-Sundar.S-k@amd.com, derekjohn.clark@gmail.com,
 denis.benato@linux.dev, 	linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
In-Reply-To: <CAGwozwHUU5n3jcR9mhP4rr-PxNdckfS0RNPuU_u1QRKwYPaqtA@mail.gmail.com>
References: <20260307115516.26892-1-lkml@antheas.dev>
	 <20260307115516.26892-3-lkml@antheas.dev>
	 <40d0a4a2946a675a1836a576119d27d3113f2f8c.camel@rong.moe>
	 <CAGwozwFndbDhZFWy97b-Fpr3SZpENL2nm5sPdcM-uXbqYaKsAA@mail.gmail.com>
	 <CAGwozwHUU5n3jcR9mhP4rr-PxNdckfS0RNPuU_u1QRKwYPaqtA@mail.gmail.com>
Content-Type: multipart/mixed; boundary="=-eOj3mdMJULzj1aIBNUB9"
Date: Mon, 09 Mar 2026 04:00:46 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/272.979.15
X-ZohoMailClient: External

--=-eOj3mdMJULzj1aIBNUB9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antheas,

On Sun, 2026-03-08 at 00:08 +0100, Antheas Kapenekakis wrote:
> On Sun, 8 Mar 2026 at 00:02, Antheas Kapenekakis <lkml@antheas.dev> wrote=
:
> >=20
> > On Sat, 7 Mar 2026 at 22:56, Rong Zhang <i@rong.moe> wrote:
> > >=20
> > > Hi Antheas,
> > >=20
> > > Thanks for working on it.
> > >=20
> > > I think this driver is useful for me and I will see if I can test it =
on
> > > my devices once I find some time. They're not handhelds but I am sure
> > > at least one of them has the ALIB method. It'd better if a module
> > > option can be used to bypass the quirk table so that testing against =
a
> > > new device will be easier. Such an option should taint the kernel ofc=
.
> >=20
> > I will defer to Mario for this one. Previous iterations of this series
> > had an override. Before I posted V2 I had a module param that allowed
> > matching by ident.

Sure. That's not really a problem for me as I can easily patch and
compile it myself. However, it makes a lot of sense if we want user's
test results on new devices. Here's my two cents on such a module
option :-P

>=20
> Hi, 2 small follow-ups. Entries to this driver will only be added for
> devices without EC/amd_pmf handling. Because those interfere. So it
> does not apply to lenovo devices AFAIK.

Yeah I knew that. I have a non-Lenovo device with ALIB and no EC/PMF.

>=20
> > > That being said, I have some review comments. Please see below and my
> > > following replies.
> > >=20
> > > On Sat, 2026-03-07 at 12:55 +0100, Antheas Kapenekakis wrote:
> > > > Add a driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power an=
d
> > > > Thermal Configuration interface (DPTCi). This exposes TDP and therm=
al
> > > > parameters for AMD APU-based handheld devices via the
> > > > firmware-attributes sysfs ABI.
> > > >=20
> > > > Parameters are staged and atomically committed through ALIB. The dr=
iver
> > > > supports two save modes: "single" (apply immediately on write) and
> > > > "bulk" (stage values, then commit with "save"). An "expanded_limits=
"
> > > > toggle widens the allowed parameter ranges beyond device defaults.
> > > >=20
> > > > Initial device support: GPD Win 5 (AMD Ryzen AI MAX).
> > > >=20
> > > > Assisted-by: Claude:claude-opus-4-6
> > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > ---
> > > >  MAINTAINERS                       |   6 +
> > > >  drivers/platform/x86/amd/Kconfig  |  14 +
> > > >  drivers/platform/x86/amd/Makefile |   2 +
> > > >  drivers/platform/x86/amd/dptc.c   | 747 ++++++++++++++++++++++++++=
++++
> > > >  4 files changed, 769 insertions(+)
> > > >  create mode 100644 drivers/platform/x86/amd/dptc.c
> > > >=20
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index e08767323763..915293594641 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -1096,6 +1096,12 @@ S:     Supported
> > > >  F:   drivers/gpu/drm/amd/display/dc/dml/
> > > >  F:   drivers/gpu/drm/amd/display/dc/dml2_0/
> > > >=20
> > > > +AMD DPTC DRIVER
> > > > +M:   Antheas Kapenekakis <lkml@antheas.dev>
> > > > +L:   platform-driver-x86@vger.kernel.org
> > > > +S:   Maintained
> > > > +F:   drivers/platform/x86/amd/dptc.c
> > > > +
> > > >  AMD FAM15H PROCESSOR POWER MONITORING DRIVER
> > > >  M:   Huang Rui <ray.huang@amd.com>
> > > >  L:   linux-hwmon@vger.kernel.org
> > > > diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x8=
6/amd/Kconfig
> > > > index b813f9265368..d610092467fc 100644
> > > > --- a/drivers/platform/x86/amd/Kconfig
> > > > +++ b/drivers/platform/x86/amd/Kconfig
> > > > @@ -44,3 +44,17 @@ config AMD_ISP_PLATFORM
> > > >=20
> > > >         This driver can also be built as a module. If so, the modul=
e
> > > >         will be called amd_isp4.
> > > > +
> > > > +config AMD_DPTC
> > > > +     tristate "AMD Dynamic Power and Thermal Configuration Interfa=
ce (DPTCi)"
> > > > +     depends on X86_64 && ACPI && DMI
> > > > +     select FIRMWARE_ATTRIBUTES_CLASS
> > > > +     help
> > > > +       Driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power =
and
> > > > +       Thermal Configuration Interface (DPTCi). Exposes TDP and th=
ermal
> > > > +       parameters for AMD APU-based handheld devices via the
> > > > +       firmware-attributes sysfs ABI, allowing userspace tools to =
stage
> > > > +       and atomically commit power limit settings. Requires a DMI =
match
> > > > +       for the device and a recognized AMD SoC.
> > > > +
> > > > +       If built as a module, the module will be called amd_dptc.
> > > > diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x=
86/amd/Makefile
> > > > index f6ff0c837f34..862a609bfe38 100644
> > > > --- a/drivers/platform/x86/amd/Makefile
> > > > +++ b/drivers/platform/x86/amd/Makefile
> > > > @@ -12,3 +12,5 @@ obj-$(CONFIG_AMD_PMF)               +=3D pmf/
> > > >  obj-$(CONFIG_AMD_WBRF)               +=3D wbrf.o
> > > >  obj-$(CONFIG_AMD_ISP_PLATFORM)       +=3D amd_isp4.o
> > > >  obj-$(CONFIG_AMD_HFI)                +=3D hfi/
> > > > +obj-$(CONFIG_AMD_DPTC)               +=3D amd_dptc.o
> > > > +amd_dptc-y                   :=3D dptc.o
> > > > diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86=
/amd/dptc.c
> > > > new file mode 100644
> > > > index 000000000000..acfe9cc01bab
> > > > --- /dev/null
> > > > +++ b/drivers/platform/x86/amd/dptc.c
> > > > @@ -0,0 +1,747 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * AMD Dynamic Power and Thermal Configuration Interface (DPTCi) d=
river
> > > > + *
> > > > + * Exposes AMD APU power and thermal parameters via the firmware-a=
ttributes
> > > > + * sysfs ABI. Parameters are staged and atomically committed throu=
gh the
> > > > + * AGESA ALIB Function 0x0C (Dynamic Power and Thermal Configurati=
on
> > > > + * interface).
> > > > + *
> > > > + * Reference: AMD AGESA Publication #44065, Appendix E.5
> > > > + *            https://docs.amd.com/v/u/en-US/44065_Arch2008
> > > > + *
> > > > + * Copyright (C) 2026 Antheas Kapenekakis <lkml@antheas.dev>
> > > > + */
> > > > +
> > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > > +
> > > > +#include <linux/acpi.h>
> > > > +#include <linux/cleanup.h>
> > > > +#include <linux/dmi.h>
> > > > +#include <linux/init.h>
> > > > +#include <linux/kobject.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/mutex.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/processor.h>
> > > > +#include <linux/sysfs.h>
> > > > +#include <linux/unaligned.h>
> > > > +
> > > > +#include "../firmware_attributes_class.h"
> > > > +
> > > > +#define DRIVER_NAME          "amd-dptc"
> > > > +
> > > > +#define ALIB_FUNC_DPTC               0x0C
> > > > +#define ALIB_PATH            "\\_SB.ALIB"
> > > > +
> > > > +#define ALIB_ID_TEMP_TARGET  0x03
> > > > +#define ALIB_ID_STAPM_LIMIT  0x05
> > > > +#define ALIB_ID_FAST_LIMIT   0x06
> > > > +#define ALIB_ID_SLOW_LIMIT   0x07
> > > > +#define ALIB_ID_SKIN_LIMIT   0x2E
> > > > +
> > > > +enum dptc_param_idx {
> > > > +     DPTC_PPT_PL1_SPL,       /* STAPM + skin limit (set together) =
*/
> > > > +     DPTC_PPT_PL2_SPPT,      /* slow PPT limit */
> > > > +     DPTC_PPT_PL3_FPPT,      /* fast PPT limit */
> > > > +     DPTC_CPU_TEMP,          /* thermal control target */
> > > > +     DPTC_NUM_PARAMS,
> > > > +};
> > > > +
> > > > +struct dptc_param_limits {
> > > > +     u32 expanded_min;
> > > > +     u32 device_min;
> > > > +     u32 def;
> > > > +     u32 device_max;
> > > > +     u32 expanded_max;
> > > > +};
> > > > +
> > > > +struct dptc_device_limits {
> > > > +     struct dptc_param_limits params[DPTC_NUM_PARAMS];
> > > > +};
> > > > +
> > > > +struct dptc_param_desc {
> > > > +     const char *name;
> > > > +     const char *display_name;
> > > > +     u16 scale;      /* sysfs-to-ALIB multiplier (e.g. 1000 for W-=
>mW) */
> > > > +     u8 param_id;
> > > > +     u8 param_id2;   /* secondary ALIB ID, 0 if none */
> > > > +};
> > > > +
> > > > +static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] =
=3D {
> > > > +     [DPTC_PPT_PL1_SPL]  =3D { "ppt_pl1_spl",  "Sustained power li=
mit (W)",
> > > > +             1000, ALIB_ID_STAPM_LIMIT, ALIB_ID_SKIN_LIMIT },
> > > > +     [DPTC_PPT_PL2_SPPT] =3D { "ppt_pl2_sppt", "Slow PPT limit (W)=
",
> > > > +             1000, ALIB_ID_SLOW_LIMIT },
> > > > +     [DPTC_PPT_PL3_FPPT] =3D { "ppt_pl3_fppt", "Fast PPT limit (W)=
",
> > > > +             1000, ALIB_ID_FAST_LIMIT },
> > > > +     [DPTC_CPU_TEMP]     =3D { "cpu_temp",     "Thermal control li=
mit (C)",
> > > > +                1, ALIB_ID_TEMP_TARGET },
> > > > +};
> > >=20
> > > The indent here just made me crazy :-/
> > >=20
> > > Align the contents after line breaks to the left braces.
> >=20
> > I will review how to do the alignment, although I'm not happy with how
> > aligning to spaces will look. PL1 will overflow.

No, it won't. Having four tabs before `1000' gives you a line length of
80 characters (editors will tell that you are at column 81). And
nowadays the maximum line length allowed is 100 (that's why Derek
suggested you should avoid some unnecessary wraps).

> >=20
> > > > +
> > > > +/* AI MAX Handheld class: GPD Win 5 */
> > > > +static const struct dptc_device_limits limits_maxhh =3D { .params =
=3D {
> > >=20
> > > Please don't save a line by zipping braces like this. It's hard to re=
ad
> > > and likely to be missed when glancing the code (that's what happened =
to
> > > me and it really confused me).
> > >=20
> > > I found you did the same in [PATCH v3 3/4] for `.profiles'. That shou=
ld
> > > be avoided too.
> >=20
> > This is a leftover from before adding profiles. I guess it does not
> > make much sense now. I can reflow.
> >=20
> > > > +     [DPTC_PPT_PL1_SPL]  =3D {  0,  4, 25,  80, 100 },
> > > > +     [DPTC_PPT_PL2_SPPT] =3D {  0,  4, 27,  82, 100 },
> > > > +     [DPTC_PPT_PL3_FPPT] =3D {  0,  4, 40,  85, 100 },
> > > > +     [DPTC_CPU_TEMP]     =3D { 60, 70, 95,  95, 100 },
> > > > +}};
> > > > +
> > > > +/* Substring matches against boot_cpu_data.x86_model_id; order mat=
ters. */
> > > > +static const char * const dptc_soc_table[] =3D {
> > > > +     /* AI MAX */
> > > > +     "AMD RYZEN AI MAX+ 395",
> > > > +     "AMD RYZEN AI MAX+ 385",
> > > > +     "AMD RYZEN AI MAX 380",
> > > > +     NULL,
> > > > +};
> > > > +
> > > > +static const struct dmi_system_id dptc_dmi_table[] =3D {
> > > > +     /* GPD */
> > > > +     {
> > > > +             .ident =3D "GPD Win 5",
> > > > +             .matches =3D {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1618-05"),
> > > > +             },
> > > > +             .driver_data =3D (void *)&limits_maxhh,
> > > > +     },
> > > > +     { }
> > > > +};
> > > > +MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
> > > > +
> > > > +struct dptc_priv;
> > > > +
> > > > +struct dptc_attr_sysfs {
> > > > +     struct dptc_priv *priv;
> > > > +     struct kobj_attribute current_value;
> > > > +     struct kobj_attribute default_value;
> > > > +     struct kobj_attribute min_value;
> > > > +     struct kobj_attribute max_value;
> > > > +     struct kobj_attribute scalar_increment;
> > > > +     struct kobj_attribute display_name;
> > > > +     struct kobj_attribute type;
> > > > +     struct attribute *attrs[8];
> > > > +     struct attribute_group group;
> > > > +     int idx;
> > > > +};
> > > > +
> > > > +struct dptc_priv {
> > > > +     struct device *fw_attr_dev;
> > > > +     struct kset *fw_attr_kset;
> > > > +
> > > > +     const struct dptc_device_limits *dev_limits;
> > > > +
> > > > +     bool expanded;
> > > > +
> > > > +     enum dptc_save_mode { SAVE_SINGLE, SAVE_BULK } save_mode;
> > >=20
> > > Defining the enumeration separately will improve readability.
> > >=20
> > > > +
> > > > +     u32 staged[DPTC_NUM_PARAMS];
> > > > +     bool has_staged[DPTC_NUM_PARAMS];
> > > > +
> > > > +     /* Protects mutable driver state */
> > >=20
> > > The comment is nonsense. To make it helpful, it should be "Protects
> > > members above/below" with properly arranged structure layout.
> > >=20
> > > > +     struct mutex lock;
> > > > +
> > > > +     struct dptc_attr_sysfs params[DPTC_NUM_PARAMS];
> > > > +     struct dptc_attr_sysfs expanded_attr;
> > > > +     struct kobj_attribute save_settings_attr;
> > > > +};
> > > > +
> > > > +static struct platform_device *dptc_pdev;
> > > > +
> > > > +static u32 dptc_get_min(struct dptc_priv *dptc, int idx)
> > > > +{
> > > > +     return dptc->expanded ? dptc->dev_limits->params[idx].expande=
d_min
> > > > +                           : dptc->dev_limits->params[idx].device_=
min;
> > > > +}
> > > > +
> > > > +static u32 dptc_get_max(struct dptc_priv *dptc, int idx)
> > > > +{
> > > > +     return dptc->expanded ? dptc->dev_limits->params[idx].expande=
d_max
> > > > +                           : dptc->dev_limits->params[idx].device_=
max;
> > > > +}
> > > > +
> > > > +static u32 dptc_get_default(struct dptc_priv *dptc, int idx)
> > > > +{
> > > > +     return dptc->dev_limits->params[idx].def;
> > > > +}
> > > > +
> > > > +static int dptc_alib_call(const u8 *ids, const u32 *vals, int coun=
t)
> > > > +{
> > > > +     union acpi_object in_params[2];
> > > > +     struct acpi_object_list input;
> > > > +     acpi_status status;
> > > > +     u32 buf_size;
> > > > +     int i, off;
> > > > +     u8 *buf;
> > > > +
> > > > +     if (count =3D=3D 0)
> > > > +             return -EINVAL;
> > >=20
> > > Return -ENOENT as think-lmi does (see its save_settings_store()) and
> > > update the documentation accordingly.
> > >=20
> > > > +
> > > > +     /* Buffer layout: WORD total_size + count * (BYTE id + DWORD =
value) */
> > > > +     buf_size =3D 2 + count * 5;
> > > > +     buf =3D kzalloc(buf_size, GFP_KERNEL);
> > > > +     if (!buf)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     put_unaligned_le16(buf_size, buf);
> > > > +
> > > > +     for (i =3D 0; i < count; i++) {
> > > > +             off  =3D 2 + i * 5;
> > > > +             buf[off] =3D ids[i];
> > > > +             put_unaligned_le32(vals[i], buf + off + 1);
> > >=20
> > > put_unaligned_le32(vals[i], &buf[off + 1]);
> > >=20
> > > > +     }
> > > > +
> > > > +     in_params[0].type          =3D ACPI_TYPE_INTEGER;
> > > > +     in_params[0].integer.value =3D ALIB_FUNC_DPTC;
> > > > +     in_params[1].type          =3D ACPI_TYPE_BUFFER;
> > > > +     in_params[1].buffer.length  =3D buf_size;
> > > > +     in_params[1].buffer.pointer =3D buf;
> > >=20
> > > Misaligned `=3D'.
> > >=20
> > > > +
> > > > +     input.count   =3D 2;
> > > > +     input.pointer =3D in_params;
> > > > +
> > > > +     status =3D acpi_evaluate_object(NULL, ALIB_PATH, &input, NULL=
);
> > > > +     kfree(buf);
> > > > +
> > > > +     if (ACPI_FAILURE(status)) {
> > > > +             pr_err("ALIB call failed: %s\n",
> > > > +                    acpi_format_exception(status));
> > > > +             return -EIO;
> > > > +     }
> > > > +
> > > > +     pr_debug("sent %d ALIB parameter(s)\n", count);
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int dptc_alib_send_one(int idx, u32 val)
> > > > +{
> > > > +     u32 hw_val =3D val * dptc_params[idx].scale;
> > > > +     u32 vals[2];
> > > > +     u8 ids[2];
> > > > +     int count =3D 0;
> > > > +
> > > > +     ids[count]  =3D dptc_params[idx].param_id;
> > > > +     vals[count] =3D hw_val;
> > > > +     count++;
> > > > +     if (dptc_params[idx].param_id2) {
> > > > +             ids[count]  =3D dptc_params[idx].param_id2;
> > > > +             vals[count] =3D hw_val;
> > > > +             count++;
> > > > +     }
> > > > +
> > > > +     return dptc_alib_call(ids, vals, count);
> > > > +}
> > > > +
> > > > +static int dptc_alib_save(struct dptc_priv *dptc)
> > > > +{
> > > > +     u32 vals[DPTC_NUM_PARAMS * 2];
> > > > +     u8 ids[DPTC_NUM_PARAMS * 2];
> > > > +     int i, count =3D 0;
> > > > +     u32 hw_val;
> > > > +
> > > > +     for (i =3D 0; i < DPTC_NUM_PARAMS; i++) {
> > > > +             if (!dptc->has_staged[i])
> > > > +                     continue;
> > > > +
> > > > +             hw_val =3D dptc->staged[i] * dptc_params[i].scale;
> > > > +             ids[count]  =3D dptc_params[i].param_id;
> > > > +             vals[count] =3D hw_val;
> > > > +             count++;
> > > > +             if (dptc_params[i].param_id2) {
> > > > +                     ids[count]  =3D dptc_params[i].param_id2;
> > > > +                     vals[count] =3D hw_val;
> > > > +                     count++;
> > > > +             }
> > >=20
> > > I could imagine a helper function to prevent replicating the same cod=
e
> > > patterns twice:
> > >=20
> > > static size_t dptc_alib_fill_param(u8 *ids, u32 *vals, size_t offset,
> > >                                    enum dptc_param_idx param, u32 val=
)
> > > {
> > >         u32 hw_val =3D val * dptc_params[param].scale;
> > >=20
> > >         ids[offset]    =3D dptc_params[param].param_id;
> > >         vals[offset++] =3D hw_val;
> > >=20
> > >         if (dptc_params[param].param_id2) {
> > >                 ids[offset]    =3D dptc_params[param].param_id2;
> > >                 vals[offset++] =3D hw_val;
> > >         }
> > >=20
> > >         return offset;
> > > }
> > >=20
> > > > +     }
> > > > +
> > > > +     return dptc_alib_call(ids, vals, count);
> > > > +}
> > > > +
> > > > +/* Sysfs callbacks */
> > > > +
> > > > +static ssize_t dptc_current_value_show(struct kobject *kobj,
> > > > +                                    struct kobj_attribute *attr, c=
har *buf)
> > > > +{
> > > > +     struct dptc_attr_sysfs *ps =3D
> > > > +             container_of(attr, struct dptc_attr_sysfs, current_va=
lue);
> > > > +     struct dptc_priv *dptc =3D ps->priv;
> > > > +
> > > > +     guard(mutex)(&dptc->lock);
> > > > +
> > > > +     if (!dptc->has_staged[ps->idx])
> > > > +             return sysfs_emit(buf, "\n");
> > > > +     return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
> > > > +}
> > > > +
> > > > +static ssize_t dptc_current_value_store(struct kobject *kobj,
> > > > +                                     struct kobj_attribute *attr,
> > > > +                                     const char *buf, size_t count=
)
> > > > +{
> > > > +     struct dptc_attr_sysfs *ps =3D
> > > > +             container_of(attr, struct dptc_attr_sysfs, current_va=
lue);
> > > > +     struct dptc_priv *dptc =3D ps->priv;
> > > > +     u32 val, min, max;
> > > > +     int ret;
> > > > +
> > > > +     if (count =3D=3D 1 && buf[0] =3D=3D '\n') {
> > > > +             guard(mutex)(&dptc->lock);
> > > > +
> > > > +             dptc->has_staged[ps->idx] =3D false;
> > > > +             return count;
> > > > +     }
> > > > +
> > > > +     ret =3D kstrtou32(buf, 10, &val);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     guard(mutex)(&dptc->lock);
> > > > +
> > > > +     min =3D dptc_get_min(dptc, ps->idx);
> > > > +     max =3D dptc_get_max(dptc, ps->idx);
> > > > +     if (val < min || (max && val > max))
> > > > +             return -EINVAL;
> > > > +     dptc->staged[ps->idx]    =3D val;
> > > > +     dptc->has_staged[ps->idx] =3D true;
> > > > +     if (dptc->save_mode =3D=3D SAVE_SINGLE)
> > > > +             ret =3D dptc_alib_send_one(ps->idx, val);
> > > > +
> > > > +     return ret ? ret : count;
> > > > +}
> > > > +
> > > > +static ssize_t dptc_default_value_show(struct kobject *kobj,
> > > > +                                    struct kobj_attribute *attr, c=
har *buf)
> > > > +{
> > > > +     struct dptc_attr_sysfs *ps =3D
> > > > +             container_of(attr, struct dptc_attr_sysfs, default_va=
lue);
> > > > +
> > > > +     return sysfs_emit(buf, "%u\n", dptc_get_default(ps->priv, ps-=
>idx));
> > > > +}
> > > > +
> > > > +static ssize_t dptc_min_value_show(struct kobject *kobj,
> > > > +                                struct kobj_attribute *attr, char =
*buf)
> > > > +{
> > > > +     struct dptc_attr_sysfs *ps =3D
> > > > +             container_of(attr, struct dptc_attr_sysfs, min_value)=
;
> > > > +     struct dptc_priv *dptc =3D ps->priv;
> > > > +
> > > > +     guard(mutex)(&dptc->lock);
> > > > +
> > > > +     return sysfs_emit(buf, "%u\n", dptc_get_min(dptc, ps->idx));
> > > > +}
> > > > +
> > > > +static ssize_t dptc_max_value_show(struct kobject *kobj,
> > > > +                                struct kobj_attribute *attr, char =
*buf)
> > > > +{
> > > > +     struct dptc_attr_sysfs *ps =3D
> > > > +             container_of(attr, struct dptc_attr_sysfs, max_value)=
;
> > > > +     struct dptc_priv *dptc =3D ps->priv;
> > > > +
> > > > +     guard(mutex)(&dptc->lock);
> > > > +
> > > > +     return sysfs_emit(buf, "%u\n", dptc_get_max(dptc, ps->idx));
> > > > +}
> > > > +
> > > > +static ssize_t dptc_scalar_increment_show(struct kobject *kobj,
> > > > +                                       struct kobj_attribute *attr=
, char *buf)
> > > > +{
> > > > +     return sysfs_emit(buf, "1\n");
> > > > +}
> > > > +
> > > > +static ssize_t dptc_display_name_show(struct kobject *kobj,
> > > > +                                   struct kobj_attribute *attr, ch=
ar *buf)
> > > > +{
> > > > +     struct dptc_attr_sysfs *ps =3D
> > > > +             container_of(attr, struct dptc_attr_sysfs, display_na=
me);
> > > > +     return sysfs_emit(buf, "%s\n", dptc_params[ps->idx].display_n=
ame);
> > > > +}
> > > > +
> > > > +static ssize_t dptc_type_show(struct kobject *kobj,
> > > > +                           struct kobj_attribute *attr, char *buf)
> > > > +{
> > > > +     return sysfs_emit(buf, "integer\n");
> > > > +}
> > > > +
> > > > +static ssize_t dptc_save_settings_show(struct kobject *kobj,
> > > > +                                    struct kobj_attribute *attr, c=
har *buf)
> > > > +{
> > > > +     struct dptc_priv *dptc =3D
> > > > +             container_of(attr, struct dptc_priv, save_settings_at=
tr);
> > > > +
> > > > +     guard(mutex)(&dptc->lock);
> > > > +
> > > > +     if (dptc->save_mode =3D=3D SAVE_SINGLE)
> > > > +             return sysfs_emit(buf, "single\n");
> > > > +     return sysfs_emit(buf, "bulk\n");
> > > > +}
> > > > +
> > > > +static ssize_t dptc_save_settings_store(struct kobject *kobj,
> > > > +                                     struct kobj_attribute *attr,
> > > > +                                     const char *buf, size_t count=
)
> > > > +{
> > > > +     struct dptc_priv *dptc =3D
> > > > +             container_of(attr, struct dptc_priv, save_settings_at=
tr);
> > > > +     int ret =3D 0;
> > > > +
> > > > +     guard(mutex)(&dptc->lock);
> > > > +
> > > > +     if (sysfs_streq(buf, "save"))
> > >=20
> > > Please don't rely on the `count =3D=3D 0' check in dptc_alib_call(). =
`dptc-
> > > > save_mode =3D=3D SAVE_SINGLE' should result in -EOPNOTSUPP to maint=
ain
> > > consistency with think-lmi (update the documentation accordingly).
> >=20
> > I will consider it. But this is subtractive behavior. We are still ABI
> > compliant even if the write goes through and it does not affect
> > functionality.

If you return something different in a certain case, it's neither API
compatible nor ABI compatible.

Also the issue here is more about you shouldn't rely on the `count =3D=3D
0' check in dptc_alib_call() to prevent running into unexpected state
when `dptc->save_mode =3D=3D SAVE_SINGLE' but "save" is written. Explicit
checks are better than implicit ones.

> >=20
> > > > +             ret =3D dptc_alib_save(dptc);
> > > > +     else if (sysfs_streq(buf, "single"))
> > > > +             dptc->save_mode =3D SAVE_SINGLE;
> > > > +     else if (sysfs_streq(buf, "bulk"))
> > > > +             dptc->save_mode =3D SAVE_BULK;
> > > > +     else
> > > > +             return -EINVAL;
> > > > +
> > > > +     return ret ? ret : count;
> > > > +}
> > > > +
> > > > +static ssize_t dptc_expanded_current_value_show(struct kobject *ko=
bj,
> > > > +                                             struct kobj_attribute=
 *attr,
> > > > +                                             char *buf)
> > > > +{
> > > > +     struct dptc_attr_sysfs *ps =3D
> > > > +             container_of(attr, struct dptc_attr_sysfs, current_va=
lue);
> > > > +     struct dptc_priv *dptc =3D ps->priv;
> > > > +
> > > > +     guard(mutex)(&dptc->lock);
> > > > +
> > > > +     return sysfs_emit(buf, "%d\n", dptc->expanded);
> > > > +}
> > > > +
> > > > +static ssize_t dptc_expanded_current_value_store(struct kobject *k=
obj,
> > > > +                                              struct kobj_attribut=
e *attr,
> > > > +                                              const char *buf, siz=
e_t count)
> > > > +{
> > > > +     struct dptc_attr_sysfs *ps =3D
> > > > +             container_of(attr, struct dptc_attr_sysfs, current_va=
lue);
> > > > +     struct dptc_priv *dptc =3D ps->priv;
> > > > +     bool val;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D kstrtobool(buf, &val);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     guard(mutex)(&dptc->lock);
> > > > +
> > > > +     dptc->expanded =3D val;
> > > > +     /* Clear staged values: limits changed, old values may be out=
 of range */
> > > > +     memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
> > >=20
> > > I'd prefer using a bitmap so that you don't need to use memset() to
> > > clear them. It also saves some memory if more parameters are added in
> > > the future.
> >=20
> > I will review if has_staged needs to exist. Values cannot be 0 anyway.
> > A bit map has other readability issues.

Just a reminder: you may also need to increase expanded_min to 1.

> >=20
> > > > +
> > > > +     return count;
> > > > +}
> > > > +
> > > > +static ssize_t dptc_expanded_default_value_show(struct kobject *ko=
bj,
> > > > +                                             struct kobj_attribute=
 *attr,
> > > > +                                             char *buf)
> > > > +{
> > > > +     return sysfs_emit(buf, "0\n");
> > > > +}
> > > > +
> > > > +static ssize_t dptc_expanded_min_value_show(struct kobject *kobj,
> > > > +                                         struct kobj_attribute *at=
tr,
> > > > +                                         char *buf)
> > > > +{
> > > > +     return sysfs_emit(buf, "0\n");
> > > > +}
> > > > +
> > > > +static ssize_t dptc_expanded_max_value_show(struct kobject *kobj,
> > > > +                                         struct kobj_attribute *at=
tr,
> > > > +                                         char *buf)
> > > > +{
> > > > +     return sysfs_emit(buf, "1\n");
> > > > +}
> > > > +
> > > > +static ssize_t dptc_expanded_scalar_increment_show(struct kobject =
*kobj,
> > > > +                                                struct kobj_attrib=
ute *attr,
> > > > +                                                char *buf)
> > > > +{
> > > > +     return sysfs_emit(buf, "1\n");
> > > > +}
> > > > +
> > > > +static ssize_t dptc_expanded_display_name_show(struct kobject *kob=
j,
> > > > +                                            struct kobj_attribute =
*attr,
> > > > +                                            char *buf)
> > > > +{
> > > > +     return sysfs_emit(buf, "Expanded Limits\n");
> > > > +}
> > > > +
> > > > +static ssize_t dptc_expanded_type_show(struct kobject *kobj,
> > > > +                                    struct kobj_attribute *attr, c=
har *buf)
> > > > +{
> > > > +     return sysfs_emit(buf, "integer\n");
> > > > +}
> > > > +
> > > > +/* Sysfs setup */
> > > > +
> > > > +static void dptc_setup_param_sysfs(struct dptc_priv *dptc,
> > > > +                                struct dptc_attr_sysfs *ps, int id=
x)
> > > > +{
> > > > +     ps->priv =3D dptc;
> > > > +     ps->idx =3D idx;
> > > > +
> > > > +     sysfs_attr_init(&ps->current_value.attr);
> > > > +     ps->current_value.attr.name  =3D "current_value";
> > > > +     ps->current_value.attr.mode  =3D 0644;
> > > > +     ps->current_value.show       =3D dptc_current_value_show;
> > > > +     ps->current_value.store      =3D dptc_current_value_store;
> > > > +
> > > > +     sysfs_attr_init(&ps->default_value.attr);
> > > > +     ps->default_value.attr.name  =3D "default_value";
> > > > +     ps->default_value.attr.mode  =3D 0444;
> > > > +     ps->default_value.show       =3D dptc_default_value_show;
> > > > +
> > > > +     sysfs_attr_init(&ps->min_value.attr);
> > > > +     ps->min_value.attr.name      =3D "min_value";
> > > > +     ps->min_value.attr.mode      =3D 0444;
> > > > +     ps->min_value.show           =3D dptc_min_value_show;
> > > > +
> > > > +     sysfs_attr_init(&ps->max_value.attr);
> > > > +     ps->max_value.attr.name      =3D "max_value";
> > > > +     ps->max_value.attr.mode      =3D 0444;
> > > > +     ps->max_value.show           =3D dptc_max_value_show;
> > > > +
> > > > +     sysfs_attr_init(&ps->scalar_increment.attr);
> > > > +     ps->scalar_increment.attr.name =3D "scalar_increment";
> > > > +     ps->scalar_increment.attr.mode =3D 0444;
> > > > +     ps->scalar_increment.show      =3D dptc_scalar_increment_show=
;
> > > > +
> > > > +     sysfs_attr_init(&ps->display_name.attr);
> > > > +     ps->display_name.attr.name   =3D "display_name";
> > > > +     ps->display_name.attr.mode   =3D 0444;
> > > > +     ps->display_name.show        =3D dptc_display_name_show;
> > > > +
> > > > +     sysfs_attr_init(&ps->type.attr);
> > > > +     ps->type.attr.name           =3D "type";
> > > > +     ps->type.attr.mode           =3D 0444;
> > > > +     ps->type.show                =3D dptc_type_show;
> > > > +
> > > > +     ps->attrs[0] =3D &ps->current_value.attr;
> > > > +     ps->attrs[1] =3D &ps->default_value.attr;
> > > > +     ps->attrs[2] =3D &ps->min_value.attr;
> > > > +     ps->attrs[3] =3D &ps->max_value.attr;
> > > > +     ps->attrs[4] =3D &ps->scalar_increment.attr;
> > > > +     ps->attrs[5] =3D &ps->display_name.attr;
> > > > +     ps->attrs[6] =3D &ps->type.attr;
> > > > +     ps->attrs[7] =3D NULL;
> > > > +
> > > > +     ps->group.name  =3D dptc_params[idx].name;
> > > > +     ps->group.attrs =3D ps->attrs;
> > > > +}
> > > > +
> > > > +static void dptc_setup_expanded_sysfs(struct dptc_priv *dptc,
> > > > +                                   struct dptc_attr_sysfs *ps)
> > > > +{
> > > > +     ps->priv =3D dptc;
> > > > +     sysfs_attr_init(&ps->current_value.attr);
> > > > +     ps->current_value.attr.name  =3D "current_value";
> > > > +     ps->current_value.attr.mode  =3D 0644;
> > > > +     ps->current_value.show       =3D dptc_expanded_current_value_=
show;
> > > > +     ps->current_value.store      =3D dptc_expanded_current_value_=
store;
> > > > +
> > > > +     sysfs_attr_init(&ps->default_value.attr);
> > > > +     ps->default_value.attr.name  =3D "default_value";
> > > > +     ps->default_value.attr.mode  =3D 0444;
> > > > +     ps->default_value.show       =3D dptc_expanded_default_value_=
show;
> > > > +
> > > > +     sysfs_attr_init(&ps->min_value.attr);
> > > > +     ps->min_value.attr.name      =3D "min_value";
> > > > +     ps->min_value.attr.mode      =3D 0444;
> > > > +     ps->min_value.show           =3D dptc_expanded_min_value_show=
;
> > > > +
> > > > +     sysfs_attr_init(&ps->max_value.attr);
> > > > +     ps->max_value.attr.name      =3D "max_value";
> > > > +     ps->max_value.attr.mode      =3D 0444;
> > > > +     ps->max_value.show           =3D dptc_expanded_max_value_show=
;
> > > > +
> > > > +     sysfs_attr_init(&ps->scalar_increment.attr);
> > > > +     ps->scalar_increment.attr.name =3D "scalar_increment";
> > > > +     ps->scalar_increment.attr.mode =3D 0444;
> > > > +     ps->scalar_increment.show      =3D dptc_expanded_scalar_incre=
ment_show;
> > > > +
> > > > +     sysfs_attr_init(&ps->display_name.attr);
> > > > +     ps->display_name.attr.name   =3D "display_name";
> > > > +     ps->display_name.attr.mode   =3D 0444;
> > > > +     ps->display_name.show        =3D dptc_expanded_display_name_s=
how;
> > > > +
> > > > +     sysfs_attr_init(&ps->type.attr);
> > > > +     ps->type.attr.name           =3D "type";
> > > > +     ps->type.attr.mode           =3D 0444;
> > > > +     ps->type.show                =3D dptc_expanded_type_show;
> > > > +
> > > > +     ps->attrs[0] =3D &ps->current_value.attr;
> > > > +     ps->attrs[1] =3D &ps->default_value.attr;
> > > > +     ps->attrs[2] =3D &ps->min_value.attr;
> > > > +     ps->attrs[3] =3D &ps->max_value.attr;
> > > > +     ps->attrs[4] =3D &ps->scalar_increment.attr;
> > > > +     ps->attrs[5] =3D &ps->display_name.attr;
> > > > +     ps->attrs[6] =3D &ps->type.attr;
> > > > +     ps->attrs[7] =3D NULL;
> > > > +
> > > > +     ps->group.name  =3D "expanded_limits";
> > > > +     ps->group.attrs =3D ps->attrs;
> > > > +}
> > >=20
> > > As Derek has said in v2, use macros to rearrange them.
> > >=20
> > > It's painful to read all these things as I'll need to scroll the scre=
en
> > > quite a lot just to read something with a low information density.
> > > That's why there are numerous macros defined in include/linux/sysfs.h=
.
> > > I could imagine defining macros like DPTC{,_EXPANDED}_ATTR_{RO,RW}.
> >=20
> > This driver consists of two instantiation blocks. It is not possible
> > to dedup the initialization functions and save space because the
> > function holders and structs that would be needed undo that.

Undo what?

> >=20
> > The blocks in lenovo other are significantly less readable and harder
> > to write. Perhaps you save around 20 lines. But it is not worth it
> > imo.
>=20
> I would consider adding them if the helper macros are centralized, but
> I am not adding macros to this driver.

The macros in lenovo-wmi-other are completely readable and are just
some common attribute techniques. Just search for `##_attr|attr_##',
and you'll see a lot of similar patterns.

Also my PoC (see attachment) showed that using macros to allocate them
statically saves 77 lines.

>=20
> Antheas
>=20
> > > Meanwhile, I am not very sure why you would have to dynamically
> > > initialize all these attributes. I haven't notice a blocker of defini=
ng
> > > them statically at the module-level (see how lenovo-wmi-other did). A=
m
> > > I missing anything?
> >=20
> > You are not missing something. There is no benefit to dynamic
> > allocation. Static allocation needs macros.

If dynamic allocation of attributes isn't required, it should be
avoided at all. Having unnecessary dynamic allocated attributes is an
anti-pattern, especially when there are (4 + 1) * 7 + 1 =3D 36
attributes. It slows down the probe sequence and adds more pressure to
kzalloc().

IMHO unwillingness to add macros is not a valid excuse of allocating
and initializing attributes dynamically.

Anyway, I've quickly figured out a PoC patch (based on v3 4/4) to
demonstrate how to properly define readable macros to allocate all
attributes statically. See the attachment.

You may add

   Co-developed-by: Rong Zhang <i@rong.moe>
   Signed-off-by: Rong Zhang <i@rong.moe>

to v4 if you decide to adopt my patch.

> >=20
> > > > +
> > > > +static void dptc_fw_dev_unregister(void *data)
> > > > +{
> > > > +     device_unregister(data);
> > > > +}
> > > > +
> > > > +static void dptc_kset_unregister(void *data)
> > > > +{
> > > > +     kset_unregister(data);
> > > > +}
> > > > +
> > > > +static int dptc_resume(struct device *dev)
> > > > +{
> > > > +     struct dptc_priv *dptc =3D dev_get_drvdata(dev);
> > > > +     int ret;
> > > > +
> > > > +     guard(mutex)(&dptc->lock);
> > > > +
> > > > +     if (dptc->save_mode =3D=3D SAVE_SINGLE)
> > > > +             ret =3D dptc_alib_save(dptc);
> > >=20
> > > I don't see why bulk mode and single mode should have divergence on
> > > resuming behavior.
> >=20
> > This is personal preference.=C2=A0

Then add comments to the code with your explanation.

Thanks,
Rong

> > I'd rather bulk mode completely disengage
> > the driver handling. It also gives it a better reason to exist. After
> > all, ALIB runs a for loop inside it, there is no difference calling it
> > 3 times or 1 as far as the GPU is concerned. It is only ACPI overhead.
> > The original name was commit_mode, with manual/auto. But while working
> > on the ABI entry I found save_settings, and it was an ABI match so I
> > opted for that instead of making a new entry.
> >=20
> > Unfortunately, naming does not match precisely.
> >=20
> > Thanks for the review! Ack. on everything I did not comment on.
> >=20
> > Best,
> > Antheas
> >=20
> > > Thanks,
> > > Rong
> > >=20
> > > > +     else
> > > > +             ret =3D 0;
> > > > +
> > > > +     if (ret)
> > > > +             dev_warn(dev, "failed to restore settings on resume: =
%d\n", ret);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static DEFINE_SIMPLE_DEV_PM_OPS(dptc_pm_ops, NULL, dptc_resume);
> > > > +
> > > > +static int dptc_probe(struct platform_device *pdev)
> > > > +{
> > > > +     const struct dmi_system_id *dmi_match =3D dev_get_platdata(&p=
dev->dev);
> > > > +     struct device *dev =3D &pdev->dev;
> > > > +     struct dptc_priv *dptc;
> > > > +     int i, ret;
> > > > +
> > > > +     dptc =3D devm_kzalloc(dev, sizeof(*dptc), GFP_KERNEL);
> > > > +     if (!dptc)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     platform_set_drvdata(pdev, dptc);
> > > > +
> > > > +     ret =3D devm_mutex_init(dev, &dptc->lock);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     dptc->dev_limits =3D dmi_match->driver_data;
> > > > +     dev_info(dev, "%s (%s)\n", dmi_match->ident,
> > > > +              boot_cpu_data.x86_model_id);
> > > > +
> > > > +     dptc->fw_attr_dev =3D device_create(&firmware_attributes_clas=
s,
> > > > +                                       NULL, MKDEV(0, 0), NULL,
> > > > +                                       DRIVER_NAME);
> > > > +     if (IS_ERR(dptc->fw_attr_dev))
> > > > +             return PTR_ERR(dptc->fw_attr_dev);
> > > > +
> > > > +     ret =3D devm_add_action_or_reset(dev, dptc_fw_dev_unregister,
> > > > +                                    dptc->fw_attr_dev);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     dptc->fw_attr_kset =3D kset_create_and_add("attributes", NULL=
,
> > > > +                                              &dptc->fw_attr_dev->=
kobj);
> > > > +     if (!dptc->fw_attr_kset)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ret =3D devm_add_action_or_reset(dev, dptc_kset_unregister,
> > > > +                                    dptc->fw_attr_kset);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     for (i =3D 0; i < DPTC_NUM_PARAMS; i++) {
> > > > +             dptc_setup_param_sysfs(dptc, &dptc->params[i], i);
> > > > +             ret =3D sysfs_create_group(&dptc->fw_attr_kset->kobj,
> > > > +                                      &dptc->params[i].group);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +     }
> > > > +
> > > > +     dptc_setup_expanded_sysfs(dptc, &dptc->expanded_attr);
> > > > +     ret =3D sysfs_create_group(&dptc->fw_attr_kset->kobj,
> > > > +                              &dptc->expanded_attr.group);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     sysfs_attr_init(&dptc->save_settings_attr.attr);
> > > > +     dptc->save_settings_attr.attr.name  =3D "save_settings";
> > > > +     dptc->save_settings_attr.attr.mode  =3D 0644;
> > > > +     dptc->save_settings_attr.show       =3D dptc_save_settings_sh=
ow;
> > > > +     dptc->save_settings_attr.store      =3D dptc_save_settings_st=
ore;
> > > > +     ret =3D sysfs_create_file(&dptc->fw_attr_kset->kobj,
> > > > +                             &dptc->save_settings_attr.attr);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static struct platform_driver dptc_driver =3D {
> > > > +     .driver =3D {
> > > > +             .name =3D DRIVER_NAME,
> > > > +             .pm   =3D pm_sleep_ptr(&dptc_pm_ops),
> > > > +     },
> > > > +     .probe  =3D dptc_probe,
> > > > +};
> > > > +
> > > > +static int __init dptc_init(void)
> > > > +{
> > > > +     const struct dmi_system_id *match;
> > > > +     bool soc_found =3D false;
> > > > +     int i, ret;
> > > > +
> > > > +     match =3D dmi_first_match(dptc_dmi_table);
> > > > +     if (!match)
> > > > +             return -ENODEV;
> > > > +
> > > > +     if (!acpi_has_method(NULL, ALIB_PATH)) {
> > > > +             pr_warn("ALIB method not present\n");
> > > > +             return -ENODEV;
> > > > +     }
> > > > +
> > > > +     for (i =3D 0; dptc_soc_table[i]; i++) {
> > > > +             if (strstr(boot_cpu_data.x86_model_id,
> > > > +                        dptc_soc_table[i])) {
> > > > +                     soc_found =3D true;
> > > > +                     break;
> > > > +             }
> > > > +     }
> > > > +     if (!soc_found) {
> > > > +             pr_warn("unrecognized SoC '%s'\n",
> > > > +                     boot_cpu_data.x86_model_id);
> > > > +             return -ENODEV;
> > > > +     }
> > > > +
> > > > +     dptc_pdev =3D platform_device_register_data(NULL, DRIVER_NAME=
, -1,
> > > > +                                               match, sizeof(*matc=
h));
> > > > +     if (IS_ERR(dptc_pdev))
> > > > +             return PTR_ERR(dptc_pdev);
> > > > +
> > > > +     ret =3D platform_driver_register(&dptc_driver);
> > > > +     if (ret) {
> > > > +             platform_device_unregister(dptc_pdev);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void __exit dptc_exit(void)
> > > > +{
> > > > +     platform_driver_unregister(&dptc_driver);
> > > > +     platform_device_unregister(dptc_pdev);
> > > > +}
> > > > +
> > > > +module_init(dptc_init);
> > > > +module_exit(dptc_exit);
> > > > +
> > > > +MODULE_AUTHOR("Antheas Kapenekakis <lkml@antheas.dev>");
> > > > +MODULE_DESCRIPTION("AMD DPTCi ACPI Driver");
> > > > +MODULE_LICENSE("GPL");
> > >=20

--=-eOj3mdMJULzj1aIBNUB9
Content-Disposition: attachment; filename="static_attr.patch"
Content-Type: text/x-patch; name="static_attr.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

IGRyaXZlcnMvcGxhdGZvcm0veDg2L2FtZC9kcHRjLmMgfCAyNTkgKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyks
IDE2OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQv
ZHB0Yy5jIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kL2RwdGMuYwppbmRleCBhM2Q1ODJlNDhj
ZDMuLmY1NGY0ZmNhNjNmNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kL2Rw
dGMuYworKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvZHB0Yy5jCkBAIC0xOCw2ICsxOCw3
IEBACiAjaW5jbHVkZSA8bGludXgvYWNwaS5oPgogI2luY2x1ZGUgPGxpbnV4L2NsZWFudXAuaD4K
ICNpbmNsdWRlIDxsaW51eC9kbWkuaD4KKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KICNpbmNs
dWRlIDxsaW51eC9pbml0Lmg+CiAjaW5jbHVkZSA8bGludXgva29iamVjdC5oPgogI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPgpAQCAtMjYsNiArMjcsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX3Byb2ZpbGUuaD4KICNpbmNsdWRlIDxsaW51eC9wcm9jZXNzb3IuaD4KICNpbmNsdWRlIDxs
aW51eC9zeXNmcy5oPgorI2luY2x1ZGUgPGxpbnV4L3N0cmluZ2lmeS5oPgogI2luY2x1ZGUgPGxp
bnV4L3VuYWxpZ25lZC5oPgogCiAjaW5jbHVkZSAiLi4vZmlybXdhcmVfYXR0cmlidXRlc19jbGFz
cy5oIgpAQCAtNjcsNyArNjksNiBAQCBzdHJ1Y3QgZHB0Y19kZXZpY2VfbGltaXRzIHsKIH07CiAK
IHN0cnVjdCBkcHRjX3BhcmFtX2Rlc2MgewotCWNvbnN0IGNoYXIgKm5hbWU7CiAJY29uc3QgY2hh
ciAqZGlzcGxheV9uYW1lOwogCXUxNiBzY2FsZTsJLyogc3lzZnMtdG8tQUxJQiBtdWx0aXBsaWVy
IChlLmcuIDEwMDAgZm9yIFctPm1XKSAqLwogCXU4IHBhcmFtX2lkOwpAQCAtNzUsMTQgKzc2LDE0
IEBAIHN0cnVjdCBkcHRjX3BhcmFtX2Rlc2MgewogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBk
cHRjX3BhcmFtX2Rlc2MgZHB0Y19wYXJhbXNbRFBUQ19OVU1fUEFSQU1TXSA9IHsKLQlbRFBUQ19Q
UFRfUEwxX1NQTF0gID0geyAicHB0X3BsMV9zcGwiLCAgIlN1c3RhaW5lZCBwb3dlciBsaW1pdCAo
VykiLAotCQkxMDAwLCBBTElCX0lEX1NUQVBNX0xJTUlULCBBTElCX0lEX1NLSU5fTElNSVQgfSwK
LQlbRFBUQ19QUFRfUEwyX1NQUFRdID0geyAicHB0X3BsMl9zcHB0IiwgIlNsb3cgUFBUIGxpbWl0
IChXKSIsCi0JCTEwMDAsIEFMSUJfSURfU0xPV19MSU1JVCB9LAotCVtEUFRDX1BQVF9QTDNfRlBQ
VF0gPSB7ICJwcHRfcGwzX2ZwcHQiLCAiRmFzdCBQUFQgbGltaXQgKFcpIiwKLQkJMTAwMCwgQUxJ
Ql9JRF9GQVNUX0xJTUlUIH0sCi0JW0RQVENfQ1BVX1RFTVBdICAgICA9IHsgImNwdV90ZW1wIiwg
ICAgICJUaGVybWFsIGNvbnRyb2wgbGltaXQgKEMpIiwKLQkJICAgMSwgQUxJQl9JRF9URU1QX1RB
UkdFVCB9LAorCVtEUFRDX1BQVF9QTDFfU1BMXSAgPSB7ICJTdXN0YWluZWQgcG93ZXIgbGltaXQg
KFcpIiwgMTAwMCwKKwkJCQlBTElCX0lEX1NUQVBNX0xJTUlULCBBTElCX0lEX1NLSU5fTElNSVQg
fSwKKwlbRFBUQ19QUFRfUEwyX1NQUFRdID0geyAiU2xvdyBQUFQgbGltaXQgKFcpIiwgMTAwMCwK
KwkJCQlBTElCX0lEX1NMT1dfTElNSVQgfSwKKwlbRFBUQ19QUFRfUEwzX0ZQUFRdID0geyAiRmFz
dCBQUFQgbGltaXQgKFcpIiwgMTAwMCwKKwkJCQlBTElCX0lEX0ZBU1RfTElNSVQgfSwKKwlbRFBU
Q19DUFVfVEVNUF0gICAgID0geyAiVGhlcm1hbCBjb250cm9sIGxpbWl0IChDKSIsIDEsCisJCQkJ
QUxJQl9JRF9URU1QX1RBUkdFVCB9LAogfTsKIAogLyogMTVXIGNsYXNzOiBBWUFORU8gQUlSIChS
eXplbiA1IDU1NjBVKSAqLwpAQCAtNTI5LDIyICs1MzAsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRtaV9zeXN0ZW1faWQgZHB0Y19kbWlfdGFibGVbXSA9IHsKIH07CiBNT0RVTEVfREVWSUNFX1RB
QkxFKGRtaSwgZHB0Y19kbWlfdGFibGUpOwogCi1zdHJ1Y3QgZHB0Y19wcml2OwotCi1zdHJ1Y3Qg
ZHB0Y19hdHRyX3N5c2ZzIHsKLQlzdHJ1Y3QgZHB0Y19wcml2ICpwcml2OwotCXN0cnVjdCBrb2Jq
X2F0dHJpYnV0ZSBjdXJyZW50X3ZhbHVlOwotCXN0cnVjdCBrb2JqX2F0dHJpYnV0ZSBkZWZhdWx0
X3ZhbHVlOwotCXN0cnVjdCBrb2JqX2F0dHJpYnV0ZSBtaW5fdmFsdWU7Ci0Jc3RydWN0IGtvYmpf
YXR0cmlidXRlIG1heF92YWx1ZTsKLQlzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgc2NhbGFyX2luY3Jl
bWVudDsKLQlzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgZGlzcGxheV9uYW1lOwotCXN0cnVjdCBrb2Jq
X2F0dHJpYnV0ZSB0eXBlOwotCXN0cnVjdCBhdHRyaWJ1dGUgKmF0dHJzWzhdOwotCXN0cnVjdCBh
dHRyaWJ1dGVfZ3JvdXAgZ3JvdXA7Ci0JaW50IGlkeDsKLX07Ci0KIHN0cnVjdCBkcHRjX3ByaXYg
ewogCXN0cnVjdCBkZXZpY2UgKmZ3X2F0dHJfZGV2OwogCXN0cnVjdCBrc2V0ICpmd19hdHRyX2tz
ZXQ7CkBAIC01NjMsMTAgKzU0OCw2IEBAIHN0cnVjdCBkcHRjX3ByaXYgewogCiAJLyogUHJvdGVj
dHMgbXV0YWJsZSBkcml2ZXIgc3RhdGUgKi8KIAlzdHJ1Y3QgbXV0ZXggbG9jazsKLQotCXN0cnVj
dCBkcHRjX2F0dHJfc3lzZnMgcGFyYW1zW0RQVENfTlVNX1BBUkFNU107Ci0Jc3RydWN0IGRwdGNf
YXR0cl9zeXNmcyBleHBhbmRlZF9hdHRyOwotCXN0cnVjdCBrb2JqX2F0dHJpYnV0ZSBzYXZlX3Nl
dHRpbmdzX2F0dHI7CiB9OwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZHB0Y19w
ZGV2OwpAQCAtNjgyLDEyICs2NjMsMjMgQEAgc3RhdGljIGludCBkcHRjX2FsaWJfc2F2ZShzdHJ1
Y3QgZHB0Y19wcml2ICpkcHRjKQogCiAvKiBTeXNmcyBjYWxsYmFja3MgKi8KIAorc3RydWN0IGRw
dGNfYXR0cl9zeXNmcyB7CisJc3RydWN0IGtvYmpfYXR0cmlidXRlIGN1cnJlbnRfdmFsdWU7CisJ
c3RydWN0IGtvYmpfYXR0cmlidXRlIGRlZmF1bHRfdmFsdWU7CisJc3RydWN0IGtvYmpfYXR0cmli
dXRlIG1pbl92YWx1ZTsKKwlzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgbWF4X3ZhbHVlOworCXN0cnVj
dCBrb2JqX2F0dHJpYnV0ZSBzY2FsYXJfaW5jcmVtZW50OworCXN0cnVjdCBrb2JqX2F0dHJpYnV0
ZSBkaXNwbGF5X25hbWU7CisJc3RydWN0IGtvYmpfYXR0cmlidXRlIHR5cGU7CisJaW50IGlkeDsK
K307CisKIHN0YXRpYyBzc2l6ZV90IGRwdGNfY3VycmVudF92YWx1ZV9zaG93KHN0cnVjdCBrb2Jq
ZWN0ICprb2JqLAogCQkJCSAgICAgICBzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIg
KmJ1ZikKIHsKIAlzdHJ1Y3QgZHB0Y19hdHRyX3N5c2ZzICpwcyA9CiAJCWNvbnRhaW5lcl9vZihh
dHRyLCBzdHJ1Y3QgZHB0Y19hdHRyX3N5c2ZzLCBjdXJyZW50X3ZhbHVlKTsKLQlzdHJ1Y3QgZHB0
Y19wcml2ICpkcHRjID0gcHMtPnByaXY7CisJc3RydWN0IGRwdGNfcHJpdiAqZHB0YyA9IGRldl9n
ZXRfZHJ2ZGF0YShrb2JqX3RvX2Rldihrb2JqLT5wYXJlbnQpKTsKIAogCWd1YXJkKG11dGV4KSgm
ZHB0Yy0+bG9jayk7CiAKQEAgLTcxMCw3ICs3MDIsNyBAQCBzdGF0aWMgc3NpemVfdCBkcHRjX2N1
cnJlbnRfdmFsdWVfc3RvcmUoc3RydWN0IGtvYmplY3QgKmtvYmosCiB7CiAJc3RydWN0IGRwdGNf
YXR0cl9zeXNmcyAqcHMgPQogCQljb250YWluZXJfb2YoYXR0ciwgc3RydWN0IGRwdGNfYXR0cl9z
eXNmcywgY3VycmVudF92YWx1ZSk7Ci0Jc3RydWN0IGRwdGNfcHJpdiAqZHB0YyA9IHBzLT5wcml2
OworCXN0cnVjdCBkcHRjX3ByaXYgKmRwdGMgPSBkZXZfZ2V0X2RydmRhdGEoa29ial90b19kZXYo
a29iai0+cGFyZW50KSk7CiAJdTMyIHZhbCwgbWluLCBtYXg7CiAJaW50IHJldDsKIApAQCAtNzQ4
LDggKzc0MCw5IEBAIHN0YXRpYyBzc2l6ZV90IGRwdGNfZGVmYXVsdF92YWx1ZV9zaG93KHN0cnVj
dCBrb2JqZWN0ICprb2JqLAogewogCXN0cnVjdCBkcHRjX2F0dHJfc3lzZnMgKnBzID0KIAkJY29u
dGFpbmVyX29mKGF0dHIsIHN0cnVjdCBkcHRjX2F0dHJfc3lzZnMsIGRlZmF1bHRfdmFsdWUpOwor
CXN0cnVjdCBkcHRjX3ByaXYgKmRwdGMgPSBkZXZfZ2V0X2RydmRhdGEoa29ial90b19kZXYoa29i
ai0+cGFyZW50KSk7CiAKLQlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIldVxuIiwgZHB0Y19nZXRf
ZGVmYXVsdChwcy0+cHJpdiwgcHMtPmlkeCkpOworCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiV1
XG4iLCBkcHRjX2dldF9kZWZhdWx0KGRwdGMsIHBzLT5pZHgpKTsKIH0KIAogc3RhdGljIHNzaXpl
X3QgZHB0Y19taW5fdmFsdWVfc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29iaiwKQEAgLTc1Nyw3ICs3
NTAsNyBAQCBzdGF0aWMgc3NpemVfdCBkcHRjX21pbl92YWx1ZV9zaG93KHN0cnVjdCBrb2JqZWN0
ICprb2JqLAogewogCXN0cnVjdCBkcHRjX2F0dHJfc3lzZnMgKnBzID0KIAkJY29udGFpbmVyX29m
KGF0dHIsIHN0cnVjdCBkcHRjX2F0dHJfc3lzZnMsIG1pbl92YWx1ZSk7Ci0Jc3RydWN0IGRwdGNf
cHJpdiAqZHB0YyA9IHBzLT5wcml2OworCXN0cnVjdCBkcHRjX3ByaXYgKmRwdGMgPSBkZXZfZ2V0
X2RydmRhdGEoa29ial90b19kZXYoa29iai0+cGFyZW50KSk7CiAKIAlndWFyZChtdXRleCkoJmRw
dGMtPmxvY2spOwogCkBAIC03NjksNyArNzYyLDcgQEAgc3RhdGljIHNzaXplX3QgZHB0Y19tYXhf
dmFsdWVfc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29iaiwKIHsKIAlzdHJ1Y3QgZHB0Y19hdHRyX3N5
c2ZzICpwcyA9CiAJCWNvbnRhaW5lcl9vZihhdHRyLCBzdHJ1Y3QgZHB0Y19hdHRyX3N5c2ZzLCBt
YXhfdmFsdWUpOwotCXN0cnVjdCBkcHRjX3ByaXYgKmRwdGMgPSBwcy0+cHJpdjsKKwlzdHJ1Y3Qg
ZHB0Y19wcml2ICpkcHRjID0gZGV2X2dldF9kcnZkYXRhKGtvYmpfdG9fZGV2KGtvYmotPnBhcmVu
dCkpOwogCiAJZ3VhcmQobXV0ZXgpKCZkcHRjLT5sb2NrKTsKIApAQCAtNzk5LDggKzc5Miw3IEBA
IHN0YXRpYyBzc2l6ZV90IGRwdGNfdHlwZV9zaG93KHN0cnVjdCBrb2JqZWN0ICprb2JqLAogc3Rh
dGljIHNzaXplX3QgZHB0Y19zYXZlX3NldHRpbmdzX3Nob3coc3RydWN0IGtvYmplY3QgKmtvYmos
CiAJCQkJICAgICAgIHN0cnVjdCBrb2JqX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQogewot
CXN0cnVjdCBkcHRjX3ByaXYgKmRwdGMgPQotCQljb250YWluZXJfb2YoYXR0ciwgc3RydWN0IGRw
dGNfcHJpdiwgc2F2ZV9zZXR0aW5nc19hdHRyKTsKKwlzdHJ1Y3QgZHB0Y19wcml2ICpkcHRjID0g
ZGV2X2dldF9kcnZkYXRhKGtvYmpfdG9fZGV2KGtvYmotPnBhcmVudCkpOwogCiAJZ3VhcmQobXV0
ZXgpKCZkcHRjLT5sb2NrKTsKIApAQCAtODEzLDggKzgwNSw3IEBAIHN0YXRpYyBzc2l6ZV90IGRw
dGNfc2F2ZV9zZXR0aW5nc19zdG9yZShzdHJ1Y3Qga29iamVjdCAqa29iaiwKIAkJCQkJc3RydWN0
IGtvYmpfYXR0cmlidXRlICphdHRyLAogCQkJCQljb25zdCBjaGFyICpidWYsIHNpemVfdCBjb3Vu
dCkKIHsKLQlzdHJ1Y3QgZHB0Y19wcml2ICpkcHRjID0KLQkJY29udGFpbmVyX29mKGF0dHIsIHN0
cnVjdCBkcHRjX3ByaXYsIHNhdmVfc2V0dGluZ3NfYXR0cik7CisJc3RydWN0IGRwdGNfcHJpdiAq
ZHB0YyA9IGRldl9nZXRfZHJ2ZGF0YShrb2JqX3RvX2Rldihrb2JqLT5wYXJlbnQpKTsKIAlpbnQg
cmV0ID0gMDsKIAogCWd1YXJkKG11dGV4KSgmZHB0Yy0+bG9jayk7CkBAIC04MzUsOSArODI2LDcg
QEAgc3RhdGljIHNzaXplX3QgZHB0Y19leHBhbmRlZF9jdXJyZW50X3ZhbHVlX3Nob3coc3RydWN0
IGtvYmplY3QgKmtvYmosCiAJCQkJCQlzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgKmF0dHIsCiAJCQkJ
CQljaGFyICpidWYpCiB7Ci0Jc3RydWN0IGRwdGNfYXR0cl9zeXNmcyAqcHMgPQotCQljb250YWlu
ZXJfb2YoYXR0ciwgc3RydWN0IGRwdGNfYXR0cl9zeXNmcywgY3VycmVudF92YWx1ZSk7Ci0Jc3Ry
dWN0IGRwdGNfcHJpdiAqZHB0YyA9IHBzLT5wcml2OworCXN0cnVjdCBkcHRjX3ByaXYgKmRwdGMg
PSBkZXZfZ2V0X2RydmRhdGEoa29ial90b19kZXYoa29iai0+cGFyZW50KSk7CiAKIAlndWFyZCht
dXRleCkoJmRwdGMtPmxvY2spOwogCkBAIC04NDgsOSArODM3LDcgQEAgc3RhdGljIHNzaXplX3Qg
ZHB0Y19leHBhbmRlZF9jdXJyZW50X3ZhbHVlX3N0b3JlKHN0cnVjdCBrb2JqZWN0ICprb2JqLAog
CQkJCQkJIHN0cnVjdCBrb2JqX2F0dHJpYnV0ZSAqYXR0ciwKIAkJCQkJCSBjb25zdCBjaGFyICpi
dWYsIHNpemVfdCBjb3VudCkKIHsKLQlzdHJ1Y3QgZHB0Y19hdHRyX3N5c2ZzICpwcyA9Ci0JCWNv
bnRhaW5lcl9vZihhdHRyLCBzdHJ1Y3QgZHB0Y19hdHRyX3N5c2ZzLCBjdXJyZW50X3ZhbHVlKTsK
LQlzdHJ1Y3QgZHB0Y19wcml2ICpkcHRjID0gcHMtPnByaXY7CisJc3RydWN0IGRwdGNfcHJpdiAq
ZHB0YyA9IGRldl9nZXRfZHJ2ZGF0YShrb2JqX3RvX2Rldihrb2JqLT5wYXJlbnQpKTsKIAlib29s
IHZhbDsKIAlpbnQgcmV0OwogCkBAIC05MTIsMTEzICs4OTksNjIgQEAgc3RhdGljIHNzaXplX3Qg
ZHB0Y19leHBhbmRlZF90eXBlX3Nob3coc3RydWN0IGtvYmplY3QgKmtvYmosCiAKIC8qIFN5c2Zz
IHNldHVwICovCiAKLXN0YXRpYyB2b2lkIGRwdGNfc2V0dXBfcGFyYW1fc3lzZnMoc3RydWN0IGRw
dGNfcHJpdiAqZHB0YywKLQkJCQkgICBzdHJ1Y3QgZHB0Y19hdHRyX3N5c2ZzICpwcywgaW50IGlk
eCkKLXsKLQlwcy0+cHJpdiA9IGRwdGM7Ci0JcHMtPmlkeCA9IGlkeDsKLQotCXN5c2ZzX2F0dHJf
aW5pdCgmcHMtPmN1cnJlbnRfdmFsdWUuYXR0cik7Ci0JcHMtPmN1cnJlbnRfdmFsdWUuYXR0ci5u
YW1lICA9ICJjdXJyZW50X3ZhbHVlIjsKLQlwcy0+Y3VycmVudF92YWx1ZS5hdHRyLm1vZGUgID0g
MDY0NDsKLQlwcy0+Y3VycmVudF92YWx1ZS5zaG93ICAgICAgID0gZHB0Y19jdXJyZW50X3ZhbHVl
X3Nob3c7Ci0JcHMtPmN1cnJlbnRfdmFsdWUuc3RvcmUgICAgICA9IGRwdGNfY3VycmVudF92YWx1
ZV9zdG9yZTsKLQotCXN5c2ZzX2F0dHJfaW5pdCgmcHMtPmRlZmF1bHRfdmFsdWUuYXR0cik7Ci0J
cHMtPmRlZmF1bHRfdmFsdWUuYXR0ci5uYW1lICA9ICJkZWZhdWx0X3ZhbHVlIjsKLQlwcy0+ZGVm
YXVsdF92YWx1ZS5hdHRyLm1vZGUgID0gMDQ0NDsKLQlwcy0+ZGVmYXVsdF92YWx1ZS5zaG93ICAg
ICAgID0gZHB0Y19kZWZhdWx0X3ZhbHVlX3Nob3c7Ci0KLQlzeXNmc19hdHRyX2luaXQoJnBzLT5t
aW5fdmFsdWUuYXR0cik7Ci0JcHMtPm1pbl92YWx1ZS5hdHRyLm5hbWUgICAgICA9ICJtaW5fdmFs
dWUiOwotCXBzLT5taW5fdmFsdWUuYXR0ci5tb2RlICAgICAgPSAwNDQ0OwotCXBzLT5taW5fdmFs
dWUuc2hvdyAgICAgICAgICAgPSBkcHRjX21pbl92YWx1ZV9zaG93OwotCi0Jc3lzZnNfYXR0cl9p
bml0KCZwcy0+bWF4X3ZhbHVlLmF0dHIpOwotCXBzLT5tYXhfdmFsdWUuYXR0ci5uYW1lICAgICAg
PSAibWF4X3ZhbHVlIjsKLQlwcy0+bWF4X3ZhbHVlLmF0dHIubW9kZSAgICAgID0gMDQ0NDsKLQlw
cy0+bWF4X3ZhbHVlLnNob3cgICAgICAgICAgID0gZHB0Y19tYXhfdmFsdWVfc2hvdzsKLQotCXN5
c2ZzX2F0dHJfaW5pdCgmcHMtPnNjYWxhcl9pbmNyZW1lbnQuYXR0cik7Ci0JcHMtPnNjYWxhcl9p
bmNyZW1lbnQuYXR0ci5uYW1lID0gInNjYWxhcl9pbmNyZW1lbnQiOwotCXBzLT5zY2FsYXJfaW5j
cmVtZW50LmF0dHIubW9kZSA9IDA0NDQ7Ci0JcHMtPnNjYWxhcl9pbmNyZW1lbnQuc2hvdyAgICAg
ID0gZHB0Y19zY2FsYXJfaW5jcmVtZW50X3Nob3c7Ci0KLQlzeXNmc19hdHRyX2luaXQoJnBzLT5k
aXNwbGF5X25hbWUuYXR0cik7Ci0JcHMtPmRpc3BsYXlfbmFtZS5hdHRyLm5hbWUgICA9ICJkaXNw
bGF5X25hbWUiOwotCXBzLT5kaXNwbGF5X25hbWUuYXR0ci5tb2RlICAgPSAwNDQ0OwotCXBzLT5k
aXNwbGF5X25hbWUuc2hvdyAgICAgICAgPSBkcHRjX2Rpc3BsYXlfbmFtZV9zaG93OwotCi0Jc3lz
ZnNfYXR0cl9pbml0KCZwcy0+dHlwZS5hdHRyKTsKLQlwcy0+dHlwZS5hdHRyLm5hbWUgICAgICAg
ICAgID0gInR5cGUiOwotCXBzLT50eXBlLmF0dHIubW9kZSAgICAgICAgICAgPSAwNDQ0OwotCXBz
LT50eXBlLnNob3cgICAgICAgICAgICAgICAgPSBkcHRjX3R5cGVfc2hvdzsKLQotCXBzLT5hdHRy
c1swXSA9ICZwcy0+Y3VycmVudF92YWx1ZS5hdHRyOwotCXBzLT5hdHRyc1sxXSA9ICZwcy0+ZGVm
YXVsdF92YWx1ZS5hdHRyOwotCXBzLT5hdHRyc1syXSA9ICZwcy0+bWluX3ZhbHVlLmF0dHI7Ci0J
cHMtPmF0dHJzWzNdID0gJnBzLT5tYXhfdmFsdWUuYXR0cjsKLQlwcy0+YXR0cnNbNF0gPSAmcHMt
PnNjYWxhcl9pbmNyZW1lbnQuYXR0cjsKLQlwcy0+YXR0cnNbNV0gPSAmcHMtPmRpc3BsYXlfbmFt
ZS5hdHRyOwotCXBzLT5hdHRyc1s2XSA9ICZwcy0+dHlwZS5hdHRyOwotCXBzLT5hdHRyc1s3XSA9
IE5VTEw7Ci0KLQlwcy0+Z3JvdXAubmFtZSAgPSBkcHRjX3BhcmFtc1tpZHhdLm5hbWU7Ci0JcHMt
Pmdyb3VwLmF0dHJzID0gcHMtPmF0dHJzOwotfQorI2RlZmluZSBfX0RQVENfQVRUUl9STyhfZnVu
YywgX25hbWUpIFwKKwlfX0FUVFIoX25hbWUsIDA0NDQsIF9mdW5jIyNfIyNfbmFtZSMjX3Nob3cs
IE5VTEwpCisKKyNkZWZpbmUgX19EUFRDX0FUVFJfUlcoX2Z1bmMsIF9uYW1lKSBcCisJX19BVFRS
KF9uYW1lLCAwNjQ0LCBfZnVuYyMjXyMjX25hbWUjI19zaG93LCBfZnVuYyMjXyMjX25hbWUjI19z
dG9yZSkKKworI2RlZmluZSBEUFRDX0FUVFJfUk8oX2Z1bmMsIF9uYW1lKSBcCisJLl9uYW1lID0g
X19EUFRDX0FUVFJfUk8oX2Z1bmMsIF9uYW1lKQorCisjZGVmaW5lIERQVENfQVRUUl9SVyhfZnVu
YywgX25hbWUpIFwKKwkuX25hbWUgPSBfX0RQVENfQVRUUl9SVyhfZnVuYywgX25hbWUpCisKKyNk
ZWZpbmUgRFBUQ19BVFRSX0dST1VQKF9mdW5jLCBfaWR4LCBfZ3JwbmFtZSkJCQkJXAorCXN0YXRp
YyBzdHJ1Y3QgZHB0Y19hdHRyX3N5c2ZzIGRwdGNfIyNfZ3JwbmFtZSMjX3N5c2ZzID0gewlcCisJ
CURQVENfQVRUUl9SVyhfZnVuYywgY3VycmVudF92YWx1ZSksCQkJXAorCQlEUFRDX0FUVFJfUk8o
X2Z1bmMsIGRlZmF1bHRfdmFsdWUpLAkJCVwKKwkJRFBUQ19BVFRSX1JPKF9mdW5jLCBtaW5fdmFs
dWUpLAkJCQlcCisJCURQVENfQVRUUl9STyhfZnVuYywgbWF4X3ZhbHVlKSwJCQkJXAorCQlEUFRD
X0FUVFJfUk8oX2Z1bmMsIHNjYWxhcl9pbmNyZW1lbnQpLAkJCVwKKwkJRFBUQ19BVFRSX1JPKF9m
dW5jLCBkaXNwbGF5X25hbWUpLAkJCVwKKwkJRFBUQ19BVFRSX1JPKF9mdW5jLCB0eXBlKSwJCQkJ
XAorCQkuaWR4ID0gX2lkeCwJCQkJCQlcCisJfTsJCQkJCQkJCVwKKwlzdGF0aWMgc3RydWN0IGF0
dHJpYnV0ZSAqZHB0Y18jI19ncnBuYW1lIyNfYXR0cnNbXSA9IHsJCVwKKwkJJmRwdGNfIyNfZ3Jw
bmFtZSMjX3N5c2ZzLmN1cnJlbnRfdmFsdWUuYXR0ciwJCVwKKwkJJmRwdGNfIyNfZ3JwbmFtZSMj
X3N5c2ZzLmRlZmF1bHRfdmFsdWUuYXR0ciwJCVwKKwkJJmRwdGNfIyNfZ3JwbmFtZSMjX3N5c2Zz
Lm1pbl92YWx1ZS5hdHRyLAkJXAorCQkmZHB0Y18jI19ncnBuYW1lIyNfc3lzZnMubWF4X3ZhbHVl
LmF0dHIsCQlcCisJCSZkcHRjXyMjX2dycG5hbWUjI19zeXNmcy5zY2FsYXJfaW5jcmVtZW50LmF0
dHIsCQlcCisJCSZkcHRjXyMjX2dycG5hbWUjI19zeXNmcy5kaXNwbGF5X25hbWUuYXR0ciwJCVwK
KwkJJmRwdGNfIyNfZ3JwbmFtZSMjX3N5c2ZzLnR5cGUuYXR0ciwJCQlcCisJCU5VTEwsCQkJCQkJ
CVwKKwl9OwkJCQkJCQkJXAorCXN0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIGRw
dGNfIyNfZ3JwbmFtZSMjX2dyb3VwID0gewlcCisJCS5uYW1lID0gX19zdHJpbmdpZnkoX2dycG5h
bWUpLAkJCQlcCisJCS5hdHRycyA9IGRwdGNfIyNfZ3JwbmFtZSMjX2F0dHJzLAkJCVwKKwl9CiAK
LXN0YXRpYyB2b2lkIGRwdGNfc2V0dXBfZXhwYW5kZWRfc3lzZnMoc3RydWN0IGRwdGNfcHJpdiAq
ZHB0YywKLQkJCQkgICAgICBzdHJ1Y3QgZHB0Y19hdHRyX3N5c2ZzICpwcykKLXsKLQlwcy0+cHJp
diA9IGRwdGM7Ci0Jc3lzZnNfYXR0cl9pbml0KCZwcy0+Y3VycmVudF92YWx1ZS5hdHRyKTsKLQlw
cy0+Y3VycmVudF92YWx1ZS5hdHRyLm5hbWUgID0gImN1cnJlbnRfdmFsdWUiOwotCXBzLT5jdXJy
ZW50X3ZhbHVlLmF0dHIubW9kZSAgPSAwNjQ0OwotCXBzLT5jdXJyZW50X3ZhbHVlLnNob3cgICAg
ICAgPSBkcHRjX2V4cGFuZGVkX2N1cnJlbnRfdmFsdWVfc2hvdzsKLQlwcy0+Y3VycmVudF92YWx1
ZS5zdG9yZSAgICAgID0gZHB0Y19leHBhbmRlZF9jdXJyZW50X3ZhbHVlX3N0b3JlOwotCi0Jc3lz
ZnNfYXR0cl9pbml0KCZwcy0+ZGVmYXVsdF92YWx1ZS5hdHRyKTsKLQlwcy0+ZGVmYXVsdF92YWx1
ZS5hdHRyLm5hbWUgID0gImRlZmF1bHRfdmFsdWUiOwotCXBzLT5kZWZhdWx0X3ZhbHVlLmF0dHIu
bW9kZSAgPSAwNDQ0OwotCXBzLT5kZWZhdWx0X3ZhbHVlLnNob3cgICAgICAgPSBkcHRjX2V4cGFu
ZGVkX2RlZmF1bHRfdmFsdWVfc2hvdzsKLQotCXN5c2ZzX2F0dHJfaW5pdCgmcHMtPm1pbl92YWx1
ZS5hdHRyKTsKLQlwcy0+bWluX3ZhbHVlLmF0dHIubmFtZSAgICAgID0gIm1pbl92YWx1ZSI7Ci0J
cHMtPm1pbl92YWx1ZS5hdHRyLm1vZGUgICAgICA9IDA0NDQ7Ci0JcHMtPm1pbl92YWx1ZS5zaG93
ICAgICAgICAgICA9IGRwdGNfZXhwYW5kZWRfbWluX3ZhbHVlX3Nob3c7Ci0KLQlzeXNmc19hdHRy
X2luaXQoJnBzLT5tYXhfdmFsdWUuYXR0cik7Ci0JcHMtPm1heF92YWx1ZS5hdHRyLm5hbWUgICAg
ICA9ICJtYXhfdmFsdWUiOwotCXBzLT5tYXhfdmFsdWUuYXR0ci5tb2RlICAgICAgPSAwNDQ0Owot
CXBzLT5tYXhfdmFsdWUuc2hvdyAgICAgICAgICAgPSBkcHRjX2V4cGFuZGVkX21heF92YWx1ZV9z
aG93OwotCi0Jc3lzZnNfYXR0cl9pbml0KCZwcy0+c2NhbGFyX2luY3JlbWVudC5hdHRyKTsKLQlw
cy0+c2NhbGFyX2luY3JlbWVudC5hdHRyLm5hbWUgPSAic2NhbGFyX2luY3JlbWVudCI7Ci0JcHMt
PnNjYWxhcl9pbmNyZW1lbnQuYXR0ci5tb2RlID0gMDQ0NDsKLQlwcy0+c2NhbGFyX2luY3JlbWVu
dC5zaG93ICAgICAgPSBkcHRjX2V4cGFuZGVkX3NjYWxhcl9pbmNyZW1lbnRfc2hvdzsKLQotCXN5
c2ZzX2F0dHJfaW5pdCgmcHMtPmRpc3BsYXlfbmFtZS5hdHRyKTsKLQlwcy0+ZGlzcGxheV9uYW1l
LmF0dHIubmFtZSAgID0gImRpc3BsYXlfbmFtZSI7Ci0JcHMtPmRpc3BsYXlfbmFtZS5hdHRyLm1v
ZGUgICA9IDA0NDQ7Ci0JcHMtPmRpc3BsYXlfbmFtZS5zaG93ICAgICAgICA9IGRwdGNfZXhwYW5k
ZWRfZGlzcGxheV9uYW1lX3Nob3c7Ci0KLQlzeXNmc19hdHRyX2luaXQoJnBzLT50eXBlLmF0dHIp
OwotCXBzLT50eXBlLmF0dHIubmFtZSAgICAgICAgICAgPSAidHlwZSI7Ci0JcHMtPnR5cGUuYXR0
ci5tb2RlICAgICAgICAgICA9IDA0NDQ7Ci0JcHMtPnR5cGUuc2hvdyAgICAgICAgICAgICAgICA9
IGRwdGNfZXhwYW5kZWRfdHlwZV9zaG93OwotCi0JcHMtPmF0dHJzWzBdID0gJnBzLT5jdXJyZW50
X3ZhbHVlLmF0dHI7Ci0JcHMtPmF0dHJzWzFdID0gJnBzLT5kZWZhdWx0X3ZhbHVlLmF0dHI7Ci0J
cHMtPmF0dHJzWzJdID0gJnBzLT5taW5fdmFsdWUuYXR0cjsKLQlwcy0+YXR0cnNbM10gPSAmcHMt
Pm1heF92YWx1ZS5hdHRyOwotCXBzLT5hdHRyc1s0XSA9ICZwcy0+c2NhbGFyX2luY3JlbWVudC5h
dHRyOwotCXBzLT5hdHRyc1s1XSA9ICZwcy0+ZGlzcGxheV9uYW1lLmF0dHI7Ci0JcHMtPmF0dHJz
WzZdID0gJnBzLT50eXBlLmF0dHI7Ci0JcHMtPmF0dHJzWzddID0gTlVMTDsKLQotCXBzLT5ncm91
cC5uYW1lICA9ICJleHBhbmRlZF9saW1pdHMiOwotCXBzLT5ncm91cC5hdHRycyA9IHBzLT5hdHRy
czsKLX0KK0RQVENfQVRUUl9HUk9VUChkcHRjLCBEUFRDX1BQVF9QTDFfU1BMLCBwcHRfcGwxX3Nw
bCk7CitEUFRDX0FUVFJfR1JPVVAoZHB0YywgRFBUQ19QUFRfUEwyX1NQUFQsIHBwdF9wbDJfc3Bw
dCk7CitEUFRDX0FUVFJfR1JPVVAoZHB0YywgRFBUQ19QUFRfUEwzX0ZQUFQsIHBwdF9wbDNfZnBw
dCk7CitEUFRDX0FUVFJfR1JPVVAoZHB0YywgRFBUQ19DUFVfVEVNUCwgY3B1X3RlbXApOworCitE
UFRDX0FUVFJfR1JPVVAoZHB0Y19leHBhbmRlZCwgMCwgZXhwYW5kZWQpOworCitzdGF0aWMgY29u
c3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqZHB0Y19hdHRyX2dyb3Vwc1tdID0geworCSZkcHRj
X3BwdF9wbDFfc3BsX2dyb3VwLAorCSZkcHRjX3BwdF9wbDJfc3BwdF9ncm91cCwKKwkmZHB0Y19w
cHRfcGwzX2ZwcHRfZ3JvdXAsCisJJmRwdGNfY3B1X3RlbXBfZ3JvdXAsCisJJmRwdGNfZXhwYW5k
ZWRfZ3JvdXAsCisJTlVMTCwKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qga29ial9hdHRyaWJ1
dGUgc2F2ZV9zZXR0aW5nc19hdHRyID0KKwlfX0RQVENfQVRUUl9SVyhkcHRjLCBzYXZlX3NldHRp
bmdzKTsKIAogc3RhdGljIHZvaWQgZHB0Y19md19kZXZfdW5yZWdpc3Rlcih2b2lkICpkYXRhKQog
ewpAQCAtMTEzMSw3ICsxMDY3LDcgQEAgc3RhdGljIGludCBkcHRjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgKmRtaV9tYXRj
aCA9IGRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7CiAJc3RydWN0IGRldmljZSAqZGV2ID0g
JnBkZXYtPmRldjsKIAlzdHJ1Y3QgZHB0Y19wcml2ICpkcHRjOwotCWludCBpLCByZXQ7CisJaW50
IHJldDsKIAogCWRwdGMgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmRwdGMpLCBHRlBfS0VS
TkVMKTsKIAlpZiAoIWRwdGMpCkBAIC0xMTUyLDYgKzEwODgsOCBAQCBzdGF0aWMgaW50IGRwdGNf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoSVNfRVJSKGRwdGMtPmZ3
X2F0dHJfZGV2KSkKIAkJcmV0dXJuIFBUUl9FUlIoZHB0Yy0+ZndfYXR0cl9kZXYpOwogCisJZGV2
X3NldF9kcnZkYXRhKGRwdGMtPmZ3X2F0dHJfZGV2LCBkcHRjKTsKKwogCXJldCA9IGRldm1fYWRk
X2FjdGlvbl9vcl9yZXNldChkZXYsIGRwdGNfZndfZGV2X3VucmVnaXN0ZXIsCiAJCQkJICAgICAg
IGRwdGMtPmZ3X2F0dHJfZGV2KTsKIAlpZiAocmV0KQpAQCAtMTE2NywyNyArMTEwNSwxMiBAQCBz
dGF0aWMgaW50IGRwdGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAo
cmV0KQogCQlyZXR1cm4gcmV0OwogCi0JZm9yIChpID0gMDsgaSA8IERQVENfTlVNX1BBUkFNUzsg
aSsrKSB7Ci0JCWRwdGNfc2V0dXBfcGFyYW1fc3lzZnMoZHB0YywgJmRwdGMtPnBhcmFtc1tpXSwg
aSk7Ci0JCXJldCA9IHN5c2ZzX2NyZWF0ZV9ncm91cCgmZHB0Yy0+ZndfYXR0cl9rc2V0LT5rb2Jq
LAotCQkJCQkgJmRwdGMtPnBhcmFtc1tpXS5ncm91cCk7Ci0JCWlmIChyZXQpCi0JCQlyZXR1cm4g
cmV0OwotCX0KLQotCWRwdGNfc2V0dXBfZXhwYW5kZWRfc3lzZnMoZHB0YywgJmRwdGMtPmV4cGFu
ZGVkX2F0dHIpOwotCXJldCA9IHN5c2ZzX2NyZWF0ZV9ncm91cCgmZHB0Yy0+ZndfYXR0cl9rc2V0
LT5rb2JqLAotCQkJCSAmZHB0Yy0+ZXhwYW5kZWRfYXR0ci5ncm91cCk7CisJcmV0ID0gc3lzZnNf
Y3JlYXRlX2dyb3VwcygmZHB0Yy0+ZndfYXR0cl9rc2V0LT5rb2JqLCBkcHRjX2F0dHJfZ3JvdXBz
KTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0Jc3lzZnNfYXR0cl9pbml0KCZkcHRjLT5z
YXZlX3NldHRpbmdzX2F0dHIuYXR0cik7Ci0JZHB0Yy0+c2F2ZV9zZXR0aW5nc19hdHRyLmF0dHIu
bmFtZSAgPSAic2F2ZV9zZXR0aW5ncyI7Ci0JZHB0Yy0+c2F2ZV9zZXR0aW5nc19hdHRyLmF0dHIu
bW9kZSAgPSAwNjQ0OwotCWRwdGMtPnNhdmVfc2V0dGluZ3NfYXR0ci5zaG93ICAgICAgID0gZHB0
Y19zYXZlX3NldHRpbmdzX3Nob3c7Ci0JZHB0Yy0+c2F2ZV9zZXR0aW5nc19hdHRyLnN0b3JlICAg
ICAgPSBkcHRjX3NhdmVfc2V0dGluZ3Nfc3RvcmU7CiAJcmV0ID0gc3lzZnNfY3JlYXRlX2ZpbGUo
JmRwdGMtPmZ3X2F0dHJfa3NldC0+a29iaiwKLQkJCQkmZHB0Yy0+c2F2ZV9zZXR0aW5nc19hdHRy
LmF0dHIpOworCQkJCSZzYXZlX3NldHRpbmdzX2F0dHIuYXR0cik7CiAJaWYgKHJldCkKIAkJcmV0
dXJuIHJldDsKIAo=


--=-eOj3mdMJULzj1aIBNUB9--
