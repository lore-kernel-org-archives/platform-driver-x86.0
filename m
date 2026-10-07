Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D949BD96
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377981; cv=none; b=AIanE6MrCIXT1SKvXeTwtPDPlxJ/hLv9OoB9IBgm4BiE0BS7PXnKDJsWghSRxXOJFag6yzLaScHjbI1If8p/ACrVrKDQdsbFb3OMpmMrwfpynZtYR//m1WwUv+FBkob/7g/fTPUivbUS0VEEHqkfWJGFWYEdjEgXioEefas90Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377981; c=relaxed/simple;
	bh=l7SkYiVt+inOyWQ8HPwyTsHjpygqZZlkOgPatJPOhU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgldSvvaHBMk7qwmK3vWeDDIJsHdFtoE4wWmWEYzVh+Ra2akNvpONi6Z8C02O9x4nsxCk8zUqaTrSyURn2OgoxVtLDIvBzx6q8QiFjRT/jTcwWGgwenHhlYYzlYq4lhGWI3THHgCkX+a8DO0ztHZFM5WN47PitB0JXXzuR7cxWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+HcN9ld; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+HcN9ld"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4649b35bso4040511f8f.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791377967; x=1791982767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jVQcZZB9AUNKjVqndRWHW4ED94+PoAgxgHXAlUExYI=;
        b=m+HcN9ldeMpv3OjaPUTuX/h3+IvWnp0RLaLgW9ted77MAUIgJOF5U5iLeEvXq11neU
         4mNPxUB0FT4Zj3NCO1eZgko4c9mRz7GRM73FXNlR50QZRB4IJyGcZ9smnGuNYM/2KsO2
         27MZIE1n90PpRcZqStO/5IO9lTk7zgBR+avsUfYKg4nudwZH6xRlDlkilatS7cTF1DP3
         13CxucdAKlNF5Xr/JRauKADIGk+0BqHBpJljspbW5OavpHz8WfKQGqSoOpHAoQqV5Oxu
         jFCcpwDrWEQwnj/iMg6lWUNG9VvqP9Uh2APwJ2C72goY+AVbFS3J9khPNh3CJsptOoGN
         NO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377967; x=1791982767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jVQcZZB9AUNKjVqndRWHW4ED94+PoAgxgHXAlUExYI=;
        b=NRYhvK4UVsheifY5D7sZuz508A9GQm78jBo609wZX5zz1okUeYTPXgjeoo/J7VVsiW
         Esw4+GC+QyaoxveUxHk+vybqeNmoVmvkCOYGHoZTNqgMd/Hnjb+28/DUwX1JO/6lGulB
         E5Xr84CNaRF5U0Inb5g7wBt92jM+itzjHGhchjHHehe0HJ4TaC5qUTdMFaaYgC2g/isp
         Q+YPjUsBv4NRQgs+vp6NnthbbYBwG0MbsIkbEuQljbacBqhAFWnh5RJVllAlziRyihzI
         BwXcce06AmMrDzV1OsA92IfSjsOFqIJChP6K/8fZICQ22ESbmgmQHLkcJqKWVx5tbWpJ
         RRag==
X-Gm-Message-State: AFuF++m2BgnKpfU/DozzvyhC+jRfzYNgGAMuIKGCrvaHSUwtHaR89PeC
	7UWgMPv4T+svPqnd3qxBxkBJ8l7d1bTT0i2kWjMNrqwla8dqP246OWzYYvkAFdTs
X-Gm-Gg: AYBFou3wtzWDJxgzFAr6LUpJEi/2gJYiAkVy0FAjTScyc++FDQmbSFAN2jEvSZpgcAT
	MVDS+R/0lovLDL78lHXgIlIyPq7FuRWAokEKqYAICpNBGLrUDZse0L8m+ar0UZMMoM318r4EZ+5
	DRDX8OAOQUvFTWIp6IerJE/QsfNb/BivzAHKcu0pDNdvxKrhm9cTcVKHIJvFMECCG/Up1m1mflt
	H2aWH/ERvoPSBEThoxrGwO24YEUfPFe+Le4wawNBt9Ko5RnLL/j8/l8n5l9OTAdKAPO/871qorj
	SniARBNPnPR2BZ3CSRnnQbTrVihwOKCOLYURpMSKcQ+vJPbHp+MhN3iMsgVeplIJChqY19TzFSp
	5dMjAgvVLha8flj+AKZbPDewAyabvKY7iCtmFNtPJ741RtM5MKFTPCk18qb2zNgqQCBtJIC5GQU
	4d128UIuApOpkEb17Ji5Wm1QzIX17nBA0cGk31++oAMdoH+yzIRB4QgRTYmyf/2xP1FT57xxqZ1
	yeE2hyc9wf9dJB7kNnJw8hKIZ3/HmTDviWfzF8TLT4=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a180660fd4mr42344425e9.27.1791377966649;
        Wed, 07 Oct 2026 05:59:26 -0700 (PDT)
Received: from PF5R4XJL.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm105304145e9.2.2026.10.07.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:59:26 -0700 (PDT)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] platform/x86/amd/hsmp: Unify per-socket sysfs metrics
Date: Wed,  7 Oct 2026 14:59:04 +0200
Message-ID: <20261007125908.321186-1-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Erwan Velu <e.velu@criteo.com>

The goal of this series is to ease server monitoring, by exposing the
HSMP metrics the same way whatever the driver, in a format that is
straightforward to integrate in metrics exporters.

The per-socket HSMP telemetry attributes (c0_residency_input,
ddr_max_bw, pwr_current_active_freq_limit, ...) are only implemented by
the ACPI driver, although they are plain HSMP messages the platform
driver can send as well. Systems probed by the platform driver therefore
only get metrics_bin.

Their location also depends on the driver: AMDI0097:0X with the ACPI
driver, amd_hsmp/socketN with the platform one.

This series moves the attributes to common code and exposes them from
both drivers under a single /sys/devices/amd_hsmp/socketN location. The
existing ACPI and platform sysfs paths are kept for compatibility.

Patch 1 is a pure code move, patch 2 adds the socket devices and wires
them in the ACPI driver, patch 3 does the same for the platform driver.
Patch 4 exposes the pwr_current_active_freq_limit_source bitmask as a
single hexadecimal value, whose interpretation can be centralized in the
monitoring stack (e.g. Grafana value mappings).

Tested on Zen3 and Zen4 (Family 19h) servers with the platform driver,
and on Zen5 (Family 1Ah) servers with the ACPI driver, in both single
and dual socket configurations.

Erwan Velu (4):
  platform/x86/amd/hsmp: Move per-socket sysfs attributes to common code
  platform/x86/amd/hsmp: Add /sys/devices/amd_hsmp socket devices
  platform/x86/amd/hsmp: Expose socket attributes from the platform
    driver
  platform/x86/amd/hsmp: Add pwr_current_active_freq_limit_source_raw

 Documentation/arch/x86/amd_hsmp.rst    |  20 +-
 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 327 +----------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |   6 +
 drivers/platform/x86/amd/hsmp/plat.c   |  20 ++
 drivers/platform/x86/amd/hsmp/sysfs.c  | 466 +++++++++++++++++++++++++
 6 files changed, 517 insertions(+), 324 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.c


base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.53.0

