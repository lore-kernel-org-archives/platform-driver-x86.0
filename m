Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0135A387
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940567; cv=none; b=fHEujYpeefWrn5gtfOlEvv8Bqp96oZpMwjiMMiiQeJT3hlS6cvx8xH3EY3gYsIUwQ7xCBoKOmm4vVwMYMWKWQVHN4UmyISRkfDqu6LpIxYliuYZB/OuptvkZWchLP7sazSTyecGrlhrWc+w86wGWVIVxOe9sd2sBxxBu1jTJ8lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940567; c=relaxed/simple;
	bh=XdMxzd8iDKQr5PS2zIsnUUypJpLDZzPkZaQ7qmg2evU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSv1aKEdpANv6OREL6AIlO/ZboX/7hGVNStDYCRJvtBA4g3VSa0cyNgopVR/b6C3y9ew+1stiBczivXPzTUUUxwBv3nlCkt7Wx0UdIY7yf1zLc69jkfIELtjkh89HUgoEyyUQRfkt7+fsY8lZDusMs9b72itRZ7x1rqTaSGWuic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=Vv6Mp1Qt; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="Vv6Mp1Qt"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so2576502a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1783940563; x=1784545363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFFSD3/CjVLS0ezRz/CdhSHYIzRiivgohq9ZOTv9sGc=;
        b=Vv6Mp1QtQSZ0TwbktUQjHmCzOuOnyqIkcvYujltX5uarPgxHuEvLrfQUW0Lwnbg7oK
         4Zn2kucqQaHe0LyQyy5kZ+OFNBcQMV2IO3cVFV4jjXIJ/jF3jVTWrirkNNaVXUTr472R
         MKPhAU7bkTfXX9WgFREkhBsGzrE+Q+j2cdnbItXAtYKFcOWeR24F8mVFkMOP3jCBwsIt
         cRE5Tp+XMCp0+w9Bq5pAUODODLuCWlrzONPwC3GRE1kgNwkzf+JeUz20gio5q65Zc24a
         nFOHMgG1nkk5ly88hw0dDanZsMTOvlFGQiscoy7OWFhvsBd+kb3Td4XX3uKUZQRM6BPA
         LZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940563; x=1784545363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFFSD3/CjVLS0ezRz/CdhSHYIzRiivgohq9ZOTv9sGc=;
        b=jglMNkn0jDuJweBoIBpLgminP++CKQeMurmckg5XKr8BsMkW3FohhBBR/LPmynicbc
         O3cip56z+g7mmwuv/YO/SAi5qG7ubZBWtDsncTkkJXq2IrGdtYGENkUVOxgNyoObwPeO
         vr7U7euGf7w5iGG/yihbQPAIyk/Z3neac37Pp3EbkM1teoFO8N0td8OIAnz6Pi4FxzqE
         7wEpYmqW+jwLTcMyDVFCRNGbRee35bjYTP32WRpjwD3EArd1M+9mWM4icEquikN0CJsp
         ZAefXMS5Mobwai3C8dpQ8MvPfDinYwyLVdwZz3AUG+uzv9IGdFkJQgiXQlU6CyEv1+YA
         nsqw==
X-Gm-Message-State: AOJu0YwbKTmiAP1ceCa7Je5yh2hX9HjoQTo3yp6GvVSAA+Y/XCjFBAxY
	NIFl7fDs7/RBDCTijzq+lODxBB+y7YXmVMBcsAzfidqyE/9QQblj56h7RTtEk61Y/Tw=
X-Gm-Gg: AfdE7clTHvIrFu8RCRFO8HYP7tpQPjTqOLtTVNJpK9LvSpzkuKu/NOnaqsAaG8p0Zco
	erCDMFCkG5pZ/X6ukErxogp/kMqDRofPwDnT52LIQE8OYo6pbdAeQhv7v6IcVcS+4fwdJL5a7Fi
	r/aoeiYmEaFUkuVPyTi3toKHuxDm1GxBRsaoqkYCb9gVnDdsUHlKFg0VP/3SIvumodo4l9Cn+0s
	21n3KJseEutQU/2X6YH2If2+pI9EOvVNrxAS9HTwg6t2xrimU/+L7moLwxYfB8Az5ZQbVCD3Xlm
	8/SjEuBFnIrNc8Iwcpc+nSX9CSJ2LNOEw7Cyo4Y0Fb84VEbu50uGtLp38mquH/RmY9iq0DVtDJJ
	pyeG7LZ/2JMilKFHBFM5RSkm8NH0YlBdC0Xn0mVHydAQJsPx/hi08YpKG1sL71fqUylT6kh3tr0
	MS0ODuT446DUuaP3JMClxCGl0Dj+ZeFQ6tQubfEyYGbJvkfLmqXH51JIHOmH+a5QNIYCrv4+SP5
	EWOOLNPQYUE6DD65qgPdoVjaKzqIIiLtnQ=
X-Received: by 2002:a05:6a20:b7a7:b0:3c0:9c1b:d0b2 with SMTP id adf61e73a8af0-3c1108c2c0amr8860918637.61.1783940563499;
        Mon, 13 Jul 2026 04:02:43 -0700 (PDT)
