Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7B6346FA0
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 19:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.73.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256458; cv=none; b=ElEe0lY0AQeUDTf1KvATpcXIjn6BLqWc5VSn3bVy3ph6vin3rLa6+mK7pfSkXCxHbyAbcAgvdR+++d/KYbxjhNq23HxLuWdH6I9swp4G7wbdj8SAXJJ+dr3ubo3N6Pf667DA/PjKKoOGCGA5nVk5ER9+ngxYIAzaxVFKB56naak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256458; c=relaxed/simple;
	bh=77yTBNAcsD8jzb40UBRlz7jn6K4J3C5GRSwI0LEbDvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g13ulxdYj6CXn94UlVOl6TlamdjhCAZ7oS5Hv8HH2eO4QglPa5jNgnVBuZvObsakQUQxakWHO/duVnAaA+PUiKiblaaITYfk2iHn2v+zyZFFWhl+O4L7tQtUUBgBOikJECyQeA3tEG8Nr8GiVA2osbC4wQzAadZrHvRzYt5uQ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=NA8m/6QC; arc=none smtp.client-ip=157.180.73.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="NA8m/6QC"
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 238B243FA6
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 19:14:09 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 2A5DE4077D
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 19:14:07 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 4ED9D1FD985
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 21:14:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1773256446;
	bh=qSPvow7XbRnOyLROydmtmw6UVFX0HLx4ilHLGRxFs+U=;
	h=Received:From:Subject:To;
	b=NA8m/6QCijIOlfJbvG1e0D6ITY73KT9dW6RnZJ73RjZynuqnjDurmtjdXtZbsjMZF
	 SOagkp7SbB5qeff8DkLRlUlikLMuz+dziT3slUWAnyNqhrdhV+rAsG1gi/UizH3Pko
	 IqG9c88J5dqkAEvVumnFI6B2o7GMxWRooVU/NUATi8M8nWlAtlITiAMMhv7nDV3YEQ
	 Ogx+yEwAPj/cRr5385NKK3vNMdd8KlQ3sjv9Ks8ue4MNOMTrBOwlUk3ntBr4iNuuv8
	 7NFOtj/UpxZwMRDwbAL1dZphtHORCEozr+uS70xh3czgpAb2uLiPhT85nu4mepOYIB
	 bKqfE52GYCvDg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-c73d251b93bso130606a12.0
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 11 Mar 2026 12:14:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXZYdJvqmE7rlMqGAR+asbqesJNH5hEIl97XUx0pbnIbM7sX7hbvU9pWdS7SjgKxLiZuJCpNkacr9D0f8tINz3aoFdz@vger.kernel.org
X-Gm-Message-State: AOJu0YyCSouSWgq3/fEhsWc/Hc7DtOp19m2+cycO29clxNafW86i1kAa
	aAQXd45B1i3r8P0VkvLDfh10pPaIZbqj34twO7Jwpok3vyWzgmxN+0HxFnuyHkCBNFtWXg9lnTP
	oVekbHoIlTAqujnEjYrarQlRx7wS2dQ0=
X-Received: by 2002:a05:6a21:a41:b0:398:74bb:d6ff with SMTP id
 adf61e73a8af0-398d7730fa9mr577976637.4.1773256444738; Wed, 11 Mar 2026
 12:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309205125.293148-1-lkml@antheas.dev>
 <20260309205125.293148-5-lkml@antheas.dev>
 <d5c2a4e0-1263-42ac-a64a-c6218e91bc09@amd.com>
 <CAGwozwFpgGV96YjaZbVfBosBL8TqXTtYJ=Av5tHSi24zV_-SMw@mail.gmail.com>
 <6545b671-6e51-4899-af28-354e7e423056@amd.com>
In-Reply-To: <6545b671-6e51-4899-af28-354e7e423056@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 11 Mar 2026 20:13:53 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF2ZxN5UF-rLP0zwyqO81P6UxY=TQ2XRby8hRdxoSRpYg@mail.gmail.com>
X-Gm-Features: AaiRm53RiRas7VpFdK6_9U7HAQBZYqrwLBx9qifOcjNpU5-YDoaKnDEaOSOnEJo
Message-ID: 
 <CAGwozwF2ZxN5UF-rLP0zwyqO81P6UxY=TQ2XRby8hRdxoSRpYg@mail.gmail.com>
