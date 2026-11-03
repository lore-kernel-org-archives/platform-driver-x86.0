Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721203;
	b=GUNTLmzA2j5w6KW42f+fQsez8RahC9cHYrrGI8lOlTAqHlWvHV49BZg9qUKpQMZWflgm
	 BULkPOOf3+HFqbF5KSEIvnOIdmfSGbNgTw0aJMdAXSF0hTPq8s6XoXqRMX67ZOCuxvR78
	 tuAwrGydmciX//RsN9uFveD5/B1y8qVbw6ftR+uuyuss4PkRllhkx7JvLXeZwm18YHz4g
	 4hYDIqEnm+3PnG03r5c6A6tocdWKrscKvzGaa7yVmtFoHsNf5tufgebbsfB+9nbAceL5R
	 1r+84uuZNAoxLyW3zDLmAVCw8i6/SJ8/nyCZR4etkWpevVr/KFtLJ0u1z7ekOfrw2mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=anB0zTq8jJujneJmcQG5UHQs5K86qJzq/JkXXdegQ0Y=;
	b=OCO0ZNhDKvIia6mWCComXJtQzDTy6+1Psh+mezXjut9xFQGr0MBLJ+i3u2jAPC2II83S
	 It2r0exrHLUUGm4X5KlJZsy7w7NhHx8oJ6UDhhFB0MGMBqcnU+PRvNyU9DX0xN4E6/JbG
	 fsQntOb/6cnVQe7z5U+f1gax+EW4Kfm/QwHW/3d1V9qjldD59gWPuHdwMZTJ4opTRpIAy
	 DWnjfxO0mo34JCEV1huID15TbJ05EvPAJFsG7Kk1R0lMen678G82+1TXtLVLp6Ed/6Pug
	 My/Tbd+1jDFN+1PgFa6v+ZFembBgKKZ5MDUD2rMrq/MkjfV0nH7I+R0lFZ5gq/HSf/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tSNX67su;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4CA606A329
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 15:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD4CA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tSNX67su
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so6376615e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2026 07:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721201; x=1794326001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=anB0zTq8jJujneJmcQG5UHQs5K86qJzq/JkXXdegQ0Y=;
        b=tSNX67subyw79uMOg4DSMsKrL4qoZR3fWMirU+8bRpPuHGhaWmjkMuROfHKcpYZP3e
         oE4uUjh/767qBQ9+CO+ovt8otMG8ZjjJjjDA/hN7HWBE6LZ9/1w9/VFAs6dCeyFyMaDa
         NejxEV3MAUgDZ2M/wOqitCqlG2nrLA8PhVVvV4hoKsuwwlbGHsRqCj23u6ZCywCohzp5
         rQ6BKIgKdt7sQYmxWVQTA6CFM4OPVOfdtnBAKEJKQW52gE8VLax0Q2iVSto6qbfaFaCi
         qnHpuYQYpLZm1l8fo9nwOiSFp4GOOlMyMyIzvBZgk/gTIMMG3alnfapmXv7+KJOB3EHH
         Gw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721201; x=1794326001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anB0zTq8jJujneJmcQG5UHQs5K86qJzq/JkXXdegQ0Y=;
        b=OZb9qbQDFI8BWVOcqaSbQ2t1Sy6R/FLcC+j1L46eLVsFhRXFnAg5FQIKsqRxO7TfOK
         GrXyx9fH/pgpaFE7S2L7ideHqlXGZ2qpf1NC0uNfc92Xiczw17g1Cb3uPVfL1FXwBHCu
         G4vo/rB+2YsQyi22z20FdvIOo+eqdOy9nCvKASLH3jtPfw2UiXHYUh67F4/rP2j6ByLw
         VoXqsnU+2HNGbODAsu/6WSFia4EEVup4ObYNosR6O4+5ctHnpHp/QxnEZ10RiUkX9iBN
         hnqPZsvf9PpbKDaTfezdWWpVeiRhLrthLWS8qzDXG9wu7o2qqd5KaHTpSy0JauQSEADg
         Xj7A==
