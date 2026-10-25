Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958103;
	b=Ll9jHUmWcahUBprhYMHVoCkFlkeGQbt+xL19HP4jJ1eE+vlHiB4daMu9GwngsFGSyab/
	 7xoei6niN4Theku+5ZyK5//mc76qd/gMdbA+talMyA3sKcRbGinEr7VAKG6pVTDI/+zjb
	 oyLi+gLS6H+Y2QWqZrHkhiN5qlYzN/6aGxQ2PXExEYJwtyHclIuSBV8nx28TWxvrY4qLT
	 oA+q2GbgWh4BHWFhR9xTHo2bm9CoL+v7geUacRw7kGaCY7LhGgtHxQUJXApdgpL/Kzrsu
	 c5odPEVENMiIhGTw3vzV42GUhnfT+K7NrVwm0fWEjAXGGn+Px67WWPDK460aWkz8dUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=77x1qiUZRiKVIGGrVBjtoX70xNoRq8JAxKSgRXShqGM=;
	b=NK7rb5wuidmetrQLP4fFNSJLflpVjs0NIjL4ZIB1b5n3kx/KB7K2W9OPaCuAlOlLBO+j
	 y4u40bCtyyg+HDiLyx5J8Qv/tGMlx6oGMyKF97aWOexNA0P01Jz6SomTdjpuXO5YBtKDJ
	 sw/GpgWWmDbo817ECNGCLw0D+jg7kp2Iko3184m6391+EFv5eRYBkGvCnboPvv3TXt2vT
	 gVfipPTm8UzfWzntPyhCR/9hiK1C5OzGECO/KMEv3K/xS+iu4L6ztRDCJYI7SsXE72Qqr
	 KdP8KNwbWbbpfJEk6a8R5FHB6TR0M8Z+6pIbnMAL/mEOUpiUDXpoIDhFj1+q+bgcjiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=WtBcFVxl;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B2A606A31A
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 19:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B2A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=WtBcFVxl
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3376938a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 12:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792958101; x=1793562901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=77x1qiUZRiKVIGGrVBjtoX70xNoRq8JAxKSgRXShqGM=;
        b=WtBcFVxlmTUpy9DpkgFamxaPrQ5IIznZ3JEWiFvXxmTFiFSjWq4eGipJm3wWGY+E6F
         m7cGtU3o4U0+JCMTg5FCciB9n6KlDXcdZwskzS9lXKfecIoxL30n5lyimfUVvRT7KlKD
         2zcsBYUrayGwQpfNU5Xv3Gvc/NKV+Bxd02QuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792958101; x=1793562901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77x1qiUZRiKVIGGrVBjtoX70xNoRq8JAxKSgRXShqGM=;
        b=RecFgI/3T1Bx98ocI/OtsMKlZjkz5kp/yZO9urKrtvuzJb/aX8frNLWpIfq7WqQ6/x
         KggWlWGsDahSUqRNvHb3k38nUGYowyRb+qP9vxLxAgOB/GAKMKUyHttJmtmu1YK11iyv
         uCCoFD1Ufo+TlAsarN/h6/7tfEBYVD1eaUqukIvDw8l/cbQJwQkSOyhxYOoKy5n0ZV/k
         0PqOBBHCXLiiC0d+u7yqNxH6h3Q8gzk28KAZEv42ni/fjb5jeTvh8bDCddgMyeMGHJHD
         a848QhnbEaaAN3z+3m/Ua0kYwGRR1/DgtaX5MPJbLPsgQiE9dPxGR+wjlYYy8GdO5Hyo
         /n9Q==
X-Gm-Message-State: AFq9FYJ4o5SLurFL4y4CHScavMPPG20uMkt6TwyBOBCXReUVdG898K33
	eK3zoVq3qzcjWbFJjeeLaOJzFS3DsaANf57AoqbDFT9P2Rf5R51qbVVXjeljdMWKva0=
