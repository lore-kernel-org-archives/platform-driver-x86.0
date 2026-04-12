Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9D019D8AC
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011539; cv=none; b=gJ8v5uhmnGPG3POSDCXU2wkTumB7NJFewJ8/uiJM58fkiDiFwABgpTicbLsGUNKJ3mmc95osHVTwvHf1vRVrmyWIdctKgf4iextDCgMMCt7yant31k2uwQQYBzvO99Hp9KXaOggVj6JRq2gg5xccLRnSBL3Fu4509a3dM0u+oZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011539; c=relaxed/simple;
	bh=fGMrJdVHO3BNg782zgRhFj4456fWdretKPYfi/QjIgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvgKxkO3aJRY+yCMK1102HLYv0OY0xwmJwo8Y0vk+N8e6iB/I7InhVWR8razXV6vhJYhgltEo9tz+vaeVBuOgA9+niV+31KRUH5OSKvHVNWOSmMInxy0+fhbxNTPw40ygFORgiceENtLe4kUPEKXDtqmvzd8mPv+K37lohNpXas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eknjw8Ht; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eknjw8Ht"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9910707d82so438540966b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776011536; x=1776616336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HugtwxIexB7rRcOd2FqtNpLxabVB7H+4U5esmVbZeJ4=;
        b=eknjw8HtInTbRpuiEvy4pVfvXNJw4KnC+Dl4HPHMHBtQQBdeIMPiBmb/D477xI6n12
         hUXCNVNSKz+R28UpI3LynqsEinVBvLvJEqSKcvwcsKOxqPqmS0YTS1rq5UPLhTvt42fu
         qcTc7MDL+fpbLXovymshFad/5eQvcdzY3WnwlEjlnlxJOAxDhA+mQOOaGh9vgQlRixXO
         3q8frR2BC9ShLBQ0OKtXGP1vAhvBjM1Fir/iJwqInWK5JNVWd8KOWRITnHCHcPCrmsHF
         mTixKNF7ukiLe35/nnxH6Qu1Gengjnc+XbipfxG/pjHoT+1rbJB4qXqo/sDkHfwzKtwJ
         eKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776011536; x=1776616336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HugtwxIexB7rRcOd2FqtNpLxabVB7H+4U5esmVbZeJ4=;
        b=K2jKER18srBy470Tb9AvNpXZ94i2pa1IcX7QjtERbLegWJXc/C248UdWs3+PbrVjmn
         axUtTTRVSTDySdsF5dtHv/tzk9vw0yy884SiIsaOt3oYOfP/l+LsZmaW6Q2TleVMVSJk
         cOF4kZQ/uil5t9qcONOlFCjyDkjvLqakYnnPZQquz6tO7gNvFzDta0Fw8IKUHWsVRXp8
         c5CqwPpNCpRRSFHWOLLi/Agswc4vaOwcXcnbdlWTcDx/Yz5r31rQqTClQhSIvSiivWyI
         3gRjpkLYHzJw6o6DotmeKyNDMERCBdKyEHMUfSlGthj5cE95zoU49QrOOKI9v7JfiVf0
         g+2w==
X-Forwarded-Encrypted: i=1; AJvYcCUjfPZEhaJBMydKAte+X1svvsBb3Qz6/4m/6j5oTT0F7MLTqwDGZDS67t0Y6yX6zjdmtpoQ667AGZ0gG179REFmka4Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/lRacSoDDlaatis60Mj+ZbFtIab3v+JwGzANwe2S4p/fxEMnD
	Ny3+jmD+kNK799kZBR8B3XGUGMpTnSOg30vr1elyGMy+hxZARE0KWWm3
X-Gm-Gg: AeBDieswINzCYXnpWWoE+o/VI+yatiKqe2rPkEDW0AxF3lyIeYtf4THWjPdxAzTAZF/
	U4VvUexlCOVXZV/tDKIqp+Q4B5VpgFai+OK6OBd1bYR5aer8U/kLffHyinCdXkzGHgc/1iNTHEd
	8jJNunv4Lonsnkhr2E/VhlbAllivbWaLpFmpA4SMEc8hU9jCLNpHTiwAqSISHYX/6Q2SgTfdPVs
	AS+PRtr0xiku7J+/ZKfjf9Lz7N4XKtJpew6ui7IuHIFxRcemqDSBknOCptgo9E4L+Fa5x/p9gaA
	ccK/bMAopPlw1BUjxo8mUFaCnEqhONYUH3/TxpvRcWq/vNIhJzZTp8aPIf2bDE92H88QMS2RIUu
	0SmK5/AMHDBbSDmgyEf7ZqtfwFlAkG9tTTX/qXedIlWgK6gPvN38Td7oARIKxcc0pIyUjjaPExn
	ghHugs72NXho96I9cu1IhjUA==
