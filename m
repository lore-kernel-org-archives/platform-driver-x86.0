Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672341;
	b=0rvWxOiT6FZgT5yMpBEBBqmvMrULXar5/Su5b7ckG6W8Qprwo3SMyB0blSNwvZrZHoQR
	 dM5Uu+KEoi/MCbMC7n102xhIHH8SJfFcH8dfWv4ZUU/XKsS3d/I2v+TNIDSCI6MUORicQ
	 RjLg0C+7cld/7MDwBbWewP5b7yEhp5/ikn5bnO9qU8Y38MnEowm/VB3n+ZfAhyDRcodWf
	 SrTgtlxnWCRt+WjoOKScbJ4KN8TWpaZtXnpdWU93VZvj00NCNNgl1AiSdHaLkt7wRnu55
	 EzntFQKAYzn3LtnuFXqdnanUR1caa8zo3hL2kQi1F/qazUpHHV/P6AV301jyDA7VtZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=547AYHesvWuVRdGCIewRd+N2Li/XBFq8XpI3l0Qzhfk=;
	b=Tz+8eNF3BQj9xxQeGle9DYm6pyH5MT8ojzVLSwvq9NuHcaHIusNeYAv8Q7r8gbQYf884
	 dSPZLxLmb6EP1cWkxD3F/vBpdJ4yQ/ZypyIGV6/9tLJOXn/viZMiWPp50vuGihgUXXg1j
	 UGDxwbQN3SUG8SFDgbCQE4KISc8+5WsFvZUIWuwHaP88gzsgma+iRIvbQ4MfHfajapgml
	 Wk8YJxQh+l35SMC4IrsmFzvh/8qVNTSx6P5pmXYt3fhOTDR0viPjCD35Wa27RsRN9U1U6
	 iM+ztpHRg8NOnVbKFf5dt0/mxs1KJ4cpb0Vyn3QLoiMOguWo5hyKAbt6N86w6TkDvOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mv4eQuaf;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A6606A33A
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B8A6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mv4eQuaf
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b244fb7fffso2325833c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 08:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672340; x=1795277140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=547AYHesvWuVRdGCIewRd+N2Li/XBFq8XpI3l0Qzhfk=;
        b=mv4eQuafDY4Pf4G/39Ez/dibbEL1tp/mEeUZkKSHNyqMaRYSbKVqWFkCkTUAiki7H3
         XvdTX9Mw57DvIoc8qwpGSCkkSAXAseI6Ervx96D73cYNWLTuGUs60H5xbF0hUduiN15q
         McYBeUVUeHXm+mMgq0MOMpCMuWtcTNbk7yCEIU0xh7g3hsGQB8kTTY77LY/HAeiqbWX4
         UgBZUIuam46igrFahSuNUALs5hbgRdSDYtQe4vIXfAoxJURgVBrWDew80EPg0aBIwTWd
         p8GNHCjqZEijGZNH39/tYW6ME1MQcPNbL2P3uvNPGgfHcPFSoF3E9OIJTfuInY8X+Sfh
         YIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672340; x=1795277140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=547AYHesvWuVRdGCIewRd+N2Li/XBFq8XpI3l0Qzhfk=;
        b=tJlJPCuA4+GK9OZqz9e3ZFlCgid50XvmrWfk1MbRWeMNIDRnJhfHyfYBypLDz8qKHV
         291cUXVUCWrJXN55Ui2pOKbbyznpERrbr0bek+jv5BqGbCWiQ/MlMSHFDYA7V+Sc3rM1
         oYV/YRvu93E7NOTOq7KztG4MiDZ1noHGf2WMs8UYjZhcCaFdTcip02X1fo1hfypZ6jYN
         WhnX7KRgnpkNcCtn7MYwYeKWL/bFklMROWVheo64xjuXOob8t+5C4MsVLYtGY604TNEY
         3kD2h1zUIxx2bO4HNPikXnUSvRuEw79s5C7aHMbioabHnEWlmX+bG0ZkKGMnwlqQpMGP
         sPiQ==
X-Forwarded-Encrypted: i=1; AL+hErFPpK5lIkYvUl6nTbEF0UK5VixERksYiJpMVzQ5p6RfqHyGbw1VK/8T5aBHFa4O53S12z2wjNiHdONFdfBvTHcFklfN@vger.kernel.org
X-Gm-Message-State: APuU4Z/sBR026+7ipQSl7zGyPscUEIQxg5+cPj0OAGXjT2FgTrhxhgrd
	Vc7ortliaVLwbgNbOtCYxH+H+Fz/RNckr9p96QF+46l3MhPCsjGrqCE=
