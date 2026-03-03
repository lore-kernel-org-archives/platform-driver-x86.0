Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA985391502;
	Tue,  3 Mar 2026 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772561910; cv=none; b=mvyvJkAfnsKKq+Z9YVIN8miX6qZlJf7Nv08U+Ym0EDVLaUOo+Fhndjn6UeTjYfN/o3MsaUIWbceroUPYUKQYtHfv1piBkPPiHsghRdFQgUeEKhtkdq508QUoxHhdNB8z0Lci3aqmgudybOywP2Zrx1ij0P76jMEacFIMvVLRmQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772561910; c=relaxed/simple;
	bh=DnehQ2wcz48Jc1KN/C1IU0ACaqTAK0YDjP7JSp/A074=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMWTFAruB4gNoQKEShSxchpgB38RaQXbNQoXJOsiF9HQtfUO3D8H41hADEMqMhi7AC7OEnxzudZ+jy5YZcrinTI6F16AomRiurgmTcdNh428ZCNGsnHwhOrgBAy3i5tEZ9dCir3OTbSdqnSvXWKZyA+BXd/TtYqcw3voNIU4o1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=cJQ+DRDM; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="cJQ+DRDM"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 140E145EEE;
	Tue,  3 Mar 2026 20:18:19 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 5C11C45EA7;
	Tue,  3 Mar 2026 20:18:18 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 729E91FCE32;
	Tue,  3 Mar 2026 20:18:17 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772561897;
	bh=vFIy/qNkGEwsPcZz9xF7NIVfkIgJ9wOMKiSwXqR1zh0=; h=From:To:Subject;
	b=cJQ+DRDM9lFdEQ+Or7TIqm5zc47A3a9VolGcUGrFhz10QPT+x30/omsB4qlqukGsT
	 AiHFrznDMhcqrXVrEcHAsmbDqLagZnfKkdsEoyBOwAau7kUxsJlpuB4wLHESVuN0Sg
	 spnGEYQKtXE27bC7brwS3kr65LZPMpSH3EDfb/x6sU2WcxbNoj1QR9NdlJL7G+lVnt
	 Db4t/K4patj9zbCid94vtRJ6W673J5SWz8Qhx5MCqsbkg/3f49wtucAMX3YN7yyPnc
	 7HToMqjsmz36BAUynA9KyZqnNcKbgPQv2auE2f+/SG8M0mLx/V5Q2dWHe5Owo2T7AH
	 sXbjfvSRNRdbg==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Mario.Limonciello@amd.com
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [RFC v1 0/2] platform/x86/amd: Add AMD DPTCi driver for TDP control
 in devices without vendor-specific controls
Date: Tue,  3 Mar 2026 19:17:05 +0100
Message-ID: <20260303181707.2920261-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177256189786.1380774.12905393838736076987@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
(the Dynamic Power and Thermal Configuration Interface, DPTCi). This
allows software to adjust APU power and thermal parameters at runtime:
STAPM limit, fast/slow PPT limits, skin-temperature TDP limit, slow/STAPM
time constants, and the thermal control target.

Until now userspace has reached this interface through the acpi_call out-
of-tree module or ryzenadj, which carry no ABI guarantees and no per-device
safety limits. This driver replaces that with a proper in-kernel
implementation that:

  * Exposes all seven parameters through the firmware-attributes sysfs ABI,
    so that standard tools (fwupd, systemd-bios-vendor, etc.) can enumerate
    and modify them without device-specific knowledge.

  * Enforces tiered per-device and per-SoC limits. The default "device"
    mode restricts writes to a curated safe range (smin..smax) derived from
    the device's thermal design. An "expanded" mode exposes the full
    hardware-validated range. An optional CONFIG_AMD_DPTC_EXTENDED Kconfig
    adds "soc" (raw ALIB_PARAMS envelope) and "unbound" tiers for advanced
    use. The active tier is itself a firmware-attribute, switchable at
    runtime.

  * Stages values and commits them atomically in a single ALIB call,
    matching the protocol's intended bulk-update semantics. A save_settings
    attribute (per firmware-attributes ABI) controls whether writes commit
    immediately ("single" mode) or are held until an explicit "save".

  * When in "single" mode, re-applies staged values after system resume,
    so suspend/resume cycles do not silently revert to firmware defaults.

Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
8000, Z1, AI 9 HX 370, and the Ryzen AI MAX series.

Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
that committed values are applied to hardware, and that fast/slow PPT
limits are honoured under a full-CPU stress load.

@Mario: can you suggest a CC list for V2? Thanks. Even if not merged, this
driver is still good for downstream use.

---
Usage
-----

List all exposed attributes (read-only, no root required):

  $ fwupdmgr get-bios-settings

This enumerates every attribute under /sys/class/firmware-attributes/,
including current_value, default_value, min_value, max_value, and
display_name for each DPTCi parameter.

Sysfs direct usage
------------------

All paths are under:

  ATTR=/sys/class/firmware-attributes/amd_dptc/attributes

Inspect a parameter (no root needed):

  $ cat $ATTR/stapm_limit/{display_name,min_value,max_value,default_value,current_value}
  Sustained TDP (mW)
  4000
  85000
  25000
                          <- empty: nothing staged yet

Stage values (held in memory, not yet sent to firmware):

  $ echo 25000 | sudo tee $ATTR/stapm_limit/current_value
  $ echo 40000 | sudo tee $ATTR/fast_limit/current_value
  $ echo 27000 | sudo tee $ATTR/slow_limit/current_value
  $ echo 25000 | sudo tee $ATTR/skin_limit/current_value
  $ echo 85    | sudo tee $ATTR/temp_target/current_value

Commit all staged values in one ALIB call:

  $ echo save | sudo tee $ATTR/save_settings

Switch to auto-commit (each write commits immediately):

  $ echo single | sudo tee $ATTR/save_settings

Return to bulk mode:

  $ echo bulk | sudo tee $ATTR/save_settings

Clear a staged value without committing:

  $ echo | sudo tee $ATTR/stapm_limit/current_value

Query or change the active limit tier (device/expanded/soc/unbound):

  $ cat $ATTR/limit_mode/possible_values
  device;expanded;soc;unbound
  $ echo expanded | sudo tee $ATTR/limit_mode/current_value

Switching tiers clears all staged values (old values may fall outside the
new range). Stages and commits must be redone after a mode switch.

Antheas Kapenekakis (2):
  Documentation: firmware-attributes: generalize save_settings entry
  platform/x86/amd: Add AMD DPTCi driver

 .../testing/sysfs-class-firmware-attributes   |   41 +-
 MAINTAINERS                                   |    6 +
 drivers/platform/x86/amd/Kconfig              |   27 +
 drivers/platform/x86/amd/Makefile             |    2 +
 drivers/platform/x86/amd/dptc.c               | 1325 +++++++++++++++++
 5 files changed, 1386 insertions(+), 15 deletions(-)
 create mode 100644 drivers/platform/x86/amd/dptc.c


base-commit: c89ce241c1909d2c2bdde88334c33f3000d364fb
-- 
2.52.0


