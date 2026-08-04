Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527C4457CC
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Aug 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838398; cv=none; b=FC3L4Mz5JvoqtXX1krsXEA2AcfgPmAw+M74/gaivmWpzcU1zZ90iwDXN+R2GKDIJjWz3pW21l19RXM2rdoQ7YVFAd96eZ6iWT8LCspkgoU3YBZGV5RyYSfvk3GfK3xg2HykrTwCTEMkJ/jlFa2JQhI9+vmWT6cvEmnMkYRok+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838398; c=relaxed/simple;
	bh=R4Rz3A3B0FYdVpxM4b2yW1U8TxbOL4wP+xDMOwkMtSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eywixT3yhh0KHya4/7G2lFOLMN5RHix/WkatQR2hyNxa8GS4e6j5oSlrtk5P4zVMc4AsD8nnIH6VZAkHHHLz5MCeUqbceQQnc89mKxtctFqk90YXClsV5cOJtQe2yjEsAuqTK4vadX5e2ZGdnL/YaK8IB0p3+FVPSh1ucXAQgCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=HDO8yhLe; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="HDO8yhLe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954d29264cso15727625e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785838394; x=1786443194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTO+yub/oHkWnNxE/PR+YPqKbJIe1H0uu4C2i4wSPEY=;
        b=HDO8yhLeRimprYkMnxvwfRiReP4WCCTyN6Gk8LUtG3fAVBYjNlAl4q3gPnq+qRKlsi
         EMzHGRsSXHc5KVNhMmEG1Oizxc6D7FiYGMbvlgk9ZkbginkQIi32SjE0otx7DdS/w5Up
         IRj5MwEpZoop/K88N0W9JqVVsUDnVgqZ4+etnaLON0xHqwrIkJn3i23f+sKIFnRv5xVB
         oq3+Fkq8moSZSLFteJpXotslzINInrvj5gEWVpDaadq8Mg3kA+VDaTk4JO2yywrLKmti
         vFBhR/RaaSv8EYCOmPYWFC+IsJNaDbsSyezGICLfQklZPksiFNRo/q6Ola0JHeOD495S
         575g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785838394; x=1786443194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTO+yub/oHkWnNxE/PR+YPqKbJIe1H0uu4C2i4wSPEY=;
        b=F12A0v4R/fUgB8DzNhlllJVZx2gt/zzVr3d6SkSsefsm4ueXWDusYGhh6fkUYDpMWW
         NmDrdbIdlOakF5u7xp3pZ11mXuxrlc+CyUceeWC8jOiW/4GnPqOAECmG456a9lEmMyyJ
         DOaAQbdvn76rHe5pnxZpiQ1BiNaJFFCkwEfTrf7KLufTKOqYKDVM9KCKWURSwtDkGKa6
         aTBuQaLDhcv5+dhQSPj15iz9HrkJdJr8gJkzfND49z0FacTRQ1DWW1xbXsB9Hk2NODF4
         BOkN2lb+nJZSMKeYMrRKB8apPN5CGiNJWQyEjGcDu3UO3rJetfaVA1bn+SfHqRC1D2Xv
         Wjsw==
X-Forwarded-Encrypted: i=1; AHgh+RqguQOX6y7gLqw2CHEiJ2u3NsU8O7xA5bsaJxA5+jnN+lRqTg4HJAGkidtlSQ8yp11Oc458EvAMdszDN8YSfAv96Se/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa0fgWUCOtlScvAtyIbIl0mUEoqzy7/h87IGfnGoxfk+Okn5aS
	Ns0JbDAf1C7nZj0Ged1mMNkMxn82oSH7j+sawBzJURrxSIqkgmLblclwNbf5pjH8NQ==
