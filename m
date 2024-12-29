Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0FA1F957;
	Sun, 29 Dec 2024 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501607; cv=none; b=Z8F4nSME5ZydIC3x+S4RSco6fXk+IWo2XcJ4WVKyqBWEGkmuKGwhB9l0aS/BrM8hgPu2ZdvwhFIdQ0WIoHJ1lCmNae9fBJC8KCHJUCKs7KNQDLQ+jzUl0zt3nRKUjquBuTS5c7RERjmZh5cDtu3wFzZxMsPh/qu7jSa3lHuFApI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501607; c=relaxed/simple;
	bh=MHCWYB3ORNFGqEExxwlrGHve3KD27VImx2hp1P41Pfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q/BbeEpj8BiVwylvkAppeRlYl1wuL1Kp4BmeSo81Y8/I02pjs5dYRY+L0geYrb9/Ff3e1JsQpUhwGqMCgcgnydHAwVLp8EtawRPlj9d8oXYJ5dz1iBQ4BmSZ6eXzUZHYdKTy7gFrFn5/Vcczcp5oQGY8spEbbaksEkvnq+PGPBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AA03Utz+; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AA03Utz+"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85ba8b1c7b9so4904601241.1;
        Sun, 29 Dec 2024 11:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501604; x=1736106404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCZR0nccR4bY33QDEA6OWQr2AcjC6hw1QXN3efH48Sc=;
        b=AA03Utz+NFmkr7HyWTXw/GVyfapiqCtT3qVrKPNOUkKlwb5tOJNNU67UaFXKMe/1UL
         TVd+OazpYDxYsmhJKY1xCC/20NMQscZAi4EhxTiUjEFrIVSbrQH6fWF5XNKSy5/Qlnab
         ml4NHXU3rWtZp2LK1St+92j0cjoQUu79PRsxGxSG4y9B43DiWHM4UZB7jTB+KShhN8uL
         A3bmZsGDFe0bO3wTid+M3z/zrA8Fm+IRlK3ROUzTnnBoY4k3huIqGivljHVMhTTqRpR1
         N3iU0rNP3lvvYVY+g72jizsygh+i3tIFeK+AlHyUP17rqfHXqHsWKLM9C4OiJBhcRtvI
         swTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501604; x=1736106404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCZR0nccR4bY33QDEA6OWQr2AcjC6hw1QXN3efH48Sc=;
        b=CDgiNfAxHQdcdtWuP6gUMyZHB5tZF2odhm1rOT1KNx9wfhhbHtpLVo9xSbi+RkreJB
         2aYXNxQFR/BRsNceeYItoGjoO3KnL2xfQ0Zkq59EL9F9pu0mUpZu0dnNtKggJRgtBri/
         CFsKifQ7Idp5+ripPC/H76MaD2PxcaLC++7MPmCz/EKPyj6z5lF+b+Cb8gw8GvxHTjQk
         mgTi126usE8pr1yyYNWlVjj1I1BCy7lRQlPSok/BfSZw+MGZCi78MU2bsrA10WyYIXVm
         Gz6ECeD7KtesheUaAkio8phq4cYNlPPhlXnerKXsiIXgWYyDfOJiR0jtP+e4RStlqWXb
         5DgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk0eWuiL6XIWbuLzd+zNoGCfaqdIuhQVDykNTaYM+FFkZwCxLw5T7CZ3vRUA94jaFqAXJRvSeeF9O5hCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Y9mQHuzMivLz2EGg1pcA2laCXHlAD0BScjBVZmgnDEokUuy9
	4hdmQZirKd4CIR68ax2ptd72Xyr/aQ0PkPyohvrAgquU7HhgkjJnuJQZPQ==
X-Gm-Gg: ASbGncvtrV2S+wyG/wBTcxRlJHgTXNm4mkJMY11UERpXHxjc2wmgXAS1kOTdTsar4YL
	JTO7KCeWZzXbcUpovlLo94BBv9r7m7IgKe67gS0GE+mxWuCKeR8TPp67kXTYVo6fkY4SOcvdhTJ
	7QfczEWWAOrcG1o5do2v+R6W+UsrpAQhvxmJ+egcgWHj8VIuK3ZpvPAuDGWC5MLky9q5OC9LYE5
	xU72bAuz2VmpD6vXYldJU8e4nmMtYXLuTZk8Vqqi51AcRgiuhkmLV8/kmYR9DCy
