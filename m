Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E662439331
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192483; cv=none; b=OqUf+b2IjZHiqwvCnV2DDbCsMn0AIDXKZ5a0seyP5xJCBNYav4zAbO9r9qp4KwxIhNIj+PW85EUB7Q5yZgu4BHDoxg+zAj4sW2OKYARf/TYFexgnyRLW8/OKmeQTQRqf4m+JgnjiFTJEPxH8ewaCW2T8DNmqzcreX3qgNqEVi68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192483; c=relaxed/simple;
	bh=0yOjtQL0ArOu129/YAlqNj4oZFMpD3l4rO0VkNazTvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lruw4Ux+nmiwvExW1TBa3yuX3EGGhu/9jddArplwDJJPpa6hQtC5cm18pYL5MBODEvLb2MNXAUeXWfuctypwEchKWJaOHsU/rvIpSae024yLCSbXJNFP3NrvEH7lJc/IOV+VEc456u+oh+tacfmrEugUcCEpGd9lp7t998Ng+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGGnAa4e; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGGnAa4e"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso2149215e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192479; x=1788797279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gA64UKZy3mC+oZEPpnPJBeWoAu5DKPeNeGaNgc7dMmk=;
        b=HGGnAa4euBd+Eh7XKK0s/W8Z+xgz4jdj417G32ZaMNU0385+bjAJLNB512Q7VSp9tX
         XJTirCUfMok/gPwhDK2dFINd2SI81ds74iMUz1X9Yk3LgjvlXYaM7m7F4Aau3P1NDc6M
         cS281BNjTv/L1f0n0NfQLFUf4BVAKQ28tybnGezNbQnTfd/WOlsQRs51UdYFyfA5W2xr
         OeTBag0oRmqCZFB+2mdhGbNrMUXeudoegLny5vsUW0gDsZJ/ZRlZD5QKTbnNTuC++4N0
         vQJgYMvjHCrIbhsI75hLdvK7V8iPieaisJl6c8OYLndjs9C3y21xG6nL2J1RO0BnEojZ
         bVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192479; x=1788797279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gA64UKZy3mC+oZEPpnPJBeWoAu5DKPeNeGaNgc7dMmk=;
        b=nwjJM2HGP/TaPy/TbMrE1nF/wBp/uTMZHuS6FYsE47yLS3VyvEEORD1KJfdLu1QVqD
         hf0+k58lf36skMbOKasLJ7Gploraa8PCK4HS74CfScIqe7KDp5x2mQ2A/NBCzv3IW6mb
         mcRL4wkI/oei36kcM16uQsYVBODlR1OnhRDipApuRVvXkRLByGZm8Ka6FkPiZCbu9iup
         KZ+pw4Te+Ni1EsP0Ba1g4XaGOSC0OmBo5cKBuTLLyTGDSOz4ZSI5ZfU/UQrMcgNPAOiX
         yCYW5Yx95tdMUH/ZXgBKDd/G0DjMPmv8zHGJ4TDClhFKnlhYbiWeK+gq+c/Vj8Afe96e
         2Q7w==
X-Forwarded-Encrypted: i=1; AHgh+Rq25ColbLKwacd74XxiAfdZ+CQIKogbfArkCtIDiobOjNIWKI0m6fZLr0kwmcU+ipmsFkCy8WAqawUdbTONdcLY65tX@vger.kernel.org
X-Gm-Message-State: AFuF++l+1Wyk76kPrmuq+5zC5rpEBUO35NGvQJGlNb95zi6ACdEgH+z7
	LXBV29vO2WnTeHMP2qCqlCWC4x6GjxQTC3nP2dGh8CWTBv5wF/6ArDL7
