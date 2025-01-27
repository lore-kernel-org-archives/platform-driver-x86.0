Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E8540849;
	Mon, 27 Jan 2025 04:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950659; cv=none; b=CmwiSuOVhnx8fQ7aQUbR0nt1mfwND7V7Vpt6u5EHJuRERgork+J5zgmjiEa48PBX3D5sSgcmjCz2B/Ox98RGn3Yx71oMMkpfy7A7geZUZD6bR+WEpa4VDtCeeI95dAtY2g/XXpOJqIsW5Qn4mbjzj5prBovjTGCa/56u6Z5xq14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950659; c=relaxed/simple;
	bh=G1SnZ6luaIgspRh4tk+V+SD42oLuSSNXxCLicYOBos4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uRpfRaCD+qxMtcgU2sA517PCbM/nxzIHNtF98nXAaffK5YUV0iag4X7iGndJbhq82Tcqzje50Pw/3D97r9/pL/84QT1PErIvDaJs3HUiXTHSf3oO7pT/0oLwWA0/RZn3sAlf5eZkbYZSwNnSytV4RJTQir4C5twdX4wYlDHQ8Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QonuuvNx; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QonuuvNx"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-51cee9d5013so2567222e0c.3;
        Sun, 26 Jan 2025 20:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950656; x=1738555456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zoSMh52JdAo+B+SO+5DUKR+59IGbcylaEPIPT58m+kc=;
        b=QonuuvNxcgrKv3bKNNAXbDnmRU64ItQaNpJZuTS+uWBLKUYUQxKQqb5sqEwrw0pR6O
         92Ubs9dVE8B+SDBYDATH6zsNevdUuUt3UXzREEIij+v1maqaxPdvNbLLyvkBw0RAeUsO
         4LNGi4t9pbi9R47hPb1L0+h4whpWQhDg/7nIVAuDaW8YyjMn3CJxHOS71/6dUfIyDJqa
         W98X6lI6TxEuMV6vaiT7aLaalUmgWk/7APbY8LHAgc6e6FblGlQwExBEl5BdpO4wXa7I
         tJed2zsVd/Mb1tMRuzDCb7Xq+qc+lN+Pbx4sXylswiUnD4UOHaOs56SVmSz/rKb3WiXv
         Wphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950656; x=1738555456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoSMh52JdAo+B+SO+5DUKR+59IGbcylaEPIPT58m+kc=;
        b=BO/be2sCamirlvaiWcSikGJcbILe37XihhxlY4q3wg5xnFLtjuY7N+A/MmWqX3frwK
         xqdD/X3d6lWel2mBlNFHHsdiM0xhKWuJnyYhYdvjxAcMsl6GKdNENrrdU1nU12QriyYe
         FnTtSQRSiDpa3QZoqws8+ocApgu5Q/5WZ8DlZq2BYr+8cKujiYe1mQn7ETkQV/N9G59P
         GevAm6rXmGN3EhbpgrG6MQ5phAwL6rZZ/sKX53MjJ35+sZFanqJcoZFqf8o2mNAfmTPP
         cIzczqvpN7eFbE5JhhfQcSi47JmRPRbP5EAN+hw3KI/C2/AHM31ch0b+Z8JC4gziajeT
         xTdg==
X-Forwarded-Encrypted: i=1; AJvYcCXgh2EPzad9TgOaalstoT1+5IGSS7cBAqTeeE80NoWB6gAZEesTJgp/2JCo0c/F412N2+3hYaVxbksM1jc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2pMdtoO3XeS1WCTsdJdtIORdbgEjSx5wmYwN3JjTd2pjZId+C
	75mDhK7c2AJLVON+IrsuBW3ZdKmIyZFJAoeMMlSGLsRCvlk/YM30fH3l1g==
