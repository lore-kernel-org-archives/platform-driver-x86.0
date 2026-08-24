Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35B8409280
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584154; cv=none; b=msMrJZmlA5WoZT+CA9mj/g9SPmABLrUfLJAGPLa+Hsieql+FpCumNv80/ZODVUpvI6RuMGcu2km6rjq2g92lYnVy/VCJyj8vxUSq04R8UxpC1FsG74wxMyXCGDlKvjVc8XVEI8ohc0SQhKFLsNiJLQMEcmxiZuktGeuk9Sddwqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584154; c=relaxed/simple;
	bh=JQyRpI8j7w1b1klCJajkWAEryhwrrdGvQg42aPShEIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MShCkPyczx2CHRoONnpsJ/HcKE1CdJ8wbH7bUT/86QjW7+3kDiTg3+7kJ5Cf+IT2dpPWrdLlUxl2wSXd51QO9xiyLawdtEugZo6bIc/BVtM8PzNM9rfSdvcayYUJgsl95Tc7kiULX8TZd7IUtt0QKLz+nithsaJyuY59paQbxoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=WkiY/KG7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="WkiY/KG7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso20145865e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787584148; x=1788188948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2r14PQPnRwiCu2pDxGMLEtZiP7xW2TLvpcZv4TNoYzM=;
        b=WkiY/KG7PcEjwCE2J+IT4W1J1AyKwHOpkRJOqCdbzwSIh7BDVjzLn+3nVbuUEqEjmc
         X20gb2mONppSGgFXtPW4wzltIl+pRzICSZQGZ1/OtwLbk50+Mhv7mPNGC28wGrQs8mS0
         8VtJ0IZmYqa1yCpfrlt42rF80Errfg6Wor3F7p5eYPqAodouvjY0+6HLfmDY1v3Gq3e+
         iZqpK+aQDCupsfy8m7pVh3QL0aK72m/ChBQANU5hdQ5CWWJQEnKqA6H0dxdvFnCO1bpN
         231dQUgvtCk3aysh2yPQTnCvqzdsS8+/DaPVSVhPHVgInlxdVog9YamqownxzpnatTeA
         57rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584148; x=1788188948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2r14PQPnRwiCu2pDxGMLEtZiP7xW2TLvpcZv4TNoYzM=;
        b=jb+Uta0wpCry28vCJXvBggQ97lml0KtDI4RmVxRmEC9kalXhoCpq+mLTMRyeGuF67X
         +OOMFqKCicUb5ciET6nYs07aGBcLDnNuT6+auE29suiZSIxeaD/mJvLcr71W7IaQC6hU
         ofHXW6py4NU5uvfF7m5hLH+TLg4GtjiZYjS3eYz/I2qgMaCCGmGDxcvRSrfrrWig+hV3
         BL8dsCCIhg+Gmpc2pXIfmTGPGQcwgNPlSOGB/V0aHYsRMcQw8yT8VK02YUqrdOsfMp7x
         2/65Qr2WF+SOoBirbJ4tvMiQdgTg/2LUM1C7yOCOfJNwupAM0wt9eWbrDTlOhdcidqef
         cfSA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4IDzwTRJcFB/FmWwYR0zAkzK9yEC2c1/6I2/OthmJRtlbCzhvRHp1XQZz0tVMDFHGqMcATP3WQHvWdVlRichv8ad+@vger.kernel.org
X-Gm-Message-State: AFuF++kssvmJcT801ytFSkCIEwCnXhnCl5QU6tquDw9AaLzIuG8tsr0D
	In579/OC3sDzNmv2v0v9RxU5gnPsweVBzQcLSaF4MIR/B2IAGQif3lQUJXF9c21F+g==
