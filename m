Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8407C3A872F;
	Thu,  5 Mar 2026 18:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734801; cv=none; b=WBDakaelKRHvHAW8p2C4vDz4Xi2VZ4bd+EAd3s1px20Pvkletz2cc96A1UhvC2ov6e6RF8x6cN1QaPuukNoB3qObssQjELpdUZPDoqGKVJZrAnL9UUf2PYfHhFaf8iTxMCd0szLAXqMW3V5acVurKGbE9EmAlxaTHLEtkCuwJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734801; c=relaxed/simple;
	bh=R9lUbgmUQUG53Z4MJUVGo9Ej4B4qQrb1TuEaz4hvpvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lfs2DluSze2UP8esZ9L+Kqp/b7ho2O+jd9/EqjgwkYepYcdKhY9m/QT7eorF3I1tYwOfWAH8MONuLs6tm7yBEspnNIaYjLb7BsK0LtT+xOTecj/l92YYWW6bf+27vdMXcAMr3uKTeNFXj3Kqy5xFd19PMGz4Je+fn2M3JtVMi2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=nw9UPT+G; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="nw9UPT+G"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 1DAB64607F;
	Thu,  5 Mar 2026 20:19:53 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id D7E5D4608C;
	Thu,  5 Mar 2026 20:19:48 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D247E1FF548;
	Thu,  5 Mar 2026 20:19:47 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772734788;
	bh=3PwsQCtlZLynU/s5QrkdUTz9WTExyo4S47BvcEi2FMU=; h=From:To:Subject;
	b=nw9UPT+GMjKzrbzLpIekwSsa6zGar548+BskfK1fBUmySgwkyFiVAvTRJ8NhGBCzt
	 daqxQUPjIBHcVLfLepf/vwFlwfcMhxe6bngXjdUGbeFaT6i/Ahu8+HzIDeex3o4rHx
	 +o7ZmUuY3cOgsGpVgLkKZwN4Yivz5XTXLzM1Y7jG3a6/6GvD4tJhYy90FSv/n5hAUz
	 AZhsXma8JYk6/oM5WKpkK04TNoUMah5aZ2qS91miK9hfc+dt3rinLE3pCq7ZriyX7j
	 w5E7+bCodv5f0YpHrRp92Qg3sdZ5velvWGYmALl0V4waQ9SLvbKe9O8fVEswvTNzHE
	 kz3UnNRt/Y5Vw==
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
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [RFC v2 0/2] platform/x86/amd: Add AMD DPTCi driver for TDP control
 in devices without vendor-specific controls
Date: Thu,  5 Mar 2026 19:17:49 +0100
Message-ID: <20260305181751.3642846-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177273478836.85889.15066022558361300908@linux3247.grserver.gr>
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

I expand the CC list here to include Sasha (you might be interested,
feel free to ask to be dropped), Derek + Shyam + Denis as requested.

Responsible disclosure: The development of this driver is AI assisted.
This includes its writing, testing, and readmes. The driver was manually
reviewed line by line, but there still may small leftover quirks. This is
an RFC, not a final version. Let's push these tools to their limits and
see where it takes us.

Assisted-by: Claude:claude-opus-4-6

---
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

V1: https://lore.kernel.org/all/20260303181707.2920261-1-lkml@antheas.dev/

Antheas Kapenekakis (2):
  Documentation: firmware-attributes: generalize save_settings entry
  platform/x86/amd: Add AMD DPTCi driver

 .../testing/sysfs-class-firmware-attributes   |   41 +-
 MAINTAINERS                                   |    6 +
 drivers/platform/x86/amd/Kconfig              |   16 +
 drivers/platform/x86/amd/Makefile             |    2 +
 drivers/platform/x86/amd/dptc.c               | 1255 +++++++++++++++++
 5 files changed, 1305 insertions(+), 15 deletions(-)
 create mode 100644 drivers/platform/x86/amd/dptc.c


base-commit: c89ce241c1909d2c2bdde88334c33f3000d364fb
-- 
2.52.0


