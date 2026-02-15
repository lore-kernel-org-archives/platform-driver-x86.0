Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245AF298CAB
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771163776; cv=none; b=IaEJoK6z9EK5gnoXdxJKH+UQNLxAjuK8yKuVyPJhxQ90RC1V5ixgSWpwIc9lSKAFtHOEaYA3O1SG2v9MnXw/awh0eji/+OOSsQT0+/76v0IupITimIEgu7gD8MNBQ8KRqVx4nHbCY2gaMXg/Aa8Ysq2OYQzPJX3KMWfQbBofeB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771163776; c=relaxed/simple;
	bh=+WJiQte+AsZ/dUhzrC0dzyP1leIpbrUwR2RY5EQmbUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9gQFBmiRBZTwCL7wM7lT2yLiFTsj+dU/rx59Kt22aLuDfGeWYGPwFuE5hhio0VJs1PS5UwKGklLX0o/3Yl+yjtombThm4PMY3kcVevPN8e+qguF/at09sNup32+iQnwDnq4f6brCrsnrq/9d1nCKde5y7RMopiklrXtsgrg9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfxO+zZa; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfxO+zZa"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so389365866b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 05:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771163773; x=1771768573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KHB6jjovGvHbln1wA1V5AA9RwOqt3Q1qKjY8PY62RDI=;
        b=OfxO+zZaMwjqD4WcNT/NsXIyJgXO76LfX/Ce+MU5e9o9GOEY39Y3jD+0DE2QVY9+1D
         Gaq9vJGTpyQmxJ2vJQXeQFL1VO+JIEdWPJjrxH2h2e9yN5Igv9q5ZaPiSbjSRLn49aHo
         lhSj35j/Ty1k00tY8mX+Luo1ttOiBXGmSjVA+U2IF3dLxsy/ATxoCeW90s8vRWgVhTKF
         xFRkSKEgEp8nvyEo0UoI6InyEqnknKi/sU4pOKbjo58gDE7kGxnoOIawilvPfA5h2eUX
         DVjMa+456/4r3cu9azTey0duVx78dl8UZ6aEm7V6WLtiOdrHqkV2IxTA/xD3oSwxyXka
         ifwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771163773; x=1771768573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHB6jjovGvHbln1wA1V5AA9RwOqt3Q1qKjY8PY62RDI=;
        b=a6GAB3OzhXt2HsKokiMgEtgjIPVq8QGOvNtqCJ3WmNc6HHIJvzXnNS/oyyaXL0303v
         ztLZZCyy/qSaK7G5nQjpwtvHYy/CFmK8oeolmg0AHl3BehamgoZZ2iybeSphLvlgzamr
         suSwwdQbiU6T1kUto6wqnSmy24zJ0Ete04xKAPJQ/SAjPloTAd5V/9UUST7ofzI/JnvI
         +mPIcI/+K+plB1fsQeApkEYkKwK7RcJ7ZAHmc5HNWOA/6JWjDQFD8ytseWB/WeBuGbbV
         1uJ/jp4Ls7kC+jf0Ye0jjsEpGxdjJvbmDk/95vlIwu+0Nqed+H9CvWzP8Yp4U2kpZHnm
         QTUw==
X-Forwarded-Encrypted: i=1; AJvYcCWlycQSl7Wnm3SlFLH5Nl5n0MzRID4xVHoJTkBhFZwbMmr08atg3mDcoVan66qchvP8M5vln/6Hv5ZEidvMIKkucZ6N@vger.kernel.org
X-Gm-Message-State: AOJu0YwHPFtzAjSc3a6o3D7+e0uL8pQVIyD/yvJtjOC826giR6UT1ebZ
	TFdhPucB8WLcm6w9qT1+t0C8nSnINNsIY5baWUCR6YcV9Y5hFImCU87Z
