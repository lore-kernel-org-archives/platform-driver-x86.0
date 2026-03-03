Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E58239658E
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 19:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772565806; cv=none; b=C6gEbt/k6Mj2/KPZhx7T+L/FruQffWeik2ExQqH7mKs+ePW1jtN5WPKYkbxgCVXM2CdE8qojLYX/Ypoc+jCJjUfc00j7SKUa1z3kDf3MFAjK02HCfF6X7KAYQnMQB9YRmMfhW05TAJWbP9vdn2uzdj7qk9tYtF2LoDJUh+utXxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772565806; c=relaxed/simple;
	bh=LwfzzD4EoNidOe+c4o+BxzKdhOmq1xhhq5/oTlllztQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFw8nA5PLj5LN6jusqv7gttTVEB7NqHTj3Umhpc+GjpW/aYLiawPNhSFYNSwFrnWl0cu+82L+CyPk4sLqunR0Cf2RJuN6r5TKwZhYR57t3PnzMyPQCwGygkHxZ8a/PHTGLt/4L6UBLp2j8qNCV5/2CuVMve5U8HoF66vWVP4DFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=O9FVbKaK; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="O9FVbKaK"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 6F65341AE5
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 21:23:23 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 95BBB45FC3
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 21:23:22 +0200 (EET)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id F012C1FF2A7
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 21:23:21 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772565802;
	bh=1d1mKjaGN2BAcI3tWuXnsGfdllYSEqXqy+SVl+uUls8=;
	h=Received:From:Subject:To;
	b=O9FVbKaKdeiPpw2pkzXR8QzFItW2VwyhISZekQ68+60GmQJCSW8pDrBrADvW9bTru
	 6Jv5RUi1z7Dfcs/Z0zhRraJ8RcDey1VqnhvxL9ifFBWNZWspMrF6epKBFKOJOPEGJq
	 aPb/SiRt3lYtbyNj9noDtqhlp1pj03t85bC2yLdpT7zDw4jcCYrT9z9l1FUP18lZMO
	 0gKe49JARYhEY4T2lsz3YbuDz2flLaU0JlkI2E4NHid1ocAZmng0qS603GtSJmXeKR
	 zckzBAUXMBke6aa4sfS7phY2Wtt72N8ColCP+lEX9JG3YXQqmlYMPkmkKoPFmyWxle
	 8QjG6JOtUE79w==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.210.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pf1-f170.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-82747396358so3068033b3a.0
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 03 Mar 2026 11:23:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW4FMgEy4cQu5Gjtm4Wl1WA8mFdJXymyo2ABu3sYunR5BAGuYgQWZ2iH0T5st7Ge1qKCMaTupLOp7o/EIygyXrN6l1T@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnkv2/RihbkBwHCLAr8ItxconGJqOoMFHHKbA00F2gHo74n72x
	NRQklBh2TTK7Y99flybkrLN6www2uRZwZdmAB76X6RtgnD9lw6unglpjHjq0IpVfY9fsDIGq7+f
	j225JhWX9SZR4Fh96fIfAbnVC611sn1A=
X-Received: by 2002:a17:90a:f950:b0:356:22ef:57ba with SMTP id
 98e67ed59e1d1-35965c17f28mr13647415a91.7.1772565800552; Tue, 03 Mar 2026
 11:23:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303181707.2920261-1-lkml@antheas.dev>
 <2af36c81-4619-4f90-a04c-c3e5ed7a0cc5@kernel.org>
 <CAGwozwGTPKH5Lc4pEzmrNd7YhHJpZHod=YhViYVVcJTVbLX9ug@mail.gmail.com>
In-Reply-To: 
 <CAGwozwGTPKH5Lc4pEzmrNd7YhHJpZHod=YhViYVVcJTVbLX9ug@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 3 Mar 2026 20:23:09 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwH9yqJre0L24fn96h3kX84QWDr=jjkYb05ka0tDShLNVA@mail.gmail.com>
X-Gm-Features: AaiRm50glDsxw__J_cExR5e7YI0A8uVEEHqeJ5eDkSoQPGN_oA6zEcWjxkigorA
Message-ID: 
 <CAGwozwH9yqJre0L24fn96h3kX84QWDr=jjkYb05ka0tDShLNVA@mail.gmail.com>
