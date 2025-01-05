Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCE1155C96;
	Sun,  5 Jan 2025 15:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091064; cv=none; b=ijqynjX/WHwdjkh+HzHJ4GGA0nJN+md6goHBUSDWh9LUf7LMYgZo4Fn1PZmqH6p+nuzSPGAaJKjuJZ86gTQlsV2hsi9WIuDobs8Uh24FV+izf2qSr77Ez6YLZ5x2srqf5PdQL2ncFeiGflx9mkFnxCQ6dqxilYvOWecH8SwOHPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091064; c=relaxed/simple;
	bh=OrSGkSGpomt9YyJIWrwnD3U4JtImBGxbNVLfDfPzucU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGmon14QSn9uDrLDuNRB44NlcGlXux3PbSWKWzgNz/rkxBKroqphEItPNRua2/mBYga5Z3Cx5Lt6nFYmdgWZekr8RCBf07ryYc4k5E83YoS3EVUVNBH3+8Ux6kgg7S1wfQl7pc+7Nq9NMCmJIX/VCpaEM2zWXv+5aD3RTFek8+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeYqGQyP; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeYqGQyP"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afe99e5229so3839247137.3;
        Sun, 05 Jan 2025 07:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091061; x=1736695861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kvU0CLP1zmfEnxL/DLViUDP8yBNg6t/F8nScT2U8XNU=;
        b=JeYqGQyPzmihBO0kpUOCA1fFXX00oCxQwL9AEJzrCYUL5iT1cfkabfRGVu+dHiQQms
         gUuioy0V20R6dyzBK2de908EHs3/QLiu6eOkFYY0vqDzuG/J9KatJwcQp+8FKlcZ9qQQ
         fX99WImYtX8NXZeywnSjdIlg47Oy+K0Y+u4J2FUIzxRVPDp1MqTXk1JGPwCQrb9U6dxp
         ZFUyuqIxgDdjqzUMPvgb4PU5qjZNOkWM/n2Sid6B6+VhqKSu/Qm+IDUW6mA7vuPyib9P
         +4ygy8evPf8vovx8q42KGmpPZ7+ll9rQD1IF3N8AJRv92lpOmD3kqFSH7MeGKLj0nukD
         iYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091061; x=1736695861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvU0CLP1zmfEnxL/DLViUDP8yBNg6t/F8nScT2U8XNU=;
        b=egC7SRI9e5bA2mpJOnP8v4O4iEd7JJo4xBo0uGiuXLJsb6i0xgn/o85c6zRxssPkoJ
         2DLlBY6q3t0LquFphLO11fZrhqrBOhnfH7LfDMCXz85LChEMcLrT0I4srYbe8wUFr7sQ
         qqHJITp3L2dU+rlv+rB8JuNArwUIxxlzpv4Zd+MJWhP+CqQooBEKnmxD6AUQ+f3qm9Ym
         7sKrJANC4KMjZphguNKa/j7gcBCmHT3FWw6oZS9xQKzaA2hgp0nUPKpkjY6rlNp+FGH6
         6QQS1r5zP4N54kERdbNrPccwb4NOA0GPYDeL40JTSRQysIvz5Nksp9WgggT5MZdSYps9
         YgrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs6ti34VPUm5koIQuUEZaJ5kLb4KyOyHUHTce+Ex9nz0WfxwGmfPZGbmqXt2yN2SINQsTCM4+fCPT8Vy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT9jHf9oI7pvmDKcQ7oP1c95Ju8oVeWszC9A3lQz/jJKcT9RSf
	hxdBo53nT3jkGiwv9U+Lq8pzIu0l95c79CD3VzpTpXyMRJV9c1WC3U7DaA==
X-Gm-Gg: ASbGncteCY2HnBdSAjJJbbatDe+Bvjgyk+5fPjuk26nwtcFU77y4qoIcSwtlFMQHVh5
	AbaSqbbUyyAzZp7ZxxfIvQEWCqu5MU7VrtJPsOsTqMP99j7zEHPUfunVL5njK0HVCEKKEaw4HAo
	OjEzJUULGF0PMCXAUJEZzO8MaaBIFxkZFpK5SVSquvFREGvlktKAb/eoK5EB2OTGSp1vHFKYChZ
	HZ8p4LNG6nVLfCRZ2JjGlAjvYD1f5iRkQP72MsZYy3CmlrhoXSnqKgyv1Za1a8J
X-Google-Smtp-Source: AGHT+IE6xRalwW27glpl4KpJjLm2Ms8V5HKrV5TmE2Hs/Nk5aXXwhvMdX4M4MZJzQiUc8d2k+QLlmA==
X-Received: by 2002:a05:6102:dca:b0:4b2:af93:4313 with SMTP id ada2fe7eead31-4b2cc462517mr38604042137.17.1736091061008;
        Sun, 05 Jan 2025 07:31:01 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:00 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v3 00/20] platform/x86: alienware-wmi driver rework
Date: Sun,  5 Jan 2025 10:30:00 -0500
Message-ID: <20250105153019.19206-2-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello :) 

I rebased this series on top of review-ilpo-next to pick up
alienware-wmi's latest commit.

~ Kurt
---
v2 -> v3:

[5/20]
 - Use traditional if statement in zone_attr_visible and return attr->mode

[7/20]
 - Remove quirks from priv

[8/20]
 - Call alienware_alienfx_exit if device_add_groups fails
 - Call device_remove_groups on .remove
 - Return ret on alienware_wmi_init()

[9/20]
 - Directly return create_thermal_profile in alienware_awcc_setup()
 - Assign priv on declaration in alienware_awcc_exit()

[10/20]
 - Fix alienware_wmi_command()

[13/20]
 - Rename x_series_features -> generic_quirks
 - Rename g_series_features -> g_series_quirks
 - Keep previous module parameter logic
 - Additionally rename *quirks -> *alienfx

[16/20]
 - Export *alienfx as an extern variable on alienware-wmi.h
 - Move pr_fmt to alienware-wmi.h

[17/20]
 - 2024 -> 2025

[20/20]
 - 2024 -> 2025

[*/20]
 - Add platform/x86 prefix to commit messages

v2: https://lore.kernel.org/platform-driver-x86/20241229194506.8268-2-kuurtb@gmail.com/

Kurt Borja (20):
  platform/x86: alienware-wmi: Remove unnecessary check at module exit
  platform/x86: alienware-wmi: Move Lighting Control State
  platform/x86: alienware-wmi: Modify parse_rgb() signature
  platform/x86: alienware-wmi: Improve hdmi_mux, amplifier and deepslp
    group creation
  platform/x86: alienware-wmi: Improve rgb-zones group creation
  platform/x86: alienware_wmi: General cleanup of WMAX methods
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
 .../platform/x86/dell/alienware-wmi-legacy.c  |   98 ++
 .../platform/x86/dell/alienware-wmi-wmax.c    |  767 ++++++++++
 drivers/platform/x86/dell/alienware-wmi.c     | 1261 -----------------
 drivers/platform/x86/dell/alienware-wmi.h     |  104 ++
 8 files changed, 1509 insertions(+), 1288 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
 delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h


base-commit: 6b228cfc52a6e9b7149cf51e247076963d6561cd
-- 
2.47.1

