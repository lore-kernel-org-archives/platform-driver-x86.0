Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E621C2E88BB
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761554500; cv=none; b=L+IhdFJUUyGpark2ruyaMWMwNUigWqFg18M1pSiF5VKiUXgjL66VxaKvufeyFe8RvJNeySZ3/eqs+F7Os/sHqlcLtPspIaWonRq0XBhtSZ4CVLo7yj8oxoSRQHfr2TgThQejrlpD4h+CFFxdvn9AmvXmKGS1aTyttrrEodmxMWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761554500; c=relaxed/simple;
	bh=UnwT6nX+iSHwG1CknWdK6VTh1JOdWQ1tUhJA2KfVfT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwKkF2DsMJE72f/k6U1HdAiumXrIOTmj41eBH5QgMevkGjnNg/IZabmLAnsSrqFyz+UwueBvIrqTwcNsLjIPxbrkwdFCboDly11uk+anm4LYXPgabWH0+Mx9bbkE5O1bBXYCVqyHaqgcs2kaleG0vlNjOXjcPzsKGIQGHLOz3qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Du6Lba+U; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Du6Lba+U"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 101F1BDBF6
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 10:41:37 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id B040BBDBFA
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 10:41:35 +0200 (EET)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D55AE200C43
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 10:41:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761554495;
	bh=7bgq8scNhrB3Jg+UhfmEUiMsC76/nwmnGV6s5QJWkBA=;
	h=Received:From:Subject:To;
	b=Du6Lba+UXdxqAOyFPY55oaigoS9DJog/xY+CeinusFAFEOHlI4XN1yGTrB4UKMLPS
	 kKtXGr2oJCGSinmdA1gzkyGOuyM5bU6mhFC+G+fmPf69qO+XASzYiuVJH1jE6lAN/a
	 x0J79NWocKVtHUxAL95qbFsWOVV+jvUtQ/QvsLn1EcyEqzqOot4S7DCqV+gnSaVbwk
	 x6aJtOzhdM+g3uRxeJ2O1d4GORD4+2c8RSXDXFDnDUU2sVrRoUZdePaenfhnq1D73O
	 2O09c2dziGChPlvhtxt22TX8tqRkaxLliSLggSkOILiY5mzNkj33Afa74jzHbiQvJT
	 0+kyvJf5qTsrw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-378d50e1c77so39553441fa.0
        for <platform-driver-x86@vger.kernel.org>;
 Mon, 27 Oct 2025 01:41:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXbysfWr/1VbDaB20fJ8IcQ0qt1TWktkr1rLtwkTUPlVjzNMHDLUilMOh+0QnoHbMhQhG2U0W2RB+GYotnatxQopysI@vger.kernel.org
X-Gm-Message-State: AOJu0YyQE6hIMFcbRMA/33ArS8BUrtdXXUb8xew8PZ2I186wH8k8kKUd
	LLus0vtwk6Ht9wLydvVvgu7oX6OP2yE8muUZBlyBaxmYcAmiVS0+6Ef17G8B4hXbjeUcF94Uzmm
	og48VffN6j76MzWRSCkBhHtJrM7uFHhA=
X-Google-Smtp-Source: 
 AGHT+IHQrnWhGSRKKWzvZYeImwBcHAM+gDl49kuOa35hnvx7oyBlnaIVQ+Sq6FuvfFsTVRdbbwTudFAhJBdtsJzwEZM=
X-Received: by 2002:a05:651c:1595:b0:364:f7e2:3908 with SMTP id
 38308e7fff4ca-37797a1439bmr102634311fa.26.1761554494137; Mon, 27 Oct 2025
 01:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
 <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
 <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
 <2684d3ab-d7cf-4eab-acd4-91bdd5debb6b@amd.com>
 <058eda7c-ab93-40a5-b387-54f7a18f3922@amd.com>
 <13fd3b12-03a0-457f-a5da-fe018b032211@amd.com>
In-Reply-To: <13fd3b12-03a0-457f-a5da-fe018b032211@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 27 Oct 2025 09:41:22 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGLfcYdpetwTk=QH+k29u8SdroFxfkxb-KbAXh36sr1XQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmPAVmdP3bYKUv3LzGXCwTY0wQJciqhi0ctU4JYKLg0UaCVGWdkVe6fI_U
Message-ID: 
 <CAGwozwGLfcYdpetwTk=QH+k29u8SdroFxfkxb-KbAXh36sr1XQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
	Perry Yuan <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, Sanket Goswami <Sanket.Goswami@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176155449518.58168.7887682630609531593@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 27 Oct 2025 at 09:36, Shyam Sundar S K <Shyam-sundar.S-k@amd.com> wrote:
>
>
>
> On 10/27/2025 13:52, Shyam Sundar S K wrote:
> >
> >
> > On 10/24/2025 22:02, Mario Limonciello wrote:
> >>
> >>
> >> On 10/24/2025 11:08 AM, Antheas Kapenekakis wrote:
> >>> On Fri, 24 Oct 2025 at 17:43, Mario Limonciello
> >>> <mario.limonciello@amd.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> >>>>> The ROG Xbox Ally (non-X) SoC features a similar architecture to the
> >>>>> Steam Deck. While the Steam Deck supports S3 (s2idle causes a crash),
> >>>>> this support was dropped by the Xbox Ally which only S0ix suspend.
> >>>>>
> >>>>> Since the handler is missing here, this causes the device to not
> >>>>> suspend
> >>>>> and the AMD GPU driver to crash while trying to resume afterwards
> >>>>> due to
> >>>>> a power hang.
> >>>>>
> >>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> >>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>> ---
> >>>>>    drivers/platform/x86/amd/pmc/pmc.c | 3 +++
> >>>>>    drivers/platform/x86/amd/pmc/pmc.h | 1 +
> >>>>>    2 files changed, 4 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/
> >>>>> platform/x86/amd/pmc/pmc.c
> >>>>> index bd318fd02ccf..cae3fcafd4d7 100644
> >>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
> >>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> >>>>> @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct
> >>>>> amd_pmc_dev *dev)
> >>>>>        switch (dev->cpu_id) {
> >>>>>        case AMD_CPU_ID_PCO:
> >>>>>        case AMD_CPU_ID_RN:
> >>>>> +     case AMD_CPU_ID_VG:
> >>>>>        case AMD_CPU_ID_YC:
> >>>>>        case AMD_CPU_ID_CB:
> >>>>>                dev->num_ips = 12;
> >>>>> @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct
> >>>>> amd_pmc_dev *dev)
> >>>>>        case AMD_CPU_ID_PCO:
> >>>>>                return MSG_OS_HINT_PCO;
> >>>>>        case AMD_CPU_ID_RN:
> >>>>> +     case AMD_CPU_ID_VG:
> >>>>>        case AMD_CPU_ID_YC:
> >>>>>        case AMD_CPU_ID_CB:
> >>>>>        case AMD_CPU_ID_PS:
> >>>>> @@ -717,6 +719,7 @@ static const struct pci_device_id
> >>>>> pmc_pci_ids[] = {
> >>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
> >>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
> >>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
> >>>>> +     { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
> >>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
> >>>>> PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
> >>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
> >>>>> PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
> >>>>>        { }
> >>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/
> >>>>> platform/x86/amd/pmc/pmc.h
> >>>>> index 62f3e51020fd..fe3f53eb5955 100644
> >>>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
> >>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> >>>>> @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
> >>>>>    #define AMD_CPU_ID_RN                       0x1630
> >>>>>    #define AMD_CPU_ID_PCO                      AMD_CPU_ID_RV
> >>>>>    #define AMD_CPU_ID_CZN                      AMD_CPU_ID_RN
> >>>>> +#define AMD_CPU_ID_VG                        0x1645
> >>>>
> >>>> Can you see if 0xF14 gives you a reasonable value for the idle mask if
> >>>> you add it to amd_pmc_idlemask_read()?  Make a new define for it
> >>>> though,
> >>>> it shouldn't use the same define as 0x1a platforms.
> >>>
> >>> It does not work. Reports 0. I also tested the other ones, but the
> >>> 0x1a was the same as you said. All report 0x0.
> >>
> >> It's possible the platform doesn't report an idle mask.
> >>
> >> 0xF14 is where I would have expected it to report.
> >>
> >> Shyam - can you look into this to see if it's in a different place
> >> than 0xF14 for Van Gogh?
> >
> > Van Gogh is before Cezzane? I am bit surprised that pmc is getting
> > loaded there.
> >
> > Antheas - what is the output of
> >
> > #lspci -s 00:00.0
>
> OK. I get it from the diff.
>
> +#define AMD_CPU_ID_VG                        0x1645
>
> S0 its 0x1645 that indicates SoC is 17h family and 90h model.
>
> What is the PMFW version running on your system?
> amd_pmc_get_smu_version() tells you that information.

cat /sys/devices/platform/AMDI0005:00/smu_fw_version
63.18.0
cat /sys/devices/platform/AMDI0005:00/smu_program
7

> Can you see if you put the scratch information same as Cezzane and if
> that works? i.e.
>
> AMD_PMC_SCRATCH_REG_CZN(0x94) instead of AMD_PMC_SCRATCH_REG_1AH(0xF14)

I tried all idle masks and they return 0

Antheas

> Thanks,
> Shyam
>
>
> >
> > 0xF14 index is meant for 1Ah (i.e. Strix and above)
> >
> >>
> >>>
> >>> Any idea why the OS hint only works 90% of the time?
> >
> > What is the output of amd_pmc_dump_registers() when 10% of the time
> > when the OS_HINT is not working?
> >
> > What I can surmise is, though pmc driver is sending the hint PMFW is
> > not taking any action (since the support in FW is missing)
> >
> >>
> >> If we get the idle mask reporting working we would have a better idea
> >> if that is what is reported wrong.
> >>
> >
> > IIRC, The concept of idlemask came only after cezzane that too after a
> > certain PMFW version. So I am not sure if idlemask actually exists.
> >
> >
> >> If I was to guess though; maybe GFX is still active.
> >>
> >> Depending upon what's going wrong smu_fw_info might have some more
> >> information too.
> >
> > That's a good point to try it out.
> >
> > Thanks,
> > Shyam
> >
>
>