X-Gm-Gg: AYBFou319hnEJgccv7K+JIvjqX2oINWj+Q5SKITvtlOZcqSDbdKhvqcakiAatGO0oPc
	8e2OjdrblRDKq6amnnFUayq681jp6SkmmJ3XZ8GY+QWc2IpOAK8PELZP2QuBTxKv5fwDlxQ6CCs
	qDxvY3cslOxg9PzteQrRchrcmMlpRtC99DcjqBo+uFx0xdF94MUL7tKo832/prhv/m1ZN9BDBzy
	s5SIn6rjrx+Dugr/gU7hKW6BmXGMH5qg8Agr5m4C+H88cnbg8V9oRgQl3uUqoSgoAlKrJXPh25B
	F00IJh3qzKceJQKwGwmInczYT9Zil/RL2hbFZ/bvcbTQcoDsKpWy/5WF0NrC1TsivLH1nBrl5z5
	mUe9qL6MBr+yeimf7aNa35CI2NV1KuxcwZYlOF/n/76uWNIENK9tEsBS5SV7DN59mPC9G9X1Ziy
	poFfuFIq82zsk0Gd93h3ub2Ek8j3aA/24PF2g9RXEQ9JD2YuEnTT0QonfLJof7u0SWVq/5ucdCr
	YEz4gk9CQXTPhoXD+sNcRNwapK68nTPxeDRJ7Q6+mmFbnDJJoCAf8l8cfLaQwfPVtqu8AhNImxN
	7PDlaOq0mwKuzd4ZlupCr14TQqzDpVnRbxLfjAhmWoRR2TJ0nGyzYYnn9nEUgj4Ijw==
X-Received: by 2002:a05:7022:3b86:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b5239e163dmr123330c88.38.1794672340199;
        Sat, 14 Nov 2026 08:05:40 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.114.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm13378548c88.10.2026.11.14.08.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:05:39 -0800 (PST)
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
Subject: [PATCH v2 00/12] Fixes for apple-gmux and runtime support
Date: Sat, 14 Nov 2026 11:03:47 -0500
Message-ID: <20261114160457.3034-1-atharvatiwarilinuxdev@gmail.com>
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

Changes in v2:
- Check the discrete pdev config before GFX0 restore (01/13)
- Don't save bridges state when state is VGA_SWITCHEROO_OFF (01/13)
- Fixes discrete_pdev initialization (01/13)
- Used PWRD on 15,1 and 15,3 aswell
- Add quirk to 0x7360 PCI id aswell (02/13)
- Add 15,1 and 15,3 and its gpu's aswell
- Removed ignore_access code (02/13)
- Initialized val in read functions (03/13)
- Fixed permanent mutex block on failure (03/13)
- Only resumed when pm_runtime is available (skipping on iMacs) (04/13)
- Corrected ordering of interrupt_work (04/13)
- Notified drm about hotplug change (04/13)
- Checked if EFI_RT_SUPPORTED_SET_VARIABLE is available before writing
  gpu-active (05/13)
- Wrote gpu-active on shutdown aswell (05/13)
- Dropped boot-gpu parameter (06/13)
- Checked if vga_switcheroo has been initialized (09/13)
- Added additional pci_is_thunderbolt_attached check to
  amdgpu_device_supports_gmux (09/13)
- Removed duplicate check (10/13)
- Renamed gmux_off to runpm_active
- Checked if adev->dev exists in dm_dp_aux_transfer to fix null ptr
  deref (11/13)
- Removed GMUX specific code (12/13)
- Initialized edp_sink_present in testing code (13/13)

Link to v1:
https://lore.kernel.org/all/20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com/

Andre Eikmeyer (6):
  platform/apple-gmux: Write switch state to EFI on MMIO devices
  drm/amdgpu: Add Apple GMUX runtime PM support
  drm/amdgpu: Catch register access while GMUX keeps the GPU off
  drm/amd/display: Refuse DP AUX while GMUX keeps the GPU off
  drm/amdgpu: Skip AC/DC notification while the GPU is runtime suspended
  drm/amd/display: Skip panel power savings on eDP links without a panel

Atharva Tiwari (6):
  platform/apple-gmux: Fix power for MMIO systems
  PCI: Disable pcie port on specific amd devices
  platform/apple-gmux: Fix MMIO interface
  platform/apple-gmux: Fix Interrupts for MMIO systems
  platform/apple-gmux: Add check to detect FSS
  platform/apple-gmux: Add documentation about iMacs

 arch/x86/pci/fixup.c                          |  43 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  61 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  48 ++-
 .../gpu/drm/amd/amdgpu/amdgpu_reg_access.c    |  24 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  14 +
 .../display/amdgpu_dm/amdgpu_dm_backlight.c   |   3 +
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  19 +-
 .../tests/amdgpu_dm_backlight_test.c          |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c           |  19 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |   1 +
 drivers/pci/pcie/portdrv.c                    |   2 +-
 drivers/platform/x86/Kconfig                  |   1 +
 drivers/platform/x86/apple-gmux.c             | 365 +++++++++++++++---
 include/linux/apple-gmux.h                    |   1 +
 include/linux/pci.h                           |   1 +
 16 files changed, 534 insertions(+), 72 deletions(-)

-- 
2.55.0

