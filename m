Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F248C406
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 17:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284894; cv=none; b=W/Q8Ryxb8BUMpOXvV9MFOxXxY0clDEAu7ewRVvmBwQTe82HMjX6gn/o8TtbdEMYudtkji6eVtyVku2khSMSiawWkEtIN0ixB1A4uEJyYf1hPNJAkBvatiAxjSAonxpURZsbGX5C9ht17CzLlhpA74C6zyVeOMgA4gkFppXljZWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284894; c=relaxed/simple;
	bh=yy21srLv7iXzaYipu582gBMyRADxOWGsjbxI+30fh90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EoiS5ddCKy6WCotxoTuF+kbVTT7Ux35LkrihedkXrVtW+kK5nPxwAXiSwG6yN0QhOmbvuWH3Nts5BxmxrO0C6+9F8AtFYhxik5/MyoQSx4+q6oYpYRXkY0oShhG8MUoAwXCpxQd0vxOlNmZ7z/I2CW3oeUc4uWBIPCRzkaBA1Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=AjioiJp7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="AjioiJp7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso456425e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Sep 2026 10:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1788284889; x=1788889689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBK06/P7IANNt8rczOHS7wy56i3XV/2ANmKJ76fwSP0=;
        b=AjioiJp7dvs22gU8TRPq4DpLv5AxyfCYHhqQW3Z7lazk1fs9b22S685zKPgSVIPR66
         KYXddHC1HBd9qOEO22DdTlr7dA2Z6t+sPbPntYqMwa+5qJxY8OO2fUniauv64uwWHWS6
         GXSTsZjGn2OFC0ls6gb0yw8TFTcRIEhqNl8zos8WpVQJ98KouRpYMTbFKVcxLeXdu+6/
         tdr1GJH2D32OkIpX/BxSarCIk5XY4fWGo+BshI5stbCgNYEbHegbEPCQQSrJjWpcYuMb
         d4OxoHg5mzAKVwI1Qp9JIoH04NeETQfxSAvPUGZKq1uw1x7hCb1A4xsUDaujINQK1kqC
         IQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284889; x=1788889689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBK06/P7IANNt8rczOHS7wy56i3XV/2ANmKJ76fwSP0=;
        b=Azsh0R8tRvG+/1re2WZKtJ0ij9a+7gHtKss+i+HpwC37yzDLIZ3X9SOAyJsS/M6z1t
         4Ve9NPECpSoGC7ARrk8QXcCs3ty7Etvk7uYoIHBV/mp3iXbRDB0T1bqU1qJAABqLzC9t
         Q2UikTRSjnONdQq6CqnoMSZRJmrXnxKyCwD/iniPAj8zg5FjvMOZodhx/hKWfzeDuY1C
         HgGM4upEYeLKu0waT7nsqyia/OQM+TNI/a36y9oBY9VA/CnFlGZD1yT9siLwbBix617f
         pp2DpF4XTvuHoTLdjygo9Vj+CnF4TyTNsf/lIG2S7U2BvAguEYXjyaMDG37PbAJ61efb
         1pAg==
X-Forwarded-Encrypted: i=1; AHgh+RrKo/+NffiGGaXxltvhKu8PF3+KtWQSQtEhFFgh0PDN5hdMRk8FzE/VtRAG3JYNGGkBGCO1r/X446p8IFy/xJvBUYYE@vger.kernel.org
X-Gm-Message-State: AFuF++kUWy4pcLWbIV2Il0ZN5CGiDV1st7fVg+RhBkWu25A47Y9VXOK/
	52yNvhKGx8jCTAWw03cjl09Xc6SvhRiUUqCCkzBKVZz2OoQLo8YyNQNwE8V0P8lu+A==
X-Gm-Gg: AR+sD13PyB5wAvwAq+uGF4VTQvxOPNkWPec/AH6a9LcRLNx2HBUilaQGKHQ5V5ORkP7
	oHvVlmjTPXgyUTXToVwj3Oyd4BN5q3PFWakvAmPX34IoWdUHizdCxn5biNLVQ1eJdIZYVHc+xXR
	BVLyts64hom9/JcubNhO6nPwTYvQ/oOGAYvZ/JbYk/kSLQCTcsy7zGHS5w6BFy56PqlBiFqdDoK
	KBeq4tirJMsSwQ/avrc8CX4t9DqsNjtkd10Nqet8+rvzU4O5Hta+GM8C+HL3yXKrCwCd7CmAjAV
	rODYPGmgtnfefHMalaGVe7fLWoP/BirxSNcIqIfdBR19t4qS2XY47v7GNhcjLDvxFyFswT7nT+l
	yzk/UbvOzZQ2yvACIYURadgrW+99bdui/3OBxQSZlp0vzFNb1Mz7kQhIOJNmWatYz5+8RD//vY3
	msTaegfGXkyB3uJAFJJVyMOemLx3zULg4ygn7L8sJOlgfOja+pIRCpDNajYfZC8/gGU/yAhUvKZ
	Nnp0zClQ1D2m7M=
X-Received: by 2002:a05:600c:4f0e:b0:49b:9433:ea44 with SMTP id 5b1f17b1804b1-49cdc40ff56mr223649635e9.4.1788284888802;
        Tue, 01 Sep 2026 10:48:08 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47885b1sm2369225e9.14.2026.09.01.10.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:48:08 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
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
	Will Deacon <will@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	Yidi Lin <yidilin@google.com>,
	Kees Cook <kees@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	chrome-platform@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: [PATCH v14 0/5] coreboot CFR firmware attributes