X-Google-Smtp-Source: AGHT+IFrzpgDSST7SqgmImtDFz0vrRoO5OB012A8scbkJWw72fIUO1WZxcQmrVirF90FsmRmSa8Raw==
X-Received: by 2002:a05:6102:568c:b0:4b2:5d10:35c0 with SMTP id ada2fe7eead31-4b2cd7c13e3mr26206153137.10.1735501603874;
        Sun, 29 Dec 2024 11:46:43 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:46:42 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 00/20] alienware-wmi driver rework
Date: Sun, 29 Dec 2024 14:44:47 -0500
Message-ID: <20241229194506.8268-2-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

Happy holidays. :)

~ Kurt
---
v1 -> v2:

[2/20]
 - Small correction in commit message

[5/20]
 - Define the sysfs attributes without macros

[6/20]
 - Reworded commit title
 - Reorder variables in previous WMAX methods too
 - Standarized sysfs method names in hdmi, amplifier and deepsleep
   groups
 - Dropped Armin's Reviewed-by tag because this patch changed a lot

[7/20]
 - Return -ENOMEM in case priv allocation fails in alienfx_probe()
 - Assign priv and platdata on variable declaration
 - Drop intermediate *leds in alienfx_probe()
 - Add quirk_entry to state container
 - Use quirks from priv on hdmi_mux, amplifier, deepslp visibility
   methods, to eventually be able to move these groups into
   alienware-wmi-wmax.c
 - Set PROBE_FORCE_SYNCHRONOUS to platform_driver, to avoid racing to
   drvdata after using device_create_groups on [8/20]

[8/20]
 - Create hdmi, amplifier, deepslp sysfs groups on wmax's probe

[9/20]
 - Assign priv on variable declaration
 - Directly return create thermal_profile() in alienware_awcc_setup()

[10/20]
 - Refactored alienware_wmi_method following Armin's comments
 - Fix legacy_wmi_update_led logic

[13/20]
 - Split DMI table lower in the file
 - Rename quirk_entry -> alienfx_quirks
 - Rename awcc_features -> awcc_quirks
 - Make hdmi_mux, amplifier and deepslp `bool`

[16/20]:
 - Only add common resources on alienware.h

[17/20]
 - Reworded commit message: now mentions some blocks were reordered
 - Move #include <linux/dmi.h> where it belongs alphabetically
 - Included hdmi, amplifier, deepslp groups in alienware-wmi-wmax.c

[18/20]
 - static inline init functions in case drivers are not compiled
 - Return errno in case drivers are not compiled

v1: https://lore.kernel.org/platform-driver-x86/20241221055917.10555-1-kuurtb@gmail.com/

Kurt Borja (20):
  alienware-wmi: Remove unnecessary check at module exit
  alienware-wmi: Move Lighting Control State
  alienware-wmi: Modify parse_rgb() signature
  alienware-wmi: Improve hdmi_mux, amplifier and deepslp group creation
  alienware-wmi: Improve rgb-zones group creation
  alienware_wmi: General cleanup of WMAX methods
  alienware-wmi: Add a state container for LED control feature
  alienware-wmi: Add WMI Drivers
  alienware-wmi: Add a state container for thermal control methods
  alienware-wmi: Refactor LED control methods
  alienware-wmi: Refactor hdmi, amplifier, deepslp methods
  alienware-wmi: Refactor thermal control methods
  alienware-wmi: Split DMI table
  MAINTAINERS: Update ALIENWARE WMI DRIVER entry
  platform/x86: Rename alienware-wmi.c
  platform/x86: Add alienware-wmi.h
  platform-x86: Split the alienware-wmi driver
  platform/x86: dell: Modify Makefile alignment
  platform/x86: Update alienware-wmi config entries
  alienware-wmi: Update header and module information

 MAINTAINERS                                   |    4 +-
 drivers/platform/x86/dell/Kconfig             |   30 +-
 drivers/platform/x86/dell/Makefile            |   45 +-
 .../platform/x86/dell/alienware-wmi-base.c    |  492 +++++++
 .../platform/x86/dell/alienware-wmi-legacy.c  |   98 ++
 .../platform/x86/dell/alienware-wmi-wmax.c    |  775 ++++++++++
 drivers/platform/x86/dell/alienware-wmi.c     | 1269 -----------------
 drivers/platform/x86/dell/alienware-wmi.h     |  101 ++
 8 files changed, 1518 insertions(+), 1296 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
 delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h


base-commit: 03f8e0e05510dad6377cd5ef029594d30e6c096d
-- 
2.47.1

