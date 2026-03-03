Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54A6372EEF
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 23:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581685; cv=none; b=f9Y2kR6lt0X4BD04mSuWoUdU1Zvk433rJQQZBLxz3DAG+BetZm1+rfPCpuxDflILKtt0KOlHpAaSjwl82Y8djG4yLfOnU9BcP4ipCoN7qlRbNVOPjbGZZwnG58mUV13jTlK27h3UDW3YCxmXBnpfS0P3H42Ser7QjwUBtxevGvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581685; c=relaxed/simple;
	bh=dH4PRUyFb9V4ecMNaNaIW+kq1nJapau935Lwedh6wEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VF/9vXuiS6kszAtagyTRPob2OIK6Ei4pIanIvNWsjhLASD9LVz0zn2RD/hyDTB8Fksu4vrbU3Y+acPHkDBMm2W4iUziRrlUO8dIQVuJ1I9srHR/CIgm1rQIu95tW92xFpGlI0AEZQqXneLVQHtA/MQgf3Smcq2o2rxcheUsvVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QIUKFwmL; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QIUKFwmL"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id D02B0C1A18
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 01:48:01 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 702EFBC1AA
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 01:48:00 +0200 (EET)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C80131FF1EB
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 01:47:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772581680;
	bh=5e1IzE/pZVJTCrKWZyBH77l4+wR1YXJBLXMnDpiDut0=;
	h=Received:From:Subject:To;
	b=QIUKFwmLrEoGoHByXOOWuIm1Ig/Ur6UXbFA110IvpT1LS8rl330tMjaUN2e7X7lLz
	 Tv/dQBmXbCvrU6CIHvV8qz5msOWbJZY4F1lK2ZmUvqnChpYiUc+L0gAyXmygAXMSMk
	 Q3g9CNKKb0qmBfLj/NlsZ9mKR3TvedZlGEqYfULBJernBkHGxzkCeMhA/s2lNf1Q3R
	 TUTxzR3wLlukiui/rTTZiP1XdocLRY5NFRNxTaOMTEphKiknCD7Ak0c5bmWohvUKoD
	 vFGpTdihxvtyouVOct/y7UQ3hve7OYipQI2MbiQvSD8tmkmdWeCtrSiTVcSTJEntnq
	 TnWjVyby2kL8A==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.42) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f42.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-354a18c48b5so5507531a91.1
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 03 Mar 2026 15:47:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVf5d9hSQ4AcaQt930GzFFWMy5LcHjubbO9CLvE1BzFSpRy3UcPx175Bfkag2vz5xnmnPt6WD9OsOwIch21wn5WgN/+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5SNXKDeU4Wl74kPDMQsL0qzbVtBCx7yJmMRvBL7l1p1h2/P5g
	EJxDVVJih1AZ66vET6l8B+QFIL6eHB8cHR+OzvEWxE0uQmMmlvHwaL5XZFki82c9RlUxP+HiSzP
	le3lXxp0H1/n4HZOv7+pKVDKvDo3iB5w=
X-Received: by 2002:a17:90b:2c86:b0:356:2872:9c5d with SMTP id
 98e67ed59e1d1-359a6a6648fmr172338a91.24.1772581678292; Tue, 03 Mar 2026
 15:47:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303181707.2920261-1-lkml@antheas.dev>
 <2af36c81-4619-4f90-a04c-c3e5ed7a0cc5@kernel.org>
 <CAGwozwGTPKH5Lc4pEzmrNd7YhHJpZHod=YhViYVVcJTVbLX9ug@mail.gmail.com>
 <00147a2d-6829-4867-9ae9-8a27eb51289a@gmx.de>
 <CAGwozwGnxf+N9QA7H+d1qd+-aKELi7=3Kowq0UjHBT+PGm85Rw@mail.gmail.com>
 <d6208c58-4d29-4565-ac14-4c1adf295990@gmx.de>
In-Reply-To: <d6208c58-4d29-4565-ac14-4c1adf295990@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 4 Mar 2026 00:47:47 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHP7sPZmLQXbuY5k2uta1abpqhLxNhTSxGNHOpT4C_a+g@mail.gmail.com>
X-Gm-Features: AaiRm52tHd1xI4mPEEE6z7AEQzjJloTeuZs7yJbx1XO9cqrmArtkydCrrU5emuI
Message-ID: 
 <CAGwozwHP7sPZmLQXbuY5k2uta1abpqhLxNhTSxGNHOpT4C_a+g@mail.gmail.com>
