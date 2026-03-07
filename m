Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1885D175A95;
	Sat,  7 Mar 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772884534; cv=none; b=RXtXm2praftpRCa7KLvDT0061KvRO3ovbpVvuAOlFR8sCn0DYJm7QXLr1TPOgEE9bB3S3i89JxGxfm/9MDw86rB2Z6yGCWPfpDEwGpyirbKhdDLDsFrAnPEI0RiL0iHBmSAPhv5sYdk5DK5BYTWsaRPk6poQrp28vQ3BG3jXq/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772884534; c=relaxed/simple;
	bh=HRsyIzfZ9pXeuJ7q9JU7416pp44LX8y624gxhYXpkgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NxxudcQ20IrmTKlKAR8+PIy41by7RuL7kUHNCoX8Z4dXy4Yj9XJXbxFDxd4c8l93ap7LSIku9NV+8VK9/00fLxmXEfXv011Z2BXx7BP5W35nklQk0beM6QXXH4KhHt6KvFkR5k0Zp8MrdSTpFRFMRrdiw+Q74DQjWThGBDEK+C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QGaSz7wD; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QGaSz7wD"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 6155A45D5D;
	Sat,  7 Mar 2026 13:55:31 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 19B3345F4A;
	Sat,  7 Mar 2026 13:55:30 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:ba48:cea4:a8c2:d901])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 205E11FD754;
	Sat,  7 Mar 2026 13:55:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772884529;
	bh=BfwdQaYObrlWXRYzFBsgsr2es7ivZ5H/tjfPXTjCnhc=; h=From:To:Subject;
	b=QGaSz7wD6jHYNRKg56nTVbEM0Jh6dQD3MK9jc688MLbAMY3/CFYA8nR2uq1dcdhh6
	 PQJ97TmD1x/YOmJ+6sgOcl76jLa54ueBl02vvCQhHqUyyWcRXkR8gj9Otj9LNKRTJa
	 TPdHh35CWFOMJHhXRI/ur6U2kymiThNSswc/4ddITJNdXUO4DlRzPtk2aEdkbDKJvv
	 2qyAbOVxAwZzHvlAykOjDejD5wNT0S2CbTEphdXg6TAnRsd/dFyw9l5MFMvRDvz0mE
	 +V6Ueo+Pq6NRrGbwda9Kfj1eWftWlDo7Yw5iJsv7X7FMIH+xJisT+ddCjyAyK35BEA
	 LHEjVlXYNe7Mw==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:ba48:cea4:a8c2:d901) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Mario.Limonciello@amd.com
Cc: W_Armin@gmx.de,
	sashal@kernel.org,
	Shyam-Sundar.S-k@amd.com,
	derekjohn.clark@gmail.com,
	denis.benato@linux.dev,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [RFC v3 0/4] platform/x86/amd: Add AMD DPTCi driver for TDP control
 in devices without vendor-specific controls
Date: Sat,  7 Mar 2026 12:55:12 +0100
Message-ID: <20260307115516.26892-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177288452964.1270797.4006554245498369@linux3247.grserver.gr>
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
    explicitly selects a profile. Certain profiles feature a "max_power"
    preset when it is deemed that using the maximum values for performance
    would lead to a degraded user experience (e.g. excessive fan noise)

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
8000, Z1, AI 9 HX 370, and the Ryzen AI MAX series.

Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
that committed values are applied to hardware, and that fast/slow PPT
limits are honoured under a full-CPU stress load.

Responsible disclosure: The development of this driver is AI assisted.
This includes its writing, testing, and readmes. The driver was manually
reviewed line by line, but there still may small leftover quirks. This is
an RFC, not a final version. Let's push these tools to their limits and
see where it takes us.

Assisted-by: Claude:claude-opus-4-6

---
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
    dptc_alib_call return -EINVAL (matches documentation)
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
 drivers/platform/x86/amd/dptc.c               | 1264 +++++++++++++++++
 5 files changed, 1313 insertions(+), 15 deletions(-)
 create mode 100644 drivers/platform/x86/amd/dptc.c


base-commit: 298ec5fe3c6a91f61dd971f9aa7e22e79c9ec024
-- 
2.52.0


