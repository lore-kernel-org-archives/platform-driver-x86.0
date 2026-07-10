Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A464379C20
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 06:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783663974; cv=none; b=T0V4xBRDwTULj1GeztbYlB56uvPS4ezeUlm7XKXvfpSWj/TFEX09ykpM88HI6aGDppbAi9srozvj2ZrNBik4cuonUsuuDdmbDYx1C1lvtyqzmiDnQFkbv7921MWtY11qFw1XDW9513gYJUD/ASs6+4FZ1bbeGMMRUqmUBOIorcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783663974; c=relaxed/simple;
	bh=yjbIpwgU2Zj1HVfX6Dd0Me70Vk9eclTlWalWqrmLzL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qh/9sVjCR2WMA4imJkrUlzlNLat4QYLsc1Q1e1IhOHDjeo269GAhs8Rk4blQr9N8GlpJDMnG2UnuPYJPU+OLcxh5Wo3NDURWnbCJ/nS5+rGj1iSKc+GP9Z0H+i9Nz09M2IrbWywGaJPPqC50MURDv09jiUORstF7tZSwqVynctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=PP3mgvs+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="PP3mgvs+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493f45e206dso859755e9.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 23:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783663968; x=1784268768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFeGRRPQZVOki974wWm87DCFrdCzIceMO+kkeAPTDHU=;
        b=PP3mgvs+SpPmW+yyRaFXAr8s0Rx0KdrVnY0P91sA533cW0oaT5OwO/jx4z3UlcsUfH
         +F3lQpqzWiFFsJ9Zw9oqYevTWjFVD2O47IngzYO/dtCnhkc7aWDRiZec5ft8YcBF/vsy
         nRPa2sQLStZA9I0yMFidR3xdTeyjsDVTXdhVsb2zHkx2cBgNck19tRWVTIGdg3Z7dgAX
         qPfkmdtXu+FIx0zymwcKBCcRYKKZzLl1Yrrg3ODsmIUlp0xo9YDAVh7k2rQwdaOEzhGA
         Xna/XPPHxpJwprsj6HgumR/1bENUeJBoBJay6i9RApSNMOzdeV0Wf5E0PjRBzdYWJKCi
         6ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783663968; x=1784268768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFeGRRPQZVOki974wWm87DCFrdCzIceMO+kkeAPTDHU=;
        b=VYtis1eEjSRgr3SyKrTn266He09oGHchVROCmBXA8ogCbJzuqGu9BMWXIclP05jOjB
         slTfa94ZW+9D0HPqd+KDuC6bNbPzKdfbEA85RvKRaB09ncnSBALLJjAL1lcdHHvhaI1u
         43ql77nZzHm/TEfULVitvOWdy8MPAPK4Qw8Ehv4QvgvGQq8bZ3J8vDuA7xiS8Y197bmX
         detNSzQ+CC/hlNV9v5wHORqJClBK/w/PGCwYxQK2YMdcHcWKMdjNQAI7Wtg+u2r/bh0o
         1BV6i7t5posq/TCCCovOb5CQJd1gNapjpbQKAvgwFSYUhvgocj3Emz5jQEQOKhoRwgFu
         hBwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkZ8LpiGZb3CRH1Mz4dCOUOo2aLGohKlMVS+gXNJ6nE2/y7u8CQeq9gW1j8SOO/9bdwGPmPLxcX7XZT/6yUL3SfTGf@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlkF8sXNglBgo6nxCgPsxtWpov8c/Db3l2B4YVAbnJz9r8zY6
	HYXWbZ5/WdX3dQEwGi/yzE954ROx1cST30CuEj18YCk2JTTteidgfQEmbmWBXVuD6A==
X-Gm-Gg: AfdE7cn1yL9u89+Ucmxhj5p3L3s2uWQz0qsuXeZqx8wiNEFQSJd9LUj3yoRM71IS70U
	mwUXHWd0Ku21wHVdZzmgufxDppEaJydnGUsmNd5fau/b47yPKd6QM2XQxFIeia5U9HSxShTis0a
	qfdDuiriwmDPJC+f6jI2CVKIfVtVG0fDEHovnaxcAD0wI4H1Xp3/phcwtjGVq9l5mmwWkPVo10E
	w/4f89z0yxfh8faIwFpVCJGKoqIgSB9GbPTG4N4JMTH8d3t0z58yww8VWKhNqtXHmk9YPOQkG9N
	WgZ+NiHsmn2Q5jtq6tHyms+t4z7xn7TLdkQykd5m3lAMzG3wg+SXmaO6x7vB6oj62md1rCrhHY/
	NqNcrTUA+j8ks/WEt/n7y9q98IGtRl4tS0JhsacUot0Tej3GlHS0AbEmt4lpGScIYGtgTW965PC
	c3QHnU3htuPOBvN4n880X4cES9G1P8g2Tt/tqZq3o=
