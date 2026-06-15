Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A984309F00
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514650; cv=none; b=UIcF9/7pqI2yuY5Hz0pH41OilnnSsv/224GYZNWmt501tg2bB1ORq7JBlDLi0MqlLN4uHEUIllJU9Z74W4di7m22pFuZzeHz9UtBcDOI4XXR0e9ygATQRS0+UTxibazpm1W17T2qZ9PIUn34P6VhVdJ5NhGFIlVZCiO03evcikQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514650; c=relaxed/simple;
	bh=PUO5VGljKV6lgXHGFPyuJBQh8VBwQ7JTz0YQdgPQMgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=REWu38BjS+zct8d252IzUN5NDh0CK2+fpBvifHho0lo5vgv8USHJ7DKCNnBL486+buOqyxuP9+MmgWNcX30epX32Iqic5kAzK8RZqze031vJt8XlaWY1kybXvYMyeN1F8TXVqmj21xIUaAtsPVAXsCJ1uRSLBqGquadvBKakDm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsISV6pl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsISV6pl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8434840cea8so1782072b3a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781514648; x=1782119448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+8dZe3bf97l46QPmdvU+g27Ve4/VmT28lCcUHvGZ3g=;
        b=AsISV6plqrwuK0jR11h3k1x+5wi8VuNp7LZqsSf/6LQGRMKx2lkjzeRDzULSKlEJH9
         wk7RdqPGVQMuXv87PYuJjFfKMz/ox6LhA88k/nkqcIU2lGwyhstisKTtjj5rwl2uP7Sh
         htaJijLE9sw0pwuZbDH0PNVNjWj4f/QLZXGgytrqW4KGqJSgVIT9pTVPEQ6+RjesEqfJ
         JJhwGHpbAwvMUwBMx5TPlk9wswSkvVfM7s012cxjh/W/j0+DLTpgY9395BwfTLp/61i7
         G31xwXj8FiLyzJbIpEr+e7gZ0SzywBIH5IHYFbpVkzHUhKaJt7ZRYlHwyQmBdA49hd4W
         3Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514648; x=1782119448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+8dZe3bf97l46QPmdvU+g27Ve4/VmT28lCcUHvGZ3g=;
        b=C51ck4T3wfXI2NBxpXs6uQ0psQM2Cyi4CKq0EouhSM8x8MyF+bBSXyiUi5sIg5mbGf
         Dup+8PcJwuxbfHH/HhIcOwgos9ATNHasWyMpoEYqQ5Fb8nEBCjhKHlExW+rScNBYCg/c
         mMZPWGou4Y9X/uvtkBqTMNd4rlsDgRWuIljlzeAhGe5arkxuB3ckJhtYIbl+FLp8GMoX
         uVTB2Mi6YX/QqdnNKMtBPVAjgVlhTLtKweDMMV1qsHaevmnpSbDmAlPFLokt+TV3F6YS
         8FkBGm/fe2bo6Me7b6DmbmNcA7xW5s8sP/4EAe0f5/qZCsFpt/885AZAg6g+96X3WIPG
         JoPg==
X-Gm-Message-State: AOJu0YxUuLq/1oBcow2XcRF2gFvwI+E7F6xnXzJt4F29oSOPynuoNm+x
	7YeUOx0xZIHtNdDupVKuiFGz1Rv9DdjZxZYWH9XaQ13+yqvOgKS82w4Ld4pnKAvH
X-Gm-Gg: Acq92OHjtkm9C29B1SC1lgCe8k3K82abqU7SWy+XttMHXVm2ew2pZJ7bI4RCXSZo97j
	xkWrgHJfQJ5/sADHnETwrP+8Wzwi5OBVeioEcuBl9Pt3fr6sB7i/jA4Y/aqkcB+SLAbnxBTS19a
	pFokegLSgoxy+HYIQ2F0A03Qrkm3XCibbe1axeyVO+pwdthIYpyFqJQomQFmhfyAI8WNL6RaXay
	jGYyHHqq4jj8wKvy8SZ96shXjyRD0MHXn030hVRyXeJFMtKPyv7GZOTtLHKJDTeElRSnnYXwgVS
	A5i6KFfB0y8S8/LeDjSqQFg02yvgkO4jxcHDYiN9mJgzWAL53WbBrUDZAiAQe5HLdfw/vLFmqa+
	PCPIDcMUb4Nbtt8g1OGWF+2zq6sduoPHCvjy8jKGLS5nF9Ighz50AzRbD2xZzjT7uzUVe7rVYDw
	y7YJIKSedZE/QUoaOqKQaGhuo2I9GG7sFXN2UHv0m9AkRxeA==
