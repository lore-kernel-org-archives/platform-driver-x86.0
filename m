Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DE43CF1E1
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 19:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181883; cv=none; b=H/sXxy4Ql8GJdKLnUXWGEMagPbZ91A8768kNf3fIWQt61cm5nQCRozUl0dIi0Im7MIavAgQXe15MuW994SJ1pBKX5Sl7LNvX307dENOPvyvbaHA+Ct34lUKZWLTY8CjeV3Nn4RQ7i40FBwv20whUCFfILQElffHAh77mYb16kec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181883; c=relaxed/simple;
	bh=LHEp5xjNPXRmYTOl7iyUCGaVLVxa648GYyPPCRFkFXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IVLdHtBgZ0BEdImT6xeCLG0of0UmdVvDXwWBVAch139vZ0SzKq8pShiRGsSO701Ey4y5JQDTUldtCJlaNR0Xfl0PJAw0zW3uI1p/A43OhplRL+aUmyWkrt3m/is+Z+j5VzCWNJDaWegzj3IctIbt9qL6KRUBpPyiK8P4GeAM2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=FoTVfR1v; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="FoTVfR1v"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso20663725e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 12:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785181879; x=1785786679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5JSXCQoc1JHZ6Nq5YFbS6Dsa7OqY+l43Qmo2JkxGjUI=;
        b=FoTVfR1vJaJIHhe1S3xqzcuaiZ5Bwizis7iHbPEa2bGj0RzRDeE2uOJ4TCx0YKXaO3
         t+iJcOucqAgM7eI+fObtJe1ve7dWKjaDcj85Cr1fRVuDuud3QVaMX410VcmE8HPwQqVZ
         b6Sty+H9/5ctXjuNSKxXm7f2jp4UVGSR2UFys4vsSwUB7Q8Spd6iqhB+1rPU/JxjNsbR
         A7+ZjUztmLcQXwPYBZF50/AlwfOUpAdsOnRb+vVGobviLWLVKFqAgWRJKx1B9cW+Yz7A
         JCK15slAIV5D7bVUtWb8NPIVTEKtLN3O36aHVVKgHbba4igWlr96pMVI6i73QjRR4ZE7
         YHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181879; x=1785786679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JSXCQoc1JHZ6Nq5YFbS6Dsa7OqY+l43Qmo2JkxGjUI=;
        b=J5oZTlp2AbeiRt2mFSNh4bU28QNdCVDmONEUKrOZczBAnHz2355CAuu2qCwi2VQoez
         KHTalHOu15gkCZ6djyCatFAhYydcICGey1eRQE17620yts0x+sPZdg/TVmJQtJDVoOxE
         yt05NQ/fOs75Hl6mFGq7kCinHZzclB4ReN2VF3tseHSvaH2JSSHt6cZvRJFpL4bbM7OH
         GuxiLRdz4XJhEqJGPDzLJAnlwA4k15K8kXPG9o2/14ddWvM0O3XbMxNPOMjemrjWTAMw
         5EmHNCcOGIfFtrpxE6ZdC4WDPMwtt/U9hf/EIPWlWhNa7y3npaIyLKYqqjrVI7ZL/TwI
         n2wg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7/GbnDwP6mlqks+HzApOthzPHirTJNnuzsQvhffz52oC+cWVUwD8Ekc67zIANK0N2wxuNHVabEIDvWFgBkg4oO7Z7@vger.kernel.org
X-Gm-Message-State: AOJu0YyKH2LNfQ2MXa6yXFj7/D8hJ3F1DPg+xWv+OMhBsAtdNVKB/AEk
	3zn6Ba8JUNtCmLU8SOBzg7CySh4jq+lYnp9v7+ZtGxiQON398igT7SaSkXc51cQLvg==
X-Gm-Gg: AR+sD10Cj3LfIp9VcYYc67BQ5UdoqLWusZqTHUkKQElstDquZBFic+tw98dhxIkoM6b
	6jJQorBvRfNoNSCqC0GAlDoPJEtUURAJ7u0d4z1FYNmPGdFLZoeBQJxJhpKfpUkJgRFcDbH3iHf
	eHISt8VFtSPZaTSqWUAayCpyp3eBVJkvMdQZSxWhMhff2K8ph1l0v1HmINMTij9rM9jt4HeDe7J
	PaxQ2TSuqIH6QdBkbVw4dcD7THLIHLpYfKOIMI05EcWEnpdrr+XuMo/6bUHGjC1UJ8hwII725AN
	TLKXbejEwKHmLWkIUKdW5i1sgJFQwv/pPH1LvLWKCfztcpCjqV2WNKOsuwoatWo0x4YKAVPTTYa
	5TkCkb5CF3a+wDB8frlrHVoWYcWT3pJyVCqu5C+ZfhqeOKWLCviQxwUEXrHVIaea6zilD4774za
	tdItV+sdW5WxRH3imQYE9Ba0eAjGnS
X-Received: by 2002:a05:600c:a016:b0:495:63e6:5fb8 with SMTP id 5b1f17b1804b1-496b56fa3c4mr122769075e9.12.1785181878642;
        Mon, 27 Jul 2026 12:51:18 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bd9e980sm253362445e9.0.2026.07.27.12.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:51:17 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: tzungbi@kernel.org
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v9 0/4] firmware: Add coreboot CFR firmware attributes driver
Date: Mon, 27 Jul 2026 20:51:10 +0100
Message-ID: <cover.1785181823.git.sean@starlabs.systems>
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

Changes in v9:
- Add the missing kstrtox.h include used by kstrtou32().
- Use a single kobject rollback path when setting registration fails.
- Split a few helper locals for readability, including the pending reboot
  device lookup and enum-value population.
- Avoid an intermediate void pointer cast while parsing numeric CFR options.
- Check the possible-values buffer length before computing each label length.

Changes in v8:
- Add a preparatory include-order cleanup before moving the firmware
  attributes class helper.
- Add direct includes for __packed and container_of(), use scoped cleanup for
  EFI names and the driver mutex, and document the efivar lock requirement on
  private helpers.
- Replace the duplicated CFR record walkers with one checked iterator that
  distinguishes malformed input from the end of a record list.
- Validate enum entries before accessing them and propagate malformed child
  records instead of treating them as absent.
- Restore the EFI variable after a failed runtime apply without retrying the
  failed firmware operation, and only emit a change event when the new EFI
  value remains stored.
- Document the possible-values size limit and why CFR entries without a usable
  runtime EFI variable are skipped.

Testing:
- x86_64 out-of-tree W=1 build of drivers/firmware/coreboot/coreboot-cfr.o.
- checkpatch --strict --git HEAD.
- v8 x86_64 and UML allmodconfig W=1 builds of the driver and helper.
- v8 runtime APM_CNT apply and reboot-needed behavior on a Star Labs Byte with
  firmware 26.07 and Linux 6.17.

Sean Rhodes (4):
  platform/x86: Sort firmware attributes class includes
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  firmware: coreboot: Add CFR firmware attributes driver

 MAINTAINERS                                   |   18 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   20 +-
 .../firmware/{google => coreboot}/Makefile    |    1 +
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
 drivers/platform/x86/Kconfig                  |    3 -
 drivers/platform/x86/Makefile                 |    2 -
 drivers/platform/x86/asus-armoury.c           |    2 +-
 .../x86/dell/dell-wmi-sysman/sysman.c         |    9 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    9 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    5 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    3 +-
 .../linux/firmware_attributes.h               |    6 +-
 28 files changed, 1257 insertions(+), 32 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (82%)
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