X-Received: by 2002:a05:600c:46cd:b0:492:6f5c:fd8c with SMTP id 5b1f17b1804b1-493f2b3fedcmr18248765e9.15.1783663968225;
        Thu, 09 Jul 2026 23:12:48 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm110345675e9.3.2026.07.09.23.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:12:47 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	Sean Rhodes <sean@starlabs.systems>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 0/3] coreboot CFR firmware attributes
Date: Fri, 10 Jul 2026 07:12:43 +0100
Message-ID: <cover.1783663929.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds a coreboot CFR firmware-attributes driver.

v3 addresses Julius's review feedback that this does not belong under
platform/x86.  The driver now lives under drivers/firmware/coreboot/,
next to the existing coreboot table consumers.  To support that, the
firmware-attributes class helper is moved from drivers/platform/x86 to
drivers/firmware.

The series also renames drivers/firmware/google to
drivers/firmware/coreboot, because the drivers in that directory are
coreboot table drivers rather than Google-specific firmware drivers.
The existing CONFIG_GOOGLE_* symbols are intentionally kept to avoid
user configuration churn.

The CFR driver uses the existing firmware-attributes ABI.  It exposes
runtime EFI variable-backed boolean, enum and integer options, skips
suppressed, volatile, dependency-gated and non-runtime options, and keeps
read-only or inactive options read-only in sysfs.

For CFR runtime-apply metadata using APM_CNT, x86 systems can apply a
setting immediately after writing the EFI variable.  Non-x86 builds keep
the EFI write and report pending_reboot.

Changes in v3:
- Move the driver from platform/x86 to drivers/firmware/coreboot.
- Split out the firmware-attributes class helper move.
- Rename drivers/firmware/google to drivers/firmware/coreboot.
- Keep CONFIG_GOOGLE_* symbols unchanged.
- Keep coreboot bus internals private to drivers/firmware/coreboot.
- Keep CFR record definitions private to the CFR driver.
- Avoid rewriting EFI variables when userspace writes the current value.

Testing:
- Tested on a Star Labs Byte with firmware 26.07 and the driver built as a
  module against Linux 6.17.
- Verified runtime APM_CNT apply with power_led.
- Verified reboot-needed behavior with debug_level.
- Built x86 objects with W=1 for the CFR/coreboot/helper path and touched
  platform-x86 firmware-attributes users.
- Built ARM64 objects with clang for the CFR/coreboot/helper path.
- Passed git diff --check and scripts/checkpatch.pl --strict.

Sean Rhodes (3):
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  firmware: coreboot: Add CFR firmware attributes driver

 MAINTAINERS                                   |   18 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   19 +-
 .../firmware/{google => coreboot}/Makefile    |    1 +
 drivers/firmware/{google => coreboot}/cbmem.c |    0
 drivers/firmware/coreboot/coreboot-cfr.c      | 1068 +++++++++++++++++
 .../{google => coreboot}/coreboot_table.c     |    0
 .../{google => coreboot}/coreboot_table.h     |    0
 .../framebuffer-coreboot.c                    |    0
 drivers/firmware/{google => coreboot}/gsmi.c  |    0
 .../memconsole-coreboot.c                     |    0
 .../memconsole-x86-legacy.c                   |    0
 .../{google => coreboot}/memconsole.c         |    0
 .../{google => coreboot}/memconsole.h         |    6 +-
 drivers/firmware/{google => coreboot}/vpd.c   |    0
 .../{google => coreboot}/vpd_decode.c         |    0
 .../{google => coreboot}/vpd_decode.h         |    0
 .../firmware_attributes_class.c               |    2 +-
 drivers/platform/x86/Kconfig                  |    3 -
 drivers/platform/x86/Makefile                 |    2 -
 drivers/platform/x86/asus-armoury.c           |    2 +-
 .../x86/dell/dell-wmi-sysman/sysman.c         |    2 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    2 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    2 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    2 +-
 .../linux/firmware_attributes.h               |    6 +-
 28 files changed, 1120 insertions(+), 25 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (83%)
 rename drivers/firmware/{google => coreboot}/Makefile (92%)
 rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
 create mode 100644 drivers/firmware/coreboot/coreboot-cfr.c
 rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
 rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
 rename drivers/firmware/{google => coreboot}/vpd.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
 rename drivers/{platform/x86 => firmware}/firmware_attributes_class.c (94%)
 rename drivers/platform/x86/firmware_attributes_class.h => include/linux/firmware_attributes.h (60%)