Subject: Re: [RFC v4 4/4] platform/x86/amd: dptc: Add device entries for
 handheld PCs
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
	derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177325644668.3637608.13570570475444288911@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 10 Mar 2026 at 17:35, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 3/10/26 3:13 AM, Antheas Kapenekakis wrote:
> > On Tue, 10 Mar 2026 at 05:11, Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >>
> >>
> >> On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
> >>> Add limit tables and DMI entries for AMD APU-based handheld devices:
> >>>
> >>>    - 15W class: AYANEO AIR
> >>>    - 18W class: AYANEO AIR Plus/Pro
> >>>    - 25W class: AYANEO AIR 1S, NEXT/KUN
> >>>    - 28W class: GPD Win Mini/4/Max 2, GPD Duo, GPD Pocket 4, AYANEO 2,
> >>>                  OrangePi NEO-01, SuiPlay0X1
> >>>    - 30W class: AYANEO FLIP/GEEK/SLIDE/3, AOKZOE A1/A1X/A2,
> >>>                  OneXPlayer F1Pro/2/X1/G1, AYN Loki Max, Zeenix Pro
> >>>
> >>> Also add SoC strings for Ryzen AI, Ryzen 8000/7040/6000/5000
> >>> families, extending support beyond the initial AI MAX series.
> >>
> >> There are a lot of numbers here.  Where did they all come from?  What
> >> are guesses?  What came from RE?  What came from documentation?
> >> How do you know these are good for the thermal design of the platform?
> >>
> >> I appreciate some of them could be cargo culted from another codebase,
> >> but I think it would be a good idea to document which ones are more
> >> likely to be accurate and why.
> >
> > Ok, here is the logic behind the limits.
> >
> > 15/18/25 are manufacturer claims by Ayaneo. Ayaneo is the only
> > manufacturer that made devices prior to the new ones that support 30W
> > limits.
> >
> > 28W is used for GPD because their devices are very portable and 30W
> > makes e.g. the bottom pan of Win Minis too hot. It is also used for
> > the Ayaneo 2/Sui/OPI, because these devices have a fullwidth glass
> > front that is used for heat dissipation. So the screen gets very hot.
> >
> > The rest of the devices use 30W.
> >
> > As for which software each OEM has. GPD: GPD does not ship first party
> > software for TDP controls. They collaborate with an independent
> > developer developing "Motion Assistant", which they also ship with
> > their devices and features a TDP slider. Ayaneo uses Ayaspace, which
> > is backed by Ryzenadj, and they give slider control to users,
> > typically with a 30W limit. They also use userspace customizable
> > presets for some default e.g. 20W profiles. Onexplayer has oxpconsole
> > with a slider as well that does 30W usually. Ayn exited the market on
> > WIndows handhelds, no software. OPI, you'd need to ask Phil but this
> > would be the primary driver for it. There is no alternative that can
> > also go to SteamOS.
> >
> > The reasoning behind the profiles is simple. 8W is power savings
> > territory. Going below can yield around 1W more, but the performance
> > degradation is not worth it. 15W is a good sweetspot for 30W
> > processors. Then, 25W is good for these devices as they saturate above
> > 22ish Watts. We could even go lower to 20W, as Lenovo did on the
> > original Go. But their newer devices use higher AC values.
> >
> > For their boost clocks, sPPT is set to around 2W higher than spl (what
> > is it called now?) to give a small boost. fPPT is set to a reasonable
> > amount for that device class and interpolated vs spl. The exception is
> > low-power where we do not want boost
> >
> > Antheas
>
> OK, each and every one of these cases needs to be documented.
>
> I suggest that they each go in their own patches, and then if there is
> any disagreement it's a single patch to revert or drop from the rest of
> the series.

Ok, so here is what I suggest going forward.

We keep the last patch while this is an RFC and annotate it as planned
to be dropped so the series can still be tested. Then, once we exit
RFC we merge initially for Win 5 to reduce email bloat. After merge, I
go through the DMIs and group them by device type, adding information
about the devices on the commit message. Then, these go to for-fixes
with a cc stable.

While doing that, I will drop all non EXACT matches. Specifically, the
Ayaneo 1S had a few variants with different DMIs (1S Limited being one
of them if I recall).

This will allow us to drop the CPU match with high certainty. I will
replace it with just an is AMD check with no logs or perhaps a debug
log, to avoid polluting Intel variant's dmesg if any.

Best,
Antheas