Subject: Re: [RFC v1 0/2] platform/x86/amd: Add AMD DPTCi driver for TDP
 control in devices without vendor-specific controls
To: Mario Limonciello <superm1@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177256580219.1635848.12701219873199863179@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 3 Mar 2026 at 20:16, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Tue, 3 Mar 2026 at 19:59, Mario Limonciello <superm1@kernel.org> wrote:
> >
> > A high level question - why aren't these vendors implementing PMF?  It's
> > 1000% less work to enable PMF.  All the values that match the design get
> > stored in BIOS, driver pulls the information and uses it.
>
> From my understanding they do not implement anything and just use
> ryzenadj with their windows vendor software.
>
> > Same approach for Windows and Linux.
> >
> > More comments below.
> >
> > On 3/3/26 12:17 PM, Antheas Kapenekakis wrote:
> > > Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
> > > ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
> > > (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
> > > allows software to adjust APU power and thermal parameters at runtime:
> > > STAPM limit, fast/slow PPT limits, skin-temperature TDP limit, slow/STAPM
> > > time constants, and the thermal control target.
> > >
> > > Until now userspace has reached this interface through the acpi_call out-
> > > of-tree module or ryzenadj, which carry no ABI guarantees and no per-device
> > > safety limits. This driver replaces that with a proper in-kernel
> > > implementation that:
> > >
> > >    * Exposes all seven parameters through the firmware-attributes sysfs ABI,
> > >      so that standard tools (fwupd, systemd-bios-vendor, etc.) can enumerate
> >
> > What is systemd-bios-vendor?  I guess I'm not familiar with this and a
> > quick web search didn't turn anything obvious up.
>
> I used some AI assistance to compile this from my userspace
> implementation and the ASEGA pdf from the AMD site. I need to go
> through _everything_  before this moves to non-RFC. Same with
> copyright year. I focused on the implementation doing the things I
> want it to do for now.
>
> > >      and modify them without device-specific knowledge.
> > >
> > >    * Enforces tiered per-device and per-SoC limits. The default "device"
> > >      mode restricts writes to a curated safe range (smin..smax) derived from
> > >      the device's thermal design.
> >
> > Can you please elaborate where you got all these numbers from?  I don't
> > know if they're accurate or not.  Someone would probably need to cross
> > reference them to be sure.
>
> Trial and error, research, references from Windows, etc. All of the
> devices in this driver have been tested with a userspace
> implementation using the same limits for ppt/sppt/fppt. Nobody has
> complained about them. To be honest, I usually do not set tctl slow
> and fast time limits, so those are referenced from the Legion Go and
> for tctl I go lower than what manufacturers usually set. Users like
> tctl because some of them like their device to stay cooler.

To be clear here, a userspace implementation using the same limits and
the same interface [1].

This driver is a straight copy of that.

[1] https://github.com/hhd-dev/hhd/blob/master/src/adjustor/core/const.py

> The big idea for this driver is to allow locking /dev/mem and ACPI.
> Other than the legion go fan curves, and the Zotac Zone driver which
> needs a cleanup, everything else is handled in the kernel now.
>
> But this approach works fine for the Zotac Zone as they seem to be
> using a very simple WMI shim.
>
> > >      An "expanded" mode exposes the full
> > >      hardware-validated range. An optional CONFIG_AMD_DPTC_EXTENDED Kconfig
> > >      adds "soc" (raw ALIB_PARAMS envelope) and "unbound" tiers for advanced
> > >      use. The active tier is itself a firmware-attribute, switchable at
> > >      runtime.
> > >
> > >    * Stages values and commits them atomically in a single ALIB call,
> > >      matching the protocol's intended bulk-update semantics. A save_settings
> > >      attribute (per firmware-attributes ABI) controls whether writes commit
> > >      immediately ("single" mode) or are held until an explicit "save".
> > >
> > >    * When in "single" mode, re-applies staged values after system resume,
> > >      so suspend/resume cycles do not silently revert to firmware defaults.
> >
> > This isn't the only interface for setting power limits.  How do you make
> > sure that the EC for example isn't stepping on toes on these designs?
>
> For the DMI matched devices it is not. For the ones that are not
> matched, the driver does not autoload and needs a kconfig parameter to
> even load.
>
> OneXPlayer is a bit more complex with their turbo button doing TDP
> swaps but turbo takeover in oxpec takes care of that and then you are
> supposed use ryzenadj.
>
> > I /guess/ it always will need to be opt-in a device by device basis.
> >
> > What happens if the vendor enables PMF in a BIOS update?  How does this
> > avoid conflicts?
>
> Some manufacturers enable pmf without implementing the tables. From my
> understanding none of them implement pmf with limits. If a
> manufacturer wants to move to pmf, we can amend the DMI entry with a
> bios match. However, from my understanding, there is no TDP slider
> equivalent for PMF.
>
> > >
> > > Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
> > > Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
> > > and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
> > > 8000, Z1, AI 9 HX 370, and the Ryzen AI MAX series.
> > >
> > > Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
> > > that committed values are applied to hardware, and that fast/slow PPT
> > > limits are honoured under a full-CPU stress load.
> > >
> > > @Mario: can you suggest a CC list for V2? Thanks. Even if not merged, this
> > > driver is still good for downstream use.
> >
> > You should include Shyam (AMD), Denis and Derek (community).
>
> Sure.
>
> > >
> > > ---
> > > Usage
> > > -----
> > >
> > > List all exposed attributes (read-only, no root required):
> > >
> > >    $ fwupdmgr get-bios-settings
> > >
> > > This enumerates every attribute under /sys/class/firmware-attributes/,
> > > including current_value, default_value, min_value, max_value, and
> > > display_name for each DPTCi parameter.
> >
> > AFAIK - fwupd doesn't understand "save_settings" today
>
> Yes, I do not expect it to even allow writing, but at least you can
> preview the values which is useful. And from what I saw defaults are
> not shown either.
>
> Antheas
>
> > >
> > > Sysfs direct usage
> > > ------------------
> > >
> > > All paths are under:
> > >
> > >    ATTR=/sys/class/firmware-attributes/amd_dptc/attributes
> > >
> > > Inspect a parameter (no root needed):
> > >
> > >    $ cat $ATTR/stapm_limit/{display_name,min_value,max_value,default_value,current_value}
> > >    Sustained TDP (mW)
> > >    4000
> > >    85000
> > >    25000
> > >                            <- empty: nothing staged yet
> > >
> > > Stage values (held in memory, not yet sent to firmware):
> > >
> > >    $ echo 25000 | sudo tee $ATTR/stapm_limit/current_value
> > >    $ echo 40000 | sudo tee $ATTR/fast_limit/current_value
> > >    $ echo 27000 | sudo tee $ATTR/slow_limit/current_value
> > >    $ echo 25000 | sudo tee $ATTR/skin_limit/current_value
> > >    $ echo 85    | sudo tee $ATTR/temp_target/current_value
> > >
> > > Commit all staged values in one ALIB call:
> > >
> > >    $ echo save | sudo tee $ATTR/save_settings
> > >
> > > Switch to auto-commit (each write commits immediately):
> > >
> > >    $ echo single | sudo tee $ATTR/save_settings
> > >
> > > Return to bulk mode:
> > >
> > >    $ echo bulk | sudo tee $ATTR/save_settings
> > >
> > > Clear a staged value without committing:
> > >
> > >    $ echo | sudo tee $ATTR/stapm_limit/current_value
> > >
> > > Query or change the active limit tier (device/expanded/soc/unbound):
> > >
> > >    $ cat $ATTR/limit_mode/possible_values
> > >    device;expanded;soc;unbound
> > >    $ echo expanded | sudo tee $ATTR/limit_mode/current_value
> > >
> > > Switching tiers clears all staged values (old values may fall outside the
> > > new range). Stages and commits must be redone after a mode switch.
> > >
> > > Antheas Kapenekakis (2):
> > >    Documentation: firmware-attributes: generalize save_settings entry
> > >    platform/x86/amd: Add AMD DPTCi driver
> > >
> > >   .../testing/sysfs-class-firmware-attributes   |   41 +-
> > >   MAINTAINERS                                   |    6 +
> > >   drivers/platform/x86/amd/Kconfig              |   27 +
> > >   drivers/platform/x86/amd/Makefile             |    2 +
> > >   drivers/platform/x86/amd/dptc.c               | 1325 +++++++++++++++++
> > >   5 files changed, 1386 insertions(+), 15 deletions(-)
> > >   create mode 100644 drivers/platform/x86/amd/dptc.c
> > >
> > >
> > > base-commit: c89ce241c1909d2c2bdde88334c33f3000d364fb
> >
> >

