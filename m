Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2156448164E
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 16:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958838; cv=none; b=U3zPJaya/ZLM5tReRQciD/I5ym1WvU0jz+F8j2zIvwQJrdZBxVEHSDFwsHq72V0P5LE65TqaMaO8zZult1LMDJrgHSFeqFbhnnzUQFyP+EGF/oY8swzNvbxcUVb1HZGG3xO/z0qc2SLfsk+E5TvQ8nfuKbreR0yVmmA+CPpimjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958838; c=relaxed/simple;
	bh=M4l4ClH7Jwc+fKfFtHK7JUjAaHPk7o8GggwSfAsAEP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MmfXeBBwd+kp4/4t3zorGL97NAZrtl2hEWI3WFQPsBqjj6J2qN2ADmxNbR9ohMfsT0RPjWTdmJJjG8RzbNnQbT0cSPX5KZcPMhSXfQQ+XLUFqociaf+iVeIDiD8EgF65Ps00FU9bJoTxN01/DugvVxlV63Fsjl3EEKWngFEkiJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7moC5Up; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7moC5Up"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso3147007a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 09:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958836; x=1791563636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ng3pfH+8Y0uTBJEh9FH2p3oXQStVr7nZPjCZ6kZCW0Q=;
        b=r7moC5Up8e3gOsjvpXwgSlqyj863yOOExweIIwty6sox2G9FUeUu2Kc7nwSx5ME5q6
         a0wTxgnLJEX/y5Wsj8jo9ksO0eLkyP2bKIODxzKh+UOYW1WJGF1qg10CHCjhuMRZIkYY
         YalM55cHfctUVyk3LJhSYq0SBSYDdlblVxopqdznR6ZtZSbSMqhI7htO61fLrT78fb6x
         9+Fb4X0y1Ib3aTlK02321up2r/VLuftrCCie3iqYWKHhytk5/bEqBq2+A02Ie8f++9lT
         dcGHSuAW0NoJqXYlafRF4bPOYb5JJ6bJVyhZZHeLFTgJxRtbxUJ3Ai/Lvlqhp9dAoG2K
         YIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958836; x=1791563636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ng3pfH+8Y0uTBJEh9FH2p3oXQStVr7nZPjCZ6kZCW0Q=;
        b=NUnu3fJaaNy/2ewWPB9dS+m6bF8KvkY/QvsQkZoOASTAVuh6/+UKtggp1SEyzVYfn1
         g3rKBaao6gDkVDGyjI1mrxpWoNmnUOz1dBNhwoLcUhet8Im0z+R3U3+KvPQ8g1Llmx22
         7Ye6HnS5rvKP0cPbwHeQa8gnSjezJgawvjAjhSMGc72kUvcHz/Nr6RreYESzKn5Hlevr
         +5wezvpZGlT7HuyZOTq+HvQURMuUKlA1u2Nu6No8CsE1GKDxmXOxyMngqy/iq0zGQvW7
         KfmEJYtxt0UhOw5tin09GUWb4aELTMo9G1YGPYyFPekwyRDTtqGFjm0xNurSm0j0GxLj
         bCkw==
X-Gm-Message-State: AFuF++lw2t8WdpwO/iX31Pb6jzj9w7yzeefd09McCyiRa69Nyzai4yr3
	Fax17GhIgPm8OtcUUMly8SzjnxA+YZFTvG1hA1/FrvkfdUfH+czMAQ1U
X-Gm-Gg: AYBFou3d+3REJqmzSG34ydj49KaBgNpc7BES7YRXg0BEBmewmwYIGTWKCvyOQHi5Rcx
	dv5LjgzAL6CiRBAIh2hz9w2BcmwfxNid/NtyMtEz80wFMicQn8oQgNBWsriEzMHiWbWkg9zl1Kd
	syCupI91o4IE9vUWZj55cBbioDytpMSaNln4Ozz/FQuX5oImk37H6F6VHqD/okpAiPib/D/giXZ
	a3yW5g/Y4eheabCH6JKW03UsAxIvlzhtw7DcqbeigvINXbz83YUfd1LEhs95tohUWiZch4ztk0p
	m8wRYHJobKHMjm55jOtdeNd8oJ2sRQlryc5PdjMTIyyrUe0oqFJDhCYRXNFtqEYh9EXRZOz6P/5
	s+kxSElP9CFMj60zolc8W7F+dQZ5GYAf1gbWGJKNjsIOJjYy/XZUxSYb09P3yoY2DGtIpbLtY7o
	h9TIGSlnnAl8oBu4SUgMLkiNO7T1HH7oKF6fzLaG+rQhQzFZEB3mRkPFl3QBk/sqU3F0Lb
X-Received: by 2002:a05:6a20:3d0b:b0:3dd:85a8:4c56 with SMTP id adf61e73a8af0-3e0bd19459dmr3535852637.29.1790958836234;
        Fri, 02 Oct 2026 09:33:56 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:33:55 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 0/9] Enable cameras on Dell Latitude 5285 2-in-1
Date: Fri,  2 Oct 2026 09:33:41 -0700
Message-ID: <20261002163350.1248431-1-tchatard@gmail.com>
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

The series touches three subsystems:
  - mfd:          patches 1-2 (intel-lpss resource-conflict quirk)
  - platform/x86: patches 3-7 (int3472/tps68470)
  - media:        patches 8-9 (ipu-bridge, ov8858)
There is no build dependency between the three groups, so - as Lee
suggested - each subsystem maintainer can take their own patches through
their respective tree.

Patch 2 (from D. Manresa) extends the intel-lpss quirk to the Dell Latitude
7275, which has the same BIOS bug; it is carried here at the maintainers'
request. The companion 7275 board-data patch is posted separately by
D. Manresa.

Changes since v11:
- All patches: shorten the Assisted-by tag to "Assisted-by: LLM" (Andy).
- Patch 1 (intel-lpss): use C99 initialisers in the quirk ID table (Andy).
- Patch 4 (move Windows MFD setup): no longer introduces a local
  struct device *dev; the existing &client->dev references are kept so the
  patch only moves code (plus the -ENODEV -> -ENODATA change), with the
  unrelated dev conversions dropped (Andy).
- Collected Reviewed-by: Sakari Ailus on patch 1; Andy Shevchenko on
  patches 2 and 3.

Earlier changelogs are in the v11 posting:
  https://lore.kernel.org/all/20260930214321.600863-1-tchatard@gmail.com/

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
 drivers/platform/x86/intel/int3472/tps68470.c | 105 +++++-----
 drivers/platform/x86/intel/int3472/tps68470.h |   8 +
 .../x86/intel/int3472/tps68470_board_data.c   | 181 ++++++++++++++++--
 6 files changed, 283 insertions(+), 59 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
--
2.53.0

