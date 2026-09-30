Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D6E51EDEA
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 21:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804615; cv=none; b=JzJOvOmfMKDtcJx1qpwzI+lzuOY5UQRF9OpmFYqgbOtEoecMc10Cpw+JP5HZnpAMLcnT3KtY5qgojIKkR9s8bLB7Ph+BAEDlRRQJvtEjzzTWB6VdNW2wTBozVoI02yytAAVot1O9Q8cU4ZDHzrjaytKzlQ27/KnCQP8pXz0/RE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804615; c=relaxed/simple;
	bh=6eiboQsGhoOo18wMjqvhZ3+2NlrJ28iq5Be6y1MEvfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOCn/2rnpVakd/2myIX7Dl9wPDkvdflIXp0lwdsIsyH/E+xtWeINHLpwigAd00kKnNxt2ZRoNTHJFJOQcd26Km0WgB9672bad010iKUXRWFLfJNBJwo123KuI6RKY8rYsK5D4LHEwsUAA1O1i1iy8Q2uWq/30rbekZwTX/ehwUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8QqBG7e; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8QqBG7e"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a498cb99b3so1312391a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804613; x=1791409413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3T6R5pVV1FJhZXiRr/cdUfkVi2Cjaw45kIt7sxpXdSw=;
        b=C8QqBG7eHSKR77iyMXbFKmBe/f84DB0FeChiQO9+g1YgUuyyKMqIYY/2yC5jd87s2W
         qDgFP5dpdpmCmLcrV1aVOr340XVhtwJaWJ7eMguldaY7Ey3CoRVUKliZ4gWLpSFJwn93
         AhA3zIHUYUiG96VAoT4qmM1SqEbUnxm3hplJtpsGoKuZ5klQOEutnj5O0PcoY7mPZx3v
         wGWLqUY1ffdkoIsityzgJKmmGM0EuAYuwlLqKyN9k3kFzu4hMBGkKm56muxVUo3hv8Jb
         8Yw8UgO6TtWA1oKsJrBfeKS7sniVPFrxqrmgXH//ReJHDGeu7YKrxN6qBs0WHmeDeF8u
         ErLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804613; x=1791409413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3T6R5pVV1FJhZXiRr/cdUfkVi2Cjaw45kIt7sxpXdSw=;
        b=vg2mgAf/6btjAtiLx6Chs30L2GfFIZUG5SltbIE5BPdp5PEcJmywhtmKsOtDS7zbDO
         pt9sdKCV60hRtA3dSsaIoAJnUweK7e8l/YWd5d3YiXEs4ZtF3jXKSWIBxydY1nhp9d19
         DGZHa09P4T/EyETcb+ZPcOG2mWCmdFbg1IRKYw/qM0SRMqJGItP41l1XSUbV/ETUYmqL
         1zNNe2eSfbAKLMxytP6jrnhtAtiKV5vQ/xgJ/V3/gE4/V6MGtroZBTKSSXPmlcAGHc7Z
         WKqS9wi4AHnBeyV5DrdlBhy/1UPhtaqvnuciO5iCQjaIIZ7YtUIcWX/sOITGdZebtIcQ
         GrJg==
X-Forwarded-Encrypted: i=1; AKwUvBxjpb5eXoWY9fy/xkdM4Avj38P5rb8tHaTt+4l5uT+oKaPtEtSzTa57wnk62AcrsKbY9tcR/SA/bkM2UdKp4N3oiprX@vger.kernel.org
X-Gm-Message-State: AFq9FYIf0fVQXSgumwbkq1uEGhrTTbFItt3YEVm2WzIqTIgRE0zz2ehZ
	xikF7AWFp+vAyI3EwazauVh0fEYIdoIkCd7vhP+QkCsdvzrTQcoC8+sy
