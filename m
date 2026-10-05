Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA3937FF46
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235423; cv=pass; b=Mxq8Piurnko/3tngh+ED/9Hh0HYHJheE5ytb5x5u05b5xsLQTgpv4UkKSmCfupwNX8dm9ksnA42RALcIxabzjN5OHowp2x2h13E/cUvvoFa5XwO+uQT7/Oo6fbHwVjp7E9GbDaIn8/ByO1MV5QzT9FekDiQh62yo1vavC8Q3U2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235423; c=relaxed/simple;
	bh=lKtNfmVxy6PnM08awUrBMfdT2M+Ze5BiielD1CHkFvk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=conSK9PDJO3GQWyFiEKT83BVvN0IeJaQz9hEN+HtoVp6hThSXIY/hhB6SFWS5hE7xmrHddERatZrfn0Vb3HhzCPedqGfiFUwkXHlHeVZ81F8oh3b4jfcGpCn29qAMyG0mrPOKWJAfx+RBw/xEBnT5+r0pvrrTVoPYR6LNpNWUTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnnRnjXN; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnnRnjXN"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-35118a5991dso1298446eec.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Oct 2026 14:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791235421; cv=none;
        d=google.com; s=arc-20260327;
        b=NH5qMeMugFWVe7h/anC2SobGnV4fTVu2xRTQrU6cnTLgzadP88zQi/WDTE8h93y9sL
         pD2l+YEEg4j0vSjEGaDhOmDbw5vc7/YYHJ8BOIWULLZQpMS42QJEjsc6UnCIjOgXHcYw
         MINKGPMMpkF+zrU6Ua24k+c9GwbOXgt+yTx0SWjvD8Z/kMBZUEiV9IInVhkJa1Tki1CJ
         WAgkV49JPGEn48BjGXFPGJkemfE1TCq5+2ECJuCUpchYCTaIdQh5OVIHhmeVlm15PNJk
         r9v1Y6rY2gKFc94Kd6/yif9/202dh/up6YwtEcYC7Y22rqxk6t52/Ql3C5Tt4LS157wk
         X48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+BMsm8vxGskhN0Hd8cdAfO0SjPkALEVFiwdvrxqaZWI=;
        fh=cD6bYjLkkiNFNApBqzDxNrc8JODElmP07PHrXbdNJ64=;
        b=Yi22MtwPn5HwWaJQovKMO90G5+zngIGXlTIY7eZHxYnzaA+yYMIAHiDAqmBvLi6ZN2
         W1wxzOjYtAo7wjptHp4hC9Ei2ISEbtlSZxZe3eRo4PsbzDhSmT+QPMMrhoqkrz8IoYYQ
         /u9I10Kg3EWQ+rFa1SytnSTRC15i6JfrkBpuldx5MkAhrVCnWHE+6hGNq/B4XtQ3de0T
         bsPbMQAm3iQotGJqbEZYtxNWEGIr/cxguod0OJoWkuFyEfwJWH+iR5raQ1baB9/8YYdT
         J4wFEqY/+qMeymuEZUfNWrmICjYFgUqGiF1QLpERH07+GgW9qZP1w/5TNHJCIwyPZ3Vb
         iu3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791235421; x=1791840221; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+BMsm8vxGskhN0Hd8cdAfO0SjPkALEVFiwdvrxqaZWI=;
        b=FnnRnjXNausk+trqCQkL2dvONA684455VH4RQJ97im0b5ZPv2EhyYxlafi+//+ZS9q
         CiKxz36j/9JTGgO7eIGsXDyqinf6Rf8OV08L55BqUTcRYNpMNzsFP6q7suSmPSLqoMoC
         UlvmBvaIzvN9ql5q4/3HoENUwBLyW3F1PwadtxDoRRmL7A41AcQPVmOK02m9Rs21Rcgb
         N8lYHQqLibgolABawpz2PDprxrqs41URqynKrmr5KibciHKwX4FMSYm5gffshWqYl00H
         neFG9za0aE9F1JOQoj1mz0BXwJvW3tsOKNsnsRAwOTiktvgPkrIWOVTMBpQh/XqH/5ha
         sE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791235421; x=1791840221;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+BMsm8vxGskhN0Hd8cdAfO0SjPkALEVFiwdvrxqaZWI=;
        b=olGB32RP2B1J6J4dnn6CEQpoI3EclnifLME6No7KoeI5WMA4qdd3hsknQdKlVv2+E3
         WPOSkQHYwZugNL+Uc1IJcA3aLykqv+f/QjEsDFXZj18GXkw4vBWCuYGSHLg+2H1yDiCJ
         6lX04j/hNegvzJrQ08m39Y9OmFQlNwzFpG4gi+yv3HW0tav0/YAKQ7KvuZqh/ggZKHTZ
         93XqmGaC9WEX6Ldcyut0IUAMo9VsRNAjAGQJd/zR44K+IEKSKLKLGcPbrIjh3SNDnTlN
         4nG1j3Sa/kEG6VW33cNmwEjng6ne3k6DflYpB+7iJ8W8XPtLRZ5VOXyuEYxlk9jN5+8b
         4yqA==