X-Gm-Gg: AR+sD112VCuTKaMSwSH2RfLmVp6lWzRxwQqr05KlVj3AwpBJd1samKG/ULMAe1D7UNA
	fI9KY99nu0e1g3KYYC9aQqdPdEmxO7URDRQw0JSRu6d85sXWOSz7Pke6fTqsJkegjm2eLZ8xWCO
	gwWmirh0PAaCYcawaoCoS8IsMqLWJK1NkEb9unS5VytFTT3QHZeXdqxW3hQMl24taDfYU2ShGG1
	1O8bf9iMQjoQhPYPhy/5E7LvfPFFgDW15Nj33jc2J9RQ/dWLu3pzHQe6u8mFbS3RFHbfdxtRXKj
	9Jjwb6Fox7VM+vjriNXxTNsrDuasrR7yQ2GkZN1iZvTX3oE/ax+Iip6xEdn7p+f/OU7grQzuMSs
	fBNg1/vO5wFMYO6Ol1ArDI80lgYaJ/1dzyG5/MCqVHihcstfhezVKCDMtqa5J7DHFKZEgCa63RI
	DxvEgrAMedps9EihaUaOeNYQpFvST8DrAzjs6reZTXSFE2hkAnz56InboorDdARARp5sV3NemUD
	UhFIBhrhw8nQX76oALB/a7IqM2MRzw=
X-Received: by 2002:a05:600c:4f09:b0:496:bffb:fb7b with SMTP id 5b1f17b1804b1-499b8457b10mr339689055e9.10.1787584147711;
        Mon, 24 Aug 2026 08:09:07 -0700 (PDT)
Received: from horizon.localdomain ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c8f382b1sm63920035e9.8.2026.08.24.08.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:09:07 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
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
	Dell.Client.Kernel@dell.com,
	Sean Rhodes <sean@starlabs.systems>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Kees Cook <kees@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	chrome-platform@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>
Subject: [PATCH v13 RESEND 0/5] coreboot CFR firmware attributes
Date: Mon, 24 Aug 2026 16:08:57 +0100
Message-ID: <cover.1787584107.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending v13 because the previous send path corrupted several inline patch
bodies. No patch content changes.

Move the firmware attributes class helper out of platform/x86, rename the
coreboot-table firmware driver directory from google to coreboot, and add a
coreboot CFR firmware attributes driver.

Changes in v13:
- Rebase on current upstream master.
- Restore the CONFIG_GOOGLE_* to CONFIG_COREBOOT_* renames for generic
  coreboot firmware symbols, with the old names kept as transitional symbols.
  Julius clarified that the symbol names are part of the directory rename
  cleanup and should describe coreboot rather than Google. Update the matching
  Kconfig dependencies and Makefile gates to use the new symbols.
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
- Keep the scoped cleanup in the CFR driver, but use explicit goto cleanup for
  the nested sysfs group registration path.

Changes in v10:
- Rename generic firmware Kconfig symbols from CONFIG_GOOGLE_* to
  CONFIG_COREBOOT_* and keep the old names as transitional symbols, as
  suggested by Julius.
- Update arm64 defconfig and DRM coreboot framebuffer dependencies for the new
  symbols. In v13, the arm64 defconfig update is split into its own patch.
- Address the nested cleanup-path review on CFR attribute registration.

Changes in v9:
- Add the missing kstrtox.h include used by kstrtou32().
- Use a single kobject rollback path when setting registration fails.
- Split a few helper locals for readability, including the pending reboot
  device lookup and enum-value population.
- Avoid an intermediate void pointer cast while parsing numeric CFR options.
- Check the possible-values buffer length before computing each label length.

Changes in v8:
- Add a preparatory include-order cleanup before moving the firmware attributes
  class helper.
- Add direct includes for __packed and container_of(), use scoped cleanup for
  EFI names and the driver mutex, and document the efivar lock requirement on
  private helpers.
- Replace the duplicated CFR record walkers with one checked iterator that
  distinguishes malformed input from the end of a record list.
- Validate enum entries before accessing them and propagate malformed child
  records instead of treating them as absent.
- Restore the EFI variable after a failed runtime apply without retrying the
  failed firmware operation, and only emit a change event when the new EFI value
  remains stored.
- Document the possible-values size limit and why CFR entries without a usable
  runtime EFI variable are skipped.

Tested on a Star Labs Byte with firmware 26.07: runtime APM_CNT apply was
verified with power_led, and reboot-needed behavior was verified with
debug_level.

Sean Rhodes (5):
  platform/x86: Sort firmware attributes class includes
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
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
 .../x86/dell/dell-wmi-sysman/sysman.c         |    9 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    9 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    5 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    3 +-
 .../linux/firmware_attributes.h               |    6 +-
 31 files changed, 1348 insertions(+), 73 deletions(-)
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

