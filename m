Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E906C3B1EFC
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 04:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780635462; cv=none; b=oPW2HbNZgbRUTdub800Y5/bV+tf95G3U5oUKfx9oi2c0wm/GlEL+fOpJJEf46b+xXlO47H2lwXZf42oYuuHW1BVQfRkXJh4ET1U5BPb1LKX8G6vv73/6Qmyhhb1GWEnExHaevfiMD6wptGnWAx225MzKpYEplnsjxgFNcjOPeFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780635462; c=relaxed/simple;
	bh=BBq1vcJ3DGzb/phnRYiOPHgZvzH4Zfsw8MBSn9d6ADQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W92jfrSrERSf2dV0AMt9Gi2RIUtJ9wcaD0O+rgnaoMbMs3rf+RsjcaGk3XiVZrvFc5cw2tnpk4YT7LJ71y7dWpADf2TmKxIGGnNq6ezZfGE9ypBaSSYaiLktwd00xJhauK6bWExoR9vdMBCAN+V09ZXDbJz37wUaqktgsrdU7nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBl5zPnm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBl5zPnm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf30d530bdso15214645ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Jun 2026 21:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780635460; x=1781240260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LkXpTTx7nmx/SLLGJ3KBaxSxsnhZK0UGgkmV8fFj4mk=;
        b=sBl5zPnmQROZM/0uHV9mU13XrVSW6JqAvmK2QuDZ9kflYiY/etB9vEnIL+IiEc/l9U
         F6Jm8e8vOhi3te+Lj6enxk1+gX0rY3Q1FIRF/iw8egHPKmes8uaXw46qJ9wIWK8vwvwV
         JslsgqUvzKV3qPcGlSnqyT4PhFjInf+cvqaniT/NRrFmOJy/aLoQRNkwF5Ep+Y7gsL1a
         8csKymsyfgm3CpiNK4TXaDwFV76BrXZl0W4BHXApaHiVAnMd8zkeTYJG0BZHpofl/opO
         Co/H7LRPjzVT4dtU2Xn7nRI3njTprneZ8BOo5OlCj4XN2JU8uiKxfV6QGTopvTjxGdbU
         qxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780635460; x=1781240260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkXpTTx7nmx/SLLGJ3KBaxSxsnhZK0UGgkmV8fFj4mk=;
        b=dbj+Dv7vRTMpabHSjhMOTcKuQA1qE3PVIwZOtZgK0M+nprzw0D07NJa2w3tdy1yc4T
         oIJf40ZA7z7ACYjQs8VB5yHIli9dX1psv+PCb6qyFW533vdnmLfnmCtWg+1+fvCP3Rme
         h10TGsu8GExGRH0Nta13dCRWDrd5Yr1H+WjjWOSJ3I8MoNSdntgh1Pltx92z4ixoo7uu
         Xd4gvvOi9vEdRh3YdX4ka+xwZc80VcpRsW31awvEgv6Cr2/31Q9wQTD6643erEDZOjNc
         puMpnJgPreGmQzMPHpvVI7Y6IEAvUgCBsKYHhuHG76KRw3lGMspVl1Kmrnaqyiqpw1ax
         X20Q==
X-Gm-Message-State: AOJu0YzDwW3RCvZ7el3TftvY8OJxHgmDaLqupRKB5mRLGTv3wO5jqDkZ
	DqH1hlYz+IxwKFMpHx6NtE7MKMnrApIC+9ItE1HxR5K3jpygNOdpgDIC
X-Gm-Gg: Acq92OHJzwI+5zWazoIE/nvYrnp3p0pqcS0yuHD760BfADFg/n83iktBw/n78kJ1ukW
	CEhedyI4ZVjlG/AYstRWoqD+S3br8sHW5atIEi/KJLcY8jnc7c8H8YkxBQUDhI8nSEXIQVH6l9W
	MpUkmdG0+0p2yJUW2epuZ34tVNmhSvAwatT6Jzc6sEuIkH8i2LaercBEwa+LyhLp7CjLkHFH6zP
	o8SBT+SJb2Bon0E9K4W8+/+yNUrmhiv8P7ZOXjHcuKZwsxx5ww72azLr7+TOYIM2gjp9mdp3Qvd
	KbR7XmoFPJAV1zcE2Kwx/7kx/IVJ9WIdCADc7V1sFizWAl0qMPEvZc3sGFvQN63MK1m9tgGyd5l
	r4/FpG0wRCLTspa1qd1/HG9kAqkBAPcr5iyBP9No7dFVGEuTpks6LcehjGgCRo5Es4yCdF0y5xC
	EBGjb3q8rat1zFA1wFlQ2YORa3zIfBihjcNi8rKklpCKtAjQsdOBXeEOtCs8NKyciIKGOTK+cqg
	NvX+yWkG/yc9hK1fC8i8gl5zi8=
X-Received: by 2002:a17:903:b8d:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2c1e835b26cmr19090915ad.35.1780635460246;
        Thu, 04 Jun 2026 21:57:40 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm75093325ad.73.2026.06.04.21.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 21:57:39 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] platform/x86: asus-wmi: Don't warn when fan curve method is unsupported
Date: Fri,  5 Jun 2026 13:57:24 +0900
Message-ID: <20260605045724.6907-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fan_curve_check_present() probes for fan curve support by calling
fan_curve_get_factory_default(). On devices whose firmware does not
implement the fan curve WMI methods (e.g. the ASUS-built Intel
NUC15CRHU5), the underlying asus_wmi_evaluate_method_buf() returns
-ENODEV, which fan_curve_get_factory_default() reports with pr_warn()
on every boot:

  asus_wmi: fan_curve_get_factory_default (0x00110024) failed: -19
  asus_wmi: fan_curve_get_factory_default (0x00110025) failed: -19
  asus_wmi: fan_curve_get_factory_default (0x00110032) failed: -19

This is a normal, expected condition: the caller already handles the
absence gracefully, and asus_wmi_evaluate_method_buf() already logs the
unsupported method at pr_debug() level. Suppress the warning for -ENODEV
while keeping it for genuine failures.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 80144c412b90..9b12a9e1eb97 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3538,7 +3538,8 @@ static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
 	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
 					   FAN_CURVE_BUF_LEN);
 	if (err) {
-		pr_warn("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
+		if (err != -ENODEV)
+			pr_warn("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
 		return err;
 	}
 
-- 
2.43.0

