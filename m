Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75662374E71
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 20:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772568260; cv=none; b=AfkJLoiTjf+J6nUMFL74k7Ic/eEaxLXb7zKAMXGe0TTXfTundB7gNhmrq5emZh0C3j4AMZSvs5KQKwzDbAmTPxwGT5qWrpzvsJxQhI2PsOX8PxwB9FTFiSlCFmU3qbjqM1BoQV4yz9XMVORW9Qxgr584kHATT8ABm1/+hFnxzLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772568260; c=relaxed/simple;
	bh=9xB7x33pENs3d6voMEWJUKLfsthOLkeG6SVNGV+eZn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQh5q00ddzWTw1aI1y+j4Mr39Ae3YcyLa1Omk1s0J1mrNwdCTNUDsdMWdS1G5K2Tq2qnIFR3K+BiOfOGqWSLnv029Wvvn0KhIk/SMwgZwKbO6/UNhp7HGDPWjxiNH+Axi2ORHiH93ipsKFny64Fk+7kFIrGeRNIPkAv/yFkFGj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=YVt+yFrb; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="YVt+yFrb"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id A73695E8D8
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 22:04:17 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 5FACE5E21B
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 22:04:16 +0200 (EET)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 600531FF21B
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 22:04:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772568255;
	bh=4sxerjwxBkoAElrTv0Yja121pep4yWQvjZKoMg33iiE=;
	h=Received:From:Subject:To;
	b=YVt+yFrbHIL4pPWRY5m4gaDLjgshR3XwHcQ27qWP/JRo9bZzX6Jwr+mS3PLHyQtxh
	 DdVl5L9aO/HTBepMPtfxEuuZipKJ5RvejeCKCIIXNf4RkLZIm5k/2Aiec5WZhexiPQ
	 ZQVw0u9BuW68+inbeAnzllBacKU8tub5ilwmOdk7Zi8rFe0dIOcU5Vz1LcWIzmAkOg
	 UE79Jt/AgdiJUzfp83265d/wL+ZkYYpz2ye9U2aoZ7BX3B4pBAXpN3cKD5U9/S9te4
	 jD4qPvY9gSYi6vye/UZxe0aVkWkKaSnvy1ij7sLa/BIrWoEhtC933vG6sZrvgAkkmk
	 Ip/QMMazg/dOQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.45) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f45.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3598df39444so1523810a91.2
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 03 Mar 2026 12:04:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVUD6tLPirOz3VeHuIKdJXYZmSBxF1WcnycTGtV7nxPyeb3pmG2H0WBcu99n7sgP1E5qY4GqaupcrLEYQ4fOXKzLFrc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/QBKlluA0KdvhyRssp0LrjRzJ8Pv9LiVX4WONt8DUo5VABvCA
	L5lX6EWBl7fpkN1hVpMtUI+YgvbfyenKZQdSbvolR1eUm/c9/r5fTzTDdf3GnpoC4g+90MiygiB
	bTPwTQL/JB8Ri41mWNlWyT8OVmApqGKI=
X-Received: by 2002:a17:90b:1d09:b0:359:8988:38d3 with SMTP id
 98e67ed59e1d1-35989883b88mr7846129a91.7.1772568254227; Tue, 03 Mar 2026
 12:04:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303181707.2920261-1-lkml@antheas.dev>
 <2af36c81-4619-4f90-a04c-c3e5ed7a0cc5@kernel.org>
 <CAGwozwGTPKH5Lc4pEzmrNd7YhHJpZHod=YhViYVVcJTVbLX9ug@mail.gmail.com>
 <061b13d9-2415-46e0-8671-26ce0f608c8e@kernel.org>
In-Reply-To: <061b13d9-2415-46e0-8671-26ce0f608c8e@kernel.org>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 3 Mar 2026 21:04:02 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFYUO6bHcGOr4Q808r_y9_kLLS4-v_UUA44V0ZQ+KrpMA@mail.gmail.com>
X-Gm-Features: AaiRm53x77UEr44HPUvS7JstDfTiwdE8f-M5IVWFLk0hed8RdLC5CeFPRZTSK74
Message-ID: 
 <CAGwozwFYUO6bHcGOr4Q808r_y9_kLLS4-v_UUA44V0ZQ+KrpMA@mail.gmail.com>