X-Received: by 2002:a17:906:bf45:b0:b98:36cd:7e0e with SMTP id a640c23a62f3a-b9d729bfe44mr587550466b.45.1776011535850;
        Sun, 12 Apr 2026 09:32:15 -0700 (PDT)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1a3bsm236468666b.62.2026.04.12.09.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:32:15 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: broonie@kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: rf@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>
Subject: [PATCH v2 0/3] Fix CS35L56 amplifier on Intel LPSS SPI with broken ACPI cs-gpios
Date: Sun, 12 Apr 2026 18:31:48 +0200
Message-ID: <20260412163151.506282-1-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260215135524.1171065-2-khalil@rentman.nl>
References: <20260215135524.1171065-2-khalil@rentman.nl>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v2 of the patch series fixing dual CS35L56 amplifiers on HP
laptops with Intel Lunar Lake and broken ACPI cs-gpios.

Changes since RFC v1 (addressing feedback from Richard Fitzgerald):

- Added DMI quirk table: GPIO CS fixup is now only applied on known
  affected platforms (HP EliteBook 8 G1i, board 8D8A), not generically
  for all devices with CS > 0.

- Fixed chip select range check: only chip selects outside the
  controller's num_chipselect range are fixed up. A NULL cs_gpiods[cs]
  within range means "native chip select", not broken. This avoids
  incorrectly replacing native CS0 with the GPIO descriptor.

- Removed ASUS reference (GU605C was fixed by BIOS update).

- Added Patch 1/3 (spi core): __spi_add_device() now preserves preset
  cs_gpiod on the device instead of unconditionally overwriting from
  ctlr->cs_gpiods. This was suggested by Richard as the preferred
  approach to avoid modifying controller state post-probe.

- Patch 2/3 (serial-multi-instantiate): Extracted GPIO fixup into a
  dedicated helper function. Currently still installs the GPIO on the
  controller's cs_gpiods array because __spi_add_device() overwrites
  device-level cs_gpiod. With Patch 1/3 applied, a future cleanup
  could set the GPIO directly on the device instead.

- Patch 3/3 (spi-pxa2xx): Unchanged from v1. Handles clock gating
  on Intel LPSS controllers when GPIO chip select is active.

Note: While Richard also suggested the cs35l41_hda self-fixup approach
(setting cs_gpiod on the device post-probe via spi_setup), this doesn't
work here because the device can't even be added to the bus - SPI core
rejects it with -EINVAL when cs >= num_chipselect. The serial-multi-
instantiate approach is necessary to extend num_chipselect first.

Regarding modifying the probed controller: I acknowledge this is not
ideal. Patch 1/3 is a step toward the cleaner approach (preset on
device). However, num_chipselect still needs to be extended, and
cs_gpiods needs to be expanded to prevent out-of-bounds access in
__spi_add_device(). I'm open to suggestions for a cleaner way to
handle this.

Tested on HP EliteBook 8 G1i 16 inch (Intel Core Ultra 7 258V,
Lunar Lake-M) with 2x CS35L56 Rev B0. Both amplifiers probe
successfully, load calibration and tuning, and produce audio.

Related bug reports:
- https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/2131138
- https://bugzilla.kernel.org/show_bug.cgi?id=221064
- https://github.com/thesofproject/linux/issues/5621

Khalil (3):
  spi: Preserve preset cs_gpiod in __spi_add_device()
  platform/x86: serial-multi-instantiate: Fix SPI chip select on
    platforms with incomplete ACPI cs-gpios
  spi: pxa2xx: Handle clock gating for GPIO chip select devices

 .../platform/x86/serial-multi-instantiate.c   | 168 ++++++++++++++++++
 drivers/spi/spi-pxa2xx.c                      |  45 ++++-
 drivers/spi/spi.c                             |   3 +-
 3 files changed, 211 insertions(+), 5 deletions(-)

-- 
2.43.0

