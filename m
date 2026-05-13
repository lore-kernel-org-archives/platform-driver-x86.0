Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED7F357CF7;
	Wed, 13 May 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687263; cv=none; b=h86hw7cXWyN+2ZyQB2DsjKD0htpfWwfm7t9WlgHGw9meQgw6SGWpnpNui/HFRM180v3c1A0eNcRa4yAbthexInfv9YRCH1cqawJBrfiD0NJv6K6JjrUkJQWHkTB+nyPr4kPSa9X1th2HobUif4WkKjTxVNu0u+ayweEeealcQVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687263; c=relaxed/simple;
	bh=lblvKt4Wg5h4j+HZiAOXBeVbvv/P5oErAibInNykTLY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B6F/kLagcSn0Xozu/uTvx8FTrucCFgwateTerx60qIH7GN24WkbmLW4kWjzFPpUIZfxAIYEGbPWzHZtQYLRhpAdGZ6wbhXpcxuXA3k7pFzgR4I3gvywBCoB5T18T98tO8H9p0zquHqwrpuAvS+VdMZo35+kBMnN4A1W/mxc/3I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=aYTZxwjr; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="aYTZxwjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail; t=1778687248; x=1778946448;
	bh=BxvSbDkRGwQ65PN7fal+kUYQsnlW1MYG6A6Y46PXi0E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aYTZxwjrhoDzgIWsu3gph/qujj8IoN8+xw6+jSnVeunSmmSwpvbZ+m+XwSDYTDZ1I
	 VYRcw1O9YNopmIHNmCnUPVhD+mofkwvSc+NVphCkA7oj+4aUu6vpM28XsJi0oBxGg0
	 /A4fQizbZD9RaXVfv3/L89G08MH2fPkmS3QUV2mn7XeN3Lihs/85LQAERw5AnCoCyC
	 1kLD7QkkvLQBSBeZNfo0l8GTE9Mn2cnNkLd+HXV0XnaQP2eviivTL4EaaQ3KpMAKg4
	 Vo7+nyWw0hTA8nTI65m4YZGigke+AogKJKhg2oJhdF6cdz58WB7DFvFPWQ7bXnZqEB
	 4XiFE7A67WRBg==
Date: Wed, 13 May 2026 15:47:23 +0000
To: platform-driver-x86@vger.kernel.org
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: yaseen@ghoul.dev, corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, derekjohn.clark@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, mpearson-lenovo@squebb.ca, Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] asus-armoury: gate PPT writes on active fan curves
Message-ID: <20260513154714.25160-1-yaseen@ghoul.dev>
In-Reply-To: <20260511061901.907540-1-yaseen@ghoul.dev>
References: <20260511061901.907540-1-yaseen@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: 973cf600a656d5f066c85ccb2f2796ca7bb16d9f
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
    and returns -EBUSY with a pr_warn() from the PPT write path on
    affected models when no fan curve is active.

  Patch 2: Exposes the same flag to userspace as a read-only sysfs
    attribute (requires_fan_curve) so tools like asusctl and rogcc
    can surface the prerequisite to the user before issuing PPT
    writes. Documented in
    Documentation/ABI/testing/sysfs-class-firmware-attributes.

Testing:
  Verified on G835LW (ROG Strix SCAR 18 2025, requires_fan_curve=3Dtrue):
  - With no fan curve active, writes to ppt_pl1_spl return -EBUSY
    and the cached value is unchanged.
  - With pwm1_enable=3D1 on /sys/class/hwmon/.../asus_custom_fan_curve,
    PPT writes succeed and readback matches.
  - The pr_warn fires exactly once per rejected write.

  I do not have access to the other 27 affected models. Testers from
  any of these would be appreciated: FX507VI, FX507VV, FX507Z,
  GA402X, GA403UI, GA403UV, GA403WM, GA403WR, GA403WW, GA605W,
  GU605CR, GU605CW, GU605CX, GU605M, G513I, G513QM, G513QY, G513R,
  G614J, G615LR, G634J, G713PV, G733C, G733P, G814J, G834J, G835LR.

Changes since v1:
  - Return EBUSY instead of ENODEV for userspace clarity
    (Suggested by Derek J. Clark)
  - Update ABI Documents to reflect the change to EBUSY

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


