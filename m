Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC02481ABF
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Mar 2026 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772831662; cv=pass; b=HrO44F0NXnV2p1Uf5jRQaGbaLvPIdSZOUts/PJK2eBkQ9KUxUs9uuFcXH5pzj0TWWC0omi5hP1TfGJ+wh2qLAMUwHl+Smr9mX4EsQm2WonwNyN4Guq3pHh4wI6YUMk+fa1H5gHHiH28BFoK4rph9bjCFgPXTtUdOf/IFS3h4F2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772831662; c=relaxed/simple;
	bh=Bcu2K4TOIBWSbG40baFXpE57SKLjARku+DTXpJxZVKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/3ZRafMKSpfJQa8TKoMWQY7r+7ZISnAlqv2Z3DxJjxUpyEyQUI3DHT49+TIKW1G9cBysqpU3HUbx1KCWfjp9G2ar652QDmXzxaWscwYAiAQjYQmmoWtfteoYmeDvWVkYOmIh+tIqnCid7Ymf1h1d6/cctUCbyqyA7d+T6Mlf3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7zK2vQ/; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7zK2vQ/"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89a14be4733so55723396d6.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Mar 2026 13:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772831658; cv=none;
        d=google.com; s=arc-20240605;
        b=YOCB9R6qulRpkFLk5N0WGYTGOsN3TzTdvTEVnDhJZlPmmqmZsYnKmBOxKyY7SHubhL
         f/T4jLpsJd5TA8wjSxfxOz80CUXZWyP0ikcNUtHceZI+kufC0x7GmvORzV4DcU0UD1d/
         oP00sms5vhMDHaiJVHIDbsd6f3wHu03/SQttJlkX2Tfa69P5EqWFGgt+Rtq09U0fRzJM
         LxC/LEfsO5kTm0NkaHxqmyvB4fXM39FvGUe2cdiVtudcym+4R1j5e3Ua6VF6O/Xecahc
         mmjd/bxtdkK90d2ah/0bbGdOJQH+Qr398sv21L7XQ2Kn3mK0ZywxncQ+9O6odL1ioY4Q
         K9jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G/z/ouJ872IWkcvAn8ch9joFmYQyPZ8EqwlLbtxBAd4=;
        fh=UC7npyxy4E7aNo88m2Yb5nVaCfrZLoO2H0sTXWDby+c=;
        b=JGg7OwsLudN1hKoeeFbgP0s7naON6YiXYTwJ2AWeG/kok7gw5Z4F5mnUrGK7F1Ih5U
         aVmlBW/k1Y0WtpOUa7qOlxo6nmxXcDSGtqi6BbMgSganRD8g/69wzuoBFZDfkdyC9sac
         Glr+Xr7xF8THkKzkcMeuGsNnWLH88bAvwEdyCOYt8ZyHOcTJxhpMetvJVVrOLgsBllez
         KD3vXHsxFpovBaWzl6rXlyPdVd/rZnM58EVCG1AAWOh77T2mPCNi7Tfyeq3Tl3HhwPw0
         H9JLKK18AiLSRyEpbV4nOiiuRyKsV+kTcuoMu1AZs4Z4+D1qfnUVSd4XLcqqgJfI2AkF
         WZNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772831658; x=1773436458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/z/ouJ872IWkcvAn8ch9joFmYQyPZ8EqwlLbtxBAd4=;
        b=M7zK2vQ/U31AYKe2Ik/khfudIMlL1sBaZrEfmYp5C/SNPrpjyD8RNrm3WDp3CTIyaf
         JEzxxRNH6eXFr63bPKG0TFk78AP1TnzlSSjgOQKOSbV3WKEURxi+aLZqRiimgrG25DVL
         LjRBJUHsh5jNNDFFfyuL2n0SO68TVtSCSIf1AHAMj2itKTVxtLtnxOsnhc76ECudo1Be
         +arfPw9dXDKyUHRG/L3vM/NWTqZNmYy12tphFrV/niTnbJOjhrnJx4WW0Fpz7kCQO7Va
         2DnPGDEe4qUzOnZ2br7ijimKpXI3X3PM7mcwYKfe25U2cqB4x6a1R4MbpaNMEonBE0uN
         cWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772831658; x=1773436458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G/z/ouJ872IWkcvAn8ch9joFmYQyPZ8EqwlLbtxBAd4=;
        b=GIrLogS13ifkdvJZsiN1o6mtOx9VEY8t+lggbwLOnXP2GTY/CxiP/ixAgxXHBXfvLB
         A8uH9N93XDRqxUkg/l/TCMJ1RjQNy7QmBphCouxAKZ8x6+4a1XJFfGOj3uy82LuDklDs
         efOJhiyY3OitbfV8Tp7tIqlmSOAmo/jfI9PIW0YmhR0VsNLizBLOQHILOZ+nSzPOTx6R
         QXtkB2XVGKM5nWqv2df7geEHhHVbMEK94Jl4V6NoO2G4lImNqy5rOlOKtKBrDWRds/uE
         ANKAKHbovBuL3YpH4fKxPK4rJvVGffkzZ3wgMbDfl7Ry4gwsHhcGetBMbMd775FisTSS
         OGyg==
X-Forwarded-Encrypted: i=1; AJvYcCXx9tz2zXs2vsEzmkp5Rx2a2ttPqxLrvGdGIiqxnfXRGGv3GBW7yxe0xHWKrF7WJEsstWrBc6SoZMCVV7ug8j4xe6zp@vger.kernel.org
X-Gm-Message-State: AOJu0YwavrANrsDvw2Sk9BJfpHt+vleyyTsT53iLqPMlMf509WFLtg+O
	CmEjC74axrGEc6pi1cXU+R9jx7+9rRvbIZpj+cKO6a09wBgj+T7n9SkH7u8bUOXI9sCaOJ2qI6v
	a3/fFOfFG3BijmQJeb2EbLrOkpfTbtwQ=
X-Gm-Gg: ATEYQzxuDhJoZ5U/68ICyLFFZyssXI0cU+TtdRKQHszjTLkYu8nRz8ThXxMC8+CxfWU
	XOsZYch5R1EkYlO2gVdOQa81zzsI+6QhT6k3u1zyMgJ0i0CY1cXQCZDgJRaJdp5PZjKzU1GUExe
	HSEm4IkDlUo29pb/m7hxpsBI96j+4znDotzA5OFicCr+Gg9o6luak66FxjXgd/tS4K6Nm0m8ebo
	FGSVP8GJS92uRLVMsfoCtSucQLdtFFbVUEfxVsZj5aO9kgGC6HhBniqSTLIWhE02hakMHC4R1O2
	rg==
X-Received: by 2002:a05:6214:f63:b0:899:f6bb:331f with SMTP id
 6a1803df08f44-89a30acb563mr54238836d6.41.1772831658092; Fri, 06 Mar 2026
 13:14:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305181751.3642846-1-lkml@antheas.dev> <20260305181751.3642846-3-lkml@antheas.dev>
