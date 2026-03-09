Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9C83ECBEC;
	Mon,  9 Mar 2026 20:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089563; cv=none; b=kR3Ml4dEtip5t6MT2XnrEpcpTtaCaKB9DrsfIhsOw8VODx4MvYzJoX44ITj/5fbPhWTY7nIpTXFF/L7Qe4rac+lZfwe+Jrld0JrTrRtT5hg9tX+TCq9/JPZ3isHyb+fqaNs7t/GSeG0jSxgLls9jAJRvSx0Q9f2f/A1aqumReMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089563; c=relaxed/simple;
	bh=pKJlDFSNQSjDvYxHcVPI74hDyk1nh08IRu7sugMq+lM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UugdIOrVixoFXMfkL4Wqp7hDv+DSuXVvg+Bf6P5pByhX/vPim/cIAN6UqOLORM7irq4Gzk5WZKCpVUOK+O6QaPRl0khocoLc7iFcldqJlNJNXAM9Ksbbkc2jT7Z3YwWA2CTvROizFgmMW7Qt9E2tDsE2pqhcH5+GlvlcRMNf3pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=MOEZVBK/; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="MOEZVBK/"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 1932BCA137;
	Mon,  9 Mar 2026 22:52:34 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 095C4C975D;
	Mon,  9 Mar 2026 22:52:33 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 16E6E201CBC;
	Mon,  9 Mar 2026 22:52:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1773089552;
	bh=cI75MfOIeh5lO9KdsVV+rCNb5JqvGlyU7h7bzCyEP/M=; h=From:To:Subject;
	b=MOEZVBK/JumbKp9MqLHY4xfqcJY9lYNB9meX0Ra/g6OvilmYquXiBzfsAwbwvs+X9
	 708OXUyzPfg7uulpIrGYrLiFHVsGR76sUIraSy2GGuSDcbMoTQJyhDL8eY3/kHWZX8
	 gCyKKJj3x4/0oSStSv0B0Abcy7z0jzWGYYeWWa1TOMr/zGgfG+zlijf8vhK+dsKjjf
	 KbguvjpXYx0gJdDsfZC8AKFaW3iG7HhTwViwqPbdLV7k89WAM8odH/SbrcjR77FLnS
	 OPn6uq0wwrBRcoiCOR+UMO3OClC5fNF6Rwa4ZtExW0PbR14toxsewPFg4BQtcaPdmJ
	 lWyNQVCP0bahw==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Mario.Limonciello@amd.com
Cc: W_Armin@gmx.de,
	sashal@kernel.org,
	Shyam-Sundar.S-k@amd.com,
	derekjohn.clark@gmail.com,
	denis.benato@linux.dev,
	i@rong.moe,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [RFC v4 0/4] platform/x86/amd: Add AMD DPTCi driver for TDP control
 in devices without vendor-specific controls
Date: Mon,  9 Mar 2026 21:51:21 +0100
Message-ID: <20260309205125.293148-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177308955266.1090654.6160992127406937914@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
(the Dynamic Power and Thermal Configuration Interface, DPTCi). This
allows software to adjust APU power and thermal parameters at runtime:
sustained power limit (SPL/STAPM + skin), slow PPT, fast PPT, and the
thermal control target.

Unlike mainstream AMD laptops, these devices do not implement vendor-
specific WMI or EC hooks for TDP control. The ones that do, use DPTCi
under the hood. For these devices, ALIB is the only viable mechanism for
the OS to adjust power limits, making a dedicated kernel driver the
correct approach rather than relying on the out-of-tree acpi_call module
or ryzenadj.

The driver provides two layers of control:

  * Platform profile integration (low-power / balanced / performance /
    custom), with per-device preset tunings derived from thermal envelope
    data. Selecting a non-custom profile applies values immediately and
    locks the individual tunables to read-only. The default profile is
    "custom", leaving the device at firmware defaults until userspace
    explicitly selects a profile.

  * Four firmware-attributes tunables (ppt_pl1_spl, ppt_pl2_sppt,
    ppt_pl3_fppt, cpu_temp) that become writable in "custom" mode.
    Values are enforced against per-device limits (smin..smax), with an
    "expanded_limits" toggle that widens the range to the full hardware-
    validated envelope (min..max). A save_settings attribute controls
    whether writes commit immediately ("single") or are staged for an
    explicit bulk "save".

On resume, the active profile or staged values are re-applied so that
suspend/resume cycles do not silently revert to firmware defaults unless
in custom and in bulk mode. In that case, defer to userspace.

Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
8000, AI 9 HX 370, and the Ryzen AI MAX series.

Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
that committed values are applied to hardware, and that fast/slow PPT
limits are honoured under a full-CPU stress load.

Responsible disclosure: The development of this driver is AI assisted.
This includes its writing, testing, reviewing, and readmes. The driver was
manually reviewed line by line, but there may still be small leftover
quirks. This is an RFC, not a final version. Let's push these tools to
their limits and see where it takes us.

Assisted-by: Claude:claude-opus-4-6

---