Received: from [127.0.1.1] ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm52249087eec.22.2026.07.13.04.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:02:43 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Date: Mon, 13 Jul 2026 16:32:24 +0530
Subject: [PATCH 1/2] platform/x86: int1092: Fix potential memory leak in
 sar_probe()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260713-platx86-v1-1-c8991bff03a0@cse.iitm.ac.in>
References: <20260713-platx86-v1-0-c8991bff03a0@cse.iitm.ac.in>
In-Reply-To: <20260713-platx86-v1-0-c8991bff03a0@cse.iitm.ac.in>
To: Shravan Sudhakar <s.shravan@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>
X-Mailer: b4 0.13.0

The memory allocated for device_mode_info in parse_package() called by
sar_get_data() is not freed in some of the error paths in sar_probe().
Fix that by converting to use device managed allocations.

Fixes: dcfbd31ef4bc ("platform/x86: BIOS SAR driver for Intel M.2 Modem")
Cc: stable@vger.kernel.org
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

v1->v2:
- Changed the patch to instead use device managed allocations for both
  the device_mode_info and the context structure, as suggested by Ilpo
  Järvinen.
v2->v3:
- Align the arguments to the opening paranthesis as suggested by Ilpo
  Järvinen.

Link to v1: https://patchwork.kernel.org/project/platform-driver-x86/patch/20260707070524.953741-1-nihaal@cse.iitm.ac.in/
Link to v2: https://patchwork.kernel.org/project/platform-driver-x86/patch/20260710052806.100107-1-nihaal@cse.iitm.ac.in/
---
 drivers/platform/x86/intel/int1092/intel_sar.c | 32 ++++++++------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/intel/int1092/intel_sar.c b/drivers/platform/x86/intel/int1092/intel_sar.c
index 849f7b415c1e..7263114f0b3d 100644
--- a/drivers/platform/x86/intel/int1092/intel_sar.c
+++ b/drivers/platform/x86/intel/int1092/intel_sar.c
@@ -91,8 +91,10 @@ static acpi_status parse_package(struct wwan_sar_context *context, union acpi_ob
 	    item->package.count <= data->total_dev_mode)
 		return AE_ERROR;
 
-	data->device_mode_info = kmalloc_objs(struct wwan_device_mode_info,
-					      data->total_dev_mode);
+	data->device_mode_info = devm_kmalloc_array(&context->sar_device->dev,
+						    data->total_dev_mode,
+						    sizeof(*data->device_mode_info),
+						    GFP_KERNEL);
 	if (!data->device_mode_info)
 		return AE_ERROR;
 
@@ -253,7 +255,7 @@ static int sar_probe(struct platform_device *device)
 	if (!handle)
 		return -ENODEV;
 
-	context = kzalloc_obj(*context);
+	context = devm_kzalloc(&device->dev, sizeof(*context), GFP_KERNEL);
 	if (!context)
 		return -ENOMEM;
 
@@ -264,7 +266,7 @@ static int sar_probe(struct platform_device *device)
 	result = guid_parse(SAR_DSM_UUID, &context->guid);
 	if (result) {
 		dev_err(&device->dev, "SAR UUID parse error: %d\n", result);
-		goto r_free;
+		return result;
 	}
 
 	for (reg = 0; reg < MAX_REGULATORY; reg++)
@@ -272,43 +274,29 @@ static int sar_probe(struct platform_device *device)
 
 	if (sar_get_device_mode(device) != AE_OK) {
 		dev_err(&device->dev, "Failed to get device mode\n");
-		result = -EIO;
-		goto r_free;
+		return -EIO;
 	}
 
 	result = sysfs_create_group(&device->dev.kobj, &intcsar_group);
 	if (result) {
 		dev_err(&device->dev, "sysfs creation failed\n");
-		goto r_free;
+		return result;
 	}
 
 	if (acpi_install_notify_handler(ACPI_HANDLE(&device->dev), ACPI_DEVICE_NOTIFY,
 					sar_notify, (void *)device) != AE_OK) {
 		dev_err(&device->dev, "Failed acpi_install_notify_handler\n");
-		result = -EIO;
-		goto r_sys;
+		sysfs_remove_group(&device->dev.kobj, &intcsar_group);
+		return -EIO;
 	}
 	return 0;
-
-r_sys:
-	sysfs_remove_group(&device->dev.kobj, &intcsar_group);
-r_free:
-	kfree(context);
-	return result;
 }
 
 static void sar_remove(struct platform_device *device)
 {
-	struct wwan_sar_context *context = dev_get_drvdata(&device->dev);
-	int reg;
-
 	acpi_remove_notify_handler(ACPI_HANDLE(&device->dev),
 				   ACPI_DEVICE_NOTIFY, sar_notify);
 	sysfs_remove_group(&device->dev.kobj, &intcsar_group);
-	for (reg = 0; reg < MAX_REGULATORY; reg++)
-		kfree(context->config_data[reg].device_mode_info);
-
-	kfree(context);
 }
 
 static struct platform_driver sar_driver = {

-- 
2.43.0

