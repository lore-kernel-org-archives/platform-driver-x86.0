Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDC646DFEC
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001801; cv=pass; b=E5EzUHiCUK1HnVRfmPam13n5d2xGAeUbe0z+ApAsh//0u//LPEV6s/kdW4ZlXuUVy1yKQNKw5ZoJSXgVvmYplJ5udKfk6Woesvs46BMK/qAvTx6UnP8v7zVYnLTvUpRRScMCYP6+Oh0cU1Ik/JIwGQLdEupZ4T7jpST1+LvLzvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001801; c=relaxed/simple;
	bh=c0HChJwQcolwumJkMaqBcRzS/VRhk6rvGSTr9tmYmvo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=daxt9m3PgE3nNGvHc0sA+BEzDS1CyDPAv9vcHNpxIQXRuvJwRKpUeuV8yiZRcDyqFxIELdX1zRYLCSpF7xZEHldAJzsg2jgAtCGS5d5C3P4yrJ1TDO/bDDg4hFbewGfC1TmCLCkKx+VKcDAkJ+mTqXvMN0Z931j6HG+ALJPDFtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=vQ+Mc4yo; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="vQ+Mc4yo"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c7a743cf8so541984d50.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 14:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787001795; cv=none;
        d=google.com; s=arc-20260327;
        b=mFxsK1DGdQk5Eo91SPYzkXIwGOqK0SqLTDa9cy6GjeRTG2+2s6qqPWxDnRjUZGxkNb
         yO5nLyNC2kita3Q+PWiC6O2b76xY/I+nQ/SQO6LgSKsSuIv7A4TrAZ1aYH2HuW9awh8S
         rBOei+g4QTxlWcb56aNZUrryaFoFMwjbIYdpuk909PzDlxCC8/AWn8f+l8RS6KnyUZiT
         ZXpgO6BwWe527tMGtxl3rNlaJd+Ggl+fsgP52g7QVJmKAAAMBnhX6oGTNLX4vSRVE/Qn
         HCBvO+4hruLBvN8VzB8/YxnLN083WQi67y+UYc9i7P6pXd/TkmzaLhe6jYoBDbczi/QB
         oaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+5PLKuMouYLJfuABukE9BfK1nd1YWhR9ndsRk8oKsV0=;
        fh=WVlOv77n2thnu9LIrSqf0PkZqnX7EfeXuql4SguZeC0=;
        b=kP09ln7MtlnVAQn+mWvp33QhFqcca/79m01W4tOJ3kt98J7IqUPTKEqw6WV+Nce5SR
         sOtNPNCgNQ6JMtxRDWUtWlSVR5bCkAs7ntvaFEVHk8dxeauV9WzOuqmxv7UUEkvr/tSV
         RPX+HSc4SDTfZiHUeQHRCNMzGo3ccb6Hlzv0g5qSayaH2MEwoI1/mBLqhEo+3tN/TTVJ
         bfnxbiyb2MShx4lwS4SpSPU6DKVOuBdYTJP0muYtUDcbb5lns/MdyQXqBeAUAseB3+mI
         CTcD3wNpDbQSPf3HuGa3qq/kOqztyI5ptT/r3tuWcNQ1ewrY+zqUIu/3D7pT3htpsq77
         Le6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787001795; x=1787606595; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5PLKuMouYLJfuABukE9BfK1nd1YWhR9ndsRk8oKsV0=;
        b=vQ+Mc4yoo/pLlykrUZD5R0BED51oM20972SyPUMtJYIMFFS04bGjrF9X1DSQYVS5Is
         /W1IKeK5KgIWmzX3mHEUV0su0cgaISJvELeJVm/lu16gez+OzcMalkAnFhKctMjCWx+K
         iX44yz9NmifJ2aqYAR5Kay6ksw1W2/aefOButdWcu/vTHo3MKsBT6+rrwJNxmhe+ojwC
         y+sqssevlNYoQwV6GVonag5w7UMrXfR27uCdTfYJtphJ5igECBxyls2az5J8XEcj/Rfv
         417W9gghZVE3iKTkRNCMSG3CEaYd2NWPVEc8u5i7TchE9FVBySGCdOoN5h3Qa9IF9gDm
         HaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787001795; x=1787606595;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+5PLKuMouYLJfuABukE9BfK1nd1YWhR9ndsRk8oKsV0=;
        b=m4HXQPTWVxEJNiqnOHOMP8ZscXo8muSbp7q3sohzCe9DFxtXiXsruBak60xm21G/av
         S25RZXdPevvagaqYk8AiyMbvoNuxMUqahAdliN4rXRv0cDN0IkB5heGEwOco90NOWxus
         FwFmsGkfhnB8LWgE90gTGfV3bJHqretaKovvTJpvXKySI48FltTDibG17u/5JfmkDoHk
         m8zuLglQevo4tImu+DTbWq6Ua9y5p+MPe4p5IW9BjReX+6yGnEMUnDLj4bpq/HnGn5jS
         oSCA2qmMJnXyirkjLZfrp2bdBrSrwC838PtcLZw9xJDbuPcabX/Tz0+wwxhwH/1y+Iq2
         Mqkg==
