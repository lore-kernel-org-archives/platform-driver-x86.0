Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7BA50276
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772962986; cv=none; b=CND3dLIMMHDau1WckJK8FtU4l6mDEtwg38lYnIVPrQoACX3TOT3dU0VUYfkg544SO7LWfUFDAvH7ilSCzQUeZM72o7bqsDJU5fMB2dI+8p0ynohQpFBnx619148N6Dtwxr0KNnRqFZ2CjAToOs4mZm4Lbfatf6nE34MLihOX7bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772962986; c=relaxed/simple;
	bh=mLO1DA/gOyuGLyfjZZCLtV8KQeKO6x0tE/89Zyadqnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTMrXpCeTx2W3yv8fFKD+vUsswQMtY46H8+eGvLMXdns9XoN/ZWZ9XAXNtH64Oh8Pid0L841RrzRm7XFxyy/pFoPwCiLkhyH7DBi8BU6iGUAfGV9W+J8LrR9SYJT6AOLPW9guHdNxUP9fvihPGk5fWal/E6ktWpYpzxPqB8Up04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=h75HtIwf; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="h75HtIwf"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id BB030C5868
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 11:43:01 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 4587DC5861
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 11:43:00 +0200 (EET)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 7E907200C64
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 11:42:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772962979;
	bh=ayWAb2Mpw6aoSw9678gVe4WCH/og2+l1xtJRAJGUUYg=;
	h=Received:From:Subject:To;
	b=h75HtIwf/RRqUWhij8RIElh1cqPCkr6MIrs6rk1OTwUCqBfFKJrcgyS0UJsnm1e4v
	 bwm+mxYOQzsUDfAWMgPkmdpyK8rMpw70z7o8cqdmtsWpT77newW2DsiyYZGXghXWmp
	 UhQATQPhTFdKFIRxY+HnVRtHa+HPxFpgYnjeTfPDxUVDiTQkpPgsVcvuOPpgTMG+jh
	 +O/mNsbnIPVsMN29Wae75GQ3z1eYwrMT/fq1m59VnnsbyWGpI3lEVIPx5ljGg++tT/
	 B71n+9cPhjpLVt3/MAlk9T3aoLw4B3jVNG/T72g8dDCGN4VTNM7h8O/rNY5bn8SCxH
	 uePRYBSuA5QjQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.43) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f43.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3567e2b4159so5988287a91.0
        for <platform-driver-x86@vger.kernel.org>;
 Sun, 08 Mar 2026 01:42:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU0gEbh5vfbo4T7Eb9nP/4sNDO20kRgkTGVyKDkeNSGGpo+JZRXH5afmF5W+x+xvfHlTWOaGX+Ao2oyzMM8BJo0c97j@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Try2b+adia7ungyc1qalXMbdh2yv+zTiO1BOTAaSNyXbm90a
	JfPTFfRb9LQy/Pd3tGXMRdZeZXnYzEct25ndAcjKamyzajkJcZTLEB9WA9b0kGeq6A3JU40EouM
	IBbvxOmPK/7Xqx8mRKqAlEm45V/bBESE=
X-Received: by 2002:a17:90b:3e45:b0:354:9b3f:710b with SMTP id
 98e67ed59e1d1-359be32bc30mr6589542a91.19.1772962978068; Sun, 08 Mar 2026
 01:42:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307115516.26892-1-lkml@antheas.dev>
 <20260307115516.26892-5-lkml@antheas.dev>
 <f963610b6a159e513b146566e57a1d1de7cf78b7.camel@rong.moe>
 <CAGwozwEAdd7L85Q=uYidzR_y2ap7oZgjY3EOYgNAP-uZ7SAVvA@mail.gmail.com>
 <c4ed6c5cc789522a81deea75a5ef3a70e2dd8b5d.camel@rong.moe>
In-Reply-To: <c4ed6c5cc789522a81deea75a5ef3a70e2dd8b5d.camel@rong.moe>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 8 Mar 2026 10:42:46 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHY18_6F-6AVFj3XmCqX5w4SZ60ZGYoYOavUY=11agR0A@mail.gmail.com>
X-Gm-Features: AaiRm51jn32GIrb6-koiFeE6p-peZTB0pwe9sg43OrAbY3HRtA8Eer8ktQ3RyKk
Message-ID: 
 <CAGwozwHY18_6F-6AVFj3XmCqX5w4SZ60ZGYoYOavUY=11agR0A@mail.gmail.com>