X-Gm-Gg: AZuq6aL/KzGFWuytzdArEugpExAF1IxRitjPBnw941Iqj8Gwi5wFqPb40+bwNeaiNIy
	BQB8rwAdfqvEAp41kUUO9UhjkLHzLztiSefkm66iLuITPS07dXuk8pd+7gCoKP0tndvKqgVfzhh
	EGjfnbV9W55QilAlCJqGRpFLaYLArwHYvPVT5HC3GZ73uO35Icg9VEWepB+hIcvcRCJvkbfcuZY
	NW7jo08Fuz9ghL7E/moxYHKyk34VQulad0n8HPDi4Ole/rfhqw+awWw4ycfvgFfTdeTvn/JN8UZ
	C4WSUoC6yd8MWJv7xYp14oGgZXwEYDbikTBGX/YNDrKpzRkqFnChbxSbbixjmR87UUKS0CsrMkz
	lqpgj0Q6xR1xWjcFFeMjLw9Iz2lXQ8moU+tPb6tQlSRwSucKp4HDj2Z/inwDSbv7xx248+KMofE
	LK+ESB7uJSIU1JObi6MvYplQ==
X-Received: by 2002:a17:907:6d17:b0:b8f:ad62:edc7 with SMTP id a640c23a62f3a-b8fb41fc64bmr418527566b.24.1771163773144;
        Sun, 15 Feb 2026 05:56:13 -0800 (PST)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7626bdbsm164179166b.40.2026.02.15.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 05:56:11 -0800 (PST)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: broonie@kernel.org,
	hdegoede@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: rf@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] Fix second CS35L56 amplifier on Intel LPSS SPI with broken ACPI cs-gpios
Date: Sun, 15 Feb 2026 14:55:22 +0100
Message-ID: <20260215135524.1171065-1-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To: broonie@kernel.org, hdegoede@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: rf@opensource.cirrus.com, linux-spi@vger.kernel.org,
    platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

This patch series fixes an issue where the second Cirrus Logic CS35L56
amplifier fails to probe on several HP and ASUS laptops with Intel Lunar
Lake processors. The amplifiers are connected via SPI, and the second
one (CS1) always times out reading HALO_STATE (returns all zeros).
Speakers work correctly in Windows.

The root cause is a broken ACPI DSDT on these machines. The SPI
controller's _DSD declares:

    "cs-gpios", Package (0x01) { Zero }

This only defines CS0 (native). The CS1 GPIO entry is missing entirely,
even though the ACPI device node (CSC3556) does define a GpioIo resource
for CS1 and both SpiSerialBusV2 resources correctly specify
DeviceSelection 0 and 1.

This causes two problems:

1. The SPI framework has no GPIO descriptor for CS1, so it never toggles
   the actual chip select line to the second amplifier.

2. On Intel LPSS controllers with dynamic clock gating
   (cs_clk_stays_gated=true, e.g., Cannon Lake and later), the SPI
   clock is gated when no native CS is asserted. With GPIO chip select,
   the native CS register is never asserted, so the clock never runs.

The fix is in two parts:

Patch 1 modifies serial-multi-instantiate to acquire the CS GPIO from
the ACPI GpioIo resource and install it on the controller's cs_gpiods
array. Setting it directly on the spi_device doesn't work because
__spi_add_device() unconditionally overwrites spi->cs_gpiod[] from
ctlr->cs_gpiods[cs]. The array is reallocated to accommodate the
additional chip select.

Patch 2 modifies spi-pxa2xx to handle GPIO chip select on LPSS
controllers with dynamic clock gating. When spi_is_csgpiod() is true,
cs_assert asserts the native CS in the control register (to enable the
clock domain) and forces the clock gate on. cs_deassert reverses both.

Tested on HP EliteBook 8 G1i (Intel Core Ultra 7 258V, Lunar Lake-M)
with 2x CS35L56 Rev B0. Both amplifiers now probe successfully, load
calibration and tuning, and produce audio.

Related bug reports:
- https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/2131138
- https://bugzilla.kernel.org/show_bug.cgi?id=221064
- https://github.com/thesofproject/linux/issues/5621

Khalil Laleh (2):
  platform/x86: serial-multi-instantiate: Add GPIO chip select support
    for SPI devices
  spi: pxa2xx: Handle dynamic clock gating for GPIO chip select devices

 drivers/platform/x86/serial-multi-instantiate.c | 83 ++++++++++++++++++
 drivers/spi/spi-pxa2xx.c                        | 35 +++++++-
 2 files changed, 114 insertions(+), 4 deletions(-)

--
