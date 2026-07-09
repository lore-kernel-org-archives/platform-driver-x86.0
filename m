Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD31224234
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601425; cv=none; b=l6C1gjswFg03wPtWWIt2fW8j1pjpKGv/eU/kUOdi8JgcliOibNwn2pDYPmbiY3rpAc0YUnz8Zb01DQ85ZIg3fExYRMS9BspTHnyx4MFhurbGPcWwjkj9L4CGFxCBUsSsHAtriGyUvrTy8fqYDqngpiS6mEDXBBlJt4xbgVR2360=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601425; c=relaxed/simple;
	bh=EXfM0v4EhcxQ+tklDnuDMs1Avw18MIFqmglueS1d490=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ek53g4L8O/Te+EttsPfkYmhFYk2+ZpzDcucNVOuU3sukRqHt74Sf5wDZDy3Y+AePSZz9jGV/W6yN8nPqdEpy62GubYYM9h0OgyeamxGwHUEXtHCie2j9WKbv4wnTZgEE633n4qjUMB+pHa3zDrn4CMvrjrB+a8vfGJmzKgqxoYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=uiTBm7Bo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="uiTBm7Bo"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47d6c634f45so477387f8f.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 05:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783601421; x=1784206221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwbEF25FIKLXdl4gOi13bRERXBt3gyz2qIndX0FIOYg=;
        b=uiTBm7Bo9+tuX/2ZqQ60t2r7Fn5cZBujaMnd8Y8Ey60OZC195iV2FVTgoT42/o4tYQ
         O2o4mcfw84aulDZotlr/IoEs+L/nKruF5m5nLhrAlj0XX7H7fqZFemu6Tfq6OfnLCO6R
         vEcwtIA1H2dYZOBL2rQ0UPsTJTHg5KlZk9eDKMKezULM2x5k1XqAhwRH2g/hKs4o+lK6
         ISQOpDZnU1ZR2Cu7IcWZ46c2JseDoLpxrcxuZS6B2TkZ4hdzix6oKiH1y2AX+LUN7L6+
         OGjIvgzXD8+T39klXNN6Tm7TGZtPipUEADVMOlVu9V29oJ8xmWiZ/LbtebUpJnIv6JJ3
         HaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601421; x=1784206221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwbEF25FIKLXdl4gOi13bRERXBt3gyz2qIndX0FIOYg=;
        b=Ven8g+PPPrTzxy0+QrSttp5B8BggjP2fzvEE/ljFdzLhgY6V00h5GrlPR6cWB0htUf
         WKffhdomggphpr5wXVvzD6vyWImmaheoITl1bgaWuZ76dsgKPiUEmub/6wZmTFty9NS4
         z9f6NOX5BScvXqIBmWBPwfj2HPnXGCIqfrMxSOkTcPuoQr612NkJSmMBKUBpCk7pfmNt
         h5vFHMjhv9gDYXEdhi/SkwhRi1zKkcuKFhmMc6N7frY95uyjzN/ricuFugGeZbkRkYj4
         SSx8UFjgEIfnG0KDNLgqI0VIC32uTahpq59UuoDTJwjlnDPyvgr10ANG7lMkv7Uyt4RN
         jhdg==
X-Gm-Message-State: AOJu0Yygwvs2zsKPBDLHbt9PnKKQfBO2cydxrZL2ECVzTk9tzrf57cKe
	SGRyqhfFxCLHxNTvU1CaEsfYb99t/AxHAZWhYF6RQPMGSatVKOlRETr9qTnX7Z4OBvPNd5oYU8d
	vKQQ=
X-Gm-Gg: AfdE7cm3TyDFckiGa/xfk2hDe0EM2yEv91QKkBw5Aj4L+wixV93Nfxi8rqTLuvWsqNh
	g9nS1UgwH7gRO7U0S5Czgw06Ruq6hJXYPEEFGs3DD840xgupIKqfX66Dala6GYNB+WrVH5EAghS
	kCEqUIu26GFtQc6xXkKo7+O7hzCtPjo4QFf+4wKg4s1kd50bf4eO70W0RkSJaWELIfmSElljl4l
	hgRNUr7I47HHudEiVdgzlk8W4E1AouBknBuycfT6/x11lSCH/vBCD9TTPwLfVzXZa49osmPximP
	aDppkLw6UOEjMnhY2LtT1f//kZTVWrGDBOuRif/d5ZYznLzjGlYXSJd+/mzQGyhE5vK7eqk6f7B
	HcfzjFQRQCqB5o6tkiM7MgEE8pnZav0mS4Z16340gWBWYECSGVnlnfHnUiHmovSa8KxK7S/lusm
	+v0XF62VLSXtNm41zaXm7sm83ty6mGcvFxIjio/V63XFowSgC41qH/8kTu
X-Received: by 2002:a05:6000:4027:b0:47d:e548:9b2 with SMTP id ffacd0b85a97d-47df071b752mr7412876f8f.2.1783601420418;
        Thu, 09 Jul 2026 05:50:20 -0700 (PDT)
Received: from horizon.localdomain ([150.228.38.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm47589451f8f.35.2026.07.09.05.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:50:20 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: platform-driver-x86@vger.kernel.org
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sean Rhodes <sean@starlabs.systems>,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v2 0/1] coreboot CFR firmware attributes
Date: Thu,  9 Jul 2026 13:50:16 +0100
Message-ID: <cover.1783601414.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This adds a firmware-attributes driver for coreboot CFR tables.

Changes since v1:
- Add explicit includes for the helper APIs used by the driver.
- Use __free(kfree) and no_free_ptr() for EFI name allocation.
- Use isascii() for EFI variable name validation.
- Convert the EFI write path mutex to scoped_guard().
- Rename the label/current-value parser to avoid default-value ambiguity.
- Use devm_kzalloc() and devm_mutex_init() for the driver state.
- Clarify that -EOPNOTSUPP after a successful EFI write is the
  reboot-required path.

Tested on Star Labs Lite GLKR, firmware 26.07, Linux 6.17.0-35-generic:
loaded coreboot_table and coreboot-cfr as test modules, verified
firmware-attributes sysfs exposure, fwupd BIOS settings enumeration, and
the reboot-required write path with debug_level.

Thanks,
Sean

Sean Rhodes (1):
  platform/x86: Add coreboot CFR firmware attributes

 MAINTAINERS                              |   6 +
 drivers/firmware/google/coreboot_table.h |  45 --
 drivers/platform/x86/Kconfig             |  13 +
 drivers/platform/x86/Makefile            |   1 +
 drivers/platform/x86/coreboot-cfr.c      | 986 +++++++++++++++++++++++
 include/linux/coreboot.h                 | 147 ++++
 6 files changed, 1153 insertions(+), 45 deletions(-)
 create mode 100644 drivers/platform/x86/coreboot-cfr.c

