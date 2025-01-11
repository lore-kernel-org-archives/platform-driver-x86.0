Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28047372;
	Sat, 11 Jan 2025 05:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736574460; cv=none; b=Hib+zCrAZWnqfA5w8Tzc2fJJwuJrdABJbO2pCgoveRcZse6JCq7F4tQxiMdvvxniHhjTy9/VW36X7rSir9xLlmkph8ofup8nPR1m7ro3CWgU6H/r5mgPp5M90zbKAgj+yH0yciULUM+UOOkknhqtu4xYOmL0jhj/cQkzOzpRn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736574460; c=relaxed/simple;
	bh=bQpJaOMWdT4MazdkjrAukrXvt4SIu5IrMePG+kBnNoM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pkh/yDyvo4Y2dq7wLm3GeCWHrvy3Cw50b8nEUh+sFAcuXc74nBeoMJoQP0kRv/U0CET2C7kcQZCk5bkhRWsjzkXHI8xnljupE0a5Sk66CwPJhU5zyw2pwi54TwnyNNFHQKm4C5cDzlvhvF3zMlzRnjgeCoubVEwwEt4fXW09Dmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGlTBcjt; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGlTBcjt"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3a812618bc1so815515ab.3;
        Fri, 10 Jan 2025 21:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736574458; x=1737179258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nqy3hUMXBLqTshl0Kne8uMHjwI9ItLObnBiRXqIgRzM=;
        b=ZGlTBcjtRTGJbz0C4hpKaaENUvf/JYPkB9KwVgIT0hAUvQvP029SUxw8eQvGCJVbgT
         D2E3Eymu/rJDZGTuY/rhOy4bz4EjyHBeYmF0E/tSTIGBMIso7eyZpsz09Qh3oJhYbHlX
         JBTaRo3J+yKPGK/1pUT4rRQKmBNj/YYBbQiXsxDjM6pxFXO7LQwkks5QjM/CEaqdunUe
         U24oNjlLdtybBNcT14NvEyRhdk8KLdp4XqA5hMuTbd+Bi2TwcBp7zj7esO3UBK3bLGW6
         ZKTHwlssyQsR1DcB538fWk+6z+BDvRmT7MyA9olTitomHtWMFFLmsX5UAtYblOSWl4qb
         4Tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736574458; x=1737179258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqy3hUMXBLqTshl0Kne8uMHjwI9ItLObnBiRXqIgRzM=;
        b=URUC5vlo8IezTKPSBE90Ctrc/+IaHJRa0A6zzLQErvtAnQeuhiVv+iLx/W/GpnNJfZ
         S6u2c1agLrxHh7m1y0R2v92iGMDwrjTzKU82OQAJozKfgdc5RoUcN7YCozLiA/WEv6Ul
         ODAazDkpBcCzjO2om+rUr11PXHYQfuaNiY3epFeo8HkMbLbSaaW2+gg9a14yX2EAzbWy
         NSiF7ZVzC46IfDTsP+dXbucJyq8nXwYe+UITjzYeRMTp0wbizbji87rnYVYcVu/OGUt8
         bXMaFZK/n6kf9EEjEXqHQrKnLaOvoAw87QRRXXURzCWaGx3MK8n4msqb60CCtb8NyU0B
         9FTw==
X-Forwarded-Encrypted: i=1; AJvYcCUl2lucgjI0YvnxPvYJ4tN5VOolH4WUiyN4LgHayMEc3yLE14cKBKmRktY+UKjL8BUPPISjPpizgByRPJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFN4sPFEJ+gKHVAATr5NYBtvcFVaYCRBKtCsITCsTOBRxab78t
	syeDW6mqIJuh4O1hs0L51EZzhSuRjdmMrEhyQXy6NEhnfXpy8/c=
X-Gm-Gg: ASbGnctbG9HsdMaoIgw6c3jXqPe2DPM9jjW1PdOTN/pJNxO/qO5VPqmGWhJ3cyYoBJE
	kWqMQhiKkQ8CkOH9b66d558RSMdEiBKwYHohlq+3/OF+f6aAt3Q9nzbJw/IKi8sQDKlhG2v7lSo
	YQE5FhTzlXH/+IMrY/UVUM4WMImnXzZJIqN8VRiA87L/tjiUPlTICRsJNb1px4gAbUz0olBxztA
	BFnlrvUEtFzzr2ZSdGjLfijWWn0RiamppU57k8J1JFaGIheJdr/2A==
X-Google-Smtp-Source: AGHT+IEtcNScmnhye4osThZaSMJQ2ckyCfvvCnrbx5Rc7c7ig60Rm0qTilgFvrRxAmCLKx5Nu8I+pA==
X-Received: by 2002:a05:6e02:2164:b0:3a7:e9a1:8fff with SMTP id e9e14a558f8ab-3ce3a8bcf48mr25806975ab.4.1736574458206;
        Fri, 10 Jan 2025 21:47:38 -0800 (PST)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b717652sm1312253173.93.2025.01.10.21.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 21:47:37 -0800 (PST)
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
Subject: [PATCH] platform/x86: dell-uart-backlight: fix NULL pointer dereference in probe
Date: Fri, 10 Jan 2025 23:47:17 -0600
Message-Id: <20250111054717.1830450-1-chenyuan0y@gmail.com>
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

Fixes: 484bae9e4d6a ("platform/x86: Add new Dell UART backlight driver")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/platform/x86/dell/dell-uart-backlight.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index 6e5dc7e3674f..41162ff1686b 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -283,16 +283,16 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	init_waitqueue_head(&dell_bl->wait_queue);
 	dell_bl->dev = dev;
 
-	ret = devm_serdev_device_open(dev, serdev);
-	if (ret)
-		return dev_err_probe(dev, ret, "opening UART device\n");
-
 	/* 9600 bps, no flow control, these are the default but set them to be sure */
 	serdev_device_set_baudrate(serdev, 9600);
 	serdev_device_set_flow_control(serdev, false);
 	serdev_device_set_drvdata(serdev, dell_bl);
 	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
 
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "opening UART device\n");
+
 	get_version[0] = DELL_SOF(GET_CMD_LEN);
 	get_version[1] = CMD_GET_VERSION;
 	get_version[2] = dell_uart_checksum(get_version, 2);
-- 
2.34.1