X-Gm-Gg: AR+sD10t2pSTqC8GUZDEF9p+8AnMey39HDyD+CBK3bYNJXiVPYnR0AnjsENfPcM2lzV
	kFEtr88qjy/5bg0bMZwKVTTGKOZeXUv8S1sj4CN7MG28JwNgPXGFW+BmdWMpYLg6YxvYq3Pl8lJ
	WL/6YZdtFOWgdOvnEEEO8rthX3XVQmzQ8lFVAqLI5B6SoCQ/TXQc5vFtlNspoLvsTg/n34LsyKm
	sSmeTsTNJaoMXCiNFWRLnzBLzCmNQYqIf5X3X/qtdhdXakHDgx22HdNNTiU9P0AN4hZLW71e8as
	Ew8W0Nj5hvccYbkvNguRSiK6LJOiv49M8LVigscbRxEE8b04OCQdpT6Yih+JEBM+8aWXriHJLxV
	LSu4qFmC1xOtJK8g7e7KqqJRWsAaYwQShWm1H05gKREkCXRO/ljlpzrV4YGquTThMg6sSPtAw8Z
	iluM5zlIKTwF615w6dQj4StzOCzW8HlBlaEWTISDh6BrkvEFeA//WOwkBK2bGrneEWMQ3OHvvMG
	Qrp40a3m0rhrr/x+k0luuHBDcTM2ocN
X-Received: by 2002:a05:600d:6451:20b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-4980c66d950mr239212685e9.7.1785838393168;
        Tue, 04 Aug 2026 03:13:13 -0700 (PDT)
Received: from horizon.localdomain ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm67300275e9.4.2026.08.04.03.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 03:13:12 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: chrome-platform@lists.linux.dev
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Sean Rhodes <sean@starlabs.systems>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Oliver Lin <oliver@liuxiaozhen.dev>
Subject: [PATCH v11 0/4] coreboot CFR firmware attributes
Date: Tue,  4 Aug 2026 11:13:05 +0100
Message-ID: <cover.1785838269.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the firmware attributes class helper out of platform/x86, rename the
coreboot-table firmware driver directory from google to coreboot, and add a
coreboot CFR firmware attributes driver.

Changes in v11:
- Keep the scoped cleanup in the CFR driver, but use explicit goto cleanup for
  the nested sysfs group registration path.

Changes in v10:
- Address the nested cleanup-path review on CFR attribute registration.

Changes in v9:
- Add the missing kstrtox.h include used by kstrtou32().
- Use a single kobject rollback path when setting registration fails.
- Split a few helper locals for readability, including the pending reboot
  device lookup and enum-value population.
- Avoid an intermediate void pointer cast while parsing numeric CFR options.
- Check the possible-values buffer length before computing each label length.

Tested on a Star Labs Byte with firmware 26.07: runtime APM_CNT apply was
verified with power_led, and reboot-needed behavior was verified with
debug_level.

Sean Rhodes (4):
  platform/x86: Sort firmware attributes class includes
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  firmware: coreboot: Add CFR firmware attributes driver

 MAINTAINERS                                   |   18 +-
 arch/arm64/configs/defconfig                  |    6 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   88 +-
 drivers/firmware/coreboot/Makefile            |   15 +
 drivers/firmware/{google => coreboot}/cbmem.c |    0
 drivers/firmware/coreboot/coreboot-cfr.c      | 1205 +++++++++++++++++
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
 drivers/firmware/google/Makefile              |   14 -
 drivers/gpu/drm/sysfb/Kconfig                 |    2 +-
 drivers/platform/x86/Kconfig                  |    3 -
 drivers/platform/x86/Makefile                 |    2 -
 drivers/platform/x86/asus-armoury.c           |    2 +-
 .../x86/dell/dell-wmi-sysman/sysman.c         |    9 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    9 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    5 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    3 +-
 .../linux/firmware_attributes.h               |    6 +-
 31 files changed, 1340 insertions(+), 65 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (57%)
 create mode 100644 drivers/firmware/coreboot/Makefile
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
 delete mode 100644 drivers/firmware/google/Makefile
 rename drivers/platform/x86/firmware_attributes_class.h => include/linux/firmware_attributes.h (60%)

