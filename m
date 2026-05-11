Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616B2C234E
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 06:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778480368; cv=none; b=kZRTpQuAFCfXIam71rF7cP8JdLXUoAIghpDFbColVg+DwQ0zJtvX6mQUXzetByr1jxvMTe0BEzkSQ5cPeMitvSx7cXid0Fjz0FWBEKM9A+J6R3DzUs8SiOkERooOlf5C7Dkw97WVJokx+0dOiLo1t8laf+SS6GJuw3UVBvsqWrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778480368; c=relaxed/simple;
	bh=/gUi5KT2tU0ZZDRcccbQuCskv0Uny4gzKoQpSgQ1n0c=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EpJafaUzNoHKiWEDZoFD2Y35c5eJ+f6gpS4cM55QOX5/uWB3liCrDgPkgLfLy/RCszmWi2YCJJJsFgE6oIt3ct+WrnBMQjAP1bn1FfWMHmgDyDvtcXvS1zx/ZypB4UfoLYMslSlUbsiTG0GMnJZ+eO0sv9ubIthBHeNU94q8QZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=mZYFxgko; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="mZYFxgko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail; t=1778480362; x=1778739562;
	bh=AWfBwWsnhl3DIACN+ea9HV3Qy07bFiBxBpH910+BQlk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mZYFxgkof6sfDpiIjbid6Lm1nweWmBLSYH2P66UA9fwDkUoHpWs19pNc76DdK6TMe
	 UBu2o2t7Ov4SZGIG0M2e03QnsmcpWTeigldP/sElUrxSdgN+hbcJ6brFftgcBmRwmC
	 UAwPAFIIkk/iV6oDW33rSQ/9LUh9kbruMQUACZxHwCANzefT7oRR2k2FS21FnnKEJE
	 ORNS68LHXTp1VwOO9egvSQY95vkn5OQnDILbfyAp+wjeMMo1fAr6G3sCip8SU22QkT
	 B3dZ0dA0ff/j8LQbMiIy1EA3MvVVs1TSssz2QvXQzEulRl1bPsjySPzFH0i7lsABHh
	 Kk3HnGFyRw3/w==
Date: Mon, 11 May 2026 06:19:14 +0000
To: platform-driver-x86@vger.kernel.org
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: yaseen@ghoul.dev, corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, derekjohn.clark@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, mpearson-lenovo@squebb.ca, Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org, asus-linux@lists.linux.dev
Subject: [PATCH 0/2] asus-armoury: gate PPT writes on active fan curves
Message-ID: <20260511061901.907540-1-yaseen@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: 8964d49e94d8684135f78d2def9c5f598cc7bef8
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

My first kernel patch series, posted in agreement with Denis Benato (Cc'd).

On 28 ASUS ROG laptop models flagged with requires_fan_curve in the
asus-armoury DMI power_data table, the BIOS ACPI method SPLX silently
discards Package Power Tracking (PPT) writes unless the fan mode is
set to Manual (FANM=3D4). FANM is set to 4 by the DEFC method when a
custom fan curve is written. Until then, the WMI DEVS call returns
success but the firmware ignores the value, so userspace sees no
effect from writes to ppt_pl1_spl, ppt_pl2_sppt, ppt_pl3_fppt,
ppt_apu_sppt or ppt_platform_sppt.

The requires_fan_curve flag has existed in the per-model power_data
entries for some time but was never read. This series wires it up:

  Patch 1: Adds the actual gate. Exports
    asus_wmi_custom_fan_curve_is_enabled() from asus-wmi so
    asus-armoury can query fan-curve state across module boundaries,
    and returns -ENODEV with a pr_warn() from the PPT write path on
    affected models when no fan curve is active.

  Patch 2: Exposes the same flag to userspace as a read-only sysfs
    attribute (requires_fan_curve) so tools like asusctl and rogcc
    can surface the prerequisite to the user before issuing PPT
    writes. Documented in
    Documentation/ABI/testing/sysfs-class-firmware-attributes.

Testing:
  Verified on G835LW (ROG Strix SCAR 18 2025, requires_fan_curve=3Dtrue):
  - With no fan curve active, writes to ppt_pl1_spl return -ENODEV
    and the cached value is unchanged.
  - With pwm1_enable=3D1 on /sys/class/hwmon/.../asus_custom_fan_curve,
    PPT writes succeed and readback matches.
  - The pr_warn fires exactly once per rejected write.

  I do not have access to the other 27 affected models. Testers from
  any of these would be appreciated: FX507VI, FX507VV, FX507Z,
  GA402X, GA403UI, GA403UV, GA403WM, GA403WR, GA403WW, GA605W,
  GU605CR, GU605CW, GU605CX, GU605M, G513I, G513QM, G513QY, G513R,
  G614J, G615LR, G634J, G713PV, G733C, G733P, G814J, G834J, G835LR.

Ahmed Yaseen (2):
  platform/x86: asus-armoury: gate PPT writes behind active fan curve
  platform/x86: asus-armoury: expose requires_fan_curve via sysfs

 .../testing/sysfs-class-firmware-attributes   | 25 +++++++++++++
 drivers/platform/x86/asus-armoury.c           | 35 +++++++++++++++++++
 drivers/platform/x86/asus-wmi.c               | 28 +++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h    |  5 +++
 4 files changed, 93 insertions(+)

--=20
2.54.0