X-Forwarded-Encrypted: i=1; AKwUvBzXON+6b05LkfSdcm97wzkuZlmGmkeguOsPGAwbkabWRKE7uGr3VbzZtOGvbAOSMiytWGAf8qFgQQD2zEHbszdj9X8t@vger.kernel.org
X-Gm-Message-State: APuU4Z+mhwDxMO5QR60Bg8iIb4lQoWCYaexV4tmsCA3SXPV2Yfck0j4A
	rHYId8Jgf/1EAD+z1WEAOHZhNwTEHDnb/MAEzc2OFW8s7GZal0DcOF13
X-Gm-Gg: AYBFou053ZBWF+1W6pFt098DmhK35SRAdzdv0q7F0+ABAJVSaRIKQWpt/5gvoS3fKKo
	BIqKrU2yMeT9is4ADAdYfByWw5swASN0Ghpdplepkk8H5jny4lkmjheCt1tuPmlhbTKRmlzkpWs
	N1G7Ki645Rx8cn7P4IyL0XsZky31gvUrfwrXpKssRJOC5OTUsV2ZP8KENd+ABUvLuXwUiyVrOI8
	34Syv5hWPrG06b7izbf26ysfeiciYQ6eyAZQQH6WgRLCaWynGYWn1WQ0GKqAB1SJB7pu5oggOU4
	eNwEd0YNRqc1op91+NkkH9MacKRVVyHofUU1VoXS6aQ92DFvEe2fob3B/I1SbCRYmWN0dCXFszO
	0oB3ng4JSHxG344EX0oQZ54P2HWzfoD1LyYyFQoE5FdNeU9rogHPLkfReludPVKlEgjySa0B1wG
	Xj6nh/hiKLs6j0+pKyZQjc+iosQ+CZIQ45kinEn/VW0YGKqbWqSfnyeLNXAheLCAUEphW++XjF6
	CFD21WKyG0CzfG6lgGzpuhDKOTX3zjJimmDwo3/XEezkQ3RClS8BgLOI0CUlF1XPADz3H6eewRe
	4PIIOoDtgxMVbHlldpx9Ypx8CgRUODKpu2evyOIE9K5/HFZHdzdHMh+7DeAAE9DLhis+OaT1
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr237110155e9.1.1793721200982;
        Tue, 03 Nov 2026 07:53:20 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:1209:ec98:a2b4:9c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm63777815e9.5.2026.11.03.07.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:20 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	Caspar Adriani <caspar.adriani@proton.me>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [RFC PATCH 0/3] GZ302 rear camera (OMNI13B1, OV13B10) board data
Date: Tue,  3 Nov 2026 18:53:10 +0300
Message-ID: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series is NOT meant to be merged yet. It puts the board data of
the rear camera of the ASUS ROG Flow Z13 (GZ302EA) into patches, so the
sensor can be enabled once the ISP firmware supports it. In the v6
thread of the ISP4 driver [1], Mario noted that OMNI13B1 would need a
new amdgpu entry and the matching GPIO tables; this is that data, plus
the board configuration and a small sensor-driver change.

Caspar Adriani already posted an OMNI13B1 amdgpu/amd_isp4 patch in
his RFC [3] and dropped it after Pratap's reply [2]; credit for the
first posting goes to him. This series covers the sensor reset GPIO,
the 24 MHz clock and four lanes in the graph, and an I2C ID table for
ov13b10, and lists where every value comes from (below).

Why not for merging: with isp_4_1_1.bin from linux-firmware,
SET_STREAM_CONFIG fails with error 6 (UNSUPPORTED_SENSOR) for this
sensor, as Pratap explained in [2]. Merging patch 3 would make every
GZ302 show a camera that cannot stream. The stock linux-firmware image
does not start this sensor; on my machine the camera runs with ISP
firmware and sensor setup data from my own Windows driver
installation, read from the Windows partition of that machine. I do
not redistribute any of it.

The values and where they come from:

- ACPI _HID OMNI13B1: \_SB.CAMB in an SSDT (confirmed).
- I2C address 0x10: the sensor answers there; the _DSM returns the
  same value (confirmed).
- Sensor clock 24 MHz: the rate declared for the OV05C10 platform
  (assumed).
- Four CSI-2 lanes at 560 MHz: the ov13b10 full-resolution mode
  (assumed).
- Sensor reset, amdisp-pinctrl GPIO 0, active low: tested on the GZ302
  (confirmed).
- enable_isp, AMDI0030:00 pin 85: copied from OMNI5C10 (unconfirmed).
  The capture driver needs it to probe, no ACPI device claims the pin,
  and the ISP also boots with it left undriven.

Bin, Pratap: the firmware sets up the sensor clock and link, so could
you confirm the clock rate, the link frequency and whether pin 85 is
needed on this board?

Sensor model: as Bin and Pratap explained, on Linux the ISP firmware
controls the sensor, and the reference ov05c10 sensor is not bound by
a host driver. Patches 2 and 3 fit that model. Patch 1 and the 24 MHz
dependency below only matter if a host sensor driver is used, which
is how my out-of-tree setup starts the sensor. Which model will the
sensor-agnostic driver use for OV13B10? If it is firmware-only, patch
1 can be dropped.

Dependencies before this can be merged:
- ISP firmware that supports the OV13B10 on this platform.
- With a host sensor driver only: 24 MHz support in ov13b10, which
  accepts only a 19.2 MHz external clock today.
- Patch 3 needs patch 2: the ISP setup in amdgpu uses the software
  node that amd_isp4 attaches to the ACPI device, as for OMNI5C10.

Patch 2 copies the software-node graph of the OV05C10 entry. If a
shared graph builder is preferred, I am happy to rework it that way.

Patches 1 and 2 have no user-visible effect on their own; patch 3 is
the one that makes amdgpu create the ISP for this board.

Testing: built with W=1 (clang) on next-20261026. Not runtime-tested
in this form. The same graph, I2C address and reset GPIO work out of
tree on the GZ302: the board configuration in a patched amd_isp4
module, the reset GPIO registered from there, and an ACPI override
that lets the stock amdgpu find the sensor. There the clock is still
declared as 19.2 MHz and the sensor driver is adapted to 24 MHz. That
out-of-tree code is in a repository I can share on request. I can
test patches and firmware on the GZ302 at any time.

Related: two isp4 driver fixes found on this machine were sent to
linux-media separately [4] and have been reviewed by Bin and Pratap,
and the GZ302 bring-up is discussed in [3].

AI use: Claude (Claude Code) helped me write these patches and the
changelogs from the out-of-tree code, and run the checks. I reviewed
everything.

[1] https://lore.kernel.org/all/3a671359-b05a-4d58-84ca-f29385088e5c@kernel.org/
[2] https://lore.kernel.org/all/ea758386-13b0-4667-8eca-9aa4efefe92b@amd.com/
[3] https://lore.kernel.org/all/lWYl1YJwDSh-q2Ew2f8b0BweQ4V-SUnPMSMurU5gT1LkqVdrmWFunj0sSgjC7m66bORBAD_jRCFTt1_ZOkotOMukY46rI4ayYbIfPQq4E9U=@proton.me/
[4] https://lore.kernel.org/all/20261026182442.229869-1-saif.elden.hatim@gmail.com/

Regards,
Seifelden

Seifelden Abdelmonem (3):
  media: i2c: ov13b10: add an I2C device ID table
  platform/x86: amd_isp4: add the OV13B10 (OMNI13B1) board configuration
  drm/amdgpu: add the OMNI13B1 (OV13B10) ISP sensor

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c |   1 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c  |  13 ++-
 drivers/media/i2c/ov13b10.c              |   7 ++
 drivers/platform/x86/amd/amd_isp4.c      | 127 +++++++++++++++++++++++
 4 files changed, 147 insertions(+), 1 deletion(-)


base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
-- 
2.56.0