X-Gm-Gg: AYBFou3luTBjbR7G9euAG0/uAIbhyn6DmYrc34fqm3LE7HXpGqJ5Df+6bkAcJJMoNLS
	YNuowSfBTEsZ2QiTlmFFqFWfz/NqSIEqwOLXlclOznih0uCcO6z0tP74imR+O60CXC7aeGbrYPq
	JSsH4sXOPMTK57/CdgwGR6r56LOQqSF1rwOV6RTFKX9huJYB/UmoECKPAPyapKaDJJB/TghTHua
	hqsTpyQhvHsrpno1U+v7sL6iz8M79CpuP2fiYEdShp0dVHGS+XAjdxqF55p4BGkmRZB6/SKj4F6
	DYOnsAtNwFNnJ2OKzGk90gK0IcN+9Gduy72ZUb2AlQeKMaSW9F22Kssg/39AiJaffVPFbG3xVeN
	Kl6GbfPjOTVB5YYsP4FbZ3refufp3GZ+CSO8IW6HVuEwsTffJk9jDUFBWaJYsL0fFrBBEy6xkVE
	PGz++3L2yiQ25PXsF0csqpfaAqynSeXYs/6M1GHDEnxSHAsotsURyBsSkeuX1TDhBK7Me/qRMj3
	A0IkQ==
X-Received: by 2002:a17:90b:3c45:b0:3a2:b038:c931 with SMTP id 98e67ed59e1d1-3a4fb238128mr82331a91.40.1790804613093;
        Wed, 30 Sep 2026 14:43:33 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:32 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 0/9] Enable cameras on Dell Latitude 5285 2-in-1
Date: Wed, 30 Sep 2026 14:43:12 -0700
Message-ID: <20260930214321.600863-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

Per Documentation/process/coding-assistants.rst, every patch carries an
Assisted-by tag; this work was developed with help from an AI coding
assistant. I have reviewed and tested it on the hardware and take
responsibility for the result.

The series is interdependent and touches three subsystems:
  - mfd:          patches 1-2 (intel-lpss resource-conflict quirk)
  - platform/x86: patches 3-7 (int3472/tps68470)
  - media:        patches 8-9 (ipu-bridge, ov8858)
Per Sakari's suggestion it is probably best merged as one set - e.g. the
mfd/platform-drivers-x86 patches via one tree with an immutable branch that
the media tree can pull. Lee, an Acked-by on the mfd patches (1-2) would
help enable that; I'm happy to follow whichever approach the maintainers
prefer.

Patch 2 (from D. Manresa) extends the intel-lpss quirk to the Dell Latitude
7275, which has the same BIOS bug; it is carried here at the maintainers'
request. The companion 7275 board-data patch is posted separately by
D. Manresa.

Changes since v10:
- New patch 2 (D. Manresa): add the Dell Latitude 7275 to the intel-lpss
  resource-conflict quirk (Reviewed-by: Hans de Goede, Sakari Ailus).
- Patch 9 (ov8858): use ACPI_PTR() for the ACPI match table (Sakari).
- Collected Reviewed-by tags: Andy Shevchenko on patches 1, 7 and 8.
- Patch 5 (static clock consumer): kept the inline if/else as-is, per
  Sakari (Andy had suggested a helper).

Earlier changelogs are in the v10 posting:
  https://lore.kernel.org/all/20260831160754.9857-1-tchatard@gmail.com/

Tested on Ubuntu 25.10 (kernel 6.17.0-22-generic) and Ubuntu 26.04 (kernel
7.0.0-31-generic): both cameras working in Zoom, Chrome, and GNOME Camera
via PipeWire. Also independently tested on the closely-related Dell Latitude
5290 2-in-1 by Vitalii Tytskyi:
  https://github.com/vitovt/dell-5290-camera-kernel/tree/master/patches

D. Manresa (1):
  mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk

Thierry Chatard (8):
  mfd: intel-lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop
    counters
  platform/x86: int3472: tps68470: move Windows MFD setup below the
    device-type switch
  platform/x86: int3472: tps68470: add static clock consumer support
  platform/x86: int3472: tps68470: use a common always-on VIO regulator
    init_data
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477

 drivers/media/i2c/ov8858.c                    |   8 +
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 drivers/mfd/intel-lpss-acpi.c                 |  38 ++++
 drivers/platform/x86/intel/int3472/tps68470.c | 116 ++++++-----
 drivers/platform/x86/intel/int3472/tps68470.h |   8 +
 .../x86/intel/int3472/tps68470_board_data.c   | 181 ++++++++++++++++--
 6 files changed, 290 insertions(+), 63 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