Subject: Re: [RFC v1 0/2] platform/x86/amd: Add AMD DPTCi driver for TDP
 control in devices without vendor-specific controls
To: Armin Wolf <W_Armin@gmx.de>
Cc: Mario Limonciello <superm1@kernel.org>, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177258168013.2643519.2779228176756173868@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 3 Mar 2026 at 22:51, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 03.03.26 um 20:34 schrieb Antheas Kapenekakis:
>
> > On Tue, 3 Mar 2026 at 20:27, Armin Wolf <W_Armin@gmx.de> wrote:
> >> Am 03.03.26 um 20:16 schrieb Antheas Kapenekakis:
> >>
> >>> On Tue, 3 Mar 2026 at 19:59, Mario Limonciello <superm1@kernel.org> wrote:
> >>>> A high level question - why aren't these vendors implementing PMF?  It's
> >>>> 1000% less work to enable PMF.  All the values that match the design get
> >>>> stored in BIOS, driver pulls the information and uses it.
> >>>   From my understanding they do not implement anything and just use
> >>> ryzenadj with their windows vendor software.
> >> Do they implement a WMI ACPI device called "AOD"? AFAIK this WMI device
> >> is used by the Ryzen Master utility, so it could also allow users to change
> >> the TDP limits in a reasonable safe way.
> >>
> >> If they indeed only use ryzenadj, then shame on them.
> >  From my understanding, Ryzen Master has not been updated in a while. I
> > was not aware of the AOD device. Moreover, it was my understanding
> > that Ryzen Master hardcoded write and lookup addresses.
>
> AFAIK someone on the Phoronix forums has found out that Ryzen Master uses
> the AOD WMI device, at least on some platforms.
>
> >  From a quick lookup in my dump repository [2] it seems like not all of
> > them feature an AOD device. See below for an AI assisted compilation.
> >
> > The good thing with this interface is that it handles rerouting to
> > different mailbox addresses per generation, which makes implementation
> > straightforward.
>
> Yes, but the WMI interface also signals what kinds of settings are supported
> on a given device, as well as limits and step sizes. We would however require
> some input from AMD to figure out how to properly use it. Otherwise i can run
> some test to figure out the underlying interface.
>
> On devices without the AOD device, using the ALIB interface indeed seems to be
> the least dangerous way.

Seems like the AOD device just does clock tuning, but clocks are
locked on these devices and boost is enough to exceed the thermal
envelope. So I would not consider it a replacement in any case.
Perhaps there's some potential for desktop CPUs, but that's not my
area.

Antheas

