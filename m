Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965387;
	b=qsrhXlpbNbkuiTQwjFuhO3LMvLppGeptxRvKJ3AAxPWbE0PK8nJIrhg0pGMVj7SEShy/
	 4RE5h+dnxpHtM6NnrLhMPxeEakktH//wlyUVMPomTTrIL1mkLw6Qui8L6D4ZgBMTDYyf9
	 MafQ4N0hcgUQLXmmGxKyLqGDK3YmhadRIfRmMPmjOpjmsjNgt+LTdV7OFVpvtTvDgibh2
	 u7W1vopwM0xq9BMMBoBA9vQhgRNwbFuYnwZijaBCAIIJBkiJScNPgl7xar+Pm3TADJPqV
	 uQtGAx5rfgrCTz6IfM82U3PONqjEiTHOnMbVMeNDkqXV9T6a47uBOargjNMIK6/nq1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zQ5JrUhjamvnVOdOCffVZf80O6Bx02k8KhxMXqpf0jM=;
	b=RmbzWYK6N2ATiV3EHP/mIyckmwZKk8icry3KYKdRYNnubUxktMABpXT29TafjDLlMXrn
	 GJMinPB1px1R+voEkmPTM+0CM0jXeFYnpsihN49GKlxHG7eL9HATOAy9qF4dDIgy+Nb/r
	 4XH0TYIzFgJ8PFsiYvord5wGvEUn4o5GIOXyOF/hhPVyWLrD/EOCYi0oRqxbWus5UbAbL
	 wQEFbfhsZx4QzYwjerugNHhkANTKnu5z/kWhQtTEnlrbVE9RLvzDl620XOfoQ9EkdrqC2
	 Rog+2unyBTyTIv2O70LCAV3liek2Dy4DUKxW8qAQvVgzGlbwVtXiIBiNQC11qrTpq3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=J3OL+Vzf;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15030606A93A
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 11:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15030606A93A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=J3OL+Vzf
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4c9abc1824so75618166b.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 03:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793965385; x=1794570185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQ5JrUhjamvnVOdOCffVZf80O6Bx02k8KhxMXqpf0jM=;
        b=J3OL+VzfPEp8l5rIblU5BbBN/i4yadOVbqcnRKbsux2tChDERVw2b1+3t8vZT89OYI
         PaOV+D9ZazBfvTRCx223p6soNriTcOmQYwdQSoV7Yul53zgWrRzRRKA60vWGw03umDxP
         UI8gy/UmqU/LtQt4sfygsjC6dQzf1Z9lGg4zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965385; x=1794570185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQ5JrUhjamvnVOdOCffVZf80O6Bx02k8KhxMXqpf0jM=;
        b=ENfdzFBuVlcdOh1fpX1qncgmBimSFE9qpBC36QMawMOVwKALHYDR1P8uS22SOiJ8Ul
         g5ZYWSU6HsojujO6fBC6Kavhxxo/VA7xTSUZupURu21JwpnVuBd/87qRgENsTlXFtcJC
         q+boDB4145/ND2R9geN7qadrbL8Ot5GgBULSmSAYG7cdWzTFuteSp3EHy63DdpJBhkDJ
         cjNUq9OunfrSWTMUZ7Yyudp85u+OMn9qA4lGeV0C4Do2I7ccaTpazwOWkRzwmykTIdiJ
         epQVSaQFedv/dFTuHIHpskikGoPT/s8M2C84r43nRMW3KDARCuf60iwX7wrZcP80FjoE
         NUeA==
X-Gm-Message-State: APuU4Z+vLlODSyFhyoW2Zqd1t5nKch32DvUW4max1XhzaZi30rJV5hah
	pj28lDHd65WZGz+Hgxi8AonmV3bNh5KEr4HqUEZYvx1Xv7fuGNgf2zS2boiPX6UM9LQ=