X-Gm-Gg: ASbGncujcjJZSED2GBLcec0JoBqv+LG9nBnrsr5tSJu9pBPxyzkgQ43unIwPJCAvEN9
	9O9D3OwiLN+kWyzHTA+bhqy1KQ7lsdW9mwiSqxVLR2JcgThPZu+W23Hsr3xZARW3mVaXbnqGJxH
	QRSSjJmU/7K4rldr+rEw1VR1kuKERZg7q4yOahirsYeUZkUMsl2beJ9O0Lha4U8FAJJJtG1vPCs
	AslRSeZ9XsmjxVkAmku8qj598b/K+lpdXQegAXivveNKbmhbUbM/n0997mdGiR6+prEJXLJAdJD
	c4EAMqnZrCJW
X-Google-Smtp-Source: AGHT+IHR9TY1Po+l9aO+agkiYMvFGJobMQ1wNwuYAeBQekSA3adasd3LK0AN1G5tKo72c0I1GQAzkg==
X-Received: by 2002:a05:6102:a4a:b0:4b1:1b07:f7c3 with SMTP id ada2fe7eead31-4b690c77e0dmr33286890137.20.1737950656293;
        Sun, 26 Jan 2025 20:04:16 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:15 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 00/14] platform/x86: alienware-wmi driver rework
Date: Sun, 26 Jan 2025 23:03:52 -0500
Message-ID: <20250127040406.17112-1-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi :)

No changes besides v5 aside from rebasing on top of the for-next branch
`fixes` merge. Especifically to account for commit

	c1043cdb019e ("alienware-wmi: Fix X Series and G Series quirks")

Which adds a check for `quirks->num_zones > 0` before calling
alienware_zone_init().

If the solution explained bellow is sound, this patchset should be
ready!

~ Kurt
---
v5 -> v6:

[01/14]
  - Check for `quirks->num_zones > 0` in alienfx_probe() because
    alienware_zone_init() is dropped in this patch
  - Slightly reword commit message to reflect this change

[02/14]
  - Drop `quirks->num_zones > 0` check in alienfx_probe() because the
    platform_device is now only created if `!quirks->thermal` which
    actually implies `quirks->num_zones > 0` because those features are
    incompatible between them.
  - Slightly reword commit message to reflect this change

v5: https://lore.kernel.org/platform-driver-x86/20250119220542.3136-1-kuurtb@gmail.com/

Kurt Borja (14):
  platform/x86: alienware-wmi: Add a state container for LED control
    feature
  platform/x86: alienware-wmi: Add WMI Drivers
  platform/x86: alienware-wmi: Add a state container for thermal control
    methods
  platform/x86: alienware-wmi: Refactor LED control methods
  platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
  platform/x86: alienware-wmi: Refactor thermal control methods
  platform/x86: alienware-wmi: Split DMI table
  MAINTAINERS: Update ALIENWARE WMI DRIVER entry
  platform/x86: Rename alienware-wmi.c
  platform/x86: Add alienware-wmi.h
  platform/x86: Split the alienware-wmi driver
  platform/x86: dell: Modify Makefile alignment
  platform/x86: Update alienware-wmi config entries
  platform/x86: alienware-wmi: Update header and module information

 MAINTAINERS                                   |    4 +-
 drivers/platform/x86/dell/Kconfig             |   30 +-
 drivers/platform/x86/dell/Makefile            |   45 +-
 .../platform/x86/dell/alienware-wmi-base.c    |  488 +++++++
 .../platform/x86/dell/alienware-wmi-legacy.c  |  101 ++
 .../platform/x86/dell/alienware-wmi-wmax.c    |  782 +++++++++++
 drivers/platform/x86/dell/alienware-wmi.c     | 1249 -----------------
 drivers/platform/x86/dell/alienware-wmi.h     |  102 ++
 8 files changed, 1525 insertions(+), 1276 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
 delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h


base-commit: 0da9a3f9ac8ada83fa79579455871ec59f11db72
-- 
2.48.1