Subject: Re: [RFC v3 4/4] platform/x86/amd: dptc: Add device entries for
 handheld PCs
To: Rong Zhang <i@rong.moe>
Cc: Mario.Limonciello@amd.com, W_Armin@gmx.de, sashal@kernel.org,
	Shyam-Sundar.S-k@amd.com, derekjohn.clark@gmail.com, denis.benato@linux.dev,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177296297986.1806272.13514935451450998661@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 8 Mar 2026 at 10:29, Rong Zhang <i@rong.moe> wrote:
>
> Hi Antheas,
>
> On Sat, 2026-03-07 at 23:40 +0100, Antheas Kapenekakis wrote:
> > On Sat, 7 Mar 2026 at 22:57, Rong Zhang <i@rong.moe> wrote:
> > >
> > > Hi Antheas,
> > >
> > > On Sat, 2026-03-07 at 12:55 +0100, Antheas Kapenekakis wrote:
> > > > Add limit tables and DMI entries for AMD APU-based handheld devices:
> > > >
> > > >  - 15W class: AYANEO AIR
> > > >  - 18W class: AYANEO AIR Plus/Pro
> > > >  - 25W class: AYANEO AIR 1S, NEXT/KUN
> > > >  - 28W class: GPD Win Mini/4/Max 2, GPD Duo, GPD Pocket 4, AYANEO 2,
> > > >                OrangePi NEO-01, SuiPlay0X1
> > > >  - 30W class: AYANEO FLIP/GEEK/SLIDE/3, AOKZOE A1/A1X/A2,
> > > >                OneXPlayer F1Pro/2/X1/G1, AYN Loki Max, Zeenix Pro
> > > >
> > > > Also add SoC strings for Ryzen AI, Z1, Ryzen 8000/7040/6000/5000
> > > > families, extending support beyond the initial AI MAX series.
> > > >
> > > > Assisted-by: Claude:claude-opus-4-6
> > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > ---
> > > >  drivers/platform/x86/amd/dptc.c | 409 ++++++++++++++++++++++++++++++++
> > > >  1 file changed, 409 insertions(+)
> > > >
> > > > diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
> > > > index 1f07e2e6f278..a3d582e48cd3 100644
> > > > --- a/drivers/platform/x86/amd/dptc.c
> > > > +++ b/drivers/platform/x86/amd/dptc.c
> > > > @@ -85,6 +85,66 @@ static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] = {
> > > >                  1, ALIB_ID_TEMP_TARGET },
> > > >  };
> > > >
> > > > +/* 15W class: AYANEO AIR (Ryzen 5 5560U) */
> > > > +static const struct dptc_device_limits limits_15w = { .params = {
> > > > +     [DPTC_PPT_PL1_SPL]  = {  0,  5, 10, 15,  18 },
> > > > +     [DPTC_PPT_PL2_SPPT] = {  0,  5, 10, 15,  18 },
> > > > +     [DPTC_PPT_PL3_FPPT] = {  0,  5, 12, 18,  22 },
> > > > +     [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> > > > +}, .profiles = {
> > > > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
> > > > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 10, 12, 15, 0 } },
> > > > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 15, 15, 18, 0 } },
> > > > +}};
> > > > +
> > > > +/* 18W class: AYANEO AIR Plus/Pro (Ryzen 5 5560U, Ryzen 7 5825U) */
> > > > +static const struct dptc_device_limits limits_18w = { .params = {
> > > > +     [DPTC_PPT_PL1_SPL]  = {  0,  5, 15, 18,  22 },
> > > > +     [DPTC_PPT_PL2_SPPT] = {  0,  5, 15, 18,  22 },
> > > > +     [DPTC_PPT_PL3_FPPT] = {  0,  5, 15, 20,  25 },
> > > > +     [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> > > > +}, .profiles = {
> > > > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
> > > > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 12, 14, 15, 0 } },
> > > > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 18, 18, 20, 0 } },
> > > > +}};
> > > > +
> > > > +/* 25W class: Ryzen 5000 handhelds (AYANEO NEXT, KUN) */
> > > > +static const struct dptc_device_limits limits_25w = { .params = {
> > > > +     [DPTC_PPT_PL1_SPL]  = {  0,  4, 15, 25,  32 },
> > > > +     [DPTC_PPT_PL2_SPPT] = {  0,  4, 20, 27,  35 },
> > > > +     [DPTC_PPT_PL3_FPPT] = {  0,  4, 25, 30,  37 },
> > > > +     [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> > > > +}, .profiles = {
> > > > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> > > > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 20, 0 } },
> > > > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 27, 30, 0 } },
> > > > +}};
> > > > +
> > > > +/* 28W class: GPD Win series, AYANEO 2, OrangePi NEO-01 */
> > > > +static const struct dptc_device_limits limits_28w = { .params = {
> > > > +     [DPTC_PPT_PL1_SPL]  = {  0,  4, 15, 28,  32 },
> > > > +     [DPTC_PPT_PL2_SPPT] = {  0,  4, 20, 30,  35 },
> > > > +     [DPTC_PPT_PL3_FPPT] = {  0,  4, 25, 32,  37 },
> > > > +     [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> > > > +}, .profiles = {
> > > > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> > > > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 22, 0 } },
> > > > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 32, 0 } },
> > > > +}};
> > > > +
> > > > +/* 30W class: OneXPlayer, AYANEO FLIP/GEEK/SLIDE/3, AOKZOE */
> > > > +static const struct dptc_device_limits limits_30w = { .params = {
> > > > +     [DPTC_PPT_PL1_SPL]  = {  0,  4, 15, 30,  40 },
> > > > +     [DPTC_PPT_PL2_SPPT] = {  0,  4, 20, 32,  43 },
> > > > +     [DPTC_PPT_PL3_FPPT] = {  0,  4, 25, 41,  50 },
> > > > +     [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> > > > +}, .profiles = {
> > > > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> > > > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 25, 0 } },
> > > > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 41, 0 } },
> > > > +}};
> > > > +
> > > >  /* AI MAX Handheld class: GPD Win 5 */
> > > >  static const struct dptc_device_limits limits_maxhh = { .params = {
> > > >       [DPTC_PPT_PL1_SPL]  = {  0,  4, 25,  80, 100 },
> > > > @@ -103,11 +163,60 @@ static const char * const dptc_soc_table[] = {
> > > >       "AMD RYZEN AI MAX+ 395",
> > > >       "AMD RYZEN AI MAX+ 385",
> > > >       "AMD RYZEN AI MAX 380",
> > > > +     /* Ryzen AI */
> > > > +     "AMD Ryzen AI 9 HX 370",
> > > > +     "AMD Ryzen AI HX 360",
> > >
> > > What's "AMD Ryzen AI HX 360"? Did you mean "AMD Ryzen AI 9 H 365"
> > > (Chinese-specific model id) and "AMD Ryzen AI 9 365" (other regions)?
> >
> > Hm, goot point. I seem to have added this preemptively looking at my
> > commit logs earlier this year.
> >
> > It might not be the exact name. Since we do SoC + DMI in this driver
> > it might cause some devices with the chip to fail to load.
> >
> > Some HX360 handhelds did ship I think, but I never got bug reports
> > about it missing. I want to say 360 is ryzen 7, at least looking
> > online. Are you sure it's 9?
>
> Did you mean asking your AI when you said "looking online"? There's no
> *HX* 360. If you want `Ryzen AI * H* 3*', online search gives you
> "Ryzen AI 9 HX 370" and "Ryzen AI 9/7/5 H 365/350/340/330" ("H" is
> Chinese-specific). If you want `Ryzen AI * 360', online search gives
> you "Ryzen AI 7 PRO 360" -- it's "PRO" instead of "HX".

Yes, that was what I found. I have a stale entry in my userspace
software from last february [1]. However, no users complained about
missing TDP controls, so I am not sure what to make of it.

Marketing name can be different from the code name in the CPU.

Since my software did hybrid SoC or DMI matching, I cannot
disambiguate them now.

This driver does SoC AND DMI for safety (most devices did SoC since as
you can see in this driver, there are only 4 profiles and CPU matches
are correct for devices other than GPD), so there is a chance we will
propagate errors and some devices will miss TDP controls initially. I
am unsure about 36X series, most users went with H370 or 8840U for
that gen. It is very rare to see those in the wild.

Antheas

[1] https://github.com/hhd-dev/hhd/commit/c2f3fdbd1488a19deef67846bf30c33d6dcd94c8

> Thanks,
> Rong
>
> >
> > Antheas
> >
> > > > +     /* Z1 - Extreme before plain Z1 */
> > > > +     "AMD Ryzen Z1 Extreme",
> > > > +     "AMD Ryzen Z1",
> > >
> > > You don't need both since strstr("AMD Ryzen Z1") matches "AMD Ryzen Z1
> > > Extreme".
> > >
> > > Thanks,
> > > Rong
> > >
> > > > +     /* Ryzen 8000 */
> > > > +     "AMD Ryzen 7 8840U",
> > > > +     /* Ryzen 7040 */
> > > > +     "AMD Ryzen 7 7840U",
> > > > +     /* Ryzen 6000 */
> > > > +     "AMD Ryzen 7 6800U",
> > > > +     "AMD Ryzen 7 6600U",
> > > > +     /* Ryzen 5000 */
> > > > +     "AMD Ryzen 7 5800U",
> > > > +     "AMD Ryzen 7 5700U",
> > > > +     "AMD Ryzen 5 5560U",
> > > >       NULL,
> > > >  };
> > > >
> > > >  static const struct dmi_system_id dptc_dmi_table[] = {
> > > >       /* GPD */
> > > > +     {
> > > > +             .ident = "GPD Win Mini",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-01"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "GPD Win Mini 2024",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "GPD Win Mini 2024",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02-L"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "GPD Win 4",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > >       {
> > > >               .ident = "GPD Win 5",
> > > >               .matches = {
> > > > @@ -116,6 +225,306 @@ static const struct dmi_system_id dptc_dmi_table[] = {
> > > >               },
> > > >               .driver_data = (void *)&limits_maxhh,
> > > >       },
> > > > +     {
> > > > +             .ident = "GPD Win Max 2",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1619-04"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "GPD Win Max 2 2024",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1619-05"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "GPD Duo",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "GPD Duo",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01-L"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "GPD Pocket 4",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "GPD Pocket 4",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04-L"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     /* OrangePi */
> > > > +     {
> > > > +             .ident = "OrangePi NEO-01",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEO-01"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     /* AYN */
> > > > +     {
> > > > +             .ident = "AYN Loki Max",
> > > > +             .matches = {
> > > > +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
> > > > +                     DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     /* Tectoy (Zeenix Pro = Loki Max) */
> > > > +     {
> > > > +             .ident = "Zeenix Pro",
> > > > +             .matches = {
> > > > +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
> > > > +                     DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Pro"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     /* AOKZOE */
> > > > +     {
> > > > +             .ident = "AOKZOE A1 AR07",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AOKZOE A1 Pro",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 Pro"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AOKZOE A1X",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1X"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AOKZOE A2 Pro",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     /* OneXPlayer (Intel variants filtered by SoC table) */
> > > > +     {
> > > > +             .ident = "ONEXPLAYER F1Pro",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1Pro"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "ONEXPLAYER F1 EVA-02",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1 EVA-02"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "ONEXPLAYER 2",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > > > +                     DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 2"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "ONEXPLAYER X1 A",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 A"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "ONEXPLAYER X1z",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1z"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "ONEXPLAYER X1Pro",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Pro"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "ONEXPLAYER G1 A",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 A"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     /* AYANEO - 15W */
> > > > +     {
> > > > +             .ident = "AYANEO AIR",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_15w,
> > > > +     },
> > > > +     /* AYANEO - 18W */
> > > > +     {
> > > > +             .ident = "AYANEO AIR Plus",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Plus"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_18w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AYANEO AIR Pro",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_18w,
> > > > +     },
> > > > +     /* AYANEO - 25W */
> > > > +     {
> > > > +             .ident = "AYANEO AIR 1S",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_MATCH(DMI_BOARD_NAME, "AIR 1S"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_25w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AYANEO NEXT Advance",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_25w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AYANEO NEXT Lite",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Lite"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_25w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AYANEO NEXT Pro",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_25w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AYANEO NEXT",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_25w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AYANEO KUN",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_25w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AYANEO KUN",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO KUN"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_25w,
> > > > +     },
> > > > +     /* AYANEO - 28W */
> > > > +     {
> > > > +             .ident = "AYANEO 2",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "SuiPlay0X1",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_28w,
> > > > +     },
> > > > +     /* AYANEO - 30W */
> > > > +     {
> > > > +             /* DMI_MATCH catches all FLIP variants (DS, KB, 1S DS, 1S KB) */
> > > > +             .ident = "AYANEO FLIP",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             /* DMI_MATCH catches GEEK and GEEK 1S */
> > > > +             .ident = "AYANEO GEEK",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AYANEO SLIDE",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "SLIDE"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > > +     {
> > > > +             .ident = "AYANEO 3",
> > > > +             .matches = {
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > > > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
> > > > +             },
> > > > +             .driver_data = (void *)&limits_30w,
> > > > +     },
> > > >       { }
> > > >  };
> > > >  MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
> > >
>

