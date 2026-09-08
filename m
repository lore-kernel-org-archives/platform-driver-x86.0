Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEB154B1C4
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892462; cv=none; b=IDZisvrE25kJHhHfvwIG4AVW7LQMFg+7z98xVZpbiN55DWoxdukQTJtsMNPgjGRm3prvtjGN3r2EkJPSpwppmyorBpAeFw/CCQfKm7wVxQ1J102LlatRyFAFGuj5+C0VQIS4S2hvGW31JMUhaI/1q19972GYVLf99KI3WXCTgEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892462; c=relaxed/simple;
	bh=4eGTP4LUxsjfl69Msy68378nEsw33bHsm07+fTnlLT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwO2MRYO+ZSmrBi9K8Gi4nCa3hcHeSkVfzDIz7odHStF6ZLmnCjlGij4o6qiIaFwYxYpTKiQ5qUErVqtFLcaPf4hIY4hQFEwa/XHQY6hExrAeE6dhC6WSTENwIOm2p9PD3UnEPjkYN2ceG/FBFoRm/1f9bxyNhBVYmv4SMIxoXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efl7mipp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efl7mipp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8687630fso42507005e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 11:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892455; x=1789497255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlzHWsXat6ojDJ/DAFZB3TdvYphSiZcgNgIhwrwJoq8=;
        b=efl7mippk5rRe/T7glofPen+X0bnSTrkcumgHFCpVOH9vMwvAgiFBC4k5YQKMNcJvf
         9iJfRpUipv3ZaeZcGr9QxGTbFWy9gXY2NTCF7BR9Y7zvN1IANDO1jx24AZbneLEm/ncb
         JwCVSbjXjibhsaKNAQXlall3wQGcKvgPPVmRLhoRFJhXV1H1aHGg70O5rj/e7Gs3UKzF
         daYD+SSshnPNCtD8BhLfTLqI3Thxn9bVd48UH5pEMLQzWhG1ivHRaZhLDDbU2J04e+aT
         HYNbWxErBoiguchpzQW+if1OtFHlUCUAIRorxZcsz99r6AaFtle5gThTb9fybgra8vHK
         n8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892455; x=1789497255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlzHWsXat6ojDJ/DAFZB3TdvYphSiZcgNgIhwrwJoq8=;
        b=d+IHMZl63QIs1uulH2eaGoiLmbn35v6yEUb6zQYu0fMGYZ/fpbDDxFR17usgLrO0pd
         Ry9ggJGaKIgH6NshT0aKPhbvD0Dpiyb/0nNrqoliwawhc14262P1IPG2d1lHbZetwIdh
         cga/OuvUWn1Cw49Y7FE5z4vHMkK3oLHAacBi/eBtciBAtiBUhHRmo5fNUJqNhn+TWfmp
         l+1u7FId/sGZ1PZuuYk9LNOj1xWq+oSJUkBuo3yJC4JaraSdLGhzjkpCOACOsfSuMxMa
         u1oZcngwXnyvNduib15TkqHFuvSOgJNU0NoFKs2BQNiPKgZKz9VDbilA2IgmH7YMUX6a
         4evg==
X-Forwarded-Encrypted: i=1; AKwUvByWD3iER2Z7CWK9Ira199jvSIEoVRVCuiTdkIbo5R4l68Cgzgrf6z4s3wYyB3RbragE1P//MzSNaDDx9F4T27jeuM7H@vger.kernel.org
X-Gm-Message-State: AFuF++kkU0ibMWknOII1zkR5Jbl1UlIkV3WbYeq0Tsn1DOm6MBqaW10s
	7I+u8mqTywrnTZXCXdTTHi72+IHXEfQs0h3tOnBnLmnPQY1Mu7dAnL4h