X-Gm-Gg: AR+sD13cmB2KkSFGoV54bF+E9BOAvT23bw2sWX29CQVRYC8J4Pg6Q0TOKT1D3ejYd9a
	R4g2S7VP+oa5W5ASOBz+h/rnc+oeBn0RVzcXF5qd7IAhlJ1G46du2oSobo7oRLGU/9Ae5LMpLe9
	bxMVb5sDl7O+Lmqxw9Wxa8Bh3OwI6NgjFWIy+DyC5srMJHzHbK7f9gniGoeGxUsyejb7/GDKGoG
	Y3gehqqP1quO6uEyIbXTZ7oknNnerMufP3cHhkAIHzP4vtwOb3BwKZahDo8fQckdjN9LVd9yYXA
	olwPaJ/chuWR9FrTeJ7FUvDXTfMmGdiWn2axnaHQWLXBIJxDHq9nEjRdeNnaKPGiV5Grc/eWD6h
	s63dvwO3k4n2rS7jl+ryEYOcDJoOzChrfTS/nsBvGjgYqqgamPS646SElXDICffzkgI5GO6WgjZ
	Zo/bpeSlmwQG9s9cbKGdMCswL05JDMy4rx48kxJuc7KERKEV89sOnX74/I
X-Received: by 2002:a05:600c:1f8b:b0:499:ae94:be05 with SMTP id 5b1f17b1804b1-49cdc3df92amr33451405e9.0.1788192479266;
        Mon, 31 Aug 2026 09:07:59 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:07:58 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v10 0/8] Enable cameras on Dell Latitude 5285 2-in-1
Date: Mon, 31 Aug 2026 18:07:46 +0200
Message-ID: <20260831160754.9857-1-tchatard@gmail.com>
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
Assisted-by tag: this work was developed with help from an AI coding
assistant (Claude Code). I have reviewed and tested all of it on the
hardware and take responsibility for the result.

The series is interdependent (all eight patches are needed for working
cameras) and touches three subsystems: mfd (patch 1), platform/x86 int3472
(patches 2-6) and media (patches 7-8). It is probably best merged as one
set - for example via platform-drivers-x86 with an immutable branch that
the media and MFD trees can pull. Lee, an Acked-by on patch 1 (mfd) would
help enable that; I'm happy to follow whichever merge approach the
maintainers prefer.

Changes since v9 (addressing Sakari Ailus's and Andy Shevchenko's review):
- Rebased onto platform-drivers-x86/for-next.
- Added Assisted-by tags to every patch per coding-assistants.rst (both
  reviewers asked).
- Split the old clock-consumer patch (v9 3/6) into two: a pure refactor
  that moves the Windows MFD-cell setup below the device-type switch
  (now 3/8), and the actual static clock-consumer support (now 4/8), as
  requested by Sakari.
- In that refactor, split the struct device *dev declaration from its
  assignment, and add a blank line separating generic and local forward
  declarations in tps68470.h, as requested by Andy.
- New patch 5/8: factor the always-on VIO regulator init_data out of the
  board-data patch into a shared common_tps68470_vio_reg_init_data, and
  fold in the byte-identical intel_nvl copy, as requested by Sakari.
- Patch 1 keeps Andy's Reviewed-by (subject prefix fixed to "mfd:" in v9).

Earlier changelogs are in the v7-v9 postings:
  v9: https://lore.kernel.org/all/20260827201611.99825-1-tchatard@gmail.com/
  v8: https://lore.kernel.org/all/20260826112452.13539-1-tchatard@gmail.com/
  v7: https://lore.kernel.org/all/20260819140107.1329091-1-tchatard@gmail.com/

Tested on Ubuntu 25.10 (kernel 6.17.0-22-generic) and Ubuntu 26.04 (kernel
7.0.0-30-generic): both cameras working in Zoom, Chrome, and GNOME Camera
via PipeWire. Also independently tested on the closely-related Dell Latitude
5290 2-in-1 (same IPU3/TPS68470/OV5670/OV8858/DW9714 stack) by Vitalii
Tytskyi:
  https://github.com/vitovt/dell-5290-camera-kernel/tree/master/patches

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

 drivers/media/i2c/ov8858.c                    |   7 +
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 drivers/mfd/intel-lpss-acpi.c                 |  32 ++++
 drivers/platform/x86/intel/int3472/tps68470.c | 116 ++++++-----
 drivers/platform/x86/intel/int3472/tps68470.h |   8 +
 .../x86/intel/int3472/tps68470_board_data.c   | 181 ++++++++++++++++--
 6 files changed, 283 insertions(+), 63 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

