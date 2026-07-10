Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570ED21ADC7
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783661302; cv=none; b=B1GeJ4PsM7e6iQ0J/SFV0XCoVJ4VjzrOZ2mW6G6logTZCSQkgpJQKhO1XrSa+hRDbti0P4IuJ/OboVoFQDoyQcEpBVyuX8Shs7DzMfFEpCv7DaAcFU0Rz2hleBqT36SvYVXcUN6I+lZjhIzLkv/92M2yo2Qe+h0J+jbRFLHa82U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783661302; c=relaxed/simple;
	bh=I6qmZKmYgOCDd23juh8E1V8ly31ICCecziDj6Ab2yfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sTOJZlkrFyt4b88O8xqelq1y5OmoY7aETiK0LU50uH8KiuncYDqJuykcm8E/RNUktCWndO8trhratgXomMB3aetg4EOr+XbMgw2HEZ9z9FP22W9A1sN+Y3DRcq7LVgjtxEaPumgVdq2RIj/8ppuHbCTHB9BG8JkpqrDZSFD+GTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=VYOQvi9O; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="VYOQvi9O"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so422763a12.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 22:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1783661298; x=1784266098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtgNPfiuPP2PxEYv19OKovNjnDZbOavqTWC7kRVkwjA=;
        b=VYOQvi9ORuhZUOM50E2rhusfmvI9IH/+CbWZ7mfqyoZiwXu3DydnAQYE1NsJb237ck
         7SQ52aB4FSgZjM4h3+S8WnPFBrmkNtnxhz41BomM7htlf7zTS5qQGTDHZSd3sTPTLLS9
         zvjzlqp24u+R5Ah4nuNfzvmeei0K9NqiWqYhZe+9uUQsEgfVnvwdiZqIPQSZ9XkbqVvr
         av5RXxir9YvMnR8M0tKcT4IPkiWuUTPwdvVtUAVWj4Uo2y0WhKQxxC0RaHvRA+DKSjx+
         tFoFGy55mKGZsQ+bSmSsyyGJuwsuhOZhGOOUvbZY0hYECUiAOtcENxNhvkkFuVHgOBvF
         iSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783661298; x=1784266098;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mtgNPfiuPP2PxEYv19OKovNjnDZbOavqTWC7kRVkwjA=;
        b=mHnVkZ9NWlaI7npSBfwxXYEZEj8/x48//Sj/3i1jv8K2xRZVHb2lhRn3W9aM6yVgMm
         86DUBCEPEpx9j8Xy5rwWHO9PfcFDtrj0blsDNnMV/xzcc4DckNRzGfSbJM055XvEvL53
         Q5o4377ci0bT1QUMaNUN2RHBz744QMUCQMm6ePGmEqjzrX/ao+n0KiY/qdlbPkEgBNjI
         Q+HNffAdTCYr7QsIvlIXaQ64Gnn8jKLr0IXdYugPixi1s+ZdQMYW4B3EdVSeUNs6+KmW
         CV5Z27/+NW9rwyUGfAjKOc0G8UzibQVLWzSn1BZPnX4rutwhlGk/CE0CFsJV+k4VX5Li
         Lsag==
X-Forwarded-Encrypted: i=1; AHgh+RrvTYFSHFPnJKxr8ZFqMnA53V7G5wcJhKEM7FeAy1JlOu0zPHo1nHvAfURv1sWxGHQ8K/qKn8Z8R/lKZaNRa4hA7WJa@vger.kernel.org
X-Gm-Message-State: AOJu0YyNMk6+37OJZt5xoXb4Lsmr+TsuGmSWJzNqiwYkgR3UG1Xi3YQz
	5hEF01q0MootQ5h4MTU/c9neAMa4naJlPd26dUWTcC3SFJ32gH3MYHOuEvC/A9HwEuE=
X-Gm-Gg: AfdE7clchOXpcoKs5UTvgm3MwEAdMFCjHHBEPGZQPDV7CYs1OZsVSVqP6swStGKyczI
	g02wrjApqZb1s4zs2t0xu0Bzss10hOS55NDyNIRb05q6wWpbjizEg7+ovM4DrsJ1FVuQFcKf+Jl
	GjgHt7MNMWU2Tv9n7gE0i353aniqYeR09z/qykBEQ5J2b2RkgWAFtj26FYGCkXD7FNG/GT5kTgS
	d9JaHEnRceZ4r2lAR1yy7D7Sddif7gMhctcd2DsBO4S75kmUMm6tbr+J3RzcWCJ/2Z23Ajl2O+E
	FOUtltCKPQMk1PzC0fjdSDnB7H2ZRoPnf3FbXH382WPduSItYS8nVJyjmqFf7861CwEvqNUPcfM
	KqC7vXMQ0+YZpz7Y7FweFKOZtZ0PIubVBYb0QczJeeXo0fE1UMmGOPSE4VJgI284c1bGAPCaZp8
	faiKRRMMS5VSTy2F2sF09GLIaszxCStqYjNyIaY203bZvkD+f1P0LJQvnGUXBUaJkCGuWEB7SqK
	+XJaPyd8egO9hm9hvn6eE0HEtArKkbFi5ksA+EaW4k=
X-Received: by 2002:a05:6a21:7a9c:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3c0bcfea4bcmr12603274637.19.1783661298383;
        Thu, 09 Jul 2026 22:28:18 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm62526530c88.14.2026.07.09.22.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:28:17 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: s.shravan@intel.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] platform/x86: int1092: Fix potential memory leak in sar_probe()
Date: Fri, 10 Jul 2026 10:58:03 +0530
Message-ID: <20260710052806.100107-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

Link to v1: https://patchwork.kernel.org/project/platform-driver-x86/patch/20260707070524.953741-1-nihaal@cse.iitm.ac.in/

 .../platform/x86/intel/int1092/intel_sar.c    | 30 +++++--------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/intel/int1092/intel_sar.c b/drivers/platform/x86/intel/int1092/intel_sar.c
index 849f7b415c1e..f234e1f55aec 100644
--- a/drivers/platform/x86/intel/int1092/intel_sar.c
+++ b/drivers/platform/x86/intel/int1092/intel_sar.c
@@ -91,8 +91,8 @@ static acpi_status parse_package(struct wwan_sar_context *context, union acpi_ob
 	    item->package.count <= data->total_dev_mode)
 		return AE_ERROR;
 
-	data->device_mode_info = kmalloc_objs(struct wwan_device_mode_info,
-					      data->total_dev_mode);
+	data->device_mode_info = devm_kmalloc_array(&context->sar_device->dev,
+			data->total_dev_mode, sizeof(*data->device_mode_info), GFP_KERNEL);
 	if (!data->device_mode_info)
 		return AE_ERROR;
 
@@ -253,7 +253,7 @@ static int sar_probe(struct platform_device *device)
 	if (!handle)
 		return -ENODEV;
 
-	context = kzalloc_obj(*context);
+	context = devm_kzalloc(&device->dev, sizeof(*context), GFP_KERNEL);
 	if (!context)
 		return -ENOMEM;
 
@@ -264,7 +264,7 @@ static int sar_probe(struct platform_device *device)
 	result = guid_parse(SAR_DSM_UUID, &context->guid);
 	if (result) {
 		dev_err(&device->dev, "SAR UUID parse error: %d\n", result);
-		goto r_free;
+		return result;
 	}
 
 	for (reg = 0; reg < MAX_REGULATORY; reg++)
@@ -272,43 +272,29 @@ static int sar_probe(struct platform_device *device)
 
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

