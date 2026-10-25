Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900886;
	b=1fql0RFUpNtPpkQIk6t9nzMsDc6pZ4dRVTRXvq1CZwMhmx8AkF9N2fqmhurLtDrJrxmT
	 YO53EZzqsBAhnOlgbm0kWzgqG61SdslETVaBwNFgNedDkV+JhlsqnvNGG6GdFXP9SVu08
	 RuCqrs2ghcrvZUWirA8ENiPqqI9zbes+cvMm94Q/KiaOCwb8zFKmvYX0BWfDu/Ttu4AdD
	 Ha3/nCjlKK50X9hJ+HhL8uQG7i22+TuSPliK5lOF8IlypccMkTg3Wf3J16mGBG2UtJAgT
	 VolPVeq+piQpTzFvTaydYGImEDTrQGUt2izcje47CZYjjU4fxntZiGcGMri7GBe8xHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lv7p0AUZ948zcVcPc4Q28K28YGEwBExkgg3ueLIutWo=;
	b=ugiJLqQ/eJq6E3j9xOaUBp8SSsJrXSMqP0Unt4ebzx3FfDacqt7vV5HUN2O8YB3Gx59w
	 VraSQ1uMUIDBFo8z5wyb5C5AAJRCfKeusvxLAMZGlow66ZD2/tcxP+XcNSxFBCL3lKBGL
	 TAlQhPxV57d9hwinROXokzVkKKXIjXkSV9kiFQWbAaagEGL8IJ/EqpzU779GLg6jlOzeJ
	 kePG3Ve1uPc0d6lE3Qeg1w6FytDCGChoHodyHIExNqSBNJOxkBiDzzvhN2iHy+NJXxdBZ
	 gUHJbHv+uyNfrWn8yM4BBMt1YdEGg3YOwwPIcRbQr8nhjNIUXnIwp/RyCkYSDBY+sJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UcHVUAhj;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C08606A31E
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 04:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C08606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UcHVUAhj
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so3432497c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 21:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900885; x=1793505685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lv7p0AUZ948zcVcPc4Q28K28YGEwBExkgg3ueLIutWo=;
        b=UcHVUAhjlOgC5vn+r/DfTojBQILIlvC796CCzLjdttaWMezCI1GUNgehXALAKecE1D
         lmPt1BgkKzuiENImuapUnFft0fV54XJWiF12/HPmRCJlppWOGTMrEfXchqp+FiQa4Krh
         rADvqEcrmwAQASEiYlXEQHF/5F/L+6l100i8qytWolKaeMUfyrKBzjW0XDgbKJ/uruB/
         v+O9P8yZIiW5cBlkaRyDAQZwFVxvCodXp81DLNrhAoICsKpe3EYbFFzl75NLCR78rR5y
         3mqPBHwZHkd9x6ZtK1aMrh6mjpJjgXjSu8vBSH646/oA/ugNCgK41C2PQvFKzj3awNmy
         IQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900885; x=1793505685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lv7p0AUZ948zcVcPc4Q28K28YGEwBExkgg3ueLIutWo=;
        b=oxW1fyuwe2yJ1lhcQmEk3tMusJQ3ZjN1O+BBfFR4eNHc4eaVAg8aFP3uKRWMr0bbnV
         A8Y9WJ0AwFlg2Eq1W50g8mj3gWaZ4BFC0LbaTk99KpkEMagbVXMHZG95nHti0wRgH7Uh
         kZuHOLc9Hpj1S2+3DcdbfZ0bHwoSM2ol6joV3rG9cKL3AYDWJW2C6Vx9dNs2syRL15YL
         71vWepPxna7zdvpNYywLwraYc9SkW0MY8V1oPeKpAnZOCVpiejWOrA39KJY3py/idXwk
         DRCCLWI4/IEI1z2/QxZIwredOpmh5olmdP6kQ+4mv2QZbAdtsGDgGvyMp1Rupul5uU0N
         8t2g==
X-Forwarded-Encrypted: i=1; AKwUvBzURRmBZKWxhsO6KdL6y31+XWnFTBe8MV4kP1tebuqeI4fvh+Jki0OsrWvzvqcSQeAlqm42V/43QGEaqETtjUV2Wohx@vger.kernel.org
X-Gm-Message-State: AFq9FYIIlCtkYSQTuTSSnyhq98/SfEB7DrP8T1qgJS1rFShQlZP6oNEb
	xJcmEFGi9istxlFffdZDmc5WFVc2WnFm7ptDES7dV9EofZ35XH4CbVI=
