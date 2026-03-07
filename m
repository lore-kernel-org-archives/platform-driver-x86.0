Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5455D4C81
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Mar 2026 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772923249; cv=none; b=c5trzbE0A3qa5b9uZyppAIRx4UZe/pyQSGUMQ6jpKVKplqwmR2XwY4Kh7ytvpnliRPyzdfwUis+CaXZeFjn2YpDwCirVzoJsSQgDa4arRA/dorcMOcXTkH9/ODa4Z6ZgeCh8rr3YRT/15YoI0r+/YmvQs+gpmSPjCImA86Fhhio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772923249; c=relaxed/simple;
	bh=avrbulHDsmCgLilyAQ7obl4Ll0QbZQdE0bRk3WPRvIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQlYNudmRe2gOCau3JS6dnTZlYc8gjYRlNd+3GaepWn7PjFsh5nsXyOCleORdwLb5go8FicTlZeaVqzZlGRKDEN2Moxpw44ze2ViDcparoLqOAjF0SQ0P0W9ZdxpIKmsKI8WdSPwZKYSUG8z/0A5Pvrwvw+CWqxvaEfUoDhvQcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=iOtYdyVr; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="iOtYdyVr"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 5FFE3BC0B3
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 00:40:44 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id DEE10BC0AE
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 00:40:42 +0200 (EET)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 40889200CF2
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 00:40:42 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772923242;
	bh=JO3Dl2ZAmnVXHIaOzasZDNIg+XLCdehAcaT8kTLR1a4=;
	h=Received:From:Subject:To;
	b=iOtYdyVrJD6vLUAnoFAGR+RgXy69Z1YIWL19NTp10PlDwr5X6Q0ILyttyD9ahfUUe
	 cSeH7TifPtFBF4FTc3q+dqTgP2p+OBm8DiF/ZMYwX8MV9d0sWPgnVj+rFhGULz8pi4
	 TFt7IEC6DWiUfb/aoS29vRJNcPt3qhqhLl8iNYf+7AEMUxqr8rGxUuIgf7rIksbo7s
	 OivULxfWJa20pdJfuScTkMOOZCfluhfhJUaHgbPByHesLSZSuwre2FqB2cc15uKwPp
	 dr78zAVv5VteU1KMU1SXi87lP/wvQF/QDqbiQFhQEmqutZ+bTw3bzH1QPbT4X1+dLE
	 nuGBeD7fNzicg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.45) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f45.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-35691a231a7so6456724a91.3
        for <platform-driver-x86@vger.kernel.org>;
 Sat, 07 Mar 2026 14:40:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVF7zonHp4NLVc7CvzoIk+IXaV1FCJqTV0ChXEKBYY+p3DhGf9oxgxP0n5VorEKWPEjZtRsYq1LJgc6SBtf8O2G3ri5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb5cBvwEexr8D9pFX4gqcs6w7hXKJRsHamgXQx+0FASPwz04ym
	LUz3l9deTAdvSI6MzSgARv7JkBxPT3IuRzDnZOZvRW7v7EIOsehIpgiPPKXK1ph5dmsWY6HfQDF
	MMQh869+gmI6KIuRbs+I5qbpgOazdQ7Q=
X-Received: by 2002:a17:90b:52c8:b0:359:9082:1d0c with SMTP id
 98e67ed59e1d1-359be324929mr5467272a91.30.1772923240801; Sat, 07 Mar 2026
 14:40:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307115516.26892-1-lkml@antheas.dev>
 <20260307115516.26892-5-lkml@antheas.dev>
 <f963610b6a159e513b146566e57a1d1de7cf78b7.camel@rong.moe>
In-Reply-To: <f963610b6a159e513b146566e57a1d1de7cf78b7.camel@rong.moe>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 7 Mar 2026 23:40:29 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEAdd7L85Q=uYidzR_y2ap7oZgjY3EOYgNAP-uZ7SAVvA@mail.gmail.com>
X-Gm-Features: AaiRm50worcwE6AWiNAN4fWzHrw6LLLiAq6AdZpKPED676sd67vk9bis5FXYojY
Message-ID: 
 <CAGwozwEAdd7L85Q=uYidzR_y2ap7oZgjY3EOYgNAP-uZ7SAVvA@mail.gmail.com>
