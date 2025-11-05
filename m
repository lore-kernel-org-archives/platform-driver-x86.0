Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8832D7DE8
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Nov 2025 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762342524; cv=none; b=NRJByoZMfJHgiyD1Q1pmSx7LXZXx3uwrwKKbxUshK1iZhVh8rOy42EtRxNJWPWMR9+PKt/DLvsCC/kfdx/feNXnilbX6EmmHg0oUK73rtORrP31ITOWRXt1b6Uouawh0eWx+p4nGJ/hY6gJRtq64FDxTLE4TlQLWIGpcDR4B/9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762342524; c=relaxed/simple;
	bh=xR4ebIOIgyLajP0SZZlOHMf1aHTZBqWsJqPNccjbhjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMNOxQUL8u+5LckSEOedjsrU0yva5dMNYvK/KlDm5UL4qccjEky+w0scfYelpO3QcaG3gjUJn4VoLQP0w3M9/NCEZAeYU7P/WCFevoa65e4cx9vvkrTFAYDDA+41RVwhRvFFkhK5Oae38xISUlGkSuqft8SOwCZAvLyVmNfca/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=BiWs7cRW; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="BiWs7cRW"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 949AB5E56B
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Nov 2025 13:35:14 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id B90D75E52B
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Nov 2025 13:35:12 +0200 (EET)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 782D91FEC95
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Nov 2025 13:35:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762342511;
	bh=2zPD0WBVf4i/ezq7b1QUKnCu2WljXyXeAe1e8dFi6io=;
	h=Received:From:Subject:To;
	b=BiWs7cRW3Z9DU4IvRXcutWQ3O3hXOwlrtbpzSJQ2Nuj6tUS+zGoFo4LuhllI1YM68
	 Wct9vvrfywJm+voFL61t4SPWJKFsu6RtA83jX0zCQCWSdBHnTx89ykUT9u3WDkn0zf
	 WSSO6WPa/kAAlhvfjSyt8ELrZwO0foA6PWdeYD+b+cPMOjRxDfgEgOfxQuxfzSXL2o
	 HqXbdAbmi0KoHDmrd84BOI32fZq7oEl/N3TFUUoE7DAix7Uc25ZugRFJkN+caziIip
	 nxf3rcHfz+O9GlkMvgdmPvuCcGAUXcl+2naDaJmcaXqci36MqJzXKLUoa0up0syxKv
	 5msLslkJMr5UA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-37a4e329a90so8814101fa.0
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 05 Nov 2025 03:35:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxZW/FHCjfDqh5XsrZNq1ujYCWL+pTRW+H4V8Evfe62vBixnB3m/yOReCODnnHmEKhkSKMYH6FymcYlJiy4sSaBZRt@vger.kernel.org
X-Gm-Message-State: AOJu0YzY3ndFzIfQgIc0+uwiGGs5Ki74t45s12aigYkg2VIoe2AcGeWi
	4nwLPlkRjScDkNT1qVKSFf+e00/+7OTucGG4XbmfX3gTAN4TK+NcL+aE7jLnkBCOoEHtb1GrVYb
	sMfVoG8k1knl1/1/Dy+52fV2PnAhilSY=
X-Google-Smtp-Source: 
 AGHT+IHGQj4EZeUimtkbjgF1IeB2tetC4shdETjzwtgaULQ5O6waLgVlriowcbZfmBoH0NWumdnutXg5Frg7mKzgBN0=
X-Received: by 2002:a2e:a58d:0:b0:37a:584c:23ef with SMTP id
 38308e7fff4ca-37a584c24bbmr4808481fa.31.1762342510693; Wed, 05 Nov 2025
 03:35:10 -0800 (PST)
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
 <CAGwozwGLfcYdpetwTk=QH+k29u8SdroFxfkxb-KbAXh36sr1XQ@mail.gmail.com>
 <100c2f25-d1f4-5b82-4a76-a08394ece471@linux.intel.com>
 <fe9bb350-6dc5-4911-ad32-a95911251167@amd.com>
In-Reply-To: <fe9bb350-6dc5-4911-ad32-a95911251167@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 5 Nov 2025 12:34:59 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFRWiR4xQ422tp6H0R9knLjNkn4ewERyYtZgzOYfnJWxw@mail.gmail.com>
X-Gm-Features: AWmQ_bmwOsN6-7nnJfMI7_4qSh-nyTpW0WB_Wo9A0VaG9xskOZ9zDoHsNLjt4fc
Message-ID: 
 <CAGwozwFRWiR4xQ422tp6H0R9knLjNkn4ewERyYtZgzOYfnJWxw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
	Perry Yuan <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org, Sanket Goswami <Sanket.Goswami@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176234251183.480814.1845576599142801542@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 5 Nov 2025 at 12:28, Shyam Sundar S K <Shyam-sundar.S-k@amd.com> wr=