X-Gm-Gg: AYBFou38tsam0FmI6/i9XaXGqyOjWw1yQf/i0PAro3DKyMJH/arVNB9b1UpVcwVRYxc
	w0ioR82ghJP/3yZb9t/ZHH22hz1oAB/DH7WIjm0crhtzMukKk9gRxxADAv9qDbNYMQ5AiTA6u7x
	wD7HFUg0ktGgsddMc3Swtg0aYK9s/828KgXx+X/71Zc5X/73Pg0XxZ2S9YzzUBoYgHeVoOh5g30
	BkctT8KKvtzDSpm0gXUN1fG1T3at6wKr6xXxhJrlTUwq2ttCo6cW8Yf5hgYZJ6xPxJo+EvpJuoo
	FXe+O6jd/9G0om+17oxqjttEHrqhZC1QOMUWL852nAIC5COva4o+xoUxGtJ/KMnkSacb1d6735j
	G9crGd4WdueU7nyIx9Z7zoqkOZi/Zb2ck86dzFSdkeYcqCKw86HBusrL4ZPNkby6pnbvfxNdZ9M
	/N32E3yb9/9rNLZtY2N+SkDR74MxzSXyZwP3TYKoG92P1tOVxfc3xAhD+1lLEhQuKVDPESuT1Ou
	U06a3A+jOOtTrxZgN8oDSEJ/sC6LxhEeNrc8hLQf399C1hOch53jtAQjYMwRI39NTEEfEY95OrM
	84GD3ogx4pS2jq4=
X-Received: by 2002:a05:7022:5f09:b0:15e:6541:3099 with SMTP id a92af1059eb24-19933e10e21mr5393203c88.7.1792900884823;
        Sat, 24 Oct 2026 21:01:24 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:01:24 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 00/13] Fixes for apple-gmux and runtime support
Date: Sat, 24 Oct 2026 23:59:36 -0400
Message-ID: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes apple-gmux on T2 Macs (2018-2020):

  - Fix interrupt handling
  - Automatically turn on dGPU when a external monitor connects.
  - Fix base register read/write
  - Fix power handling
  - Improve documentation
  - New module parameter to toggle boot GPU.
  
It also adds vga_switcheroo runtime power management for T2 Macs, built
on gmux power control, so the dGPU is powered off automatically when
idle and users no longer need to toggle it manually.

Andre Eikmeyer (6):
  platform/apple-gmux: Write switch state to EFI on MMIO devices
  drm/amdgpu: Add Apple GMUX runtime PM support
  drm/amdgpu: Catch register access while GMUX keeps the GPU off
  drm/amd/display: Refuse DP AUX while GMUX keeps the GPU off
  drm/amdgpu: Skip AC/DC notification while the GPU is runtime suspended
  drm/amd/display: Skip panel power savings on eDP links without a panel

Atharva Tiwari (7):
  platform/apple-gmux: Fix power for MMIO systems
  PCI: Disable pcie port and access on D3 on specific amd devices
  platform/apple-gmux: Fix MMIO interface
  platform/apple-gmux: Fix Interrupts for MMIO systems
  platform/apple-gmux: Add parameter to configure boot gpu
  platform/apple-gmux: Add check to detect FSS
  platform/apple-gmux: Add documentation about iMacs

 arch/x86/pci/fixup.c                          |  30 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  60 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  45 ++-
 .../gpu/drm/amd/amdgpu/amdgpu_reg_access.c    |  24 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  14 +
 .../display/amdgpu_dm/amdgpu_dm_backlight.c   |   3 +
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  19 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c           |  19 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |   1 +
 drivers/pci/access.c                          |  18 +
 drivers/pci/pcie/portdrv.c                    |   2 +-
 drivers/platform/x86/Kconfig                  |   1 +
 drivers/platform/x86/apple-gmux.c             | 377 ++++++++++++++++--
 include/linux/apple-gmux.h                    |   1 +
 include/linux/pci.h                           |   7 +
 16 files changed, 554 insertions(+), 71 deletions(-)

-- 
2.55.0

