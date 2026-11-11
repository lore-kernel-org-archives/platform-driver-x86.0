Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416655;
	b=jaYBBzHTimIu7eFJ5eFRWqfBct7GWbc1TybCn1NxEn/ys7sdfGXKMprPm1erWDxRH3lx
	 VnlLHsfKmnryfZGv9H8frPqLjy3mlJf7g/pR4oIkEKHwmEJx9OcDAeJpUA9vbUg90LsSY
	 Aa4ac6LPuVYdbuaVtMu5iJO1e3Cp2MX85g2P/dEIPgKWESji2zAWgsE3eF98g2nlbvu2M
	 re+v4F1sEgGW49UfHxndbk4ZzfjYIOAjeVrgb9LJZMpX81v0G3vRKUNLS7Syc71rh6sC2
	 qOZkI1gw1O7SVjYZkJQpfg4CTO/dJ/qINkN3ktG2qtg9QwH9vXDz7MSsB5eVrtL3W2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=D3og3MEI53zysEm81HgrUH/b77qnl1uvybcLOq7j15s=;
	b=vPb727KVDyOO+j3VHH1H0y6InLiHos61GkqTOlDJ6SIF3LNev1zuYlxEh/DassGaqd9I
	 eWdLDqYfGrMqEq7PK/7jwl4XtL1o6W/3gPEcx9I3TtiYQqnZSFT0cMSITZOFudpkfM3Xp
	 ROaUcCdD75vzCZXwX/gU8dcpbYG8eIlktGxZEYBZgmSv6kj5L/z1wV61y/nhSHt85pP82
	 Ri8qw4Kio5TTI0i2/t6B/QfoM9734lrH97XJ5nWJkxI0ropQGCqV29h34ro101u7bF3E1
	 jwDKfbyAmDnNHokd8AYUPODRudDzNVIuJWdj+Ncp7x9yNXZe8/CCRPc6JMl3YkHIvXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=BLX9VuSh;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1960606A338
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 17:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1960606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=BLX9VuSh
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b750e40ce2so3047119a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 09:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1794416653; x=1795021453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3og3MEI53zysEm81HgrUH/b77qnl1uvybcLOq7j15s=;
        b=BLX9VuSh0tGPjDWO+v1GGRNRuZysS856JlySOYtGjbOf3NefuQLksEE4eaLchLEX9y
         0ssKGSWuuJPseC0tWYcvt12rv1aWauXmJ368GEYUXJDcWr/rrzrcB5agBEWvYlJu/7cU
         m7X0lTZe4GJJ/Ea+Gzy0Lvn8psBvzOW5oRvxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416653; x=1795021453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3og3MEI53zysEm81HgrUH/b77qnl1uvybcLOq7j15s=;
        b=q6RlTvF142/vrYxDaROIxixcdhAcV5STbKyMHZbvtcx9fdffDqKe8PncSIQO5xvcI0
         jGDQzi3/9EtdIMo4nbyLUz5uz1nh/J3tfPJe9M6ef6GdVNi+DkbTX2IaPvoyUUS10v6z
         GO9O+fpE9J8OYMEdQN0ul5+hE9zISkOA7gJyMw2W+GM0TZU9A0nqSem+nrklNd9DPPo1
         9f7o6d+QNZrCwHee020dkMJH9iPhaMLaYnZ/CVmncn8g6d/N+7h408Tb5VTGUIAazCsW
         NzXAOvn6hGAboyX1DrPg97J9tANGbwdVAdFIsluOBP3DNvZ+Dq/Gw4mzlSEj8DG2xD4E
         83Wg==
X-Gm-Message-State: APuU4Z9qCWSHQrbYEPHH4JSzc6/kgAPcYIaly5Zt92BZVEGTJuVSTzCM
	mAiAQssj1zhsnZnPHzKHMwwqxZLFPrmuEcr+jDFC7mHlTLC2+lJoVGKjqJ6ZoJNetyA=