Date: Tue,  1 Sep 2026 18:48:01 +0100
Message-ID: <cover.1788284852.git.sean@starlabs.systems>
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

Changes in v14:
- Rebase on current upstream master after Linux 7.3-rc1, preserving the
  intervening coreboot table bounds and CBMEM no-map changes.
- Drop the standalone include-order cleanup. Replace the affected relative
  includes directly in the firmware attributes helper move, as requested by
  Tzung-Bi.
- Split the DRM coreboot framebuffer dependency update from the firmware
  directory and Kconfig rename so it can receive a DRM Acked-by separately.
- Keep the CFR driver and its runtime behavior unchanged from v13.

Changes in v13:
- Rebase on current upstream master.
- Restore the CONFIG_GOOGLE_* to CONFIG_COREBOOT_* renames for generic
  coreboot firmware symbols, with the old names kept as transitional
  symbols.
  Julius clarified that the symbol names are part of the directory rename
  cleanup and should describe coreboot rather than Google. Update the
  matching Kconfig dependencies and Makefile gates to use the new symbols.
- Split the arm64 defconfig symbol update into a separate final patch, as
  requested by Krzysztof and Julius, instead of folding it into the rename.
- Move the COREBOOT FIRMWARE DRIVERS MAINTAINERS entry to its alphabetical
  position.
- Make the CFR APM_CNT runtime-apply dependency explicit with HAS_IOPORT
  instead of using an x86-only runtime branch.

Changes in v12:
- Temporarily kept the existing CONFIG_GOOGLE_* symbols and dropped the
  arm64 defconfig update after review feedback against the user-visible
  config rename. v13 supersedes this with transitional symbols and a split
  defconfig patch.
- Free invalid enum labels before returning an error from CFR enum parsing.

Changes in v11:
- Keep the scoped cleanup in the CFR driver, but use explicit goto cleanup
  for the nested sysfs group registration path.

Changes in v10:
- Rename generic firmware Kconfig symbols from CONFIG_GOOGLE_* to
  CONFIG_COREBOOT_* and keep the old names as transitional symbols, as
  suggested by Julius.
- Update arm64 defconfig and DRM coreboot framebuffer dependencies for the
  new symbols. In v13, the arm64 defconfig update is split into its own
  patch; in v14, the DRM dependency is split into its own patch.
- Address the nested cleanup-path review on CFR attribute registration.

Changes in v9:
- Add the missing kstrtox.h include used by kstrtou32().
- Use a single kobject rollback path when setting registration fails.
- Split a few helper locals for readability, including the pending reboot
  device lookup and enum-value population.
- Avoid an intermediate void pointer cast while parsing numeric CFR
  options.
- Check the possible-values buffer length before computing each label
  length.

Changes in v8:
- Add a preparatory include-order cleanup before moving the firmware
  attributes class helper. This is superseded by the direct replacements in
  v14.
- Add direct includes for __packed and container_of(), use scoped cleanup
  for EFI names and the driver mutex, and document the efivar lock
  requirement on private helpers.
- Replace the duplicated CFR record walkers with one checked iterator that
  distinguishes malformed input from the end of a record list.
- Validate enum entries before accessing them and propagate malformed child
  records instead of treating them as absent.
- Restore the EFI variable after a failed runtime apply without retrying
  the failed firmware operation, and only emit a change event when the new
  EFI value remains stored.
- Document the possible-values size limit and why CFR entries without a
  usable runtime EFI variable are skipped.

Changes in v7:
- Validate the CFR payload checksum and use bounded record walks. Propagate
  malformed input and transient probe failures instead of silently dropping
  settings.
- Make EFI writes transactional, serialize EFI reads and writes, and expose
  settings read-only when EFI writes are unavailable. Preserve
  `pending_reboot` when rollback cannot fully restore a setting.
- Propagate suppressed, dependency-gated, read-only and inactive form
  state, and bound form nesting.
- Preserve APM token zero and reject enumerations whose values cannot fit
  in the sysfs output buffer.

Earlier revisions:
- Move the driver from platform/x86 to drivers/firmware/coreboot and split
  out the firmware-attributes helper move and google-to-coreboot directory
  rename, following Julius's review.
- Keep coreboot bus internals and CFR records private, avoid rewriting EFI
  variables when the requested value is already active, and store driver
  data on the class device instead of in a file-global pointer.
- Use the coreboot-specific device ID header, explicit helper includes,
  scoped resource cleanup and device-managed driver state in response to
  the initial reviews.

Tested on a Star Labs Byte with firmware 26.07: runtime APM_CNT apply was
verified with power_led, and reboot-needed behavior was verified with
debug_level.

Sean Rhodes (5):
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  drm/sysfb: Update coreboot framebuffer Kconfig symbol
  firmware: coreboot: Add CFR firmware attributes driver
  arm64: defconfig: Update coreboot firmware symbols

 MAINTAINERS                                   |   34 +-
 arch/arm64/configs/defconfig                  |    6 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   89 +-
 drivers/firmware/coreboot/Makefile            |   15 +
 drivers/firmware/{google => coreboot}/cbmem.c |    0
 drivers/firmware/coreboot/coreboot-cfr.c      | 1204 +++++++++++++++++
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
 .../x86/dell/dell-wmi-sysman/sysman.c         |    2 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    2 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    2 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    2 +-
 .../linux/firmware_attributes.h               |    6 +-
 31 files changed, 1337 insertions(+), 66 deletions(-)
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