In-Reply-To: <20260305181751.3642846-3-lkml@antheas.dev>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 6 Mar 2026 13:14:06 -0800
X-Gm-Features: AaiRm51iraXhYCM1H1ZMcNTmmiPVVlw4Ew3E6G3F8jr-JYfdIe30nrI6B4K9wxs
Message-ID: <CAFqHKTkUx8KYr78dJt3tqMAbx5HpQQQbuAE04Dz2DH3RX14xGg@mail.gmail.com>
Subject: Re: [RFC v2 2/2] platform/x86/amd: Add AMD DPTCi driver
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Mario.Limonciello@amd.com, W_Armin@gmx.de, sashal@kernel.org, 
	Shyam-Sundar.S-k@amd.com, denis.benato@linux.dev, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 10:19=E2=80=AFAM Antheas Kapenekakis <lkml@antheas.d=
ev> wrote:

> Implement a driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power
> and Thermal Configuration Interface (DPTCi). This function allows
> userspace to configure APU power and thermal parameters at runtime by
> calling the \_SB.ALIB ACPI method with a packed parameter buffer.
>
> Unlike mainstream AMD laptops, the handheld devices targeted by this
> driver do not implement vendor-specific WMI or EC hooks for TDP control.
> The ones that do, use DPTCi under the hood. For these devices, exposing
> the ALIB interface is the only viable mechanism for the OS to adjust
> power limits, making a dedicated kernel driver the correct approach
> rather than relying on unrestricted access to /dev/mem or ACPI method
> invocation from userspace.

Hi Antheas,

Thanks for the CC. I've long opined the lack of having a generic
interface for these features in the kernel. With that being said, I
think very careful consideration for the interface is a necessity. We
never want to have the chance for an unsuspecting or inexperienced
user to have hardware malfunctions by misusing the interface. As a
general rule I think it would be good for each individual device added
to have a tested-by tag before it is included. That message would
preferably include some sort of metadata identifying the true hardware
limits (tech docs if available, but marketing material or OEM software
screenshots would be sufficient, we know how some of these companies
are with information)

> The driver matches the ABI of asus-armoury, by exposing a platform
> profile with reasonable tunings for devices depending on their max
> thermal envelope, and {ppt_pl1_spl,ppt_pl2_sppt,ppt_pl3_fppt,cpu_temp}
> tunables which only become writable when the profile is custom,
> otherwise they are read-only and reflect the current profile.
>
> The default profile is custom so that we do not write to the device
> until userspace explicitly selects a profile, remaining at firmware
> defaults.

I see what you're trying to do here, but I'm a bit conflicted on the
implementation. Hardware defaults are there for a reason after all...
Part of the original discussion with custom was that setting it would
taint the kernel to inform remote troubleshooters that there was a
non-standard change. TBS I don't see that in the actual code for
acpi/platform_profile.c so maybe the intention was that the drivers
themselves set it? If that's the case then I'll need to submit a patch
to add that to lenovo-wmi-gamezone so I'm compliant. I'd like Mario's
input on that first as IMO it makes more sense to do it as a blanket
in the platform class, or we don't bother as we expect drivers to
respect the TDP limits set by ODM/OEM. If we do end up doing that
though, just booting a device with this driver would automatically
taint the kernel, which is certainly not the desired behavior. I'm not
sure how to best square that circle. Do we know the BIOS defaults for
all the devices we're adding here? I'd expect that would correspond
with balanced most of the time, so perhaps making sure those match is
a good compromise.


> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  MAINTAINERS                       |    6 +
>  drivers/platform/x86/amd/Kconfig  |   16 +
>  drivers/platform/x86/amd/Makefile |    2 +
>  drivers/platform/x86/amd/dptc.c   | 1255 +++++++++++++++++++++++++++++
>  4 files changed, 1279 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/dptc.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e08767323763..915293594641 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1096,6 +1096,12 @@ S:       Supported
>  F:     drivers/gpu/drm/amd/display/dc/dml/
>  F:     drivers/gpu/drm/amd/display/dc/dml2_0/
>
> +AMD DPTC DRIVER
> +M:     Antheas Kapenekakis <lkml@antheas.dev>
> +L:     platform-driver-x86@vger.kernel.org
> +S:     Maintained
> +F:     drivers/platform/x86/amd/dptc.c
> +
>  AMD FAM15H PROCESSOR POWER MONITORING DRIVER
>  M:     Huang Rui <ray.huang@amd.com>
>  L:     linux-hwmon@vger.kernel.org
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/=
Kconfig
> index b813f9265368..ee79a2c084a8 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -44,3 +44,19 @@ config AMD_ISP_PLATFORM
>
>           This driver can also be built as a module. If so, the module
>           will be called amd_isp4.
> +
> +config AMD_DPTC
> +       tristate "AMD Dynamic Power and Thermal Configuration Interface (=
DPTCi)"
> +       depends on X86_64 && ACPI && DMI
> +       select ACPI_PLATFORM_PROFILE
> +       select FIRMWARE_ATTRIBUTES_CLASS
> +       help
> +         Driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
> +         Thermal Configuration Interface (DPTCi). Exposes TDP and therma=
l
> +         parameters for AMD APU-based handheld devices via the
> +         firmware-attributes sysfs ABI, allowing userspace tools to stag=
e
> +         and atomically commit power limit settings. Requires a DMI matc=
h
> +         for the device and a recognized AMD SoC.
> +
> +         If built as a module, the module will be called amd_dptc.
> +
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd=
/Makefile
> index f6ff0c837f34..862a609bfe38 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -12,3 +12,5 @@ obj-$(CONFIG_AMD_PMF)         +=3D pmf/
>  obj-$(CONFIG_AMD_WBRF)         +=3D wbrf.o
>  obj-$(CONFIG_AMD_ISP_PLATFORM) +=3D amd_isp4.o
>  obj-$(CONFIG_AMD_HFI)          +=3D hfi/
> +obj-$(CONFIG_AMD_DPTC)         +=3D amd_dptc.o
> +amd_dptc-y                     :=3D dptc.o
> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/d=
ptc.c
> new file mode 100644
> index 000000000000..68d9d3b85cb6
> --- /dev/null
> +++ b/drivers/platform/x86/amd/dptc.c
> @@ -0,0 +1,1255 @@
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
> +#include <linux/platform_profile.h>
> +#include <linux/processor.h>
> +#include <linux/sysfs.h>
> +#include <linux/unaligned.h>
> +
> +#include "../firmware_attributes_class.h"
> +
> +#define DRIVER_NAME            "amd_dptc"
> +
> +#define ALIB_FUNC_DPTC         0x0C
> +#define ALIB_PATH              "\\_SB.ALIB"
> +
> +/* ALIB parameter IDs (AGESA spec Appendix E.5, Table E-52) */
> +#define ALIB_ID_TEMP_TARGET    0x03
> +#define ALIB_ID_STAPM_LIMIT    0x05
> +#define ALIB_ID_FAST_LIMIT     0x06
> +#define ALIB_ID_SLOW_LIMIT     0x07
> +#define ALIB_ID_SKIN_LIMIT     0x2E
> +
> +enum dptc_param_idx {
> +       DPTC_PPT_PL1_SPL,       /* STAPM + skin limit (set together) */
> +       DPTC_PPT_PL2_SPPT,      /* slow PPT limit */
> +       DPTC_PPT_PL3_FPPT,      /* fast PPT limit */
> +       DPTC_CPU_TEMP,          /* thermal control target */
> +       DPTC_NUM_PARAMS,
> +};
> +
> +struct dptc_param_limits {
> +       u32 min;        /* expanded floor:   widest safe hardware minimum=
 */
> +       u32 smin;       /* device floor:     safe operating minimum */
> +       u32 def;        /* default hint for userspace */
> +       u32 smax;       /* device ceiling:   safe operating maximum */
> +       u32 max;        /* expanded ceiling: widest safe hardware maximum=
 */
> +};
> +
> +struct dptc_profile {
> +       u32 vals[DPTC_NUM_PARAMS];      /* 0 =3D don't set / unstage this=
 param */
> +};
> +
> +struct dptc_device_limits {
> +       struct dptc_param_limits params[DPTC_NUM_PARAMS];
> +       struct dptc_profile profiles[PLATFORM_PROFILE_LAST];
> +};
> +
> +struct dptc_param_desc {
> +       const char *name;
> +       const char *display_name;
> +       u8 param_id;
> +       u8 param_id2;   /* secondary ALIB ID, 0 if none */
> +};
> +
> +static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] =3D {
> +       [DPTC_PPT_PL1_SPL]  =3D { "ppt_pl1_spl",  "Sustained power limit =
(mW)",
> +               ALIB_ID_STAPM_LIMIT, ALIB_ID_SKIN_LIMIT },
> +       [DPTC_PPT_PL2_SPPT] =3D { "ppt_pl2_sppt", "Slow PPT limit (mW)",
> +               ALIB_ID_SLOW_LIMIT },
> +       [DPTC_PPT_PL3_FPPT] =3D { "ppt_pl3_fppt", "Fast PPT limit (mW)",
> +               ALIB_ID_FAST_LIMIT },
> +       [DPTC_CPU_TEMP]     =3D { "cpu_temp",     "Thermal control limit =
(C)",
> +               ALIB_ID_TEMP_TARGET },
> +};

