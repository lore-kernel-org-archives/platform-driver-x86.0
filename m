Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090D7485517
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 20:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048054; cv=pass; b=GDQyhlC/W3/ISg9yH+lUdHyKTMgQawOWlX0/VAtyO+KzLJhIcfKk9Jf1/BPNsUUThHfMJttp0eFlZ50Mi1zD9gXtoJfxmjAKKOkmIUk1E0JHCXUGcQ/agzcE0LZa1rlUJF+8m0QuS1OGXR/hbcEEKd2kkSeSSaJHvYTGI9JBYPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048054; c=relaxed/simple;
	bh=YYL7vtprvWwxV6sKshg1wFVFWl5XwZYgAg9IlmhQ/Tw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=O1ofd4/cy4Rsb6Na08HYrnqYMBwd2VcnfO348YcP+9bKqlaC+bzLX+VkB9u58RvvP88SfI695yjR7JqvGjZRKmNFTr1OYtY1WP9k6Zc523Ka58NhOQVABXgf4ZetoSrkfoSBS02Auno3dA4TJeo2hhba1tYO+8us8rudTXOG2rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=ATgqG/8P; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="ATgqG/8P"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6685001353fso3240634d50.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Aug 2026 13:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786048051; cv=none;
        d=google.com; s=arc-20260327;
        b=OrvV9TaXDXFDQf5sCC2q7el8k7chXs/EqTFj82V0XIUjdLLYKa83PuwsbkyKdM9tf+
         yNKA2ZrbtxcqDm0UCi3BlekiNNXdzBDeTAwKTTrU2hkaRYtlEKaiKTdAQ2Ru030a6yCF
         +4/lPHI3ToS3oQ+X3rV6K6WN8qrkid8zyPjwj/f5c8z9YyyLVzhXo5uq1ZCkDMiadPsU
         611witVF1AVcNAKwuZjDByOnKTXVEDX75X0YO2ARabXAKesjDPjwRN5+Ln7Ni/rR4VEh
         3mvv2B57gC2QthScJHAHHYbLWHi3JZi4sGWSPfUiXWlRqwxMLpOLxcnOD3YamdHNku9l
         c+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mUkz9z81fXtboTnN6qDHx4c3BdpFoqvqeB7Oo3Ns4+8=;
        fh=xYu5yeYnZuFmoCl0BRaHqhNcixdpSsS3REObLrIPbHE=;
        b=rRKOD4Bi09hXyCpO3KL5tuhThuw4pEZDhXkiwtdS4PEIWmhFrCpVjJNDWw68Gim2aa
         aeEA5QfzBbCTauHLaJN9U+jnbTboWrdvRvi0eEQ+5fWkimkaMshgPEAUbq8Mes1fuE3r
         /jh7aNr7/bkpDaMMZxne/fD6Pg7bxsdufumX+vvF6CDnMGYYbmKSqJaqmvLodjQnNCNN
         iffNBK0CNnqLZcsyoliuwyryZZiK/Pcbgk8HlMngl+VEMwXfWQMyynBDWvUX5XsC8ujK
         g/u1UxDY+tmDHxBqm7Dutz68IU/m5hcDRaPMXfEiGj9CBE0QYvU79X8erO1NL/+/XAdm
         I1hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1786048051; x=1786652851; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUkz9z81fXtboTnN6qDHx4c3BdpFoqvqeB7Oo3Ns4+8=;
        b=ATgqG/8P/y/SjQoPEJCU7AgoPmZEBdCiLbFkKuACMX+l4HqWDnMNP4+zxRLE5of+K4
         pTViW+ZneilnvXHeBVnDtIQ5Du5RxnCV+uNmex/5/Qw7ekDvJqJEjfn4hpPRS0O5uf0A
         qILHN9qSc0RD5JKKl24Vc8hqsWuO1tNg8ZEMO66qq91txKwtA69dNGFpMEYuVt5s8l5o
         PYw+xQBLvxG7HA6zLHVF9UE+goHg+SUATLqK7FZax7xwbJnRS92Zl+Aeq0SI2sx3BzU8
         ySLLbHZNAmHNI72F8nwAAtOVPhcyHL5T/kZnDa8skNeRFEqfS+QBGSCYjVeO/3aA7dop
         164w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786048051; x=1786652851;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mUkz9z81fXtboTnN6qDHx4c3BdpFoqvqeB7Oo3Ns4+8=;
        b=YLzbVsmJAVSLtlUGPMEvhAnIAkLU6ikpFSizQ1vx/Lc7cjxFlIm85GJjVO3Mxf463e
         vjcCWmylz75O2BUEdI+vcPW9SsAo2fKbEDM2ES6vJwKXOkin5c1xUqLJIWDXf5VkyrgR
         CoyO6fzD5vbz9REEybxWjIq9lRS6p/id6FsXQNWfTcpiLAIhEcsq9Zn91YrEojFKN77T
         hAUpJMCIHnCYvWm2j1uDJm8R0djK7ogE7FJsKrYzYvOFLrgH5twxaLHBnORVJvworkQi
         rg1OHpPcoGiVeCRFA1aavpPG438eAQ8Om2/AWBjkFuJPA1LhR9REwhYr8j2OUk6S0l+B
         NVyw==
