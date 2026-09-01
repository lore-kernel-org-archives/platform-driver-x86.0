Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C9549E5FE
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290795; cv=none; b=RGiUMQvJ1RSwtbOEjwK3OYekcOqkJg3SFYHj2cWYe9cm4cmn01DWNffjY2DHCqtYLJwfTUkUrmYr7NmZcHliUCQ7vXSZECq3opgIfLHcDkkf+uJDFYYP6QMix0p6ifxB7Q3+gdVi13Ir6jCBOMcjlQQt1A5uZF+W+lUSN5JGSM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290795; c=relaxed/simple;
	bh=8IldVcKFWxRF8a6xnc4EgOvN6n/T6fyKnTnlCA44KsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M2HzTtWBGt+fuDh9lzBG/ECNzVE+ooJbzOK4KuspOeb1FHrAXcQ+yHywj1q5EbZB+k7NbGDtsmxCnDRtsYGwS2i2yWgnp5Apm337hQ9LgMTEpru3ELYT/BlUqaX3c6ApE+AlkQSOJms+SFKpNLMa0pczoObQLwVd2NqQi4anP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ocFyX2/p; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocFyX2/p"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso356824a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Sep 2026 12:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290793; x=1788895593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R+dXlhW9X6Vrf/RHdUTXz/EyouRxzz9SL0VdPXRzdMM=;
        b=ocFyX2/pyQNio0CRrsg2Rx8OvZTrONbRU0wGmi3iA5xKSDvKSL2a3iyY8cyCfwfWex
         ar7+ldz4uhJ+RTQcj9FOv5OZFufVo/eclXExogi3+PmXsDIuYVQYRQEwf/9m3xPv5XYf
         o1vY0QaMjvM90vOIamed9iqGLbgSyiGpy1LdgT1fG0Ul/KH9EXtEiqQ3OrNNSgiv0RUp
         K354k3ikbAyfm/0Ur85LF+KTqvqb1kxRnfAEVMpVeksKq5o23SBRkQwRfFX0oz2SK2DF
         KyYWmcz2htoQfQkw1x47CcJBv/d6w6rOW3z2m8p4zc6YMn1xxaZ8POogSo3iT/vpn2EO
         U+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290793; x=1788895593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+dXlhW9X6Vrf/RHdUTXz/EyouRxzz9SL0VdPXRzdMM=;
        b=rrkIoKyKC/Xr8m7kE9d9K+iBuJ2o19TjGGVk/3jY/CWolPhAkDvHHvsxgDC6o/d54d
         VpLffDdgXlAF8EaYVN9B1u7/bOJNYekyjCTudAOkQ7UGG7E6brNzABaeQpC9bR2wfUV5
         zKbmT1s6gLf2hlBmK5YU7edHKeHexCC4Ya7sStnbHfb/Tla3Qk8bdYpKiFLcq2Q7T4gT
         1Y3uCPOI9nuUd8WvrYXp90mftj22tKf0c6iJFob5X//YTqyhcB5AamJtzCxbl1j7Q84L
         oCCb9bKy7Q4GUuPx5nUqV+Y4E8I1iK9E21NZeesWxo7rp3vZUmwKV0T7VNyBnKkir9JL
         lAKw==
X-Forwarded-Encrypted: i=1; AKwUvBxGXOGYjSmNQuXx/cwTqekK70EczUHtUPCqwjYUWKW2AU0PUX34AHg04epqbyNeF/QEJdQZs496FEuqcbuJtY9gcbp/@vger.kernel.org
X-Gm-Message-State: AFuF++nLixgssGD05Y0+qtQjUIbnTZnzjnoqm4q7TZDoweICsVBCpRvD
	fzqcl+VpHFiuXmRRXpu56f0Sg2avoLOQvcKfvEmAeCXv4uX5CpVl8mn8
X-Gm-Gg: AYBFou2nejAOEWuMcFp42oLPjNCU5Bbq5r4zDazuSehgLc/ZnA9fvEzNUSoVUSRsZMk
	IEWRDAmSgExHH3EXfW9j8P3xjmdmJClGtY+GniWBftXKDz3J2YMYCeQvOXu5H0jXO9XbiRwBuMe
	rD2bPBRCLFg++zDPrSwyeMOD9XNtwKyQmStInNxbQSb1seJ+2GRQC0N/K3nYJ35Wjoj4B/fagQR
	+AGpjLDFIrcsDq+glqkq1/4CMWd6nNAlKaxCHhWle6uEcWWleegjIcoeg+G/kopZUGVByZjz/QW
	EwNlIn9bWcH84brQ+fcxPgT1UpLONxFcYR9zwruKO735/RD9nzD+K4xPonTjXgzDySojL0AFuIO
	7t01h+Hk/wzpHOrUgR0iOHzHJx40LZNgfRGK8wDgnQ/vPpl9h3MxtafOYw2dvaPtXMl8wSt0nWC
	WZapBsc7jWXabmzGaR36kSuQh6b6g8c7wW2M4w/Kx0naoh75D3uSPODR/FcJ8m2g==
X-Received: by 2002:a05:6402:388b:b0:6a3:f4fe:9d5f with SMTP id 4fb4d7f45d1cf-6a6829af072mr27436a12.11.1788290792518;
        Tue, 01 Sep 2026 12:26:32 -0700 (PDT)
Received: from khalil-hp.home ([62.250.116.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f94242csm146373a12.21.2026.09.01.12.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:26:32 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: Mark Brown <broonie@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>
Subject: [PATCH v3 0/3] Fix CS35L56 amplifier on Intel LPSS SPI with broken ACPI cs-gpios
Date: Tue,  1 Sep 2026 21:26:22 +0200
Message-ID: <20260901192625.1497791-1-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3 of the patch series fixing dual CS35L56 amplifiers on HP laptops
with Intel Lunar Lake and broken ACPI cs-gpios.

Changes since v2:
- Rebased onto broonie/spi for-next (commit b00c00f7dc)
- No code changes

Changes since RFC v1 (addressing feedback from Richard Fitzgerald):
- Added DMI quirk table: GPIO CS fixup is now only applied on known
  affected platforms (HP EliteBook 8 G1i, board 8D8A), not generically
  for all devices with CS > 0.
- Fixed chip select range check: only chip selects outside the
  controller's num_chipselect range are fixed up. A NULL cs_gpiods[cs]
  within range means "native chip select", not broken.
- Removed ASUS reference (GU605C was fixed by BIOS update).
- Added Patch 1/3 (spi core): __spi_add_device() now preserves preset
  cs_gpiod on the device instead of unconditionally overwriting from
  ctlr->cs_gpiods. Suggested by Richard Fitzgerald.
- Patch 2/3 (serial-multi-instantiate): Extracted GPIO fixup into a
  dedicated helper function with DMI-based quirk table.
- Patch 3/3 (spi-pxa2xx): Handles clock gating on Intel LPSS
  controllers when GPIO chip select is active.

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