X-Forwarded-Encrypted: i=1; AKwUvBy+m3DgUI2zRpDOWGAVMu78GyTeARk66aCdL55QV2iVKTrqsVqeyeQASmAZm2qgG6SqH06+cysUi5Hgwf0iZ2Y8OYy9@vger.kernel.org
X-Gm-Message-State: AFuF++lQ4/IG6f2Qmrp6QZdiHeC2k5f8pLMF6YqMKY4I5BQMmmy8Gta5
	0Volm1rfJxCXAufiU4yO+92bj0IYsJfBdI2txa0+9h5XOsAjolCRAJw9OZwAx9QbT6Zc/07tS8S
	w4gffsTbaOjx15EERQMd0Mah3/fZ3V6o=
X-Gm-Gg: AYBFou2jGygdFazVrqR0uoBQZZTQ5QYGvHncMtUFgKstYt/OA2mMhQAW963UP4HAe42
	r8coGNOp7HwED08mwDm6TEyXElto6F00Gzvj3Q7o+y3HOjT+2+JuO8ikm8oKrbWXXruwjVObZYn
	Vv7gHSsF2xr1zRa5UZDosB6/e4rc6aBApIZzu83avdqoma9+BFyTUWBuoHxrxzgAnY0NqoSCSW7
	+8W5MWottW6CGzhE5dFc/qSmVnATsy4HxiHzn5xUlz7nGbEAaiKRA6VBX7i8jgeAeP65cpKSyvB
	N14xkqb6zJ1qpfbaq2NHAF5ZI6sK2/cYde7x9or4afkDqrH199tSCDK8DD2lnkA3n77vNGBv3eK
	/NjxP8R3VbujBxWgIfSpwf0RDdonbMQIAN92tgqX+
X-Received: by 2002:a05:7301:6192:20b0:351:1f6c:2adc with SMTP id
 5a478bee46e88-3511f6c3fa8mr8573268eec.35.1791235421007; Mon, 05 Oct 2026
 14:23:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Angel <angellindo@gmail.com>
Date: Mon, 5 Oct 2026 16:23:04 -0500
X-Gm-Features: AclHuK9Z7s602mcUDHL6s_E2f36vm8zCtPPCuSnS67fsZBsYjidhjuOavzFm7LE
Message-ID: <CACiNov445=gavzZY=Yz74HNMUgd2BKoYoazWFDRRsz9uhA_rfA@mail.gmail.com>
Subject: [REPORT] Kaby Lake-H (MacBookPro14,3): package C-state stuck at PC3
 on Linux, macOS reaches PC10
To: linux-pm@vger.kernel.org, rafael@kernel.org, 
	artem.bityutskiy@linux.intel.com
Cc: rajneesh bhardwaj <irenic.rajneesh@gmail.com>, xi.pardee@linux.intel.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On a MacBookPro14,3 the package never goes deeper than PC3 on Linux,
while macOS on the same unit and the same firmware reaches PC10. I have
ruled out the usual suspects and would like advice on what else can
keep the package out of PC6 on KBL-H / SPT-H.

Hardware and software
---------------------
- MacBookPro14,3, i7-7820HQ (Kaby Lake-H), HD 630 + Radeon Pro 560
- PCH: 100-series PCH-H (SPT-H), PMC 8086:a121
- Apple EFI 529.140.2.0.0, SMC 2.45f5, Thunderbolt NVM 41.5
- Linux 7.2.5 (distro kernel), intel_idle (native tables,
  use_acpi=N), intel_pstate with HWP
- gmux switched to the iGPU; the Radeon is unpowered by the gmux
  (or unbound with its root port in D3hot, see below)