You already mentioned this elsewhere, but I agree that using W over mW
would make sense to keep the interfaces consistent.

> +/* 18W class: AYANEO AIR Plus (Ryzen 5 5560U) */
> +static const struct dptc_device_limits limits_18w =3D { .params =3D {
> +       [DPTC_PPT_PL1_SPL]  =3D {     0,  5000, 15000, 18000, 22000 },
> +       [DPTC_PPT_PL2_SPPT] =3D {     0,  5000, 15000, 18000, 22000 },
> +       [DPTC_PPT_PL3_FPPT] =3D {     0,  5000, 15000, 20000, 25000 },
> +       [DPTC_CPU_TEMP]     =3D {    60,    70,    85,    90,   100 },
> +}, .profiles =3D {
> +       [PLATFORM_PROFILE_LOW_POWER]   =3D { .vals =3D {  5000,  5000,  8=
000, 0 } },
> +       [PLATFORM_PROFILE_BALANCED]    =3D { .vals =3D { 12000, 14000, 15=
000, 0 } },
> +       [PLATFORM_PROFILE_PERFORMANCE] =3D { .vals =3D { 18000, 18000, 20=
000, 0 } },
> +}};
> +

I would personally prefer these be set directly in the DMI match per
device. Its more code in the end, but its more cautious, as each
manufacturer has a bespoke cooling solution. Assuming they're all
equivalent is not best practice IMO. I have quite a bit of historical
data on this so I can help fill in the blanks where it is missing.

> +/* 25W class: Ryzen 5000 handhelds (AYANEO NEXT, KUN) */
> +static const struct dptc_device_limits limits_25w =3D { .params =3D {
> +       [DPTC_PPT_PL1_SPL]  =3D {     0,  4000, 15000, 25000, 32000 },
> +       [DPTC_PPT_PL2_SPPT] =3D {     0,  4000, 20000, 27000, 35000 },
> +       [DPTC_PPT_PL3_FPPT] =3D {     0,  4000, 25000, 30000, 37000 },
> +       [DPTC_CPU_TEMP]     =3D {    60,    70,    85,    90,   100 },
> +}, .profiles =3D {
> +       [PLATFORM_PROFILE_LOW_POWER]   =3D { .vals =3D {  8000,  8000, 12=
000, 0 } },
> +       [PLATFORM_PROFILE_BALANCED]    =3D { .vals =3D { 15000, 17000, 20=
000, 0 } },
> +       [PLATFORM_PROFILE_PERFORMANCE] =3D { .vals =3D { 25000, 27000, 30=
000, 0 } },
> +}};
>
> +/* 28W class: GPD Win series, AYANEO 2, OrangePi NEO-01 */
> +static const struct dptc_device_limits limits_28w =3D { .params =3D {
> +       [DPTC_PPT_PL1_SPL]  =3D {     0,  4000, 15000, 28000, 32000 },
> +       [DPTC_PPT_PL2_SPPT] =3D {     0,  4000, 20000, 30000, 35000 },
> +       [DPTC_PPT_PL3_FPPT] =3D {     0,  4000, 25000, 32000, 37000 },
> +       [DPTC_CPU_TEMP]     =3D {    60,    70,    85,    90,   100 },
> +}, .profiles =3D {
> +       [PLATFORM_PROFILE_LOW_POWER]   =3D { .vals =3D {  8000,  8000, 12=
000, 0 } },
> +       [PLATFORM_PROFILE_BALANCED]    =3D { .vals =3D { 15000, 17000, 22=
000, 0 } },
> +       [PLATFORM_PROFILE_PERFORMANCE] =3D { .vals =3D { 25000, 28000, 32=
000, 0 } },
> +       [PLATFORM_PROFILE_MAX_POWER]   =3D { .vals =3D { 28000, 30000, 32=
000, 0 } },
> +}};
> +
> +/* 30W class: OneXPlayer, AYANEO AIR/FLIP/GEEK/SLIDE/3, AOKZOE */
> +static const struct dptc_device_limits limits_30w =3D { .params =3D {
> +       [DPTC_PPT_PL1_SPL]  =3D {     0,  4000, 15000, 30000, 40000 },
> +       [DPTC_PPT_PL2_SPPT] =3D {     0,  4000, 20000, 32000, 43000 },
> +       [DPTC_PPT_PL3_FPPT] =3D {     0,  4000, 25000, 41000, 50000 },
> +       [DPTC_CPU_TEMP]     =3D {    60,    70,    85,    90,   100 },
> +}, .profiles =3D {
> +       [PLATFORM_PROFILE_LOW_POWER]   =3D { .vals =3D {  8000,  8000, 12=
000, 0 } },
> +       [PLATFORM_PROFILE_BALANCED]    =3D { .vals =3D { 15000, 17000, 25=
000, 0 } },
> +       [PLATFORM_PROFILE_PERFORMANCE] =3D { .vals =3D { 25000, 28000, 41=
000, 0 } },
> +       [PLATFORM_PROFILE_MAX_POWER]   =3D { .vals =3D { 30000, 32000, 41=
000, 0 } },
> +}};
> +
> +/* AI MAX Handheld class: GPD Win 5 */
> +static const struct dptc_device_limits limits_maxhh =3D { .params =3D {
This struct name seems arbitrary compared to the others. If this is
the eventual pattern this should just be called _80w

> +       [DPTC_PPT_PL1_SPL]  =3D {      0,  4000, 25000,  80000, 100000 },
> +       [DPTC_PPT_PL2_SPPT] =3D {      0,  4000, 27000,  82000, 100000 },
> +       [DPTC_PPT_PL3_FPPT] =3D {      0,  4000, 40000,  85000, 100000 },
> +       [DPTC_CPU_TEMP]     =3D {     60,    70,    95,     95,    100 },
> +}, .profiles =3D {
> +       [PLATFORM_PROFILE_LOW_POWER]   =3D { .vals =3D { 15000, 15000, 25=
000, 0 } },
> +       [PLATFORM_PROFILE_BALANCED]    =3D { .vals =3D { 25000, 27000, 40=
000, 0 } },
> +       [PLATFORM_PROFILE_PERFORMANCE] =3D { .vals =3D { 60000, 63000, 85=
000, 0 } },
> +       [PLATFORM_PROFILE_MAX_POWER]   =3D { .vals =3D { 80000, 82000, 85=
000, 0 } },
> +}};