X-Forwarded-Encrypted: i=1; AHgh+Rppp5NZs7SZKqoDUkmGsIzSm9MJt/53Pq3+WCDp+4pbdDa/KxYsOb7wQzFrA252XL6Y9l+hM0AuJi/41MPpu+Sb/bqr@vger.kernel.org
X-Gm-Message-State: AOJu0YztVvTSptKOjaqPU/PRLKBaPI9TcQwHI0IWJPKqXhNfWQ9xNnCh
	0eZq4OczmIz2dUUuCbrh+9rafgxs64dYarNlfGqVE9ysWM5SlX/4DmxgcXdKoB/pnSOHzztjywf
	u9OGFsnvNINH4AdCdZE70VjudCpFqKQOfIXh+CwEF
X-Gm-Gg: AR+sD12lYTg0admttlyWizFVR0xt32lJqfsxeqdFUTu1vYg6oY3BCpnKeLl/DhhsNEN
	60bZKgTSa/tSWMCITnI9vp9mevPcKSHp5dWiX1ywYThLqv9s6umepNAfwVMfCxFvtaJYUwggcMs
	/9DD2tt6hpRlm61stUtAE+l8kOHWks3xLPliYzuOybfJaWgrDzqQQ9mAQk+iIqYAVnCqHRiNHqO
	9qNsBwyguHQ0KYGMfxaD8q4W/OOegp/KBZlO2jsw9hQzZmGqyfx8Ifn+skOWJg/k6I0/d/cPCh3
	efmRUPBR+i3/PjAeCLMAAiE55P36wuhUqHNraafg137pKypkUaWYRzA8K5hR9J8gydbW+d2MyrA
	fE8r19kHC
X-Received: by 2002:a53:cd49:0:b0:664:dbfc:e46d with SMTP id
 956f58d0204a3-66ac2fafb9cmr2208972d50.35.1786048050724; Thu, 06 Aug 2026
 13:27:30 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 15:27:30 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 15:27:29 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 6 Aug 2026 15:27:29 -0500
X-Gm-Features: AUfX_mzAUIcTps50AuX9XV0cmoM9F8eoNkrO6qV8e69hoMZI6prHfv4r-rievDE
Message-ID: <CABtds-2VsrCtqniHX=znRP-bzpWFTCYDK_Bb3xUgjyVj8Z80Nw@mail.gmail.com>
Subject: [PATCH v12 0/4] coreboot CFR firmware attributes
To: chrome-platform@lists.linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, 
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	josh@joshuagrisham.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	florian.fainelli@broadcom.com, chenhuacai@kernel.org, mst@redhat.com, 
	wenst@chromium.org, tzungbi@kernel.org, briannorris@chromium.org, 
	jwerner@chromium.org, tzimmermann@suse.de, javierm@redhat.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, krzysztof.kozlowski@oss.qualcomm.com, andersson@kernel.org, 
	geert@linux-m68k.org, dmitry.baryshkov@oss.qualcomm.com, arnd@arndb.de, 
	ebiggers@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com, 
	sven@kernel.org, u.kleine-koenig@baylibre.com, bhelgaas@google.com, 
	dakr@kernel.org, o-takashi@sakamocchi.jp, titouan.ameline@gmail.com, 
	kees@kernel.org, dri-devel@lists.freedesktop.org, oliver@liuxiaozhen.dev
Content-Type: text/plain; charset="UTF-8"

Move the firmware attributes class helper out of platform/x86, rename the
coreboot-table firmware driver directory from google to coreboot, and add a
coreboot CFR firmware attributes driver.

Changes in v12:
- Drop the v10 CONFIG_GOOGLE_* to CONFIG_COREBOOT_* renames after review
  feedback that the user-visible config churn is not justified.
- Drop the arm64 defconfig update and DRM coreboot framebuffer dependency
  update that only followed from the CONFIG symbol rename.
- Keep the directory rename, but preserve the existing CONFIG_GOOGLE_* symbols.
  CONFIG_COREBOOT_CFR remains the new symbol for the new CFR driver.
- Free invalid enum labels before returning an error from CFR enum parsing.

Changes in v11:
- Keep the scoped cleanup in the CFR driver, but use explicit goto cleanup for
  the nested sysfs group registration path.

Changes in v10:
- Renamed generic firmware Kconfig symbols from CONFIG_GOOGLE_* to
  CONFIG_COREBOOT_* and kept the old names as transitional symbols, as
  suggested by Julius. This was dropped again in v12.
- Updated arm64 defconfig and DRM coreboot framebuffer dependencies for the new
  symbols. These updates were dropped again in v12.
- Addressed the nested cleanup-path review on CFR attribute registration.

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
 drivers/firmware/coreboot/coreboot-cfr.c      | 1208 +++++++++++++++++
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
 28 files changed, 1272 insertions(+), 32 deletions(-)
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
 rename drivers/platform/x86/firmware_attributes_class.h =>
include/linux/firmware_attributes.h (60%)