X-Received: by 2002:a05:6a00:2354:b0:835:3f51:730e with SMTP id d2e1a72fcca58-8434cd24381mr12977337b3a.13.1781514648408;
        Mon, 15 Jun 2026 02:10:48 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:172b:de82:f342:993b:860a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b00d4c7sm9392459b3a.40.2026.06.15.02.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:10:47 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v10 0/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
Date: Mon, 15 Jun 2026 14:40:31 +0530
Message-ID: <20260615091034.987029-1-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a split version of the Victus 15-fb0xxx support change. Patches
1 and 2 are no-functional-changes-intended refactors which move the
existing thermal-profile and fan-control decisions into board-specific
.driver_data. Patch 3 adds support for Victus 15-fb0xxx board 8A3D.

v10 rebases the series on platform-drivers-x86/for-next as requested,
now that the recent hp-wmi DMI ID additions are in that branch. It
preserves the newer 8B2F, 8D26, and 8E35 board entries while converting
the table to board-specific feature data.

The gpu_delta fan-table parsing fix remains out of this series. Ilpo
suggested postponing that part to the other GPU fan series, so this
version keeps only the board-data and 8A3D support pieces.

8A3D is added with both the Victus S thermal-profile data and the Victus
fan-control data. The existing generic platform-profile sysfs path on
8A3D accepts writes/readbacks without hp_wmi errors, and the Victus fan
table/control path exposes working PWM control.

Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS
F.22. With the series applied, the platform-profile choices are
low-power, balanced, and performance. Writes to all three profiles
succeeded and read back the selected value. In a CPU stress test with
powerprofilesctl held at performance, low-power reduced CPU package
power to about 30 W, while balanced and performance both ran at about
47 W. In a light PRIME offload test, low-power also kept the NVIDIA GPU
at lower clocks and power than the other profiles. pwm1 and pwm1_enable
are exposed through hwmon.

Radhey Kalra (3):
  platform/x86: hp-wmi: Introduce board-specific feature data
  platform/x86: hp-wmi: Drive fan control from board data
  platform/x86: hp-wmi: Add Victus 15-fb0xxx support

 drivers/platform/x86/hp/hp-wmi.c | 210 ++++++++++++++++++++++---------
 1 file changed, 148 insertions(+), 62 deletions(-)

-- 
Changes in v10:
- Rebase on platform-drivers-x86/for-next commit 3429ae7b2f02, per
  Ilpo's request.
- Preserve hp-wmi board entries added since v9: 8B2F, 8D26, and 8E35.
- Reuse victus_s_board_params for 8A3D instead of adding an identical
  victus_8a3d_board_params struct.
- Keep the 8A3D DMI match sorted with the existing board IDs.

Changes in v9:
- Resend after one week with no review comments.
- Clarify that the series follows up on the earlier v6 0/4 review by
  dropping the gpu_delta patch and using the tested Victus S path.
- No code changes from v8 because the target platform-drivers-x86 branch
  had not moved since v8.
- Recheck that platform-drivers-x86/review-ilpo-next and for-next still
  pointed at commit a167ae8eace5.

Changes in v8:
- Resend after one week with no review comments.
- Rebase on platform-drivers-x86/review-ilpo-next commit
  a167ae8eace5 to preserve the newer 8902 hp-wmi board entry.
- Keep the gpu_delta fan-table parser fix out of this series; it can be
  handled with the other GPU fan series.
- Add Hans de Goede to Cc per MAINTAINERS for X86 PLATFORM DRIVERS.

Changes in v7:
- Bump the version because v6 was already sent.
- Note that the corrected 3-patch version was accidentally sent as v6
  after an earlier v6 had already been sent.
- Keep the gpu_delta fan-table parser fix out of this series; it can be
  handled with the other GPU fan series.
- Keep 8A3D on the Victus S thermal-profile path after testing profile
  writes/readbacks, CPU package power, and light PRIME offload behavior.

Changes in v6:
- Drop the gpu_delta fan-table parser fix for now; it can be handled
  with the other GPU fan series.
- Rebase on platform-drivers-x86/for-next commit 5fdac9983681.
- Preserve the recently added 8BC2 board entry.
- Preserve the 8D41 switch to omen_v1_no_ec_thermal_params.
- Add 8A3D with Victus S thermal-profile data and Victus fan-control
  data.

2.54.0
