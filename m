Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0C523BCF7
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129560; cv=none; b=Du4ycDvUJ8L6yIsSFpMx5Sr30/9aOSTjdCnJhc3Z585cdb3l6eBXfJOoHn1ISvN6sAOySLDPYvKyzh4czjiktk3/0wK64iW0DJeCV9z6R8KVFkNzGGoqpwyBv2guSnBeKMmplJ24zVRyUq/uMDMnYr9vqSkhz1b0rEwJM72O4g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129560; c=relaxed/simple;
	bh=Tcv9sgTjCw7iB0FtqtR4hZkuNlm4Lz1RUR9nb1fF1h8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWuz43SwfLJZWvz1hQ893paQhExrFU14bEaa9uEyjFgmY9kf5cvzFYUb8Y3Ro0m5LOKgNnWV6aFvsWJ2vDuFQ+wC1awPigaGHufsB366rpls6WFYwYolgYxB5KonXHWXLAk4xhqwr1ufGq3M5+25a90B7cL1Rz443kW2fm84VLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=foMwnfhK; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="foMwnfhK"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 6399BC0C20
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 09:59:12 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 85836C4F1F
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 09:59:11 +0200 (EET)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 06CDB200BF2
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 09:59:14 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1773129554;
	bh=40WjfKiKlWglmwKCv2framvl+UKl/Z0rQ7oJsdXtUNg=;
	h=Received:From:Subject:To;
	b=foMwnfhKAx0sRJzqf2ZTdE3URXGgOnm8d6BQAjv+IUM38VRcAhNb7kZsZVrsWfRx3
	 LEQT43keVVV2AuHBhbI3K7uEbGrHFM7yYIpC+PeBvMYGCTOD96UhjzRJxQc8/ggBzU
	 TAHnJHfawOVxCfGVR2ZigIEKTj+McPdv58j7l/399R5OhzrZuy8N5ubiyTy6ophfvj
	 36YUZCSCzFdrOf3FMo6ljqVukTKcEbMpcdIX2nq66mtNqkjL4wAwvUhcat9WosbtR3
	 y92+eTUs93sZ5VMDjt8rbfzgzI17gnM5gEIXCrdKtbszEnKHBtO9eM9/90c5Gt9kgf
	 GoDUEeysvQkSg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f173.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-c7384f5a9cdso2377207a12.0
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 10 Mar 2026 00:59:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWvfGlkhklpnM7oeaB7Ib1j9yNUv+P13llWOPiG677GR0JTfHSkGKN3TpSWUuwRKLJ4hYBeYE6Nd7/lz3+lO94faUGf@vger.kernel.org
X-Gm-Message-State: AOJu0YzY7ixwUK/DeBIv8QtmWoLiqn24vAofGDcOiEoxEelhTrU7m/C3
	RRhSQfe1G3VnTNIoOOuHH2oqtXXLJfgiIfhZETd8owPCLimMNRq9vvmr+zVKCBMloNbpt5oJxDO
	64OaS/hw1ryssuBsjvPT07IzY/4qdOUk=
X-Received: by 2002:a05:6a21:890b:b0:398:71f2:59b7 with SMTP id
 adf61e73a8af0-39871f27186mr7868301637.33.1773129552411; Tue, 10 Mar 2026
 00:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309205125.293148-1-lkml@antheas.dev>
 <42275140-ecef-4878-b256-1061060d4958@amd.com>
In-Reply-To: <42275140-ecef-4878-b256-1061060d4958@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 10 Mar 2026 08:59:01 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEmENx98qB51D89h59rb2qw66f_TJENd+W41onb5GYhfw@mail.gmail.com>
X-Gm-Features: AaiRm50zV0z_YlTdOqb1mnN4c-Ny51RtiaZ4mct241EzKVr4u2AzdGOHnjg7KhQ
Message-ID: 
 <CAGwozwEmENx98qB51D89h59rb2qw66f_TJENd+W41onb5GYhfw@mail.gmail.com>
Subject: Re: [RFC v4 0/4] platform/x86/amd: Add AMD DPTCi driver for TDP
 control in devices without vendor-specific controls
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
	derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177312955422.3515246.7024098436701019421@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 10 Mar 2026 at 03:43, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
> > Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
> > ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
> > (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
> > allows software to adjust APU power and thermal parameters at runtime:
> > sustained power limit (SPL/STAPM + skin), slow PPT, fast PPT, and the
> > thermal control target.
> >
> > Unlike mainstream AMD laptops, these devices do not implement vendor-
> > specific WMI or EC hooks for TDP control. The ones that do, use DPTCi
> > under the hood. For these devices, ALIB is the only viable mechanism for
> > the OS to adjust power limits, making a dedicated kernel driver the
> > correct approach rather than relying on the out-of-tree acpi_call module
> > or ryzenadj.
> >
> > The driver provides two layers of control:
> >
> >    * Platform profile integration (low-power / balanced / performance /
> >      custom), with per-device preset tunings derived from thermal envelope
> >      data. Selecting a non-custom profile applies values immediately and
> >      locks the individual tunables to read-only. The default profile is
> >      "custom", leaving the device at firmware defaults until userspace
> >      explicitly selects a profile.
> >
> >    * Four firmware-attributes tunables (ppt_pl1_spl, ppt_pl2_sppt,
> >      ppt_pl3_fppt, cpu_temp) that become writable in "custom" mode.
> >      Values are enforced against per-device limits (smin..smax), with an
> >      "expanded_limits" toggle that widens the range to the full hardware-
> >      validated envelope (min..max). A save_settings attribute controls
> >      whether writes commit immediately ("single") or are staged for an
> >      explicit bulk "save".
> >
> > On resume, the active profile or staged values are re-applied so that
> > suspend/resume cycles do not silently revert to firmware defaults unless
> > in custom and in bulk mode. In that case, defer to userspace.
> >
> > Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
> > Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
> > and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
> > 8000, AI 9 HX 370, and the Ryzen AI MAX series.
> >
> > Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
> > that committed values are applied to hardware, and that fast/slow PPT
> > limits are honoured under a full-CPU stress load.
> >
> > Responsible disclosure: The development of this driver is AI assisted.
> > This includes its writing, testing, reviewing, and readmes. The driver was
> > manually reviewed line by line, but there may still be small leftover
> > quirks. This is an RFC, not a final version. Let's push these tools to
> > their limits and see where it takes us.
> >
>
> I'll tell you where the most immediate limit is.  Humans can't review
> RFC changes that go in daily.
>
> Over my weekend I see multiple copies of the series in my inbox.  To me
> they must have obviously been garbage because you sent them so quickly
> instead of waiting for feedback.  So I'll delete those from my inbox and
> review the most recent one.
>
> That's somewhat tongue in cheek.  I know you're excited for this series,
> but please make sure you take time to gather and take feedback into
> account before posting another series.

It's true, I've been having a bit of fun. But the series is stabilized
now, I don't plan to send another version soon unless I messed up
something.

V3 incorporated your feedback/derek's and V4 incorporated rong's
feedback. V4 is minor, it is just nits.

> Maybe you can pass this to a robot and it
> can give you actionable feedback, but a human sitting down and reviewing
> a patch series in a serious way takes time.

I'm using this series as a testbed to make some tooling for this,
maybe I will post it soon.

> > Assisted-by: Claude:claude-opus-4-6
> >
> > ---
> >
> > Changes in v4:
> >    - Align dptc_params continuation lines to opening brace
> >    - Reflow all dptc_device_limits structs: expand zipped braces into
> >      separate .params and .profiles blocks with proper indentation
> >    - Extract enum dptc_save_mode from struct dptc_priv to a standalone
> >      declaration
> >    - Replace vague mutex comment with explicit list of protected members
> >    - Use &buf[off + 1] form for put_unaligned_le32
> >    - Fix misaligned '=' in ACPI in_params block
> >    - Factor out dptc_alib_fill_param() helper to deduplicate ALIB buffer
> >      construction in dptc_alib_send_one() and dptc_alib_save(); use int
> >      instead of size_t for element counts throughout
> >    - Consolidate dptc_current_value_store: single guard(mutex) instead of
> >      two, eliminating duplicated profile check
> >    - Return -EBUSY instead of -EPERM when profile is not custom
> >    - Add blank line after early returns for readability
> >    - Consolidate dptc_alib_save() call into dptc_apply_profile(), which
> >      now returns int; simplify dptc_pp_set() and dptc_resume() callers
> >    - Squash device_create formatting fix into the patch that introduced it
> >    - Remove bogus "AMD Ryzen AI HX 360" SoC entry (no such model exists)
> >    - Return -ENOENT instead of -EINVAL from dptc_alib_call() when no
> >      parameters are staged, matching think-lmi save_settings semantics
> >    - Remove bool has_staged[] array: use staged[i] == 0 as the "not
> >      staged" sentinel, raise expanded_min from 0 to 1 W to ensure 0 is
> >      never a valid user value
> >    - Remove unnecessary braces from if/else if/else chain in dptc_resume()
> >    - Drop Ryzen Z1 SoC entries: Z1 devices (Lenovo/Asus) use vendor EC/PMF
> >      drivers, not ALIB DPTCi
> >
> > Changes in v3:
> >    - Split single driver patch into 3: core driver, platform profile,
> >      device entries
> >    - Rename DRIVER_NAME from "amd_dptc" to "amd-dptc" (match subsystem
> >      convention for platform drivers and firmware-attributes devices)
> >    - Add scale field to dptc_param_desc: sysfs values in user units (W, C),
> >      driver multiplies by scale (1000 for mW) before sending to ALIB
> >    - Rename struct fields: min/smin/smax/max ->
> >      expanded_min/device_min/device_max/expanded_max
> >    - Remove comment "ALIB parameter IDs (AGESA spec Appendix E.5, Table
> >      E-52)"
> >    - Move ALIB method check after SoC/DMI validation, change pr_debug to
> >      pr_warn
> >    - Reorder local variable declaration in dptc_init (dptc after other vars)
> >    - Add commit subject prefix "dptc:" to all driver patches
> >    - Remove early-return for empty save in dptc_alib_save; let
> >      dptc_alib_call handle the empty case
> >    - Remove max_power as we do not do DC/AC validation in the driver
> >    - Fix Ayaneo AIR device matches to reflect their wattage, add 15W profile
> >      for original AIR. Cheers to the AIR Plus user who had helped tune the
> >      AIR Plus profile so it was correct.
> >
> > Changes in v2:
> >    - Use a platform_device base instead of raw inits + exit, hook into devm
> >      helpers referencing samsung-galaxybook
> >    - Add platform_profile support (low-power / balanced / performance /
> >      custom) with per-device energy presets; non-custom profiles lock
> >      tunables to read-only. We default to custom to avoid writing values
> >    - Reduce exposed parameters from seven to four (ppt_pl1_spl,
> >      ppt_pl2_sppt, ppt_pl3_fppt, cpu_temp); drop time constants and
> >      separate skin/STAPM limits in favour of a single SPL that sets both.
> >      For devices where the max tdp offers thermals that are not suitable
> >      for day to day use (e.g., excessive fan noise), MAX_POWER is added
> >    - Remove CONFIG_AMD_DPTC_EXTENDED and the "soc"/"unbound" limit tiers;
> >      keep only device (smin..smax) and expanded (min..max) and soc match
> >      (certain devices ship multiple SoCs on the same motherboard/thermal
> >      envelope, make sure we only hook into validated SoCs)
> >    - Rename "commit" attribute to "save_settings" per firmware-attributes
> >      ABI; rename limit_mode to expanded_limits
> >    - Change expanded_limits attribute type from "enumeration" to "integer"
> >      (min=0, max=1) since firmware-attributes has no bool type
> >    - Remove all global vars, limit _dev access to init and exit
> >    - Use u32 accessors to set values for ALIB call
> >    - Clean up verbose comments throughout
> >    - Add Ayn Loki Max / Tectoy Zeenix Pro
> >
> > V3: https://lore.kernel.org/all/20260307115516.26892-1-lkml@antheas.dev/
> > V2: https://lore.kernel.org/all/20260305181751.3642846-1-lkml@antheas.dev/
> > V1: https://lore.kernel.org/all/20260303181707.2920261-1-lkml@antheas.dev/
> >
> > Antheas Kapenekakis (4):
> >    Documentation: firmware-attributes: generalize save_settings entry
> >    platform/x86/amd: dptc: Add AMD DPTCi driver
> >    platform/x86/amd: dptc: Add platform profile support
> >    platform/x86/amd: dptc: Add device entries for handheld PCs
> >
> >   .../testing/sysfs-class-firmware-attributes   |   41 +-
> >   MAINTAINERS                                   |    6 +
> >   drivers/platform/x86/amd/Kconfig              |   15 +
> >   drivers/platform/x86/amd/Makefile             |    2 +
> >   drivers/platform/x86/amd/dptc.c               | 1271 +++++++++++++++++
> >   5 files changed, 1320 insertions(+), 15 deletions(-)
> >   create mode 100644 drivers/platform/x86/amd/dptc.c
> >
> >
> > base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
>
>