Subject: Re: [RFC v1 0/2] platform/x86/amd: Add AMD DPTCi driver for TDP
 control in devices without vendor-specific controls
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177256825558.1883274.4960766339742662953@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 3 Mar 2026 at 20:51, Mario Limonciello (AMD) (kernel.org)
<superm1@kernel.org> wrote:
>
>
>
> On 3/3/2026 1:16 PM, Antheas Kapenekakis wrote:
> > On Tue, 3 Mar 2026 at 19:59, Mario Limonciello <superm1@kernel.org> wrote:
> >>
> >> A high level question - why aren't these vendors implementing PMF?  It's
> >> 1000% less work to enable PMF.  All the values that match the design get
> >> stored in BIOS, driver pulls the information and uses it.
> >
> >  From my understanding they do not implement anything and just use
> > ryzenadj with their windows vendor software.
> >
> >> Same approach for Windows and Linux.
> >>
> >> More comments below.
> >>
> >> On 3/3/26 12:17 PM, Antheas Kapenekakis wrote:
> >>> Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
> >>> ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
> >>> (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
> >>> allows software to adjust APU power and thermal parameters at runtime:
> >>> STAPM limit, fast/slow PPT limits, skin-temperature TDP limit, slow/STAPM
> >>> time constants, and the thermal control target.
> >>>
> >>> Until now userspace has reached this interface through the acpi_call out-
> >>> of-tree module or ryzenadj, which carry no ABI guarantees and no per-device
> >>> safety limits. This driver replaces that with a proper in-kernel
> >>> implementation that:
> >>>
> >>>     * Exposes all seven parameters through the firmware-attributes sysfs ABI,
> >>>       so that standard tools (fwupd, systemd-bios-vendor, etc.) can enumerate
> >>
> >> What is systemd-bios-vendor?  I guess I'm not familiar with this and a
> >> quick web search didn't turn anything obvious up.
> >
> > I used some AI assistance to compile this from my userspace
> > implementation and the ASEGA pdf from the AMD site. I need to go
> > through _everything_  before this moves to non-RFC. Same with
> > copyright year. I focused on the implementation doing the things I
> > want it to do for now.
>
> Got it; so it's a made up tool :P
>
> >
> >>>       and modify them without device-specific knowledge.
> >>>
> >>>     * Enforces tiered per-device and per-SoC limits. The default "device"
> >>>       mode restricts writes to a curated safe range (smin..smax) derived from
> >>>       the device's thermal design.
> >>
> >> Can you please elaborate where you got all these numbers from?  I don't
> >> know if they're accurate or not.  Someone would probably need to cross
> >> reference them to be sure.
> >
> > Trial and error, research, references from Windows, etc. All of the
> > devices in this driver have been tested with a userspace
> > implementation using the same limits for ppt/sppt/fppt. Nobody has
> > complained about them. To be honest, I usually do not set tctl slow
> > and fast time limits, so those are referenced from the Legion Go and
> > for tctl I go lower than what manufacturers usually set. Users like
> > tctl because some of them like their device to stay cooler.
> >
> > The big idea for this driver is to allow locking /dev/mem and ACPI.
> > Other than the legion go fan curves, and the Zotac Zone driver which
> > needs a cleanup, everything else is handled in the kernel now.
> >
> > But this approach works fine for the Zotac Zone as they seem to be
> > using a very simple WMI shim.
>
> I mean at a high level I conceptually like the idea of getting rid of
> the need to use software that manipulates /dev/mem and especially
> anything that means people relying on out of tree patches.
>
> This is a strong balancing act though to ratify interfaces to things
> that we don't have a stable ABI contract and documentation of the
> implications on getting it wrong.

Yes, that's a fair concern. From a practical perspective locking
/dev/mem and ACPI is required for secure boot so even if this approach
bounces around it is still important for downstream usecases while
OOT. This was my primary motivation for writing this.

I also tried to address the limit concerns from prior series, which is
why the DMI match is strong for stock kernels and the expanded range
leeway requires a command line argument and the SoC and unbounded
ranges require a re-compile.

While the ABI of this V1 RFC is fine, it could also be made to match
the lenovo driver by binding skin and stapm limits together and
renaming (so it works for both STT and STAPM modes regardless). Then,
it matches the convention 1-1. Although, since intel will never use
this driver, the motivation here is not strong.

To that end, it is still not clear to me for which CPUs the STAPM
limit is dropped, which is why its enabled for all of them in this V1.
I know the method got deprecated with the Z1 Extreme, but Lenovo
brought it back for their Legion Go 1 at least.


Antheas

> >
> >>>       An "expanded" mode exposes the full
> >>>       hardware-validated range. An optional CONFIG_AMD_DPTC_EXTENDED Kconfig
> >>>       adds "soc" (raw ALIB_PARAMS envelope) and "unbound" tiers for advanced
> >>>       use. The active tier is itself a firmware-attribute, switchable at
> >>>       runtime.
> >>>
> >>>     * Stages values and commits them atomically in a single ALIB call,
> >>>       matching the protocol's intended bulk-update semantics. A save_settings
> >>>       attribute (per firmware-attributes ABI) controls whether writes commit
> >>>       immediately ("single" mode) or are held until an explicit "save".
> >>>
> >>>     * When in "single" mode, re-applies staged values after system resume,
> >>>       so suspend/resume cycles do not silently revert to firmware defaults.
> >>
> >> This isn't the only interface for setting power limits.  How do you make
> >> sure that the EC for example isn't stepping on toes on these designs?
> >
> > For the DMI matched devices it is not. For the ones that are not
> > matched, the driver does not autoload and needs a kconfig parameter to
> > even load.
> >
> > OneXPlayer is a bit more complex with their turbo button doing TDP
> > swaps but turbo takeover in oxpec takes care of that and then you are
> > supposed use ryzenadj.
> >
> >> I /guess/ it always will need to be opt-in a device by device basis.
> >>
> >> What happens if the vendor enables PMF in a BIOS update?  How does this
> >> avoid conflicts?
> >
> > Some manufacturers enable pmf without implementing the tables. From my
> > understanding none of them implement pmf with limits. If a
> > manufacturer wants to move to pmf, we can amend the DMI entry with a
> > bios match. However, from my understanding, there is no TDP slider
> > equivalent for PMF.
> >
> >>>
> >>> Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
> >>> Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
> >>> and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
> >>> 8000, Z1, AI 9 HX 370, and the Ryzen AI MAX series.
> >>>
> >>> Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
> >>> that committed values are applied to hardware, and that fast/slow PPT
> >>> limits are honoured under a full-CPU stress load.
> >>>
> >>> @Mario: can you suggest a CC list for V2? Thanks. Even if not merged, this
> >>> driver is still good for downstream use.
> >>
> >> You should include Shyam (AMD), Denis and Derek (community).
> >
> > Sure.
> >
> >>>
> >>> ---
> >>> Usage
> >>> -----
> >>>
> >>> List all exposed attributes (read-only, no root required):
> >>>
> >>>     $ fwupdmgr get-bios-settings
> >>>
> >>> This enumerates every attribute under /sys/class/firmware-attributes/,
> >>> including current_value, default_value, min_value, max_value, and
> >>> display_name for each DPTCi parameter.
> >>
> >> AFAIK - fwupd doesn't understand "save_settings" today
> >
> > Yes, I do not expect it to even allow writing, but at least you can
> > preview the values which is useful. And from what I saw defaults are
> > not shown either.
> >
> > Antheas
> >
> >>>
> >>> Sysfs direct usage
> >>> ------------------
> >>>
> >>> All paths are under:
> >>>
> >>>     ATTR=/sys/class/firmware-attributes/amd_dptc/attributes
> >>>
> >>> Inspect a parameter (no root needed):
> >>>
> >>>     $ cat $ATTR/stapm_limit/{display_name,min_value,max_value,default_value,current_value}
> >>>     Sustained TDP (mW)
> >>>     4000
> >>>     85000
> >>>     25000
> >>>                             <- empty: nothing staged yet
> >>>
> >>> Stage values (held in memory, not yet sent to firmware):
> >>>
> >>>     $ echo 25000 | sudo tee $ATTR/stapm_limit/current_value
> >>>     $ echo 40000 | sudo tee $ATTR/fast_limit/current_value
> >>>     $ echo 27000 | sudo tee $ATTR/slow_limit/current_value
> >>>     $ echo 25000 | sudo tee $ATTR/skin_limit/current_value
> >>>     $ echo 85    | sudo tee $ATTR/temp_target/current_value
> >>>
> >>> Commit all staged values in one ALIB call:
> >>>
> >>>     $ echo save | sudo tee $ATTR/save_settings
> >>>
> >>> Switch to auto-commit (each write commits immediately):
> >>>
> >>>     $ echo single | sudo tee $ATTR/save_settings
> >>>
> >>> Return to bulk mode:
> >>>
> >>>     $ echo bulk | sudo tee $ATTR/save_settings
> >>>
> >>> Clear a staged value without committing:
> >>>
> >>>     $ echo | sudo tee $ATTR/stapm_limit/current_value
> >>>
> >>> Query or change the active limit tier (device/expanded/soc/unbound):
> >>>
> >>>     $ cat $ATTR/limit_mode/possible_values
> >>>     device;expanded;soc;unbound
> >>>     $ echo expanded | sudo tee $ATTR/limit_mode/current_value
> >>>
> >>> Switching tiers clears all staged values (old values may fall outside the
> >>> new range). Stages and commits must be redone after a mode switch.
> >>>
> >>> Antheas Kapenekakis (2):
> >>>     Documentation: firmware-attributes: generalize save_settings entry
> >>>     platform/x86/amd: Add AMD DPTCi driver
> >>>
> >>>    .../testing/sysfs-class-firmware-attributes   |   41 +-
> >>>    MAINTAINERS                                   |    6 +
> >>>    drivers/platform/x86/amd/Kconfig              |   27 +
> >>>    drivers/platform/x86/amd/Makefile             |    2 +
> >>>    drivers/platform/x86/amd/dptc.c               | 1325 +++++++++++++++++
> >>>    5 files changed, 1386 insertions(+), 15 deletions(-)
> >>>    create mode 100644 drivers/platform/x86/amd/dptc.c
> >>>
> >>>
> >>> base-commit: c89ce241c1909d2c2bdde88334c33f3000d364fb
> >>
> >>
> >
>
>

