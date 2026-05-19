Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0668F332615;
	Tue, 19 May 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214346; cv=none; b=S9NKfZxu9mX+lBf+rJE6xvFWiug/ACXpSnR2Gc+j0DmAMi8NEwxrdPAw3zl30crrtU/L24vBluHKUP9EyUnBlQNV5KO5TiDD4PgMMm7nsim5bqXDcP1u6Fpd8PXafH2EkEszha4tZwd66PqsySLrCbE0TlD0jhUTunI6kU3sGNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214346; c=relaxed/simple;
	bh=a7MZcD97G4LyE2jZJrim3SQQdKHmxH88QrV0HOb2AKI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UpjyMOhamVFFNrGenzPDyfw0EgRcUlIj+mV5OGBoKz2KVilVl/WMQUfFHeoNK5SQcLksS7x/MB585a2dAEOskdfcQm719uq3im46G1eRIjiW7mW1ocQyxQ+CbFQtW8cNRHKBMPrNpju1oYCfZtYAGN4HYlaAC0UYGzzFHwiu3R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=AU4XHpc/; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="AU4XHpc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail; t=1779214329; x=1779473529;
	bh=Hdr9pSyw+GyCDpSFG9XwUZeJs/aRO9kXcB/217T1CGU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=AU4XHpc/SQwSWRGfyzGf3K2Wl55QPePuQd4r1gfcuBVJaQyHCqqY5qJQ1bJjiLbUa
	 BRlWb+zL+Zy5Xm53dBLzwRk3UFQMeqoFMg1imbHZuIadsRfcYwvele5oh2w6OdUI9d
	 zdBj/h1/31BMMm1LM5ehtUwHj/sziqRm1gGfddq7IBNPfZ1SwgDr64nV8TdmDlHVjn
	 HslSanoq2Hy38G4phTvWGrv4Kc+8VwJVHFQHguk/ITWRqKHl3MbxzuIyMoZIQF/LY7
	 IDrOYtk+fmj57KLTaHDWrjCKaD8rzkn6SYIy8QH/pPAnBcGRoAOTayu8P9uSGhw9DR
	 CVkqPqu3WFuOA==
Date: Tue, 19 May 2026 18:12:04 +0000
To: Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello <superm1@kernel.org>, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH v3 0/1] asus-armoury: gate PPT writes on active fan curves
Message-ID: <20260519181155.46044-1-yaseen@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: 39dc1090540eac96512c2242e56e6925535fb0c2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

My first kernel patch series, posted in agreement with Denis Benato (Cc'd).

On 30 ASUS ROG laptop models flagged with requires_fan_curve in the
asus-armoury DMI power_data table, the BIOS ACPI method SPLX silently
discards Package Power Tracking (PPT) writes unless the fan mode is
set to Manual (FANM=3D4). FANM is set to 4 by the DEFC method when a
custom fan curve is written. Until then, the WMI DEVS call returns
success but the firmware ignores the value, so userspace sees no
effect from writes to ppt_pl1_spl, ppt_pl2_sppt, ppt_pl3_fppt,
ppt_apu_sppt or ppt_platform_sppt.

The requires_fan_curve flag has existed in the per-model power_data
entries for some time but was never read. This patch wires it up:

  Patch 1: Adds the actual gate. Exports
    asus_wmi_custom_fan_curve_is_enabled() from asus-wmi so
    asus-armoury can query fan-curve state across module boundaries,
    and returns -EBUSY with a pr_warn_once() from the PPT write path on
    affected models when no fan curve is active.

Testing:
  Verified on G835LW (ROG Strix SCAR 18 2025, requires_fan_curve=3Dtrue):
  - With no fan curve active, writes to ppt_pl1_spl return -EBUSY
    and the cached value is unchanged.
  - With pwm1_enable=3D1 on /sys/class/hwmon/.../asus_custom_fan_curve,
    PPT writes succeed and readback matches.
  - The pr_warn_once fires on the first rejected write and stays
    silent on subsequent ones, as expected.

  I do not have access to the other 29 affected models. Testers from
  any of these would be appreciated: FX507VI, FX507VV, FX507Z,
  GA402X, GA403UI, GA403UV, GA403WM, GA403WR, GA403WW, GA605W,
  GU605CR, GU605CW, GU605CX, GU605M, GU605MU, G513I, G513QM,
  G513QY, G513R, G614FP, G614J, G615LR, G634J, G713PV, G733C,
  G733P, G814J, G834J, G835LR.

Changes since v2:
  - Drop the new global asus_wmi_instance and reach the asus_wmi
    instance through the existing asus_ref reference (already shared
    with hid-asus), so it's accessed under its spinlock
  - Use pr_warn_once instead of pr_warn (Suggested by Mario Limonciello)
  - Drop the requires_fan_curve sysfs attribute (patch 2) so we're
    not locked into the ABI before a kernel-managed 'custom' platform
    profile design lands (Suggested by Derek J. Clark)

Changes since v1:
  - Return EBUSY instead of ENODEV for userspace clarity
    (Suggested by Derek J. Clark)
  - Update ABI Documents to reflect the change to EBUSY

Ahmed Yaseen (1):
  platform/x86: asus-armoury: gate PPT writes behind active fan curve

 drivers/platform/x86/asus-armoury.c        | 20 ++++++++++++++++++
 drivers/platform/x86/asus-wmi.c            | 24 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  5 +++++
 3 files changed, 49 insertions(+)

--=20
2.54.0