Changes in v4:
  - Align dptc_params continuation lines to opening brace
  - Reflow all dptc_device_limits structs: expand zipped braces into
    separate .params and .profiles blocks with proper indentation
  - Extract enum dptc_save_mode from struct dptc_priv to a standalone
    declaration
  - Replace vague mutex comment with explicit list of protected members
  - Use &buf[off + 1] form for put_unaligned_le32
  - Fix misaligned '=' in ACPI in_params block
  - Factor out dptc_alib_fill_param() helper to deduplicate ALIB buffer
    construction in dptc_alib_send_one() and dptc_alib_save(); use int
    instead of size_t for element counts throughout
  - Consolidate dptc_current_value_store: single guard(mutex) instead of
    two, eliminating duplicated profile check
  - Return -EBUSY instead of -EPERM when profile is not custom
  - Add blank line after early returns for readability
  - Consolidate dptc_alib_save() call into dptc_apply_profile(), which
    now returns int; simplify dptc_pp_set() and dptc_resume() callers
  - Squash device_create formatting fix into the patch that introduced it
  - Remove bogus "AMD Ryzen AI HX 360" SoC entry (no such model exists)
  - Return -ENOENT instead of -EINVAL from dptc_alib_call() when no
    parameters are staged, matching think-lmi save_settings semantics
  - Remove bool has_staged[] array: use staged[i] == 0 as the "not
    staged" sentinel, raise expanded_min from 0 to 1 W to ensure 0 is
    never a valid user value
  - Remove unnecessary braces from if/else if/else chain in dptc_resume()
  - Drop Ryzen Z1 SoC entries: Z1 devices (Lenovo/Asus) use vendor EC/PMF
    drivers, not ALIB DPTCi

Changes in v3:
  - Split single driver patch into 3: core driver, platform profile,
    device entries
  - Rename DRIVER_NAME from "amd_dptc" to "amd-dptc" (match subsystem
    convention for platform drivers and firmware-attributes devices)
  - Add scale field to dptc_param_desc: sysfs values in user units (W, C),
    driver multiplies by scale (1000 for mW) before sending to ALIB
  - Rename struct fields: min/smin/smax/max ->
    expanded_min/device_min/device_max/expanded_max
  - Remove comment "ALIB parameter IDs (AGESA spec Appendix E.5, Table
    E-52)"
  - Move ALIB method check after SoC/DMI validation, change pr_debug to
    pr_warn
  - Reorder local variable declaration in dptc_init (dptc after other vars)
  - Add commit subject prefix "dptc:" to all driver patches
  - Remove early-return for empty save in dptc_alib_save; let
    dptc_alib_call handle the empty case
  - Remove max_power as we do not do DC/AC validation in the driver
  - Fix Ayaneo AIR device matches to reflect their wattage, add 15W profile
    for original AIR. Cheers to the AIR Plus user who had helped tune the
    AIR Plus profile so it was correct.

Changes in v2:
  - Use a platform_device base instead of raw inits + exit, hook into devm
    helpers referencing samsung-galaxybook
  - Add platform_profile support (low-power / balanced / performance /
    custom) with per-device energy presets; non-custom profiles lock
    tunables to read-only. We default to custom to avoid writing values
  - Reduce exposed parameters from seven to four (ppt_pl1_spl,
    ppt_pl2_sppt, ppt_pl3_fppt, cpu_temp); drop time constants and
    separate skin/STAPM limits in favour of a single SPL that sets both.
    For devices where the max tdp offers thermals that are not suitable
    for day to day use (e.g., excessive fan noise), MAX_POWER is added
  - Remove CONFIG_AMD_DPTC_EXTENDED and the "soc"/"unbound" limit tiers;
    keep only device (smin..smax) and expanded (min..max) and soc match
    (certain devices ship multiple SoCs on the same motherboard/thermal
    envelope, make sure we only hook into validated SoCs)
  - Rename "commit" attribute to "save_settings" per firmware-attributes
    ABI; rename limit_mode to expanded_limits
  - Change expanded_limits attribute type from "enumeration" to "integer"
    (min=0, max=1) since firmware-attributes has no bool type
  - Remove all global vars, limit _dev access to init and exit
  - Use u32 accessors to set values for ALIB call
  - Clean up verbose comments throughout
  - Add Ayn Loki Max / Tectoy Zeenix Pro

V3: https://lore.kernel.org/all/20260307115516.26892-1-lkml@antheas.dev/
V2: https://lore.kernel.org/all/20260305181751.3642846-1-lkml@antheas.dev/
V1: https://lore.kernel.org/all/20260303181707.2920261-1-lkml@antheas.dev/

Antheas Kapenekakis (4):
  Documentation: firmware-attributes: generalize save_settings entry
  platform/x86/amd: dptc: Add AMD DPTCi driver
  platform/x86/amd: dptc: Add platform profile support
  platform/x86/amd: dptc: Add device entries for handheld PCs

 .../testing/sysfs-class-firmware-attributes   |   41 +-
 MAINTAINERS                                   |    6 +
 drivers/platform/x86/amd/Kconfig              |   15 +
 drivers/platform/x86/amd/Makefile             |    2 +
 drivers/platform/x86/amd/dptc.c               | 1271 +++++++++++++++++
 5 files changed, 1320 insertions(+), 15 deletions(-)
 create mode 100644 drivers/platform/x86/amd/dptc.c


base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
-- 
2.52.0