Subject: Re: [RFC v3 4/4] platform/x86/amd: dptc: Add device entries for
 handheld PCs
To: Rong Zhang <i@rong.moe>
Cc: Mario.Limonciello@amd.com, W_Armin@gmx.de, sashal@kernel.org,
	Shyam-Sundar.S-k@amd.com, derekjohn.clark@gmail.com, denis.benato@linux.dev,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177292324253.3533858.16742703818071821611@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 7 Mar 2026 at 22:57, Rong Zhang <i@rong.moe> wrote:
>
> Hi Antheas,
>
> On Sat, 2026-03-07 at 12:55 +0100, Antheas Kapenekakis wrote:
> > Add limit tables and DMI entries for AMD APU-based handheld devices:
> >
> >  - 15W class: AYANEO AIR
> >  - 18W class: AYANEO AIR Plus/Pro
> >  - 25W class: AYANEO AIR 1S, NEXT/KUN
> >  - 28W class: GPD Win Mini/4/Max 2, GPD Duo, GPD Pocket 4, AYANEO 2,
> >                OrangePi NEO-01, SuiPlay0X1
> >  - 30W class: AYANEO FLIP/GEEK/SLIDE/3, AOKZOE A1/A1X/A2,
> >                OneXPlayer F1Pro/2/X1/G1, AYN Loki Max, Zeenix Pro
> >
> > Also add SoC strings for Ryzen AI, Z1, Ryzen 8000/7040/6000/5000
> > families, extending support beyond the initial AI MAX series.
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/platform/x86/amd/dptc.c | 409 ++++++++++++++++++++++++++++++++
> >  1 file changed, 409 insertions(+)
> >
> > diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
> > index 1f07e2e6f278..a3d582e48cd3 100644
> > --- a/drivers/platform/x86/amd/dptc.c
> > +++ b/drivers/platform/x86/amd/dptc.c
> > @@ -85,6 +85,66 @@ static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] = {
> >                  1, ALIB_ID_TEMP_TARGET },
> >  };
> >
> > +/* 15W class: AYANEO AIR (Ryzen 5 5560U) */
> > +static const struct dptc_device_limits limits_15w = { .params = {
> > +     [DPTC_PPT_PL1_SPL]  = {  0,  5, 10, 15,  18 },
> > +     [DPTC_PPT_PL2_SPPT] = {  0,  5, 10, 15,  18 },
> > +     [DPTC_PPT_PL3_FPPT] = {  0,  5, 12, 18,  22 },
> > +     [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> > +}, .profiles = {
> > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
> > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 10, 12, 15, 0 } },
> > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 15, 15, 18, 0 } },
> > +}};
> > +
> > +/* 18W class: AYANEO AIR Plus/Pro (Ryzen 5 5560U, Ryzen 7 5825U) */
> > +static const struct dptc_device_limits limits_18w = { .params = {
> > +     [DPTC_PPT_PL1_SPL]  = {  0,  5, 15, 18,  22 },
> > +     [DPTC_PPT_PL2_SPPT] = {  0,  5, 15, 18,  22 },
> > +     [DPTC_PPT_PL3_FPPT] = {  0,  5, 15, 20,  25 },
> > +     [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> > +}, .profiles = {
> > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
> > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 12, 14, 15, 0 } },
> > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 18, 18, 20, 0 } },
> > +}};
> > +
> > +/* 25W class: Ryzen 5000 handhelds (AYANEO NEXT, KUN) */
> > +static const struct dptc_device_limits limits_25w = { .params = {
> > +     [DPTC_PPT_PL1_SPL]  = {  0,  4, 15, 25,  32 },
> > +     [DPTC_PPT_PL2_SPPT] = {  0,  4, 20, 27,  35 },
> > +     [DPTC_PPT_PL3_FPPT] = {  0,  4, 25, 30,  37 },
> > +     [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> > +}, .profiles = {
> > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 20, 0 } },
> > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 27, 30, 0 } },
> > +}};
> > +
> > +/* 28W class: GPD Win series, AYANEO 2, OrangePi NEO-01 */
> > +static const struct dptc_device_limits limits_28w = { .params = {
> > +     [DPTC_PPT_PL1_SPL]  = {  0,  4, 15, 28,  32 },
> > +     [DPTC_PPT_PL2_SPPT] = {  0,  4, 20, 30,  35 },
> > +     [DPTC_PPT_PL3_FPPT] = {  0,  4, 25, 32,  37 },
> > +     [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> > +}, .profiles = {
> > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 22, 0 } },
> > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 32, 0 } },
> > +}};
> > +
> > +/* 30W class: OneXPlayer, AYANEO FLIP/GEEK/SLIDE/3, AOKZOE */
> > +static const struct dptc_device_limits limits_30w = { .params = {
> > +     [DPTC_PPT_PL1_SPL]  = {  0,  4, 15, 30,  40 },
> > +     [DPTC_PPT_PL2_SPPT] = {  0,  4, 20, 32,  43 },
> > +     [DPTC_PPT_PL3_FPPT] = {  0,  4, 25, 41,  50 },
> > +     [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> > +}, .profiles = {
> > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 25, 0 } },
> > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 41, 0 } },
> > +}};
> > +
> >  /* AI MAX Handheld class: GPD Win 5 */
> >  static const struct dptc_device_limits limits_maxhh = { .params = {
> >       [DPTC_PPT_PL1_SPL]  = {  0,  4, 25,  80, 100 },
> > @@ -103,11 +163,60 @@ static const char * const dptc_soc_table[] = {
> >       "AMD RYZEN AI MAX+ 395",
> >       "AMD RYZEN AI MAX+ 385",
> >       "AMD RYZEN AI MAX 380",
> > +     /* Ryzen AI */
> > +     "AMD Ryzen AI 9 HX 370",
> > +     "AMD Ryzen AI HX 360",
>
> What's "AMD Ryzen AI HX 360"? Did you mean "AMD Ryzen AI 9 H 365"
> (Chinese-specific model id) and "AMD Ryzen AI 9 365" (other regions)?

Hm, goot point. I seem to have added this preemptively looking at my
commit logs earlier this year.

It might not be the exact name. Since we do SoC + DMI in this driver
it might cause some devices with the chip to fail to load.

Some HX360 handhelds did ship I think, but I never got bug reports
about it missing. I want to say 360 is ryzen 7, at least looking
online. Are you sure it's 9?

Antheas

> > +     /* Z1 - Extreme before plain Z1 */
> > +     "AMD Ryzen Z1 Extreme",
> > +     "AMD Ryzen Z1",
>
> You don't need both since strstr("AMD Ryzen Z1") matches "AMD Ryzen Z1
> Extreme".
>
> Thanks,
> Rong
>
> > +     /* Ryzen 8000 */
> > +     "AMD Ryzen 7 8840U",
> > +     /* Ryzen 7040 */
> > +     "AMD Ryzen 7 7840U",
> > +     /* Ryzen 6000 */
> > +     "AMD Ryzen 7 6800U",
> > +     "AMD Ryzen 7 6600U",
> > +     /* Ryzen 5000 */
> > +     "AMD Ryzen 7 5800U",
> > +     "AMD Ryzen 7 5700U",
> > +     "AMD Ryzen 5 5560U",
> >       NULL,
> >  };
> >
> >  static const struct dmi_system_id dptc_dmi_table[] = {
> >       /* GPD */
> > +     {
> > +             .ident = "GPD Win Mini",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-01"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     {
> > +             .ident = "GPD Win Mini 2024",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     {
> > +             .ident = "GPD Win Mini 2024",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02-L"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     {
> > +             .ident = "GPD Win 4",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> >       {
> >               .ident = "GPD Win 5",
> >               .matches = {
> > @@ -116,6 +225,306 @@ static const struct dmi_system_id dptc_dmi_table[] = {
> >               },
> >               .driver_data = (void *)&limits_maxhh,
> >       },
> > +     {
> > +             .ident = "GPD Win Max 2",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1619-04"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     {
> > +             .ident = "GPD Win Max 2 2024",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1619-05"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     {
> > +             .ident = "GPD Duo",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     {
> > +             .ident = "GPD Duo",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01-L"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     {
> > +             .ident = "GPD Pocket 4",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     {
> > +             .ident = "GPD Pocket 4",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04-L"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     /* OrangePi */
> > +     {
> > +             .ident = "OrangePi NEO-01",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEO-01"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     /* AYN */
> > +     {
> > +             .ident = "AYN Loki Max",
> > +             .matches = {
> > +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
> > +                     DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     /* Tectoy (Zeenix Pro = Loki Max) */
> > +     {
> > +             .ident = "Zeenix Pro",
> > +             .matches = {
> > +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
> > +                     DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Pro"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     /* AOKZOE */
> > +     {
> > +             .ident = "AOKZOE A1 AR07",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             .ident = "AOKZOE A1 Pro",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 Pro"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             .ident = "AOKZOE A1X",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1X"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             .ident = "AOKZOE A2 Pro",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     /* OneXPlayer (Intel variants filtered by SoC table) */
> > +     {
> > +             .ident = "ONEXPLAYER F1Pro",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1Pro"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             .ident = "ONEXPLAYER F1 EVA-02",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1 EVA-02"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             .ident = "ONEXPLAYER 2",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 2"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             .ident = "ONEXPLAYER X1 A",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 A"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             .ident = "ONEXPLAYER X1z",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1z"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             .ident = "ONEXPLAYER X1Pro",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Pro"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             .ident = "ONEXPLAYER G1 A",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 A"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     /* AYANEO - 15W */
> > +     {
> > +             .ident = "AYANEO AIR",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
> > +             },
> > +             .driver_data = (void *)&limits_15w,
> > +     },
> > +     /* AYANEO - 18W */
> > +     {
> > +             .ident = "AYANEO AIR Plus",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Plus"),
> > +             },
> > +             .driver_data = (void *)&limits_18w,
> > +     },
> > +     {
> > +             .ident = "AYANEO AIR Pro",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
> > +             },
> > +             .driver_data = (void *)&limits_18w,
> > +     },
> > +     /* AYANEO - 25W */
> > +     {
> > +             .ident = "AYANEO AIR 1S",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "AIR 1S"),
> > +             },
> > +             .driver_data = (void *)&limits_25w,
> > +     },
> > +     {
> > +             .ident = "AYANEO NEXT Advance",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
> > +             },
> > +             .driver_data = (void *)&limits_25w,
> > +     },
> > +     {
> > +             .ident = "AYANEO NEXT Lite",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Lite"),
> > +             },
> > +             .driver_data = (void *)&limits_25w,
> > +     },
> > +     {
> > +             .ident = "AYANEO NEXT Pro",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
> > +             },
> > +             .driver_data = (void *)&limits_25w,
> > +     },
> > +     {
> > +             .ident = "AYANEO NEXT",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
> > +             },
> > +             .driver_data = (void *)&limits_25w,
> > +     },
> > +     {
> > +             .ident = "AYANEO KUN",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
> > +             },
> > +             .driver_data = (void *)&limits_25w,
> > +     },
> > +     {
> > +             .ident = "AYANEO KUN",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO KUN"),
> > +             },
> > +             .driver_data = (void *)&limits_25w,
> > +     },
> > +     /* AYANEO - 28W */
> > +     {
> > +             .ident = "AYANEO 2",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     {
> > +             .ident = "SuiPlay0X1",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
> > +             },
> > +             .driver_data = (void *)&limits_28w,
> > +     },
> > +     /* AYANEO - 30W */
> > +     {
> > +             /* DMI_MATCH catches all FLIP variants (DS, KB, 1S DS, 1S KB) */
> > +             .ident = "AYANEO FLIP",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             /* DMI_MATCH catches GEEK and GEEK 1S */
> > +             .ident = "AYANEO GEEK",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             .ident = "AYANEO SLIDE",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "SLIDE"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> > +     {
> > +             .ident = "AYANEO 3",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
> > +             },
> > +             .driver_data = (void *)&limits_30w,
> > +     },
> >       { }
> >  };
> >  MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
>

