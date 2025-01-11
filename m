Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0BE1494CC;
	Sat, 11 Jan 2025 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736618486; cv=none; b=Z+IS8+mDTvJoAYdc4TJsE27jWs/fHjkP3yuzOwbe27un8n2WXraAfButyQhvQK/0ehp1fT4s6Lia/LA/ZD+fbSpgDRBsXR5TpovoK/wB4DpdPUqIBtp6DuRpUSXwI8SNijNVsi6svJ07a+Px5wrI7llALwaeYSoxssYC0UHsBxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736618486; c=relaxed/simple;
	bh=amKyJsG4QV+Ogvz5udtQF9s8EL13Hwhft1HrfrIkeg4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i0RVFBpRaqxT/dBb1EyQYunxR6l6gQsNciIuqWiCIkkOwQa1vPaoV6/lIXtCBbvz34uS+Q0gQpXNmz5Dnx6oR7s6JT3AxPx4NnaA7NG+MZulj8FlwwKSorMx+h8byeGeUoyIKCZFFnDUcH6FGi7e3kMEnrUZ6FUdRfQkazfu1nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LP3rbypC; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LP3rbypC"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a9ba99a83dso528025ab.1;
        Sat, 11 Jan 2025 10:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736618484; x=1737223284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxhQOYOiM8QelpakPdF6JB5h0nibIIy2wWJ4hGX9iG0=;
        b=LP3rbypCyM9GAX6Sb5pHIN2xcHHBeYK6p6Ncc9zWzYrHXaRhTgrHHD58qXxsnFRQGE
         X4szXBT9FQypuRHB5ueb41LmGx7NVjF6nApGJikc81lv3NtAinMtgxhM9Rn7GF0YJYny
         D6gmeM5eiT7awr1MMB8O4CWy+acH3iqSCz1crzArB7MOWhDT6D73vQKvWNLehV9CeH/W
         QUBm3TvCByuLTjROAuQI6q5mLpFFOO929+VaE0N3Lc6VZ3f0ScuSsxIO857EUGCQOGxt
         h7fKCZOxcsVB0BtifOGkOaIA807c5AXQoRXLFn6vXwYtQNo/qoYw4QLV6ys58w12x4LT
         sNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736618484; x=1737223284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxhQOYOiM8QelpakPdF6JB5h0nibIIy2wWJ4hGX9iG0=;
        b=MQPByNKOzzBPJg0MAd/0UEcwqUGuHVr0BNXZn9uCDeNpAlAyejEfQp9Yb8tR/xm2BN
         AtauhwOgxwZl5gs5mFRg8niqGf3Qp3snng+5idy673xgJohnE0BniKlWCzfzjM86QJ6u
         +K4YNh/rj9h9yGtLXWJbzgdw+rnNkhtcEsHdBvW1QpiqrUiLOgsy9AE24UREv0bZ6eDz
         vKkkU09/q9mvC11Q4H36+NKwBGigMNY42Nvf7uSxCNt2V+rYHp1xtXwxEwjZR//9LUfm
         byeF5n/zrm5/rr8DgADfOoNxDbsHgt3H3IdyDsM7s48IPcbN1LtqgLdhrpRbJWa8E62a
         Q9UA==
X-Forwarded-Encrypted: i=1; AJvYcCX1oaO7q3FPLyUkJkZWCOxiBoBu+6q6wKlDeMw1PBQmQ9/1higMHlLb0JuIHT61yB4cfGib6vhsLzAI0TY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeAUFw3dROB1q/sGViXRmz4+4EZesm8uKVgFeP0DcmpiYZ4tf4
	oQxlYWuuzyJX6p97/c/B6w5AHNlHceRMX1M4doqjbfww81DD4WA=
X-Gm-Gg: ASbGncuRMYJQCLniKffezWhkTAmrQQ9l1/WEwpysDozZbCSf7oeWbR1/nshKnIBaQxV
	/Z0gI4W39DK9KTa9EaZTIQw89cNSAxD7gJZooFJjEyC6ASyxUg2mxL4mZOWpyPKhCd0QXqOsRKW
	lHkn01pCJEnVTw2lG9qZ+v5uk0lvmIQoVhh3+navNL822ZrbvZqFLET/+DsPb9gKNAo0S7j9l3r
	HaB4sh3D0DtALsexVmku+4nJ2BCmfhk5yeG3PF+dm38qmVKAgS5Qg==
X-Google-Smtp-Source: AGHT+IEwjroKgakvosxww/1cPCLlTQv9xnzI14H25ElVVEE5DeLLWLqDG+exrSmSWc3Nj3N7r4NowA==
X-Received: by 2002:a05:6e02:16c7:b0:3a7:bfc6:be with SMTP id e9e14a558f8ab-3ce3a8f134dmr30459665ab.5.1736618483791;
        Sat, 11 Jan 2025 10:01:23 -0800 (PST)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b74a17dsm1650308173.132.2025.01.11.10.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:01:22 -0800 (PST)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	rafael.j.wysocki@intel.com,
	acelan.kao@canonical.com,
	u.kleine-koenig@baylibre.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zijie98@gmail.com,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH v2] platform/x86: dell-uart-backlight: fix NULL pointer dereference in probe
Date: Sat, 11 Jan 2025 12:01:18 -0600
Message-Id: <20250111180118.2274516-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dell_uart_bl_serdev_probe() function calls devm_serdev_device_open()
before setting the client ops via serdev_device_set_client_ops(). This
ordering can trigger a NULL pointer dereference in the serdev controller's
receive_buf handler, as it assumes serdev->ops is valid when
SERPORT_ACTIVE is set.

This is similar to the issue fixed in commit 5e700b384ec1
("platform/chrome: cros_ec_uart: properly fix race condition") where
devm_serdev_device_open() was called before fully initializing the
device.

Fix the race by ensuring client ops are set before enabling the port via
devm_serdev_device_open().
Note, serdev_device_set_baudrate() and
serdev_device_set_flow_control() calls should be
after the devm_serdev_device_open() call.

Fixes: 484bae9e4d6a ("platform/x86: Add new Dell UART backlight driver")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
CC: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-uart-backlight.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index 6e5dc7e3674f..bcc5c0f3bb4d 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -283,6 +283,9 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	init_waitqueue_head(&dell_bl->wait_queue);
 	dell_bl->dev = dev;
 
+	serdev_device_set_drvdata(serdev, dell_bl);
+	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
+
 	ret = devm_serdev_device_open(dev, serdev);
 	if (ret)
 		return dev_err_probe(dev, ret, "opening UART device\n");
@@ -290,8 +293,6 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	/* 9600 bps, no flow control, these are the default but set them to be sure */
 	serdev_device_set_baudrate(serdev, 9600);
 	serdev_device_set_flow_control(serdev, false);
-	serdev_device_set_drvdata(serdev, dell_bl);
-	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
 
 	get_version[0] = DELL_SOF(GET_CMD_LEN);
 	get_version[1] = CMD_GET_VERSION;
-- 
2.34.1