X-Gm-Gg: AYBFou0TMZbW3rWfAy2RSgi18fzDeONBGFX7m6YXdaGbJXnRfLdV869DuXCWmxTXyxJ
	beObmpAFGgfLoHP8jrYrYdVsMa43y0Yvqcb7kzPK7FqiWbcRzVohJWz/Zc0CFRgVgMl/HZKSJH2
	PX0L1cxz8lwgjvysLbdPnBgnQFsLl/Mxe+rjKoIR+OQjbPBpCYb1GTCvVEOGl1vNVptr3niDpfk
	nFUhvgAkKcGQxEoqe4WyI5enmB/qQvCoOTZ9EBjzCCsDYknlu4/odZ70eTcpFFDHWRMWiiodqwP
	jzURaFxCSR5ESilip7kQr9u9ryle7F3iVOO+/2vW1Yp5k8E+IWbEXR49IasErJTgPRj9gMNsn0+
	e223a0JPvIe7Oin0Yn4xMCvy9KW9J/S6SNd/6d1UFp1vmpk9K9kObfBzbYBZO61D4k2sjxmtQHy
	W0zl4BAdnmLf6SlAyXlU+la6xCKN/d5QaUYJ/7pYZ5+nLA7jNMPppTY+oxDu/pQb/XkQX2guQfk
	AEUQTJhKfaLmUa2RWS3WxM8ASVqaU4WGH9zOUzicW6JMcmyWqtTKbAvutEqyxudX2fHTnwd8vQ4
	txfq2YUKDAOGVWEoaSNAt9GUOamjOeI0tCMJCh3zr8kCZFGR7KFK1uoKlsQYBzhOCJNR3h3e0Ua
	pf1DmGs1OO1rk/W28r1bvvoApUDc+/zthC5Dn
X-Received: by 2002:a05:6402:450a:b0:6b5:875a:c2a0 with SMTP id 4fb4d7f45d1cf-6b7775eb13cmr2291718a12.24.1794416653066;
        Wed, 11 Nov 2026 09:04:13 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-106-110.play-internet.pl. [46.112.106.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm871660a12.12.2026.11.11.09.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:11 -0800 (PST)
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
	Yun Wang <7z0423arsenova@proton.me>,
	Oleg Rybalov <rybalov.oleg.dev@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v5 0/4] platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support
Date: Wed, 11 Nov 2026 18:04:02 +0100
Message-ID: <20261111170406.1634428-1-chris@miget.com>
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

Four patches on top of Mingyou Chen's v16 "Merge redmi-wmi into
bitland-mifs-wmi" [1] for the Xiaomi Book Pro 14 (TM2424).

The firmware passes SystemPerMode to Intel DTT, and the DTT tables in
its data vault name each mode and set its PL1 per power source.
Low-power, balanced and performance map to 0x02, 0x09 and 0x04. On
battery the firmware's performance mode is 0x03, so patch 2 lets a
profile use a separate value on battery, re-applied when the power
source changes, and patch 3 adds the quirk. Patch 1 keeps a failed
profile read from aborting system suspend, and patch 4 makes Fn+K
cycle the platform profile.

Changes since v4 [2]:
- Rebase onto v16
- Fn+K: cycle on 0x28 for every model, drop the quirk flag (Mingyou)
- Add Mingyou's Reviewed-by to the quirk patch

Changes since v3 [3]:
- Move the quirk after the battery support, so 0x03 is its battery
  entry from the start (Mingyou)
- Move the suspend fix to the front, as it stands on its own
- Fn+K still only handles 0x28. Event 0x16 reports a mode change on
  TM2135 [4] and TM2424 alike, so it stays a notification

Changes since v2 [5]:
- New mode map from the firmware's DTT tables (Kento)
- New battery support patch
- Fold in the Fn+K patch

[1] https://lore.kernel.org/all/20261111141226.9482-1-qby140326@gmail.com/
[2] https://lore.kernel.org/all/20261106114300.936782-1-chris@miget.com/
[3] https://lore.kernel.org/all/20261101161814.1325847-1-chris@miget.com/
[4] https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKyZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=@proton.me/
[5] https://lore.kernel.org/all/20261025195456.43414-1-chris@miget.com/

Chris Taraszka (4):
  platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on
    profile errors
  platform/x86: bitland-mifs-wmi: Support a separate profile value on
    battery
  platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
  platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K

 drivers/platform/x86/bitland-mifs-wmi.c | 175 +++++++++++++++++++++---
 1 file changed, 155 insertions(+), 20 deletions(-)


base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
prerequisite-patch-id: 290a15f4692b36391eade807db324a974a4c1f9e
prerequisite-patch-id: 48f575fda0c7b1d4c66179af98a7f8825666ac87
prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
-- 
2.56.0