X-Forwarded-Encrypted: i=1; AHgh+Rr47lMoZsE/qCAhbPgoJQnACCz4fV9bx5vsz5suw6pKoY5hohfyM9yWSX0QPXDHY6gDueBFETYLCNTnu4V01fsnI46J@vger.kernel.org
X-Gm-Message-State: AOJu0YwrqMgo3vrdTbQ99geZtNxhSTzsE3L/TtG9MPCfueU2V1A6wlw6
	bH/l+UjRNF0b8wqxA4LAy10W/YV9pwSX775ydTyQicaU4HNcDrSCNjIbZFJbl/c6TUkFnCcxCxn
	FP17i2tUo0hG+0PBB0bTCgmAfFu/imZBDYKlwqFSZ
X-Gm-Gg: AR+sD12V4rWFOvjv4Q0GuKPNLlNl02Ty8PuA+oGWyBKihnSUlCtXHNj3YTaqU7Kewcp
	f3uemaDg/9IBxb4nIPQO4pLVQV+qFKnNB4PLZvyzTDA68c8FM1AUXH6ocwB2vaE9dxxkIv+R6Db
	PU23RLivcUAu0gnnXxKc4SN/rV2uWSm8EXUqMGx0QVsKL2r6aGJJhqoopo7DE+FylpqVkW5eQW4
	cLBSNCgUv3Agu6jo1ijHiNdKfk4XTU2wZT2/O7AwGPzMCivs6RILqmbUe5ldoH8lQH+tJTB4wLi
	Jua4/fxH92nQysgipUPv+SfiMV6+uMRl7YsmD+axYI7snH2H9IIDKP2HPBsLQAmIgpQYQpIq
X-Received: by 2002:a53:e648:0:b0:668:8d0:20c with SMTP id 956f58d0204a3-66cbc402e78mr562185d50.20.1787001795207;
 Mon, 17 Aug 2026 14:23:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:23:14 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:23:14 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Mon, 17 Aug 2026 14:23:14 -0700
X-Gm-Features: AcwNN1UEW_I4KbJipIcXlINKvUbDivRmFcqfha0Y1blx7Hp6TaEGXKNcQwcXyPM
Message-ID: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
Subject: [PATCH v13 0/5] coreboot CFR firmware attributes
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
 rename drivers/firmware/{google => corebot}/coreboot_table.h (100%)
 rename drivers/firmware/{google => corebot}/framebuffer-coreboot.c (100%)
 rename drivers/firmware/{google => corebot}/gsmi.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
 rename drivers/firmware/{google => corebot}/vpd.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
 rename drivers/{platform/x86 => firmware}/firmware_attributes_class.c (94%)
 delete mode 100644 drivers/firmware/google/Makefile
 rename drivers/platform/x86/firmware_attributes_class.h =>
include/linux/firmware_attributes.h (60%)

-- 
2.53.0