One other thing to consider is AC vs DC power draw. Thermal load is
important, but we also want to avoid over-stressing the battery on
these devices. I would restrict MAX_POWER to when AC is plugged ad
return an error if on DC, and ensure PERFORMANCE is at or just below
peak DC power draw. I didn't do this in gamezone on Lenovo because
those limits are BIOS enforced and MAX_POWER will just match
PERFORMANCE on DC.

> +/* Substring matches against boot_cpu_data.x86_model_id; order matters. =
*/
> +static const char * const dptc_soc_table[] =3D {
> +       /* AI MAX */
> +       "AMD RYZEN AI MAX+ 395",
> +       "AMD RYZEN AI MAX+ 385",
> +       "AMD RYZEN AI MAX 380",
> +       /* Ryzen AI */
> +       "AMD Ryzen AI 9 HX 370",
> +       "AMD Ryzen AI HX 360",
> +       /* Z1 - Extreme before plain Z1 */
> +       "AMD Ryzen Z1 Extreme",
> +       "AMD Ryzen Z1",
> +       /* Ryzen 8000 */
> +       "AMD Ryzen 7 8840U",
> +       /* Ryzen 7040 */
> +       "AMD Ryzen 7 7840U",
> +       /* Ryzen 6000 */
> +       "AMD Ryzen 7 6800U",
> +       "AMD Ryzen 7 6600U",
> +       /* Ryzen 5000 */
> +       "AMD Ryzen 7 5800U",
> +       "AMD Ryzen 7 5700U",
> +       "AMD Ryzen 5 5560U",
> +       NULL,
> +};

I have some data on 4800/4800U and AMD Athelon Silver APU devices as
well. When I return from my conference I can post some DSDT dumps to
validate the interface is present on them as well.