X-Gm-Gg: AYBFou3G35P2oMp6MCPYNObVdpm+EQhthjYk+OyAFuEssxXeGRBZBo8WBBiwy3cw89V
	ZWYY1ttyiAttprOaCYA5G6SpCuFV+hsGzh6OQxwlJop0vx0vqXVzOwMZwb61sljlkqtx5LPjvNR
	Saae6GVpapOrsqipi2sav2IkplNRypTXoPHXBTX8Szq5Ib0pcf57fUx4wnWivc2amEx1cloZ05e
	tTtw/Reor03zDFW/ZKm8Ccqxh4DphKVy2QjniX1j010MuZeIXniWr2qzPteotZbp8PD6PxyZ485
	bUeDPnUA4VONuXLsoscf49waqO1dmOUofecNhWnGEXyxvMxDoqHRFe5r6CE2PlnhPAZQ2hcJbei
	vJcbPV+DO43sqienH73JcBdS06HrRzx3MTk7JnQhgeOb69CHqsOmxoqQq6hiELbwd3bPMIAKOeA
	u0JxE2LJHmxkrPX04XPZxvYCb5BPvj74cqoB61rtTGbVFoL6EDXxCdPg9kANiOi+keRrLjUuD7n
	axW+puQVDRz28fotZR/N1kyvymyzPDJ5fNtRTVTKPy13ELsyWX0Se8uoOFsL3dIYPL4cUgwS60=
X-Received: by 2002:a17:907:3d88:b0:c46:bbde:734b with SMTP id a640c23a62f3a-c46bdddf2f9mr549261166b.32.1792958100776;
        Sun, 25 Oct 2026 12:55:00 -0700 (PDT)
Received: from xia (user-46-112-84-81.play-internet.pl. [46.112.84.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea620sm238279666b.23.2026.10.25.12.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:54:59 -0700 (PDT)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v2 0/2] platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support
Date: Sun, 25 Oct 2026 20:54:54 +0100
Message-ID: <20261025195456.43414-1-chris@miget.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two patches on top of Mingyou Chen's v13 "Merge redmi-wmi into
bitland-mifs-wmi" [1], which adds the quirks table they build on.

Patch 1 adds the Xiaomi Book Pro 14 (TM2424) entry. Patch 2 stops
platform profile save/restore errors from failing system suspend or
resume.

Kento proposed a different mapping for the same board [2]: low-power
as 0x0a (which also dims the panel and keyboard backlight), balanced as
0x09, performance as 0x04 with 0x03 as fallback, and no
balanced-performance. This series keeps the four distinct firmware
modes and leaves 0x0a to the firmware's own mode cycling. Kento, if
this is a problem on BIOS 0707 or 0A0A, please say so.

Mingyou, on your v13 question: with 7/7, accept_zero_function is not
needed here. The entry does not set it and every SET succeeds.

Changes since v1 [3][4]:
- Use the quirks table from v13 instead of a DMI conditional in the code
- Match on board name TM2424 (Kento)
- Suspend fix also covers resume and skips the restore when nothing
  was saved

[1] https://lore.kernel.org/all/20261021123414.25516-1-qby140326@gmail.com/
[2] https://lore.kernel.org/all/20260929144703.700966-1-kento@kekto.ru/
[3] https://lore.kernel.org/all/20260928153902.139956-1-chris@miget.com/
[4] https://lore.kernel.org/all/20260911182131.461415-1-chris@miget.com/

Chris Taraszka (2):
  platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
  platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on
    profile errors

 drivers/platform/x86/bitland-mifs-wmi.c | 43 +++++++++++++++++++++----
 1 file changed, 36 insertions(+), 7 deletions(-)


base-commit: 9d3475065167197742b0882aff21cf8e78393277
prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
prerequisite-patch-id: 2bbb1371b506f5a07a1e6e69d34217195cd5ffcb
prerequisite-patch-id: b88e60d7915ad055b67478359bd9c6c9482d8433
prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
prerequisite-patch-id: fbf70405992dfa75ed02026d97aa16e1644fbd42
-- 
2.56.0

