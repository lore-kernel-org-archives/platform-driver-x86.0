Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597463DDB1D
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226858; cv=none; b=mIY3GdH7ppAW0G3O/rfGZ5qmjEBwktqoCNSLgR/SH6JW70B3declf8DQEqFUqm74nwXWDmMCC7X+TpShw6bjCisrrcTRAIpKO1tD0Dk2fPkZj/bn+2nrMsCe5aaUTd295EigEVknM38ktQy9rioH5byz74z4a6PbiT6anstTgb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226858; c=relaxed/simple;
	bh=ZMGN4prWDETUzkvX6AOxh9rcYuUBqEOMkLtkiQfmZoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bxRCbNoHNvHWlJPIAiUmKuNhEqGKnHr/cLD8pdGwI9m1Kg/MUkjpenf4/W+UOQYfkTTIhUmaJJerJ1rQy5BBKm4gEeL2+ZhW/w3VyYCikP4WuckUoP7CBp/vxe2ddmr/VoRojT7K6FfOVD67d4rf4SDtASExX1Ve4nUikCa8Kxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=X+kBOfn3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="X+kBOfn3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-496b7622a83so17864435e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785226853; x=1785831653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wt5+bX0vwYVzRBQrHnjwiYNYQTzOad61TO1Roo1dBpE=;
        b=X+kBOfn3FCI6/wG94Suce151slWDXJhf4LAHeNzAI7OAR8217PVXdg7BwstCGsQL+G
         p6NCgXaGDgPaRMVcSnDzQPNoo7lxGcCvf/6sqapqxWNLENhUkomtJFmn3gEgxNyjCJwf
         VSTFO7AFhweee1jv+ghlJfbUruOiCazlfJX9GhE6FOHhK596uw9fK2z53+AN9dz3L5bt
         Wh/MVaRuzcM7OJSebbFMCVWGWbDMKObLeHvS2r6Sc2tTu1zGAstUbtqR1FJuXVSNHSYJ
         ZOcnrLGJ/HdABhtpV4hML070ppU4t/35aochabtLliCnJVkursH5IJDedaaTRZPZ2v1b
         ZcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785226853; x=1785831653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wt5+bX0vwYVzRBQrHnjwiYNYQTzOad61TO1Roo1dBpE=;
        b=Llh5EvGvMeenHdJje/1mWW/OK9Inc9PB2w0a09UKKWOOG4EfrRaWYxsx7++rWq7Ps1
         FvPUGBHR1ch0eyf57N14dN7x0RHBrrQ5oNaRl3xGWsb8rJbGImrLY25W3aUKsLir1Es8
         Q7u2hr8GkcHzeWCZTG4dCueAxudtwa5ekqVc0UXnOE9XlsEc1SKrKweDxquIKN1TMrXc
         HwLpsHBp2JptbmjSFAfNkEanHCksTcHHdIftyJW+rfhDUnSCEFsenWRIaHKsztq5WsmY
         iEvBC267uoGuYBqXSQf9/tfRiyJjxDoy8C/oes8UB1g1bXAgnseAb9zTMYth/fzRgGpj
         N2AQ==
X-Forwarded-Encrypted: i=1; AHgh+RrA4zoOu+IF2cCRQH8YGp/ckSE1CIBlHYFROYzH4DxELKa1wX3DWXkBlW5aZxki/8xN+L8nznyjLg9KDQrlW3pbYMqf@vger.kernel.org
X-Gm-Message-State: AOJu0YxH3sB9roAdDBlQl7O4MEvhaQT+utM7pY2edXSNMMHGOfclEMcW
	f+gEVN+hit1amLZz27jSf3xUWDJlre8VQg1i1WSSDtRX4jWU8oBu4QWJFUG1uMXr3A==
X-Gm-Gg: AR+sD13BBf0KIl6VahWZIqOP8EF9Q7jN/SDHWETPdwbYO4g+XpezfOzEPWABXsTJVqF
	oBKnXiN1vWZZ37Mb4qUA9bd8cg5EybMMYP35fS6Mni2N71hAtcwZxMsp3Rd/aOJFARSuQx0BBpK
	EYx68+VKAbo+HMPMPoKU5Gq2w2xTqjCPrJ+pSTZCGypoGOEmn9Jt6RjIky8pVkxbfy3hHdnluRf
	AtmKsdOMl8mOMXpMm9V1BbTi2ROr97YdtywLLvNWFctLAg2Bz9PsCRk7yHfLrBhX8YL31O8N4GP
	b8fIC89dA1pl1zp8tdhI76bj4Q1Z8auyfiBgsxSCx4V345rssnhtO9KiMiCsM8UnGDvXjOrWS67
	+jSycDGY5v42+bB55tjT66q1f4ckiveQl+M/SGijewFvS+nbimK4UQPzmvxn+S+AjvBaPG/VCTp
	biG82wk9YdBC9emZjDa6+h00GrKAVAJK9jdmMyfoeorf+u+g==
X-Received: by 2002:a05:600c:4687:b0:494:6baa:ccef with SMTP id 5b1f17b1804b1-496c64262b5mr14201095e9.11.1785226853260;
        Tue, 28 Jul 2026 01:20:53 -0700 (PDT)
Received: from horizon.localdomain ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b388d5b4sm208150465e9.3.2026.07.28.01.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:20:52 -0700 (PDT)
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
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Oliver Lin <oliver@liuxiaozhen.dev>
Subject: [PATCH v10 0/4] coreboot CFR firmware attributes
Date: Tue, 28 Jul 2026 09:20:45 +0100
Message-ID: <cover.1785226809.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the firmware attributes class helper out of platform/x86,
renames the coreboot table firmware directory, and adds a coreboot CFR
firmware-attributes driver.

Changes in v10:
- Rename the generic firmware Kconfig symbols from GOOGLE_* to COREBOOT_* and
  keep the old names as transitional symbols, as suggested by Julius.
- Update the arm64 defconfig, DRM coreboot framebuffer dependency, and coreboot
  Makefile users to the new symbols.
- Keep the v9 driver fixes and helper include-order split.

GOOGLE_SMI, GOOGLE_MEMCONSOLE_X86_LEGACY and GOOGLE_VPD keep their existing
names because those drivers remain Google-specific.

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
 drivers/firmware/coreboot/coreboot-cfr.c      | 1193 +++++++++++++++++
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
 31 files changed, 1328 insertions(+), 65 deletions(-)
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