> +static const struct dmi_system_id dptc_dmi_table[] =3D {
> +       /* GPD */
> +       {
> +               .ident =3D "GPD Win Mini",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "G1617-01"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       {
> +               .ident =3D "GPD Win Mini 2024",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       {
> +               .ident =3D "GPD Win Mini 2024",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02-L"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       {
> +               .ident =3D "GPD Win 4",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       {
> +               .ident =3D "GPD Win 5",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "G1618-05"),
> +               },
> +               .driver_data =3D (void *)&limits_maxhh,
> +       },
> +       {
> +               .ident =3D "GPD Win Max 2",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "G1619-04"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       {
> +               .ident =3D "GPD Win Max 2 2024",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "G1619-05"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       {
> +               .ident =3D "GPD Duo",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       {
> +               .ident =3D "GPD Duo",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01-L"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       {
> +               .ident =3D "GPD Pocket 4",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       {
> +               .ident =3D "GPD Pocket 4",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04-L"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       /* OrangePi */
> +       {
> +               .ident =3D "OrangePi NEO-01",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEO-01"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       /* AYN */
> +       {
> +               .ident =3D "AYN Loki Max",
> +               .matches =3D {
> +                       DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       /* Tectoy (Zeenix Pro =3D Loki Max) */
> +       {
> +               .ident =3D "Zeenix Pro",
> +               .matches =3D {
> +                       DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Pro"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       /* AOKZOE */
> +       {
> +               .ident =3D "AOKZOE A1 AR07",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07")=
,
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "AOKZOE A1 Pro",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 Pro"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "AOKZOE A1X",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1X"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "AOKZOE A2 Pro",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       /* OneXPlayer (Intel variants filtered by SoC table) */
> +       {
> +               .ident =3D "ONEXPLAYER F1Pro",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1Pro=
"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "ONEXPLAYER F1 EVA-02",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1 EV=
A-02"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "ONEXPLAYER 2",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 2"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "ONEXPLAYER X1 A",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 A"=
),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "ONEXPLAYER X1z",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1z")=
,
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "ONEXPLAYER X1Pro",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Pro=
"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "ONEXPLAYER G1 A",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 A"=
),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       /* AYANEO - 18W */
> +       {
> +               .ident =3D "AYANEO AIR Plus",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Plus"),
> +               },
> +               .driver_data =3D (void *)&limits_18w,
> +       },
> +       /* AYANEO - 25W */
> +       {
> +               .ident =3D "AYANEO NEXT Advance",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
> +               },
> +               .driver_data =3D (void *)&limits_25w,
> +       },

AYANEO went through a strange DMI phase, many of the first run of NEXT
devices are prefaced with AYANEO in the board name as well

> +       {
> +               .ident =3D "AYANEO NEXT Lite",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Lite"),
> +               },
> +               .driver_data =3D (void *)&limits_25w,
> +       },
> +       {
> +               .ident =3D "AYANEO NEXT Pro",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
> +               },
> +               .driver_data =3D (void *)&limits_25w,
> +       },
> +       {
> +               .ident =3D "AYANEO NEXT",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
> +               },
> +               .driver_data =3D (void *)&limits_25w,
> +       },
> +       {
> +               .ident =3D "AYANEO KUN",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
> +               },
> +               .driver_data =3D (void *)&limits_25w,
> +       },
> +       {
> +               .ident =3D "AYANEO KUN",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO KUN"),
> +               },
> +               .driver_data =3D (void *)&limits_25w,
> +       },
> +       /* AYANEO - 28W */
> +       {
> +               .ident =3D "AYANEO 2",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       {
> +               .ident =3D "SuiPlay0X1",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
> +               },
> +               .driver_data =3D (void *)&limits_28w,
> +       },
> +       /* AYANEO - 30W */
> +       {
> +               /* Must come before the shorter "AIR" match */
> +               .ident =3D "AYANEO AIR 1S",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "AIR 1S"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "AYANEO AIR Pro",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "AYANEO AIR",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },

The original air is max 15w, air pro is 18w. I didn't scrutinize the
rest as closely, but these will need to be validated per device.
(Hence my reccomendation above)

> +       {
> +               /* DMI_MATCH catches all FLIP variants (DS, KB, 1S DS, 1S=
 KB) */
> +               .ident =3D "AYANEO FLIP",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               /* DMI_MATCH catches GEEK and GEEK 1S */
> +               .ident =3D "AYANEO GEEK",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "AYANEO SLIDE",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "SLIDE"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       {
> +               .ident =3D "AYANEO 3",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
> +               },
> +               .driver_data =3D (void *)&limits_30w,
> +       },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
> +
> +struct dptc_priv;
> +
> +struct dptc_attr_sysfs {
> +       struct dptc_priv *priv;
> +       struct kobj_attribute current_value;
> +       struct kobj_attribute default_value;
> +       struct kobj_attribute min_value;
> +       struct kobj_attribute max_value;
> +       struct kobj_attribute scalar_increment;
> +       struct kobj_attribute display_name;
> +       struct kobj_attribute type;
> +       struct attribute *attrs[8];
> +       struct attribute_group group;
> +       int idx;
> +};
> +
> +struct dptc_priv {
> +       struct device *fw_attr_dev;
> +       struct kset *fw_attr_kset;
> +
> +       const struct dptc_device_limits *dev_limits;
> +
> +       bool expanded;
> +
> +       enum platform_profile_option profile;
> +       struct device *ppdev;
> +
> +       enum dptc_save_mode { SAVE_SINGLE, SAVE_BULK } save_mode;
> +
> +       u32 staged[DPTC_NUM_PARAMS];
> +       bool has_staged[DPTC_NUM_PARAMS];
> +
> +       /* Protects mutable driver state */
> +       struct mutex lock;
> +
> +       struct dptc_attr_sysfs params[DPTC_NUM_PARAMS];
> +       struct dptc_attr_sysfs expanded_attr;
> +       struct kobj_attribute save_settings_attr;
> +};
> +
> +static struct platform_device *dptc_pdev;
> +
> +static u32 dptc_get_min(struct dptc_priv *dptc, int idx)
> +{
> +       return dptc->expanded ? dptc->dev_limits->params[idx].min
> +                             : dptc->dev_limits->params[idx].smin;
> +}
> +
> +static u32 dptc_get_max(struct dptc_priv *dptc, int idx)
> +{
> +       return dptc->expanded ? dptc->dev_limits->params[idx].max
> +                             : dptc->dev_limits->params[idx].smax;
> +}
> +
> +static u32 dptc_get_default(struct dptc_priv *dptc, int idx)
> +{
> +       return dptc->dev_limits->params[idx].def;
> +}
> +
> +static int dptc_alib_call(const u8 *ids, const u32 *vals, int count)
> +{
> +       union acpi_object in_params[2];
> +       struct acpi_object_list input;
> +       acpi_status status;
> +       u32 buf_size;
> +       int i, off;
> +       u8 *buf;
> +
> +       if (count =3D=3D 0)
> +               return -EINVAL;
> +
> +       /* Buffer layout: WORD total_size + count * (BYTE id + DWORD valu=
e) */
> +       buf_size =3D 2 + count * 5;
> +       buf =3D kzalloc(buf_size, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       put_unaligned_le16(buf_size, buf);
> +
> +       for (i =3D 0; i < count; i++) {
> +               off  =3D 2 + i * 5;
> +               buf[off] =3D ids[i];
> +               put_unaligned_le32(vals[i], buf + off + 1);
> +       }
> +
> +       in_params[0].type          =3D ACPI_TYPE_INTEGER;
> +       in_params[0].integer.value =3D ALIB_FUNC_DPTC;
> +       in_params[1].type          =3D ACPI_TYPE_BUFFER;
> +       in_params[1].buffer.length  =3D buf_size;
> +       in_params[1].buffer.pointer =3D buf;
> +
> +       input.count   =3D 2;
> +       input.pointer =3D in_params;
> +
> +       status =3D acpi_evaluate_object(NULL, ALIB_PATH, &input, NULL);
> +       kfree(buf);
> +
> +       if (ACPI_FAILURE(status)) {
> +               pr_err("ALIB call failed: %s\n",
> +                      acpi_format_exception(status));
> +               return -EIO;
> +       }
> +
> +       pr_debug("sent %d ALIB parameter(s)\n", count);
> +       return 0;
> +}
> +
> +static int dptc_alib_send_one(int idx, u32 val)
> +{
> +       u32 vals[2];
> +       u8 ids[2];
> +       int count =3D 0;
> +
> +       ids[count]  =3D dptc_params[idx].param_id;
> +       vals[count] =3D val;
> +       count++;
> +       if (dptc_params[idx].param_id2) {
> +               ids[count]  =3D dptc_params[idx].param_id2;
> +               vals[count] =3D val;
> +               count++;
> +       }
> +
> +       return dptc_alib_call(ids, vals, count);
> +}
> +
> +static int dptc_alib_save(struct dptc_priv *dptc)
> +{
> +       u32 vals[DPTC_NUM_PARAMS * 2];
> +       u8 ids[DPTC_NUM_PARAMS * 2];
> +       int i, count =3D 0;
> +
> +       for (i =3D 0; i < DPTC_NUM_PARAMS; i++) {
> +               if (!dptc->has_staged[i])
> +                       continue;
> +               ids[count]  =3D dptc_params[i].param_id;
> +               vals[count] =3D dptc->staged[i];
> +               count++;
> +               if (dptc_params[i].param_id2) {
> +                       ids[count]  =3D dptc_params[i].param_id2;
> +                       vals[count] =3D dptc->staged[i];
> +                       count++;
> +               }
> +       }
> +
> +       if (!count)
> +               return 0;
> +
> +       return dptc_alib_call(ids, vals, count);
> +}
> +
> +/* Sysfs callbacks */
> +
> +static ssize_t dptc_current_value_show(struct kobject *kobj,
> +                                      struct kobj_attribute *attr, char =
*buf)
> +{
> +       struct dptc_attr_sysfs *ps =3D
> +               container_of(attr, struct dptc_attr_sysfs, current_value)=
;

I think this can be one line.

> +       struct dptc_priv *dptc =3D ps->priv;
> +
> +       guard(mutex)(&dptc->lock);
> +
> +       if (dptc->profile !=3D PLATFORM_PROFILE_CUSTOM) {
> +               u32 val =3D dptc->dev_limits->profiles[dptc->profile].val=
s[ps->idx];

Is the interface RO? If we can read the value from hardware that would
be preferable, in case separate userspace or PMF changes this behind
the scenes. If we can avoid the kernel getting out of sync with the
hardware that would be better.

> +               if (!val)
> +                       return sysfs_emit(buf, "\n");
> +               return sysfs_emit(buf, "%u\n", val);
> +       }
> +
> +       if (!dptc->has_staged[ps->idx])
> +               return sysfs_emit(buf, "\n");
> +       return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
> +}
> +
> +static ssize_t dptc_current_value_store(struct kobject *kobj,
> +                                       struct kobj_attribute *attr,
> +                                       const char *buf, size_t count)
> +{
> +       struct dptc_attr_sysfs *ps =3D
> +               container_of(attr, struct dptc_attr_sysfs, current_value)=
;
> +       struct dptc_priv *dptc =3D ps->priv;
> +       u32 val, min, max;
> +       int ret;
> +
> +       if (count =3D=3D 1 && buf[0] =3D=3D '\n') {
> +               guard(mutex)(&dptc->lock);
> +
> +               if (dptc->profile !=3D PLATFORM_PROFILE_CUSTOM)
> +                       return -EPERM;

Note for myself, this is a better error code than what I'm doing IIRC.

> +               dptc->has_staged[ps->idx] =3D false;
> +               return count;
> +       }
> +
> +       ret =3D kstrtou32(buf, 10, &val);
> +       if (ret)
> +               return ret;
> +
> +       guard(mutex)(&dptc->lock);
> +
> +       if (dptc->profile !=3D PLATFORM_PROFILE_CUSTOM)
> +               return -EPERM;

Why do this twice? You can check this first and then use a scoped guard.

> +       min =3D dptc_get_min(dptc, ps->idx);
> +       max =3D dptc_get_max(dptc, ps->idx);
> +       if (val < min || (max && val > max))
> +               return -EINVAL;
> +       dptc->staged[ps->idx]    =3D val;
> +       dptc->has_staged[ps->idx] =3D true;
> +       if (dptc->save_mode =3D=3D SAVE_SINGLE)
> +               ret =3D dptc_alib_send_one(ps->idx, val);
> +
> +       return ret ? ret : count;
> +}
> +
> +static ssize_t dptc_default_value_show(struct kobject *kobj,
> +                                      struct kobj_attribute *attr, char =
*buf)
> +{
> +       struct dptc_attr_sysfs *ps =3D
> +               container_of(attr, struct dptc_attr_sysfs, default_value)=
;
> +

Another should be one liner, there are a few more but I'm not going to
tag each one. Additional note, what is ps supposed to stand for?
Verbose variable names improve readability.

> +       return sysfs_emit(buf, "%u\n", dptc_get_default(ps->priv, ps->idx=
));
> +}
> +
> +static ssize_t dptc_min_value_show(struct kobject *kobj,
> +                                  struct kobj_attribute *attr, char *buf=
)
> +{
> +       struct dptc_attr_sysfs *ps =3D
> +               container_of(attr, struct dptc_attr_sysfs, min_value);
> +       struct dptc_priv *dptc =3D ps->priv;
> +
> +       guard(mutex)(&dptc->lock);
> +
> +       return sysfs_emit(buf, "%u\n", dptc_get_min(dptc, ps->idx));
> +}
> +
> +static ssize_t dptc_max_value_show(struct kobject *kobj,
> +                                  struct kobj_attribute *attr, char *buf=
)
> +{
> +       struct dptc_attr_sysfs *ps =3D
> +               container_of(attr, struct dptc_attr_sysfs, max_value);
> +       struct dptc_priv *dptc =3D ps->priv;
> +
> +       guard(mutex)(&dptc->lock);
> +
> +       return sysfs_emit(buf, "%u\n", dptc_get_max(dptc, ps->idx));
> +}
> +
> +static ssize_t dptc_scalar_increment_show(struct kobject *kobj,
> +                                         struct kobj_attribute *attr, ch=
ar *buf)
> +{
> +       return sysfs_emit(buf, "1\n");
> +}
> +
> +static ssize_t dptc_display_name_show(struct kobject *kobj,
> +                                     struct kobj_attribute *attr, char *=
buf)
> +{
> +       struct dptc_attr_sysfs *ps =3D
> +               container_of(attr, struct dptc_attr_sysfs, display_name);
> +       return sysfs_emit(buf, "%s\n", dptc_params[ps->idx].display_name)=
;
> +}
> +
> +static ssize_t dptc_type_show(struct kobject *kobj,
> +                             struct kobj_attribute *attr, char *buf)
> +{
> +       return sysfs_emit(buf, "integer\n");
> +}
> +
> +static ssize_t dptc_save_settings_show(struct kobject *kobj,
> +                                      struct kobj_attribute *attr, char =
*buf)
> +{
> +       struct dptc_priv *dptc =3D
> +               container_of(attr, struct dptc_priv, save_settings_attr);
> +
> +       guard(mutex)(&dptc->lock);
> +
> +       if (dptc->save_mode =3D=3D SAVE_SINGLE)
> +               return sysfs_emit(buf, "single\n");
> +       return sysfs_emit(buf, "bulk\n");
> +}
> +
> +static ssize_t dptc_save_settings_store(struct kobject *kobj,
> +                                       struct kobj_attribute *attr,
> +                                       const char *buf, size_t count)
> +{
> +       struct dptc_priv *dptc =3D
> +               container_of(attr, struct dptc_priv, save_settings_attr);
> +       int ret =3D 0;
> +
> +       guard(mutex)(&dptc->lock);
> +
> +       if (sysfs_streq(buf, "save"))
> +               ret =3D dptc_alib_save(dptc);
> +       else if (sysfs_streq(buf, "single"))
> +               dptc->save_mode =3D SAVE_SINGLE;
> +       else if (sysfs_streq(buf, "bulk"))
> +               dptc->save_mode =3D SAVE_BULK;
> +       else
> +               return -EINVAL;
> +
> +       return ret ? ret : count;
> +}
> +
> +static ssize_t dptc_expanded_current_value_show(struct kobject *kobj,
> +                                               struct kobj_attribute *at=
tr,
> +                                               char *buf)
> +{
> +       struct dptc_attr_sysfs *ps =3D
> +               container_of(attr, struct dptc_attr_sysfs, current_value)=
;
> +       struct dptc_priv *dptc =3D ps->priv;
> +
> +       guard(mutex)(&dptc->lock);
> +
> +       return sysfs_emit(buf, "%d\n", dptc->expanded);
> +}
> +

What is the actual purpose of these expanded attrs? IMO we should only
load automatically within a validated range per device. TBS, there is
a valid need for R&D loading, so either a debugfs as Mario suggested
or a module param can be used to load the driver without limits. In
that case, I would just set max to u16 max and min to 0 and offer a
very stern dev_warn in dmesg, then you can avoid duplicated
_show/_store functions.

> +static ssize_t dptc_expanded_current_value_store(struct kobject *kobj,
> +                                                struct kobj_attribute *a=
ttr,
> +                                                const char *buf, size_t =
count)
> +{
> +       struct dptc_attr_sysfs *ps =3D
> +               container_of(attr, struct dptc_attr_sysfs, current_value)=
;
> +       struct dptc_priv *dptc =3D ps->priv;
> +       bool val;
> +       int ret;
> +
> +       ret =3D kstrtobool(buf, &val);
> +       if (ret)
> +               return ret;
> +
> +       guard(mutex)(&dptc->lock);
> +
> +       if (dptc->profile !=3D PLATFORM_PROFILE_CUSTOM)
> +               return -EPERM;
> +       dptc->expanded =3D val;
> +       /* Clear staged values: limits changed, old values may be out of =
range */
> +       memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
> +
> +       return count;
> +}
> +
> +static ssize_t dptc_expanded_default_value_show(struct kobject *kobj,
> +                                               struct kobj_attribute *at=
tr,
> +                                               char *buf)
> +{
> +       return sysfs_emit(buf, "0\n");
> +}
> +
> +static ssize_t dptc_expanded_min_value_show(struct kobject *kobj,
> +                                           struct kobj_attribute *attr,
> +                                           char *buf)
> +{
> +       return sysfs_emit(buf, "0\n");
> +}
> +
> +static ssize_t dptc_expanded_max_value_show(struct kobject *kobj,
> +                                           struct kobj_attribute *attr,
> +                                           char *buf)
> +{
> +       return sysfs_emit(buf, "1\n");
> +}
> +
> +static ssize_t dptc_expanded_scalar_increment_show(struct kobject *kobj,
> +                                                  struct kobj_attribute =
*attr,
> +                                                  char *buf)
> +{
> +       return sysfs_emit(buf, "1\n");
> +}
> +
> +static ssize_t dptc_expanded_display_name_show(struct kobject *kobj,
> +                                              struct kobj_attribute *att=
r,
> +                                              char *buf)
> +{
> +       return sysfs_emit(buf, "Expanded Limits\n");
> +}
> +
> +static ssize_t dptc_expanded_type_show(struct kobject *kobj,
> +                                      struct kobj_attribute *attr, char =
*buf)
> +{
> +       return sysfs_emit(buf, "integer\n");
> +}
> +
> +/* Sysfs setup */
> +
> +static void dptc_setup_param_sysfs(struct dptc_priv *dptc,
> +                                  struct dptc_attr_sysfs *ps, int idx)
> +{
> +       ps->priv =3D dptc;
> +       ps->idx =3D idx;
> +
> +       sysfs_attr_init(&ps->current_value.attr);
> +       ps->current_value.attr.name  =3D "current_value";
> +       ps->current_value.attr.mode  =3D 0644;
> +       ps->current_value.show       =3D dptc_current_value_show;
> +       ps->current_value.store      =3D dptc_current_value_store;
> +
> +       sysfs_attr_init(&ps->default_value.attr);
> +       ps->default_value.attr.name  =3D "default_value";
> +       ps->default_value.attr.mode  =3D 0444;
> +       ps->default_value.show       =3D dptc_default_value_show;
> +
> +       sysfs_attr_init(&ps->min_value.attr);
> +       ps->min_value.attr.name      =3D "min_value";
> +       ps->min_value.attr.mode      =3D 0444;
> +       ps->min_value.show           =3D dptc_min_value_show;
> +
> +       sysfs_attr_init(&ps->max_value.attr);
> +       ps->max_value.attr.name      =3D "max_value";
> +       ps->max_value.attr.mode      =3D 0444;
> +       ps->max_value.show           =3D dptc_max_value_show;
> +
> +       sysfs_attr_init(&ps->scalar_increment.attr);
> +       ps->scalar_increment.attr.name =3D "scalar_increment";
> +       ps->scalar_increment.attr.mode =3D 0444;
> +       ps->scalar_increment.show      =3D dptc_scalar_increment_show;
> +
> +       sysfs_attr_init(&ps->display_name.attr);
> +       ps->display_name.attr.name   =3D "display_name";
> +       ps->display_name.attr.mode   =3D 0444;
> +       ps->display_name.show        =3D dptc_display_name_show;
> +
> +       sysfs_attr_init(&ps->type.attr);
> +       ps->type.attr.name           =3D "type";
> +       ps->type.attr.mode           =3D 0444;
> +       ps->type.show                =3D dptc_type_show;
> +
> +       ps->attrs[0] =3D &ps->current_value.attr;
> +       ps->attrs[1] =3D &ps->default_value.attr;
> +       ps->attrs[2] =3D &ps->min_value.attr;
> +       ps->attrs[3] =3D &ps->max_value.attr;
> +       ps->attrs[4] =3D &ps->scalar_increment.attr;
> +       ps->attrs[5] =3D &ps->display_name.attr;
> +       ps->attrs[6] =3D &ps->type.attr;
> +       ps->attrs[7] =3D NULL;
> +
> +       ps->group.name  =3D dptc_params[idx].name;
> +       ps->group.attrs =3D ps->attrs;
> +}
> +

Some "macro soup" could clean this up a lot.

> +static void dptc_setup_expanded_sysfs(struct dptc_priv *dptc,
> +                                     struct dptc_attr_sysfs *ps)
> +{
> +       ps->priv =3D dptc;
> +       sysfs_attr_init(&ps->current_value.attr);
> +       ps->current_value.attr.name  =3D "current_value";
> +       ps->current_value.attr.mode  =3D 0644;
> +       ps->current_value.show       =3D dptc_expanded_current_value_show=
;
> +       ps->current_value.store      =3D dptc_expanded_current_value_stor=
e;
> +
> +       sysfs_attr_init(&ps->default_value.attr);
> +       ps->default_value.attr.name  =3D "default_value";
> +       ps->default_value.attr.mode  =3D 0444;
> +       ps->default_value.show       =3D dptc_expanded_default_value_show=
;
> +
> +       sysfs_attr_init(&ps->min_value.attr);
> +       ps->min_value.attr.name      =3D "min_value";
> +       ps->min_value.attr.mode      =3D 0444;
> +       ps->min_value.show           =3D dptc_expanded_min_value_show;
> +
> +       sysfs_attr_init(&ps->max_value.attr);
> +       ps->max_value.attr.name      =3D "max_value";
> +       ps->max_value.attr.mode      =3D 0444;
> +       ps->max_value.show           =3D dptc_expanded_max_value_show;
> +
> +       sysfs_attr_init(&ps->scalar_increment.attr);
> +       ps->scalar_increment.attr.name =3D "scalar_increment";
> +       ps->scalar_increment.attr.mode =3D 0444;
> +       ps->scalar_increment.show      =3D dptc_expanded_scalar_increment=
_show;
> +
> +       sysfs_attr_init(&ps->display_name.attr);
> +       ps->display_name.attr.name   =3D "display_name";
> +       ps->display_name.attr.mode   =3D 0444;
> +       ps->display_name.show        =3D dptc_expanded_display_name_show;
> +
> +       sysfs_attr_init(&ps->type.attr);
> +       ps->type.attr.name           =3D "type";
> +       ps->type.attr.mode           =3D 0444;
> +       ps->type.show                =3D dptc_expanded_type_show;
> +
> +       ps->attrs[0] =3D &ps->current_value.attr;
> +       ps->attrs[1] =3D &ps->default_value.attr;
> +       ps->attrs[2] =3D &ps->min_value.attr;
> +       ps->attrs[3] =3D &ps->max_value.attr;
> +       ps->attrs[4] =3D &ps->scalar_increment.attr;
> +       ps->attrs[5] =3D &ps->display_name.attr;
> +       ps->attrs[6] =3D &ps->type.attr;
> +       ps->attrs[7] =3D NULL;
> +
> +       ps->group.name  =3D "expanded_limits";
> +       ps->group.attrs =3D ps->attrs;
> +}
> +
> +static void dptc_fw_dev_unregister(void *data)
> +{
> +       device_unregister(data);
> +}
> +
> +static void dptc_kset_unregister(void *data)
> +{
> +       kset_unregister(data);
> +}
> +
> +/* Platform profile */
> +
> +static void dptc_apply_profile(struct dptc_priv *dptc,
> +                              enum platform_profile_option profile)
> +{
> +       const struct dptc_profile *pp;
> +       int i;
> +
> +       memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
> +
> +       if (profile =3D=3D PLATFORM_PROFILE_CUSTOM)
> +               return;
> +
> +       pp =3D &dptc->dev_limits->profiles[profile];
> +       for (i =3D 0; i < DPTC_NUM_PARAMS; i++) {
> +               if (!pp->vals[i])
> +                       continue;
> +               dptc->staged[i] =3D pp->vals[i];
> +               dptc->has_staged[i] =3D true;
> +       }
> +}
> +
> +static int dptc_pp_probe(void *drvdata, unsigned long *choices)
> +{
> +       struct dptc_priv *dptc =3D drvdata;
> +       int i, j;
> +
> +       set_bit(PLATFORM_PROFILE_CUSTOM, choices);
> +       for (i =3D 0; i < PLATFORM_PROFILE_LAST; i++) {
> +               for (j =3D 0; j < DPTC_NUM_PARAMS; j++) {
> +                       if (dptc->dev_limits->profiles[i].vals[j]) {
> +                               set_bit(i, choices);
> +                               break;
> +                       }
> +               }
> +       }
> +       return 0;
> +}
> +
> +static int dptc_pp_get(struct device *dev,
> +                      enum platform_profile_option *profile)
> +{
> +       struct dptc_priv *dptc =3D dev_get_drvdata(dev);
> +
> +       guard(mutex)(&dptc->lock);
> +
> +       *profile =3D dptc->profile;
> +       return 0;
> +}
> +
> +static int dptc_pp_set(struct device *dev,
> +                      enum platform_profile_option profile)
> +{
> +       struct dptc_priv *dptc =3D dev_get_drvdata(dev);
> +       int ret =3D 0;
> +
> +       guard(mutex)(&dptc->lock);
> +
> +       dptc->profile =3D profile;
> +       dptc_apply_profile(dptc, profile);
> +       if (profile !=3D PLATFORM_PROFILE_CUSTOM)
> +               ret =3D dptc_alib_save(dptc);
> +
> +       return ret;
> +}
> +
> +static const struct platform_profile_ops dptc_pp_ops =3D {
> +       .probe       =3D dptc_pp_probe,
> +       .profile_get =3D dptc_pp_get,
> +       .profile_set =3D dptc_pp_set,
> +};
> +
> +static int dptc_resume(struct device *dev)
> +{
> +       struct dptc_priv *dptc =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       guard(mutex)(&dptc->lock);
> +
> +       if (dptc->profile !=3D PLATFORM_PROFILE_CUSTOM) {
> +               dptc_apply_profile(dptc, dptc->profile);
> +               ret =3D dptc_alib_save(dptc);
> +       } else if (dptc->save_mode =3D=3D SAVE_SINGLE) {
> +               ret =3D dptc_alib_save(dptc);
> +       } else {
> +               ret =3D 0;
> +       }
> +
> +       if (ret)
> +               dev_warn(dev, "failed to restore settings on resume: %d\n=
", ret);
> +
> +       return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(dptc_pm_ops, NULL, dptc_resume);
> +
> +static int dptc_probe(struct platform_device *pdev)
> +{
> +       const struct dmi_system_id *dmi_match =3D dev_get_platdata(&pdev-=
>dev);
> +       struct dptc_priv *dptc;
> +       struct device *dev =3D &pdev->dev;
> +       int i, ret;
> +
> +       dptc =3D devm_kzalloc(dev, sizeof(*dptc), GFP_KERNEL);
> +       if (!dptc)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, dptc);
> +
> +       ret =3D devm_mutex_init(dev, &dptc->lock);
> +       if (ret)
> +               return ret;
> +
> +       dptc->dev_limits =3D dmi_match->driver_data;
> +       dev_info(dev, "%s (%s)\n", dmi_match->ident,
> +                boot_cpu_data.x86_model_id);
> +
> +       dptc->fw_attr_dev =3D device_create(&firmware_attributes_class,
> +                                         NULL, MKDEV(0, 0), NULL,
> +                                         DRIVER_NAME);

I think DRIVER_NAME can safely fit one line up.

I probably missed a bunch of other nitpicky stuff. I'll look more
closely once this is a more readable series.

Thanks,
Derek

> +       if (IS_ERR(dptc->fw_attr_dev))
> +               return PTR_ERR(dptc->fw_attr_dev);
> +
> +       ret =3D devm_add_action_or_reset(dev, dptc_fw_dev_unregister,
> +                                      dptc->fw_attr_dev);
> +       if (ret)
> +               return ret;
> +
> +       dptc->fw_attr_kset =3D kset_create_and_add("attributes", NULL,
> +                                                &dptc->fw_attr_dev->kobj=
);
> +       if (!dptc->fw_attr_kset)
> +               return -ENOMEM;
> +
> +       ret =3D devm_add_action_or_reset(dev, dptc_kset_unregister,
> +                                      dptc->fw_attr_kset);
> +       if (ret)
> +               return ret;
> +
> +       for (i =3D 0; i < DPTC_NUM_PARAMS; i++) {
> +               dptc_setup_param_sysfs(dptc, &dptc->params[i], i);
> +               ret =3D sysfs_create_group(&dptc->fw_attr_kset->kobj,
> +                                        &dptc->params[i].group);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       dptc_setup_expanded_sysfs(dptc, &dptc->expanded_attr);
> +       ret =3D sysfs_create_group(&dptc->fw_attr_kset->kobj,
> +                                &dptc->expanded_attr.group);
> +       if (ret)
> +               return ret;
> +
> +       sysfs_attr_init(&dptc->save_settings_attr.attr);
> +       dptc->save_settings_attr.attr.name  =3D "save_settings";
> +       dptc->save_settings_attr.attr.mode  =3D 0644;
> +       dptc->save_settings_attr.show       =3D dptc_save_settings_show;
> +       dptc->save_settings_attr.store      =3D dptc_save_settings_store;
> +       ret =3D sysfs_create_file(&dptc->fw_attr_kset->kobj,
> +                               &dptc->save_settings_attr.attr);
> +       if (ret)
> +               return ret;
> +
> +       dptc->profile =3D PLATFORM_PROFILE_CUSTOM;
> +       dptc->ppdev =3D devm_platform_profile_register(dev, "amd-dptc", d=
ptc,
> +                                                    &dptc_pp_ops);
> +       if (IS_ERR(dptc->ppdev))
> +               return PTR_ERR(dptc->ppdev);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver dptc_driver =3D {
> +       .driver =3D {
> +               .name =3D DRIVER_NAME,
> +               .pm   =3D pm_sleep_ptr(&dptc_pm_ops),
> +       },
> +       .probe  =3D dptc_probe,
> +};
> +
> +static int __init dptc_init(void)
> +{
> +       const struct dmi_system_id *match;
> +       bool soc_found =3D false;
> +       int i, ret;
> +
> +       if (!acpi_has_method(NULL, ALIB_PATH)) {
> +               pr_debug("ALIB method not present\n");
> +               return -ENODEV;
> +       }
> +
> +       match =3D dmi_first_match(dptc_dmi_table);
> +       if (!match)
> +               return -ENODEV;
> +
> +       for (i =3D 0; dptc_soc_table[i]; i++) {
> +               if (strstr(boot_cpu_data.x86_model_id,
> +                          dptc_soc_table[i])) {
> +                       soc_found =3D true;
> +                       break;
> +               }
> +       }
> +       if (!soc_found) {
> +               pr_warn("unrecognized SoC '%s'\n",
> +                       boot_cpu_data.x86_model_id);
> +               return -ENODEV;
> +       }
> +
> +       dptc_pdev =3D platform_device_register_data(NULL, DRIVER_NAME, -1=
,
> +                                                 match, sizeof(*match));
> +       if (IS_ERR(dptc_pdev))
> +               return PTR_ERR(dptc_pdev);
> +
> +       ret =3D platform_driver_register(&dptc_driver);
> +       if (ret) {
> +               platform_device_unregister(dptc_pdev);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void __exit dptc_exit(void)
> +{
> +       platform_driver_unregister(&dptc_driver);
> +       platform_device_unregister(dptc_pdev);
> +}
> +
> +module_init(dptc_init);
> +module_exit(dptc_exit);
> +
> +MODULE_AUTHOR("Antheas Kapenekakis <lkml@antheas.dev>");
> +MODULE_DESCRIPTION("AMD DPTCi ACPI Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.52.0
>
>
