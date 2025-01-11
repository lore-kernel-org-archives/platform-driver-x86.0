Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACB9153803;
	Sat, 11 Jan 2025 18:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736618997; cv=none; b=OvtPtwz9ch7TNmwOIMU3gTYFp4wKq7iOyu9F4KZJ/gbF9FkkEr8pUK/vAEbXreu0kapcwOtymd6u3FdGUSsM0wRaOUmP9Q0VA4Mt8rtF4FPFzd9/Op9bj0LKiA+KksGH8UIxOA3jlU7iDUZeFmsbFdBVsibsHo7s/2u3MOJWWiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736618997; c=relaxed/simple;
	bh=vd1yON8e0QvDkS8oJA8GmobvIVehP6gIdabQWgOXRm0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QoSYdptvqC262JtRhQm9G3kCsa/RYZ31BrdeTQ1bfjvPsqaJB5k16F+tavdcv2q1yUwcNzkax7/FIXDU43lNjJxsMLttRIBn0LlZu0w/OkIvNr/MFGiGfqX3+OY9dtwDHDBi4PG8ikmnEPDKzOerrdue/GybNhF2fkq47Mc/HT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBDgHdE3; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBDgHdE3"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-844c0d5934fso8623939f.2;
        Sat, 11 Jan 2025 10:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736618995; x=1737223795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qn6Anar4Rl6CETn1rVqRT1iMagr1bHcyFOYB7NUSiB0=;
        b=eBDgHdE3meKhci7K7MmK8aeItYmXEQS6OiXSW+xlvGBueAK5rQsJe72jHNk8WnqlMC
         ZPgENFRWcLVGnexPASsqrr5YCPIOi2I8/DvngOfUwZIokxZ33/jH6qlBU/ASLNVOamWT
         I9UBIPxzfxJOICPaqoTTVQjg9GeMAEw7awqST5fvD3oXQUusyqF/Mh4Yh2PrCHqxp6x0
         OhtgzZB0YloqdLkJ8gaCWoc82+c8sVPOVTdPHhZlsND4IbKqRe55chCX40GCfaF+pWbX
         n/ruZmbj2lhR1FMljAX/DLWqJVHmIgRtPxXpzNoBGwzE1uwGfF0sRZUy7hI/TmDckJ4S
         ISgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736618995; x=1737223795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qn6Anar4Rl6CETn1rVqRT1iMagr1bHcyFOYB7NUSiB0=;
        b=hUkK4jMFXU0lu9nw+bgr30rZcb3XjIhdNLm4xdlmAJVwwJgvwKaXb8JBrom6+zdBBI
         2oIqYCpVjWHHKPJ6GzO4HHPXSVULP+JTN8EGAJUsbIkVDIAC0fJrfXpce0hjSUm1IZ6g
         GG2rbHjvk1GySj4RNlL247iSjI5BnQSBZIA3nsdgdmkgEE+ZYWO6fw7CR6IN8mo05RYF
         tcDzF3/v8OJaeJARRJoyYEcN6P1+T01TK2cZiM/XpwJOShCRkXAZJqEFFhU91fztAuqs
         4DOVTkGCgASrEm/PxUcOdAAzsNQEEZvhdRL9gnv2lcUF64LJ2EoXNg+92fcrtaR4LWdQ
         XNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7jRQ3OD6UL2fNNY3yJilXX6L3+VRxR2ooVnhWxa8oM6Vjs6SQVZLtlqiGBZJFWF1bIHXBq3IZITAFm4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQXF56q4t6uyYbWnRHTfKn/VoaNViVLa4+6+5DgmW8jVFeEjbt
	ZaA/hZyGQl1rMSYa1Pyv7fNwctG1fzXiXlG2FREi5mHDzsp0PIUseW1h
X-Gm-Gg: ASbGncsDsU5LpUGlQ/tKIIp23Uz/YghMwzL2PhDgK2gJrjVxSKabiPHBcxkvWYOvJvr
	PKvvam3LHDgird5aSOuY7FKReWsQmYojNnSouSFLzS3s5fgfex0WM2ZgAkXqjRQLpNgwNCzNHJD
	PhCwsWD3EFWF6GSMIuqpiePfYfwZ0so7L2cQBk8k0JGWaB2CQlfKU2+0giDy8BA39Ic/SA78Kgm
	4KG3oOx8qosW0C9VM4FDq/RgHiGz+lDnd2+A8ocXbXtKwl4+nPV7Q==
X-Google-Smtp-Source: AGHT+IER6ATTRad56IhfTfp/AJB26A5t3cXqaLSk8ZIIT1CPLUnSxgbQBxPfZ9T/CsNbU85CwH2oPg==
X-Received: by 2002:a05:6e02:b22:b0:3a7:c5b1:a522 with SMTP id e9e14a558f8ab-3ce3a912bc4mr35405635ab.7.1736618994597;
        Sat, 11 Jan 2025 10:09:54 -0800 (PST)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce697858e7sm2044095ab.2.2025.01.11.10.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:09:53 -0800 (PST)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zijie98@gmail.com,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH v2] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: fix race condition
Date: Sat, 11 Jan 2025 12:09:51 -0600
Message-Id: <20250111180951.2277757-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The yt2_1380_fc_serdev_probe() function calls devm_serdev_device_open()
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

Note, serdev_device_set_baudrate() and serdev_device_set_flow_control()
calls should be after the devm_serdev_device_open() call.

Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
CC: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
index d2699ca24f34..a96b215cd2c5 100644
--- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
@@ -199,14 +199,15 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 	if (ret)
 		return ret;
 
+	serdev_device_set_drvdata(serdev, fc);
+	serdev_device_set_client_ops(serdev, &yt2_1380_fc_serdev_ops);
+
 	ret = devm_serdev_device_open(dev, serdev);
 	if (ret)
 		return dev_err_probe(dev, ret, "opening UART device\n");
 
 	serdev_device_set_baudrate(serdev, 600);
 	serdev_device_set_flow_control(serdev, false);
-	serdev_device_set_drvdata(serdev, fc);
-	serdev_device_set_client_ops(serdev, &yt2_1380_fc_serdev_ops);
 
 	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
 	if (ret)
-- 
2.34.1