> >
> >>>
> >>> Assisted-by: Claude:claude-opus-4-6
> >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>> ---
> >>>    drivers/platform/x86/amd/dptc.c | 420 ++++++++++++++++++++++++++++++++
> >>>    1 file changed, 420 insertions(+)
> >>>
> >>> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
> >>> index f4db95affb1b..b2820f8652f1 100644
> >>> --- a/drivers/platform/x86/amd/dptc.c
> >>> +++ b/drivers/platform/x86/amd/dptc.c
> >>> @@ -86,6 +86,81 @@ static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] = {
> >>>                                 1, ALIB_ID_TEMP_TARGET },
> >>>    };
> >>>
> >>> +/* 15W class: AYANEO AIR (Ryzen 5 5560U) */
> >>> +static const struct dptc_device_limits limits_15w = {
> >>> +     .params = {
> >>> +             [DPTC_PPT_PL1_SPL]  = {  1,  5, 10, 15,  18 },
> >>> +             [DPTC_PPT_PL2_SPPT] = {  1,  5, 10, 15,  18 },
> >>> +             [DPTC_PPT_PL3_FPPT] = {  1,  5, 12, 18,  22 },
> >>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> >>> +     },
> >>> +     .profiles = {
> >>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
> >>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 10, 12, 15, 0 } },
> >>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 15, 15, 18, 0 } },
> >>> +     },
> >>> +};
> >>> +
> >>> +/* 18W class: AYANEO AIR Plus/Pro (Ryzen 5 5560U, Ryzen 7 5825U) */
> >>> +static const struct dptc_device_limits limits_18w = {
> >>> +     .params = {
> >>> +             [DPTC_PPT_PL1_SPL]  = {  1,  5, 15, 18,  22 },
> >>> +             [DPTC_PPT_PL2_SPPT] = {  1,  5, 15, 18,  22 },
> >>> +             [DPTC_PPT_PL3_FPPT] = {  1,  5, 15, 20,  25 },
> >>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> >>> +     },
> >>> +     .profiles = {
> >>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
> >>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 12, 14, 15, 0 } },
> >>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 18, 18, 20, 0 } },
> >>> +     },
> >>> +};
> >>> +
> >>> +/* 25W class: Ryzen 5000 handhelds (AYANEO NEXT, KUN) */
> >>> +static const struct dptc_device_limits limits_25w = {
> >>> +     .params = {
> >>> +             [DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 25,  32 },
> >>> +             [DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 27,  35 },
> >>> +             [DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 30,  37 },
> >>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> >>> +     },
> >>> +     .profiles = {
> >>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> >>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 20, 0 } },
> >>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 27, 30, 0 } },
> >>> +     },
> >>> +};
> >>> +
> >>> +/* 28W class: GPD Win series, AYANEO 2, OrangePi NEO-01 */
> >>> +static const struct dptc_device_limits limits_28w = {
> >>> +     .params = {
> >>> +             [DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 28,  32 },
> >>> +             [DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 30,  35 },
> >>> +             [DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 32,  37 },
> >>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> >>> +     },
> >>> +     .profiles = {
> >>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> >>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 22, 0 } },
> >>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 32, 0 } },
> >>> +     },
> >>> +};
> >>> +
> >>> +/* 30W class: OneXPlayer, AYANEO FLIP/GEEK/SLIDE/3, AOKZOE */
> >>> +static const struct dptc_device_limits limits_30w = {
> >>> +     .params = {
> >>> +             [DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 30,  40 },
> >>> +             [DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 32,  43 },
> >>> +             [DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 41,  50 },
> >>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> >>> +     },
> >>> +     .profiles = {
> >>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> >>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 25, 0 } },
> >>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 41, 0 } },
> >>> +     },
> >>> +};
> >>> +
> >>>    /* AI MAX Handheld class: GPD Win 5 */
> >>>    static const struct dptc_device_limits limits_maxhh = {
> >>>        .params = {
> >>> @@ -107,11 +182,56 @@ static const char * const dptc_soc_table[] = {
> >>>        "AMD RYZEN AI MAX+ 395",
> >>>        "AMD RYZEN AI MAX+ 385",
> >>>        "AMD RYZEN AI MAX 380",
> >>> +     /* Ryzen AI */
> >>> +     "AMD Ryzen AI 9 HX 370",
> >>> +     /* Ryzen 8000 */
> >>> +     "AMD Ryzen 7 8840U",
> >>> +     /* Ryzen 7040 */
> >>> +     "AMD Ryzen 7 7840U",
> >>> +     /* Ryzen 6000 */
> >>> +     "AMD Ryzen 7 6800U",
> >>> +     "AMD Ryzen 7 6600U",
> >>> +     /* Ryzen 5000 */
> >>> +     "AMD Ryzen 7 5800U",
> >>> +     "AMD Ryzen 7 5700U",
> >>> +     "AMD Ryzen 5 5560U",
> >>
> >> Still don't understand the point of this list.
> >
> > Parallel reply.
> >
> >>>        NULL,
> >>>    };
> >>>
> >>>    static const struct dmi_system_id dptc_dmi_table[] = {
> >>>        /* GPD */
> >>> +     {
> >>> +             .ident = "GPD Win Mini",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-01"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "GPD Win Mini 2024",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "GPD Win Mini 2024",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02-L"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "GPD Win 4",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>>        {
> >>>                .ident = "GPD Win 5",
> >>>                .matches = {
> >>> @@ -120,6 +240,306 @@ static const struct dmi_system_id dptc_dmi_table[] = {
> >>>                },
> >>>                .driver_data = (void *)&limits_maxhh,
> >>>        },
> >>> +     {
> >>> +             .ident = "GPD Win Max 2",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1619-04"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "GPD Win Max 2 2024",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1619-05"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "GPD Duo",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "GPD Duo",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01-L"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "GPD Pocket 4",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "GPD Pocket 4",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04-L"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     /* OrangePi */
> >>> +     {
> >>> +             .ident = "OrangePi NEO-01",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEO-01"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     /* AYN */
> >>> +     {
> >>> +             .ident = "AYN Loki Max",
> >>> +             .matches = {
> >>> +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
> >>> +                     DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     /* Tectoy (Zeenix Pro = Loki Max) */
> >>> +     {
> >>> +             .ident = "Zeenix Pro",
> >>> +             .matches = {
> >>> +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
> >>> +                     DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Pro"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     /* AOKZOE */
> >>> +     {
> >>> +             .ident = "AOKZOE A1 AR07",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AOKZOE A1 Pro",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 Pro"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AOKZOE A1X",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1X"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AOKZOE A2 Pro",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     /* OneXPlayer (Intel variants filtered by SoC table) */
> >>
> >> Are you telling me the Intel variants actually have the same ACPI
> >> methods this series looks for?
> >
> > They do not.
>
> OK then this comment appears wrong.

Ack See above.

> >
> >>> +     {
> >>> +             .ident = "ONEXPLAYER F1Pro",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1Pro"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "ONEXPLAYER F1 EVA-02",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1 EVA-02"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "ONEXPLAYER 2",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> >>> +                     DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 2"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "ONEXPLAYER X1 A",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 A"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "ONEXPLAYER X1z",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1z"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "ONEXPLAYER X1Pro",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Pro"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "ONEXPLAYER G1 A",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 A"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     /* AYANEO - 15W */
> >>> +     {
> >>> +             .ident = "AYANEO AIR",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_15w,
> >>> +     },
> >>> +     /* AYANEO - 18W */
> >>> +     {
> >>> +             .ident = "AYANEO AIR Plus",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Plus"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_18w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AYANEO AIR Pro",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_18w,
> >>> +     },
> >>> +     /* AYANEO - 25W */
> >>> +     {
> >>> +             .ident = "AYANEO AIR 1S",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_MATCH(DMI_BOARD_NAME, "AIR 1S"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_25w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AYANEO NEXT Advance",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_25w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AYANEO NEXT Lite",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Lite"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_25w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AYANEO NEXT Pro",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_25w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AYANEO NEXT",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_25w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AYANEO KUN",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_25w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AYANEO KUN",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO KUN"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_25w,
> >>> +     },
> >>> +     /* AYANEO - 28W */
> >>> +     {
> >>> +             .ident = "AYANEO 2",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "SuiPlay0X1",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_28w,
> >>> +     },
> >>> +     /* AYANEO - 30W */
> >>> +     {
> >>> +             /* DMI_MATCH catches all FLIP variants (DS, KB, 1S DS, 1S KB) */
> >>> +             .ident = "AYANEO FLIP",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             /* DMI_MATCH catches GEEK and GEEK 1S */
> >>> +             .ident = "AYANEO GEEK",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AYANEO SLIDE",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "SLIDE"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>> +     {
> >>> +             .ident = "AYANEO 3",
> >>> +             .matches = {
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> >>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
> >>> +             },
> >>> +             .driver_data = (void *)&limits_30w,
> >>> +     },
> >>>        { }
> >>>    };
> >>>    MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
> >>
> >>
> >
>
>