A/B: macOS vs Linux, same machine, same firmware
------------------------------------------------
macOS 13.7.8, idle, display on, "powermetrics --samplers
cpu_power,gpu_power", 6 x 10 s (means):
  PC10 80.8 %, PC6 2.5 %, PC3 0.06 %, i915 DC6 97 %, PSR 99 %,
  package 0.19 W (powermetrics energy-model estimate, not RAPL)

Linux, idle, turbostat, 10 s samples:
  awake, display on:      PC3 58-71 %, PC6..PC10 0, PkgWatt 4.0-4.2 W
  s2idle (5 min sleeps):  PC3 98.5-98.8 %, PC6..PC10 0

Residencies are comparable; the macOS wattage is only an estimate.
With the display off, macOS still reaches PC7-PC10, and with a USB
disk active on the Thunderbolt xHCI (PEG link up, no ASPM) it still
reaches PC6/PC7. So firmware does not forbid deep package states.

What was ruled out (PC6..PC10 stayed at 0 in every case)
--------------------------------------------------------
- i915: eDP pipe disabled, no display power domain references left
  (i915_power_domain_info). DC5 is entered (~1/s), DC6 never.
  My guess, not verified: DC6 = 0 is a consequence of the package
  veto, not its cause. Also 0 with DPMS off.
- Radeon: unpowered via gmux (iGPU mode), or amdgpu unbound with
  runtime PM so that the PEG0 root port is in D3hot; measured awake
  and in s2idle.
- Thunderbolt: both root ports' devices removed, root ports in D3hot;
  awake and in s2idle. Forcing L1 on the PEG/TB links did nothing.
- LTR: LTR_IGNORE = 0x1fbdf written to PMC PWRM+0x30C (all IPs
  ignored), awake and during s2idle, restored afterwards.
- Combined: Radeon off, TB removed, T1/xHCI idle, DPMS off, rfkill,
  LTR_IGNORE, all at once. SMBus unbound in s2idle: no change.
- IRTL (MSR 0x60B-0x60D, 0x633-0x635): lowering them only removes
  states (with all IRTLs below 61 us even PC3 disappears), so the
  factory values are not the limit.
- MSR 0xE2 = 0x40000008 on all CPUs: package limit C10, lock bit
  clear.
- intel_idle without _CST (use_acpi=N); cpuidle shows C10 (MWAIT
  0x60) taking most of the core idle time.
- acpi_osi=Darwin: no change.
- apple_set_os: the EFI stub already calls it on MacBookPro14,3
  (declares "Mac OS X 10.9"), so that path is already taken.

PMC
---
intel_pmc_core picks the Cannon Point map on SPT-H; I sent a patch
that adds a121 to the Sunrise Point list:
https://lore.kernel.org/r/20261005-intel-pmc-spt-h-v1-1-78c98e4f4620@gmail.com

With it, pch_ip_power_gating_status at idle shows PMC, OPI-DMI,
SPI/eSPI, XHCI, LPSS, LPC, SMB, P2SB and FUSE not power gated; SPA-SPC,
GBE, SATA, HDA, ISH and CSME are gated. Unbinding the Bluetooth UART
gates LPSS, but PC6 and SLP_S0 residency stay at 0. XHCI stays on
because the Apple T1 (internal USB) is kept active. I have not
verified that the SPT-LP PPFEAR layout is correct for SPT-H.

Questions
---------
1. On KBL-H + SPT-H, besides LTR and IRTL, which platform conditions
   make the package stop at PC3 while all cores sit in C10? Is there
   a readable deny reason or status register for this?
2. What should I read next: PMC registers beyond PPFEAR (ModPHY/PLL
   or MPHY power gating status), System Agent / uncore state, or the
   PEG link power state (L1 vs L2/L3)? Any debug tool that works on
   a production part?
3. Is the SPT-LP PPFEAR map valid for SPT-H (bits 13/21 are reserved
   in the SPT map but SPD/SPE in the CNP map; root port 17 is the
   NVMe here)? Which of the IPs above are expected to stay on in
   an S0 idle that reaches PC10?
4. Are there known Apple firmware settings that only macOS undoes
   (or that Linux needs to program) for PC6 on these machines?

I can run tests on this machine and share the raw turbostat and
powermetrics output and register dumps.

I used AI analysis tools to help organize the measurements and draft
this text; all measurements were run and checked by me.

It's my first time collaborating, hopefully this info is of service
for any correction.

Thanks,

--
Ing. Angel Lindo
Director de Operaciones @ Ultratech
+507 6326-1581
LinkedIn
