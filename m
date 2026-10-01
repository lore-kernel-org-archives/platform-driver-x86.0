Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83326345CCE
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 00:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814182; cv=none; b=A2RzVJGACPAMStXIfQq+sqYfnIuutOQjHjbzg+KDyN+lc3cYiTNk/h09K48SVLVQ5lkeaS3lo72yHbP9ko1BI99mZR+qztWJ0Dfije8842W1l8T8e8lP5Jf97qup45eENaFhaFdxRmgLjPl+q5BZDvoWcsNTAr7tpYJKcGwShdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814182; c=relaxed/simple;
	bh=6JKuVrCOyZr5HvBv8gGEzuGBdgsojD1fi1cYQ2T3C+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Twrzp/ph4cxChoFxKSEdF+P3AjcBHR65mf/E3f3br1zD1uCKWYY45mn6JQJrw/x4jc7fDgTnW8g6LXp3lQw2JNEIHbUNU1SFlUZFEi5UJgvT+MjIcnxHRDyD1ZO/866Ryshz2oQDpme3idP8MHBMUVsk+9yrDrBlp3VprMYSPKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJIVEB4H; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJIVEB4H"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804c1728f9so4591537b3a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 17:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814178; x=1791418978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2gyWQPmKEWea4fs/1x3Y9NNC2VkP5t/q0sEoQj6Zxw=;
        b=EJIVEB4HqBi/2/hreY/LPnluQTujBhkAFUC5CS0IUmLhcXpyMmwzqPdhDYu2UeIov9
         GYNdm7zhvunftufHmKo8Lr/YurOFp1DB26GGZJSXt9c5e8x9pDBmbm/llIutW84zPUWO
         qtOT0nk2eqPX1oG/N/AlT7fvyTWED0nLROu4G49KS589RYUCeLHGeEg1nD9FbRvDuZk2
         OiEi8Nv1iEmbWWWNGIAZCY5wUXPD/7iB5sC2X46j8xByyDOcVw7ZRF435U8ebXoYzaPR
         TEOG7+AQIj7x3x1/BaChO1ukpjLujSRNjWYKD9TPpCiZiKH3LtVyEqjnh1OyRdgC2ZbW
         VvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814178; x=1791418978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2gyWQPmKEWea4fs/1x3Y9NNC2VkP5t/q0sEoQj6Zxw=;
        b=fJ4Y36/nKfQtzrLuRMMDqQxtBgJVvV8C4iK/Z4vO0qmN4Awwokojky5jJhXOYNpmd2
         wgpN2g1kFOGaPYItt8ODkShs6SXiqq2mXGOTnTolb/vnsvdqbj4GM+S7w+lW5OVqANLS
         u8m6jHSqD9GAGEiuTk0uiXSBDWIDsqYlrNSdQocP3w4h1ugrF5zYFsDeq9Km+5K6IHOq
         XAF8yy8K2pVJX9lYg+DgVD9dgq8CEnYEf2MwEIYOuJz3G1H1DndCiHpAF9XrZN+Gtibj
         5RjR7g0X2g8Bduwe1yAbaBdMZjmSEwPZYehRSoasI4yNLBu9Mk4l5IFg/wZacFqfPH07
         VSdw==
X-Forwarded-Encrypted: i=1; AKwUvBx0O/w3F5kIYxucIMYA63FICrSLo0ehTdielelG5G1oqpRKKHPkepHwjuAnXLta4katl+8PDNXuBv635BxpxpwyYAUt@vger.kernel.org
X-Gm-Message-State: AFuF++mqZMTdXgiP6C8dH2lkfjsSxnmZdjAhQe4Dv7VqNVcBlAm9JUgp
	PSAXJatfQWk96EDa1sxkXKWeNMbRR7uGjxsyEuVqLOPqooQ9e2NC9GDF
X-Gm-Gg: AYBFou0eFwgKo/rLFob/qRbMPbMoU0FdBoWzbEy4B+KT8VfBQ0M3rdtDTP2IR4+sqU5
	mZAqyUfCofxjqdX9/dIm4NIdVVBIzckSbjj5mNJAZyG6i0aGSrnYUiBNyEh26EdREhyBodCAwgg
	aI7xiJaAqVEurdezO2d8AD4UD18fuqYcJ7vM0QV5t0ZAfTO0QktuFpINKJ8f+D2wnRKGPCF0qvm
	9so+CLdD7wknMGR1TAv1VTB1rbQmd7Lxrh+o6BcUscEg/HKQxYyFB9nvacgXihXhaaceliF+2HT
	sl/S7MXmKvRGrurinWP9SAobQSmzJjvKverzkJ+vwFO/135XHRanDniwyWg6s4iw2VlVQpx9fzx
	ZdAdxPle1GWGqCIenQ3//ge59bdIeSFKx3Td5vL9yhbtP99RtoisEDod5C0ffdiG9rot8802iyE
	nDYjQk61IJnolvTflCGq1IyU+n16k3LpzH+CDThgXHKxTXC0POqqu1
X-Received: by 2002:a05:6a00:1885:b0:851:8baf:5b26 with SMTP id d2e1a72fcca58-8874c4de843mr2761065b3a.14.1790814178486;
        Wed, 30 Sep 2026 17:22:58 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818deef3esm247601b3a.29.2026.09.30.17.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:22:57 -0700 (PDT)
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
Date: Thu,  1 Oct 2026 00:22:34 +0000
Message-ID: <20261001002239.31461-1-qby140326@gmail.com>
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

v7:
Swap low bit and high bit for
WMI_EVENT_KBD_BRIGHTNESS in bitland_mifs_wmi_keymap
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

 MAINTAINERS                             |   5 +-
 drivers/platform/x86/Kconfig            |  12 --
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 259 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 --------------
 5 files changed, 194 insertions(+), 237 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: fe5030c8cc7156223f48530e9b49aa87c0305bcd
-- 
2.55.0