> Thanks,
> Armin Wolf
>
> > Antheas
> >
> > [2] https://github.com/hhd-dev/hwinfo
> >
> > The following devices have an AOD device:
> > Asus Z13 2025 AMD (AMDT=0x02, AMDI* HIDs)
> > Legion_5_15ACH6H AMD Ryzen 5000
> > Legion_Slim_5_14APH8 AMD
> > Legion_Slim_7_16APH8 AMD
> > ally_x AMD Ryzen Z1 Extreme
> > aokzoe a1x AMD
> > ayaneo_3 AMD
> > ayaneo_flip_kb AMD
> > legion_go AMD (multiple ACPI versions)
> > one xplayer AMD
> > onexplayer f1pro AMD (AMDT=0x02, AMDI* HIDs)
> > orangepi_neo AMD
> > xbox_ally_x AMD Ryzen Z1 Extreme
> >
> > The following do not:
> > ayaneo_airplus
> > ayaneo_kun
> > ayaneo_slide
> > gpd_win4
> > gpd_win4_2024
> > gpd_win4_8840u
> > gpd_winmini
> > legion_go_s
> > loki_max
> > onexpalyer_fly
> > onexplayer x1
> > onexplayer x1 mini
> > onexplayer_mini_pro
> > rog_ally
> > win_max_2_hx370
> > xbox_ally
> >
> >> Thanks,
> >> Armin Wolf
> >>
> >>>> Same approach for Windows and Linux.
> >>>>
> >>>> More comments below.
> >>>>
> >>>> On 3/3/26 12:17 PM, Antheas Kapenekakis wrote:
> >>>>> Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
> >>>>> ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
> >>>>> (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
> >>>>> allows software to adjust APU power and thermal parameters at runtime:
> >>>>> STAPM limit, fast/slow PPT limits, skin-temperature TDP limit, slow/STAPM
> >>>>> time constants, and the thermal control target.
> >>>>>
> >>>>> Until now userspace has reached this interface through the acpi_call out-
> >>>>> of-tree module or ryzenadj, which carry no ABI guarantees and no per-device
> >>>>> safety limits. This driver replaces that with a proper in-kernel
> >>>>> implementation that:
> >>>>>
> >>>>>      * Exposes all seven parameters through the firmware-attributes sysfs ABI,
> >>>>>        so that standard tools (fwupd, systemd-bios-vendor, etc.) can enumerate
> >>>> What is systemd-bios-vendor?  I guess I'm not familiar with this and a
> >>>> quick web search didn't turn anything obvious up.
> >>> I used some AI assistance to compile this from my userspace
> >>> implementation and the ASEGA pdf from the AMD site. I need to go
> >>> through _everything_  before this moves to non-RFC. Same with
> >>> copyright year. I focused on the implementation doing the things I
> >>> want it to do for now.
> >>>
> >>>>>        and modify them without device-specific knowledge.
> >>>>>
> >>>>>      * Enforces tiered per-device and per-SoC limits. The default "device"
> >>>>>        mode restricts writes to a curated safe range (smin..smax) derived from
> >>>>>        the device's thermal design.
> >>>> Can you please elaborate where you got all these numbers from?  I don't
> >>>> know if they're accurate or not.  Someone would probably need to cross
> >>>> reference them to be sure.
> >>> Trial and error, research, references from Windows, etc. All of the
> >>> devices in this driver have been tested with a userspace
> >>> implementation using the same limits for ppt/sppt/fppt. Nobody has
> >>> complained about them. To be honest, I usually do not set tctl slow
> >>> and fast time limits, so those are referenced from the Legion Go and
> >>> for tctl I go lower than what manufacturers usually set. Users like
> >>> tctl because some of them like their device to stay cooler.
> >>>
> >>> The big idea for this driver is to allow locking /dev/mem and ACPI.
> >>> Other than the legion go fan curves, and the Zotac Zone driver which
> >>> needs a cleanup, everything else is handled in the kernel now.
> >>>
> >>> But this approach works fine for the Zotac Zone as they seem to be
> >>> using a very simple WMI shim.
> >>>
> >>>>>        An "expanded" mode exposes the full
> >>>>>        hardware-validated range. An optional CONFIG_AMD_DPTC_EXTENDED Kconfig
> >>>>>        adds "soc" (raw ALIB_PARAMS envelope) and "unbound" tiers for advanced
> >>>>>        use. The active tier is itself a firmware-attribute, switchable at
> >>>>>        runtime.
> >>>>>
> >>>>>      * Stages values and commits them atomically in a single ALIB call,
> >>>>>        matching the protocol's intended bulk-update semantics. A save_settings
> >>>>>        attribute (per firmware-attributes ABI) controls whether writes commit
> >>>>>        immediately ("single" mode) or are held until an explicit "save".
> >>>>>
> >>>>>      * When in "single" mode, re-applies staged values after system resume,
> >>>>>        so suspend/resume cycles do not silently revert to firmware defaults.
> >>>> This isn't the only interface for setting power limits.  How do you make
> >>>> sure that the EC for example isn't stepping on toes on these designs?
> >>> For the DMI matched devices it is not. For the ones that are not
> >>> matched, the driver does not autoload and needs a kconfig parameter to
> >>> even load.
> >>>
> >>> OneXPlayer is a bit more complex with their turbo button doing TDP
> >>> swaps but turbo takeover in oxpec takes care of that and then you are
> >>> supposed use ryzenadj.
> >>>
> >>>> I /guess/ it always will need to be opt-in a device by device basis.
> >>>>
> >>>> What happens if the vendor enables PMF in a BIOS update?  How does this
> >>>> avoid conflicts?
> >>> Some manufacturers enable pmf without implementing the tables. From my
> >>> understanding none of them implement pmf with limits. If a
> >>> manufacturer wants to move to pmf, we can amend the DMI entry with a
> >>> bios match. However, from my understanding, there is no TDP slider
> >>> equivalent for PMF.
> >>>
> >>>>> Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
> >>>>> Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
> >>>>> and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
> >>>>> 8000, Z1, AI 9 HX 370, and the Ryzen AI MAX series.
> >>>>>
> >>>>> Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
> >>>>> that committed values are applied to hardware, and that fast/slow PPT
> >>>>> limits are honoured under a full-CPU stress load.
> >>>>>
> >>>>> @Mario: can you suggest a CC list for V2? Thanks. Even if not merged, this
> >>>>> driver is still good for downstream use.
> >>>> You should include Shyam (AMD), Denis and Derek (community).
> >>> Sure.
> >>>
> >>>>> ---
> >>>>> Usage
> >>>>> -----
> >>>>>
> >>>>> List all exposed attributes (read-only, no root required):
> >>>>>
> >>>>>      $ fwupdmgr get-bios-settings
> >>>>>
> >>>>> This enumerates every attribute under /sys/class/firmware-attributes/,
> >>>>> including current_value, default_value, min_value, max_value, and
> >>>>> display_name for each DPTCi parameter.
> >>>> AFAIK - fwupd doesn't understand "save_settings" today
> >>> Yes, I do not expect it to even allow writing, but at least you can
> >>> preview the values which is useful. And from what I saw defaults are
> >>> not shown either.
> >>>
> >>> Antheas
> >>>
> >>>>> Sysfs direct usage
> >>>>> ------------------
> >>>>>
> >>>>> All paths are under:
> >>>>>
> >>>>>      ATTR=/sys/class/firmware-attributes/amd_dptc/attributes
> >>>>>
> >>>>> Inspect a parameter (no root needed):
> >>>>>
> >>>>>      $ cat $ATTR/stapm_limit/{display_name,min_value,max_value,default_value,current_value}
> >>>>>      Sustained TDP (mW)
> >>>>>      4000
> >>>>>      85000
> >>>>>      25000
> >>>>>                              <- empty: nothing staged yet
> >>>>>
> >>>>> Stage values (held in memory, not yet sent to firmware):
> >>>>>
> >>>>>      $ echo 25000 | sudo tee $ATTR/stapm_limit/current_value
> >>>>>      $ echo 40000 | sudo tee $ATTR/fast_limit/current_value
> >>>>>      $ echo 27000 | sudo tee $ATTR/slow_limit/current_value
> >>>>>      $ echo 25000 | sudo tee $ATTR/skin_limit/current_value
> >>>>>      $ echo 85    | sudo tee $ATTR/temp_target/current_value
> >>>>>
> >>>>> Commit all staged values in one ALIB call:
> >>>>>
> >>>>>      $ echo save | sudo tee $ATTR/save_settings
> >>>>>
> >>>>> Switch to auto-commit (each write commits immediately):
> >>>>>
> >>>>>      $ echo single | sudo tee $ATTR/save_settings
> >>>>>
> >>>>> Return to bulk mode:
> >>>>>
> >>>>>      $ echo bulk | sudo tee $ATTR/save_settings
> >>>>>
> >>>>> Clear a staged value without committing:
> >>>>>
> >>>>>      $ echo | sudo tee $ATTR/stapm_limit/current_value
> >>>>>
> >>>>> Query or change the active limit tier (device/expanded/soc/unbound):
> >>>>>
> >>>>>      $ cat $ATTR/limit_mode/possible_values
> >>>>>      device;expanded;soc;unbound
> >>>>>      $ echo expanded | sudo tee $ATTR/limit_mode/current_value
> >>>>>
> >>>>> Switching tiers clears all staged values (old values may fall outside the
> >>>>> new range). Stages and commits must be redone after a mode switch.
> >>>>>
> >>>>> Antheas Kapenekakis (2):
> >>>>>      Documentation: firmware-attributes: generalize save_settings entry
> >>>>>      platform/x86/amd: Add AMD DPTCi driver
> >>>>>
> >>>>>     .../testing/sysfs-class-firmware-attributes   |   41 +-
> >>>>>     MAINTAINERS                                   |    6 +
> >>>>>     drivers/platform/x86/amd/Kconfig              |   27 +
> >>>>>     drivers/platform/x86/amd/Makefile             |    2 +
> >>>>>     drivers/platform/x86/amd/dptc.c               | 1325 +++++++++++++++++
> >>>>>     5 files changed, 1386 insertions(+), 15 deletions(-)
> >>>>>     create mode 100644 drivers/platform/x86/amd/dptc.c
> >>>>>
> >>>>>
> >>>>> base-commit: c89ce241c1909d2c2bdde88334c33f3000d364fb
>