X-Gm-Gg: AYBFou0rDGirvl7acevU941w6MIzKSSZZE4dG/yIxuNWg2/88CrWmklGe9vOOhtgPhi
	pyP5eGDn5Oh5RksoZNOenYTsQUGZwSoXXrRwYS5W7B8u9jatw1kf+PkxdKCsjz0a1Z4PNxGoCLW
	fKSl6x4uLzS65zRI1lvzoo5/ZnXe51A4Y/8N9WY+aRf3J6sxQqsZUUI+FphowTxKhLDB1i6PMDk
	n3EuTcd8/Levyu03+29dHdsfOEn1ww+1Kdx1a3jd76TWVLxI4226FpAjGTfP1KB/yLVST3dY7ls
	QcfgI/8iHAaZShh12Lupawo3SLfdGQSmaTuejE21cooxaE1TXSfo/WoZ3Bnmtdm/uafdYuQYaES
	T0FLfsDkw2HDhLe0HuKSJe+8bLMwQI9NRFX4saGkeFxw+wgA71bgdksGel2heHPfhl+AcPEwFPE
	ChpYSlBPXEbDWFpITffyE9+24gHozDgBoJHwrstOYt0tKpCDtGVVV1/vfYL5hXzcqBQDqY0XHmc
	+63TQ9Iqy17VA8fBxwLCPfDMmqzfin9sIItC+yLnj3NCqCdYqtesLCvYNNMpktiwPlrSWq5yN3W
	8hABw8Y4nPMq3Yws4KDO8Z4Ahr1yEpcggl6rbREcORmqL5uk
X-Received: by 2002:a17:907:3e8f:b0:c41:4d5:e97c with SMTP id a640c23a62f3a-c4d3537fda4mr201503366b.37.1793965384873;
        Fri, 06 Nov 2026 03:43:04 -0800 (PST)
Received: from xia ([83.142.187.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm71377866b.80.2026.11.06.03.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:43:04 -0800 (PST)
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
	Arsenova <7z0423arsenova@proton.me>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v4 0/4] platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support
Date: Fri,  6 Nov 2026 12:42:56 +0100
Message-ID: <20261106114300.936782-1-chris@miget.com>
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

Four patches on top of Mingyou Chen's v15 "Merge redmi-wmi into
bitland-mifs-wmi" [1] for the Xiaomi Book Pro 14 (TM2424).

The firmware passes SystemPerMode to Intel DTT, and the DTT tables in
its data vault name each mode and set its PL1 per power source.
Low-power, balanced and performance map to 0x02, 0x09 and 0x04. On
battery the firmware's performance mode is 0x03, so patch 2 lets a
profile use a separate value on battery, re-applied when the power
source changes, and patch 3 adds the quirk. Patch 1 keeps a failed
profile read from aborting system suspend, and patch 4 makes Fn+K
cycle the platform profile.

Changes since v3 [2]:
- Move the quirk after the battery support, so 0x03 is its battery
  entry from the start (Mingyou)
- Move the suspend fix to the front, as it stands on its own
- No code change at the end of the series
- Fn+K still only handles 0x28. Event 0x16 reports a mode change on
  TM2135 [3] and TM2424 alike, so it stays a notification

Changes since v2 [4]:
- New mode map from the firmware's DTT tables (Kento)
- Drop Mingyou's Reviewed-by from the quirk patch, as the map changed
- New battery support patch
- Fold in the Fn+K patch

[1] https://lore.kernel.org/all/20261028112742.674847-1-qby140326@gmail.com/
[2] https://lore.kernel.org/all/20261101161814.1325847-1-chris@miget.com/
[3] https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKyZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=@proton.me/
[4] https://lore.kernel.org/all/20261025195456.43414-1-chris@miget.com/

Chris Taraszka (4):
  platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on
    profile errors
  platform/x86: bitland-mifs-wmi: Support a separate profile value on
    battery
  platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
  platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K

 drivers/platform/x86/bitland-mifs-wmi.c | 183 +++++++++++++++++++++---
 1 file changed, 163 insertions(+), 20 deletions(-)


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
prerequisite-patch-id: 254b8455d8a7f56b730e842207d91bd6904a50ce
prerequisite-patch-id: 9708c81da6b4ed6c2d47eb927efcd64ce4ed2ecf
prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
-- 
2.56.0

