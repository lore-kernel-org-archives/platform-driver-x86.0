Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE1237266D
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 00:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814760; cv=none; b=uVDatUSkhsWLXJQLCjRP5ghjTxK27soW1T5PMaeFMLbRbi45PKCpaDCsIivfaVgxfONH9ljwTkmV6F+DUe/KM+e9Xi17bIDgCQL/w7ZhsMpS/DhmJBNaaray0AjLzFycyhNuTlU+FXFVkG3j08ZlZAE7KUZkGoRzfdZMMta6pP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814760; c=relaxed/simple;
	bh=x7Xeqy22CeVPYIZ5A9Tn9NRH39uHncyxeijFI0NRiNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wg5ppDDpAVYM6sI9waljleGPSq8b35nf6aEycCAVDyBYLbKHbv7x7X1lnFLqzwocUSOYV+hBHGE9nEthpU23Gydqk5z5NYucBTqji6+IV/NEq+FEOpo4eDS6+Vc2b+utHECqQPkLBPDxb4Cvj24+UuXcNMweWrKmT/RfMrrRDsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6lhTWti; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6lhTWti"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d1403bbaso1005384a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 17:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814752; x=1791419552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iv9L/+HVFnM7i9eClWaaSdn+muF0U9djx0l6n2F2CZA=;
        b=L6lhTWtieN697WJWtvFM+7BvL6AROJz9ftrfjGQ0d91XmUhjqNbJyoaNZ8EBdwFfk/
         kikyZyQo3JjMgzjYCcnB1+dX0Q3ZbbXeorfuFzheiX2VtXurNCnRYVeKspnLdOhUOABx
         GTIeIXJI7SXL0ZE0So371pxCFEk32ZES936iEZyCmMdhMDEtxc/QFXwcb/bVIsJ0Lq+d
         Yl1g9jql2nqNadqG/iUQsMXDqeJUMqroyDYGV5S3icZnZ+P+GWLMvVftA3mTtuhNsUMu
         H5Xu+eLwKiT2oEr1w7mUnm9YHqXe/baSU6wOmNWdjZvmtQ9lhcOYvKO4cJNtXgxUydJL
         EIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814752; x=1791419552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iv9L/+HVFnM7i9eClWaaSdn+muF0U9djx0l6n2F2CZA=;
        b=Y/1yVZFU7qQBYoxCLZSgRJVZs9EB4v0xRoaIwA/KixilcKbFhRbuho6iiKDMv3ByG3
         d4PpLDtXE+kfFHoRQEaKuRK3WP13AAAjGdqaXP43OytKpB5eKzDE6Wi24lJYHgrNJ72R
         wV3f36bsLy2719I1J8FDLKdsBfPB9PktDO/ZriYaPkYfvLpIShP+DQcSYKx4/Du8PeNe
         Kx2BqDtKOkmRvf3oVvCZ01p8IqwS/OJTfeUhq4sSUhhvs13tpsa+Da1r7SH0fXremcMq
         T+3D+OcQrC8Sqj0OPQDy7Gd1Q8qVBlMLSGrR77GWgAUJ1Soer7sSaj3oq7z56kv2m4bm
         X64w==
X-Forwarded-Encrypted: i=1; AKwUvBxsWufW4Cxy3aISpyX3tmux3aWT+pXE8zWvQO7PBItL/GrjiYH3Nu1UdXLYUN3VgrkpClDaTj4N0IOAd3oicLIfYScO@vger.kernel.org
X-Gm-Message-State: AFq9FYKuAEUVae0JoAJ83IWzzmGXSe+0kTmMW8a6+xAocmPUTVbNpoyB
	u30A5ERA6Rl3XuRhbM2atgwoeVPoBiCrbFkEDAViLU1aZgoD+ulpiNaI
X-Gm-Gg: AYBFou0t1uKOAYmfIsIXCuMKl7XD0odVhR+gAx7/AOoSf4PmkxL/jSXeIm0moPyiN4r
	Q7AG6VUuiJR6dYUT5rl3d70L8PQyphvtJlhdAdA6+CKb+TQ4tPyNfWQnVMYG4skiPM3htB6phu4
	c1g17xuCA32wVxcUjkx4vUH3pxx/lCYE3+qAy3WqhYZwgQlNIImNDNs7G2Ogf92zwse6sh1yAG1
	fdjgW4ITaK+93YYQaWrnbc6xV9YzXIqqy16MU3BJKcMscr1tbc9x89Uc/fahbLz7gi+AFtoe02Z
	n0BgANRuA2gFzsa4ZQt3tJ00fajcKt8W2D1vbtepjg0Q6/C99420Z1/6UJwW9zMxRu+X3a1HUIE
	LPGssFzBKhyTsDOywrIGDn7TRD7Y0Qp2v80ljfRLg0OSyiFsMWu4OntvStFKdW8Hs5Yh1eB30+w
	HV/624PUc53yIpx9xjWUPt2RnZ2Qim7E6BRX9A/jjCYeNMGerGxcL5
X-Received: by 2002:a17:903:2d2:b0:2e2:c28d:ab6b with SMTP id d9443c01a7336-2e2e43d3ac5mr23912735ad.0.1790814751860;
        Wed, 30 Sep 2026 17:32:31 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b58345sm3161615ad.66.2026.09.30.17.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:32:31 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v7 0/5] Merge redmi-wmi into bitland-mifs-wmi
Date: Thu,  1 Oct 2026 00:32:13 +0000
Message-ID: <20261001003218.39421-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations were not contained in this patch series, future reverse
engineering is required.

This series introduce a newly reported mic-mute hotkey definition
for Redmibooks
and dropped the previous redmi-wmi driver.

I don't have a Redmi or other Bitland device. So I cannot work on the
real device.

Features are working properly on my device (Lecoo Bellator N176).

I leave the future reverse engineering work to the community.

v8:
Correct Ilya Gladyshev's email address in the MAINTAINERS entry

v7:
Swap low bit and high bit for WMI_EVENT_KBD_BRIGHTNESS
in bitland_mifs_wmi_keymap
0x00800501 -> BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),

Report KEY_FN_ESC when WMI_EVENT_FNLOCK_STATE events received
Rename the reserved names
Use Xmas tree order in bitland_mifs_wmi_notify
Collect the Tested-by and Reviewed-by tags

v6:
Drop the wrong Redmi ops

v5:
Correct Xiaomi DMI vendor name

v4:
Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
doesn't support full-speed mode.

Mingyou Chen (5):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add per-machine ops table

 MAINTAINERS                             |   7 +-
 drivers/platform/x86/Kconfig            |  12 --
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 259 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 --------------
 5 files changed, 195 insertions(+), 238 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: fe5030c8cc7156223f48530e9b49aa87c0305bcd
-- 
2.55.0