X-Gm-Gg: AYBFou0xUIyA3lgcFqG4fvRGSLWKLlI7vZ9SiCujOkDGZbUvCJQCGN7c0n9Ts+9/3ZC
	pl05xPTfNRsV7itwDaNT/L7Hj4LWV84Ri1NN9INAFVjEKNC1BzE8kYs/AmFbH6cw/8xrGh9UMQ6
	hL6phA35Jt2bnXsFB0ffNVSpimN2lP8hL3UVyCyy/DhRvwnODtOHRfiycaKjAR7AYscTmBJAqgd
	Kcl4Hzhu6WtxeUZDWdph5gKkvH6D/Uz/h7pAtkCq12yKH7/zSP++PYbtRFxRd5pcySoJpxnRceG
	pozwOg9INcF1bkB3cKhdCGfTWY7thRRbXp5xAYLAq/+IjhEC91cVwbT8SLrtrIRJRyZDXSQ65vB
	Fcm73mWDqP2CijcXJS9Qe0JVdmiv17knLaOClVkX5Jo9ioodYkp7fYgZlfQ0oXqgnEZHoSwPAf4
	6ieusogt9mp9uFnBlR0w0JvNguIAEY/PTLmNR0+sMHR/py80JxAFa+CF5gXV6At2TH2tmHuv4ZS
	R1LAujMe4U2mlbmutLSLZp5HUCGJY/P
X-Received: by 2002:a05:600c:3145:b0:49d:1916:59c7 with SMTP id 5b1f17b1804b1-49d19165a7amr67722275e9.7.1788892454444;
        Tue, 08 Sep 2026 11:34:14 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm312095435e9.0.2026.09.08.11.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:13 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 0/2] platform/arm64: Lenovo Yoga Slim 7x Gen 11 embedded controller
Date: Tue,  8 Sep 2026 20:34:01 +0200
Message-ID: <20260908183403.2107-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 7x Gen 11 is a Qualcomm Snapdragon X2 Elite (glymur)
laptop. It carries a Compal EF06 embedded controller on I2C at address
0x70, which is the only source on this machine for the board thermistors,
the battery cell voltages, the fan tachometer, the keyboard backlight, and
the mic-mute and airplane-mode keys.

Patch 1 documents the binding, patch 2 adds the driver.

Why this is not qcom-hamoa-ec
-----------------------------

The Snapdragon reference designs - glymur CRD, hamoa IoT EVK, Asus Zenbook
A16 - place their embedded controller at 0x76, and
drivers/platform/arm64/qcom-hamoa-ec.c drives those. This machine is
different: only 0x70 ACKs, and 0x76 is not populated at all. That is also
why the firmware reports every host fan capability as unsupported, since
profiles, trip points, LUTs and tachometer queries are all addressed to
0x76.

Binding qcom-hamoa-ec here does not work. It speaks a different command set
(0x05/0x0e/0x42), appears to probe only because it never validates the
firmware version it reads back, then reports zero fans and leaves the
interrupt asserted at roughly 25 events/s indefinitely.

The ACPI tables describe both controllers: one at 0x76 (OperationRegion
DVUM, fields FC20-FC2A) inherited from the reference design, and the one
this driver targets at 0x70 (OperationRegion ERAM, battery and charger
fields). Only the latter responds on this board.

Notes
-----

Fan speed is reported but not controlled, deliberately - the EC enforces no
thermal floor over a manual setpoint. Patch 2 has the measurement.

The DT node for the controller is not part of this series; it lands with
the board DTS, which is being upstreamed separately.

Tested on a Lenovo Yoga Slim 7x Gen 11 (DMI 83QR, "Yoga Slim 7 14Q8Y11").

Changes in v2:
- Patch 2: drop #include <linux/mod_devicetable.h>; <linux/i2c.h> already
  provides both of_device_id (via linux/of.h) and i2c_device_id (via
  linux/device-id/i2c.h), and the header is on its way out.
  Reported-by: Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>
- Patch 2: add "depends on INPUT" to EC_LENOVO_YOGA_SLIM7X_GEN11; the driver
  registers an input device unconditionally, so a config with INPUT=n did
  not link.
- Patch 1: pick up Conor Dooley's Acked-by.
- Link to v1: https://lore.kernel.org/all/20260908091752.5508-1-okerixx@gmail.com/


Oleg Keri (2):
  dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
  platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver

 .../sysfs-driver-lenovo-yoga-slim7x-gen11-ec  |  21 +
 .../lenovo,yoga-slim7x-gen11-ec.yaml          |  56 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/arm64/Kconfig                |  23 +
 drivers/platform/arm64/Makefile               |   1 +
 .../arm64/lenovo-yoga-slim7x-gen11-ec.c       | 638 ++++++++++++++++++
 6 files changed, 747 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
 create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c

-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157