ote:
>
> Hi Ilpo,
>
> On 11/5/2025 16:43, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 27 Oct 2025, Antheas Kapenekakis wrote:
> >
> >> On Mon, 27 Oct 2025 at 09:36, Shyam Sundar S K <Shyam-sundar.S-k@amd.c=
om> wrote:
> >>>
> >>>
> >>>
> >>> On 10/27/2025 13:52, Shyam Sundar S K wrote:
> >>>>
> >>>>
> >>>> On 10/24/2025 22:02, Mario Limonciello wrote:
> >>>>>
> >>>>>
> >>>>> On 10/24/2025 11:08 AM, Antheas Kapenekakis wrote:
> >>>>>> On Fri, 24 Oct 2025 at 17:43, Mario Limonciello
> >>>>>> <mario.limonciello@amd.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> >>>>>>>> The ROG Xbox Ally (non-X) SoC features a similar architecture to=
 the
> >>>>>>>> Steam Deck. While the Steam Deck supports S3 (s2idle causes a cr=
ash),
> >>>>>>>> this support was dropped by the Xbox Ally which only S0ix suspen=
d.
> >>>>>>>>
> >>>>>>>> Since the handler is missing here, this causes the device to not
> >>>>>>>> suspend
> >>>>>>>> and the AMD GPU driver to crash while trying to resume afterward=
s
> >>>>>>>> due to
> >>>>>>>> a power hang.
> >>>>>>>>
> >>>>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> >>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>>>>> ---
> >>>>>>>>    drivers/platform/x86/amd/pmc/pmc.c | 3 +++
> >>>>>>>>    drivers/platform/x86/amd/pmc/pmc.h | 1 +
> >>>>>>>>    2 files changed, 4 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/
> >>>>>>>> platform/x86/amd/pmc/pmc.c
> >>>>>>>> index bd318fd02ccf..cae3fcafd4d7 100644
> >>>>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
> >>>>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> >>>>>>>> @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct
> >>>>>>>> amd_pmc_dev *dev)
> >>>>>>>>        switch (dev->cpu_id) {
> >>>>>>>>        case AMD_CPU_ID_PCO:
> >>>>>>>>        case AMD_CPU_ID_RN:
> >>>>>>>> +     case AMD_CPU_ID_VG:
> >>>>>>>>        case AMD_CPU_ID_YC:
> >>>>>>>>        case AMD_CPU_ID_CB:
> >>>>>>>>                dev->num_ips =3D 12;
> >>>>>>>> @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct
> >>>>>>>> amd_pmc_dev *dev)
> >>>>>>>>        case AMD_CPU_ID_PCO:
> >>>>>>>>                return MSG_OS_HINT_PCO;
> >>>>>>>>        case AMD_CPU_ID_RN:
> >>>>>>>> +     case AMD_CPU_ID_VG:
> >>>>>>>>        case AMD_CPU_ID_YC:
> >>>>>>>>        case AMD_CPU_ID_CB:
> >>>>>>>>        case AMD_CPU_ID_PS:
> >>>>>>>> @@ -717,6 +719,7 @@ static const struct pci_device_id
> >>>>>>>> pmc_pci_ids[] =3D {
> >>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
> >>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
> >>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
> >>>>>>>> +     { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
> >>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
> >>>>>>>> PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
> >>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
> >>>>>>>> PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
> >>>>>>>>        { }
> >>>>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/
> >>>>>>>> platform/x86/amd/pmc/pmc.h
> >>>>>>>> index 62f3e51020fd..fe3f53eb5955 100644
> >>>>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
> >>>>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> >>>>>>>> @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *=
dev);
> >>>>>>>>    #define AMD_CPU_ID_RN                       0x1630
> >>>>>>>>    #define AMD_CPU_ID_PCO                      AMD_CPU_ID_RV
> >>>>>>>>    #define AMD_CPU_ID_CZN                      AMD_CPU_ID_RN
> >>>>>>>> +#define AMD_CPU_ID_VG                        0x1645
> >>>>>>>
> >>>>>>> Can you see if 0xF14 gives you a reasonable value for the idle ma=
sk if
> >>>>>>> you add it to amd_pmc_idlemask_read()?  Make a new define for it
> >>>>>>> though,
> >>>>>>> it shouldn't use the same define as 0x1a platforms.
> >>>>>>
> >>>>>> It does not work. Reports 0. I also tested the other ones, but the
> >>>>>> 0x1a was the same as you said. All report 0x0.
> >>>>>
> >>>>> It's possible the platform doesn't report an idle mask.
> >>>>>
> >>>>> 0xF14 is where I would have expected it to report.
> >>>>>
> >>>>> Shyam - can you look into this to see if it's in a different place
> >>>>> than 0xF14 for Van Gogh?
> >>>>
> >>>> Van Gogh is before Cezzane? I am bit surprised that pmc is getting
> >>>> loaded there.
> >>>>
> >>>> Antheas - what is the output of
> >>>>
> >>>> #lspci -s 00:00.0
> >>>
> >>> OK. I get it from the diff.
> >>>
> >>> +#define AMD_CPU_ID_VG                        0x1645
> >>>
> >>> S0 its 0x1645 that indicates SoC is 17h family and 90h model.
> >>>
> >>> What is the PMFW version running on your system?
> >>> amd_pmc_get_smu_version() tells you that information.
> >>
> >> cat /sys/devices/platform/AMDI0005:00/smu_fw_version
> >> 63.18.0
> >> cat /sys/devices/platform/AMDI0005:00/smu_program
> >> 7
> >>
> >>> Can you see if you put the scratch information same as Cezzane and if
> >>> that works? i.e.
> >>>
> >>> AMD_PMC_SCRATCH_REG_CZN(0x94) instead of AMD_PMC_SCRATCH_REG_1AH(0xF1=
4)
> >>
> >> I tried all idle masks and they return 0
> >
> > Hi Shyam & Antheas,
> >
> > This discussion seems to have died down without clear indication what's
> > the best course of action here. Should I still wait?
> >
> > There's no particular hurry from my side but it seems Mario gave his
> > Reviewed-by already and there hasn't been any follow-ups between you tw=
o,
> > I'm left a bit unsure how to interpret that.
> >
>
> The thought process to was understand how do we debug the rest 5%
> failures when we do no not have idlemask concept, which got introduced
> after sometime. But both the patches should work independently, so I
> am ok with both patch 1/3 and 2/3.
>
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>
>
> >
> > In addition, is the patch 3/3 entire independent from these two PMC one=
s?
> > (If yes, I don't know why they were submitted as a series as that just
> > manages to add a little bit of uncertainty when combined into a series.=
)
>
> I see a note from Mario on the cover letter that the patch 3/3 can be
> dropped from this series and a newer approach is being planned.

To be more specific, patch 3 became two separate patches that went through =
drm.

For the rare failure, it would be an additional patch (if appropriate)
that does not affect 1 and 2.

Do you have any idea of where the failure for the other 5% of cases
comes from? I noticed that after I hibernated my device and it booted
up, it would never go into LPS0, the OS hint stopped working, would
that be a hint?

Antheas

> So, 1/3 and 2/3 of this series can be taken.
>
> Thanks,
> Shyam
> >
> > Thanks in advance,
> >
> > --
> >  i.
> >
> >> Antheas
> >>
> >>> Thanks,
> >>> Shyam
> >>>
> >>>
> >>>>
> >>>> 0xF14 index is meant for 1Ah (i.e. Strix and above)
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Any idea why the OS hint only works 90% of the time?
> >>>>
> >>>> What is the output of amd_pmc_dump_registers() when 10% of the time
> >>>> when the OS_HINT is not working?
> >>>>
> >>>> What I can surmise is, though pmc driver is sending the hint PMFW is
> >>>> not taking any action (since the support in FW is missing)
> >>>>
> >>>>>
> >>>>> If we get the idle mask reporting working we would have a better id=
ea
> >>>>> if that is what is reported wrong.
> >>>>>
> >>>>
> >>>> IIRC, The concept of idlemask came only after cezzane that too after=
 a
> >>>> certain PMFW version. So I am not sure if idlemask actually exists.
> >>>>
> >>>>
> >>>>> If I was to guess though; maybe GFX is still active.
> >>>>>
> >>>>> Depending upon what's going wrong smu_fw_info might have some more
> >>>>> information too.
> >>>>
> >>>> That's a good point to try it out.
> >>>>
> >>>> Thanks,
> >>>> Shyam
> >>>>
> >>>
> >>>
> >>
> >>
> >
>
>

