Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE8D345CAA
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Apr 2026 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074529; cv=none; b=mFE+BjKY4ReUl0mklBs59bCRhpZEwJsPLVnXmjJ2L9BR0usvHEvkXua8lcRogJiH9X7sw2/ol8eC1vz1Nk7xIvhQNTK/KkJjH3+SaQTC6bu9kEGcEBR1Q+bdH2X33jbaJnDNBZac56G6mLZeRlKZ2ZgsMx3GuhfGeYhyowWG4E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074529; c=relaxed/simple;
	bh=V8Tqks5In4sCz8giKkpBV74fLlrmr6VF7pNbEc32CZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xv6vrfmouo10KRJVCFbmjJXOpMrhUcF7kn3r/qjCVpbtdMinYMsSQljjdTC1SxofwhPVDKFxdbkSMpS6F8vsEzGAbRwPKR8Ei+bl7wMKqpEGeYMqTyj0v2NtCY756yOnvxykHzl75j5TGYdCazDYgDk28PiUGNcRTaIy+IEFTAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYQDTtip; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYQDTtip"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6714f678bdaso1626840a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Apr 2026 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074525; x=1776679325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mP1ngGhMs2oVA/SSWUiO4CUdC3iL7pughQ6YpYY6ZLo=;
        b=PYQDTtipJolVXZkJrVNHJhxanHZYhRuRgtHYsgUpl+KykEgZIGU5LMnIKyfl9aXl11
         u4hISQ2dXri8qKY1o9JLZV2iXqVpajPyZGjhAdoYcZOy7RByuPiweLj7tV2FlS5jKA5b
         5iGU7M2ohO+M2Fq0eweAioaw3t+Gv80T3k9PNaOTdsDS2YuplqObub+U4/IjjoCWhMBX
         b4HU5DVExzPbl0xibM4vmGy1zIsS0LiGCwIfYhjgAwvXOQIpqE87ImK5i/ds2bVipqQD
         n6QqD/taORzGH6i3alNGY+fEA7FOFhTOHyszjpOXshjTMR5YF2DCD67eNRALVvQv5UEf
         ixpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074525; x=1776679325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mP1ngGhMs2oVA/SSWUiO4CUdC3iL7pughQ6YpYY6ZLo=;
        b=Kv2HSA/8gVbqPjynD+0go0fPTc18wI5OQ9YeVpAsRwEjyrsvM6YKns43920QcAenFq
         psZRZ1IDxgMUL1r5qY6QpfuYBQo9s4zsTLe1tJSvdEH6Uj1kzithHLMEOEG1jTPtZpEa
         ziaI/a1721S7Cc4A9JpzNPPyfObYBkt/3/N53BFI3p8tlw1SYlhPQrkTwDZb4x3SkHBV
         VfprlelVP/8XF0Rgt7ZM6sfI/h6bV/BUkPCFVeP/xJ2kUSFi7RusfAhtgKU8Bi/IB/OV
         v/Dr/CWkOTa1B/IUV5UZCVF/1BEh61Nq/P1Z/dhVtDhLp2+cjTcQ1kECzgoy9FO91wym
         zysQ==
X-Forwarded-Encrypted: i=1; AFNElJ88j1agcKDN5ZTxtWtADalkN7Dd5qAJJDhFDPdgXemQLsZxSfrM6bvtV1ffUUQncQODLXbKpPtehVQ0JwuEvKufMUpp@vger.kernel.org
X-Gm-Message-State: AOJu0YzcyfbsOjXYVubJTGrLTQyvySvxqGwKohjQ2DrRxT5mdlAWgdgn
	QzgP7YM19216/7/y9EUBPOXu2pty0+bNYAh+vTgqal8Ff/vnnSvdfQar
X-Gm-Gg: AeBDiesfaXk54U05ectaHOzVuLwxaXgt+ciAWYk3BAZ/K4gNsdpGo2T8kSIrADT0Rxb
	qfyyiKAwcBLStHkkNqGLEGX04Qew18uzvEFB8DDEQMZtFColgWAd9nnGeWvrjWia7NakbAV8ksf
	6w/SvG+RyZrSl28AlZKlQox9tq4HzOlGvWlcY/rywdDdhUkww1JOcjXX7R25a9YaAm0bCY22AGc
	BI+X11QTa7rSTMJMH3zj1yThlnBv8ayH/ihndHWYoKep4/00CgykzEEMX+BUrMJDBAVbykfhptX
	8V2ahqRZo1IreBTfD5qi5QbX/w5sFSTDjZyMY/MVifZiMTME1ZzEfn+YB1XWMvopLQPTlbQ2RNa
	wdQriC+2rMdYFmeA7SiNJCjrMK5W8QBBw3NnOSmfyNE0rfZvkEp/dRBpvLY1fdZOE0iRM9WjcmO
	k1qrPLhaUhkUKDr3nPLbewKd64Q5f+GMmt
X-Received: by 2002:a17:907:72d4:b0:b9d:e352:f7f4 with SMTP id a640c23a62f3a-b9de352f82fmr152429666b.29.1776074524194;
        Mon, 13 Apr 2026 03:02:04 -0700 (PDT)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f189esm291993566b.58.2026.04.13.03.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:02:03 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: broonie@kernel.org,
	hdegoede@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: rf@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>
Subject: [PATCH v2 0/3] Fix CS35L56 amplifier on Intel LPSS SPI with broken ACPI cs-gpios
Date: Mon, 13 Apr 2026 12:01:37 +0200
Message-ID: <20260413100140.579845-1-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Resend of v2 with the version tag now present on all patches in the
series (previous send only had v2 on the cover letter - apologies for
the noise).

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

