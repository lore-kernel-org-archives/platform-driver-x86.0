Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2542F4A13BD
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 12:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810692; cv=none; b=iqNezWNzyWfzfwT1LSgbxHx27mxC5uwxvwFsZh0uM+kMA+vI+0WWToyb13cQ952eAKgRqWjao8/HguTviq5lg9ucCusnhe7W3hcK8O6A34SokEYDr+3CPm+nQkyCUsTgEo2HkZGEAjmdUSWT8WCrpfnOMyeJub3WkX8avJfvQF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810692; c=relaxed/simple;
	bh=PfHJYqAdNUNso9QIi/a1PoUrfQ4churnV2g+9V85fDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGHaeU5h1bogE+Z81wIOYWicCfZ2Ha8j40xZy+kq21/U3UOZXlAyFSJd7gZwkTjGsJ1HCwcdBfn/eMKf/fJcm5sX7b0aQa3SAcSE23PKrmJLlxe0s31DiCqzWP8OCcSE/hSwotdrrCsgM4q6qQ4859inMPbzCrU2ugM6DiDfi9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=NZcD67tG; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="NZcD67tG"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381216921aaso515081a91.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1784810687; x=1785415487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiPXGv4jgjzWQcJFciSEaz+MHyjRNnFYQcUtVupcsGc=;
        b=NZcD67tG6Rx/0xeEYtDNRtHDUf73GhTBotoqwwKXKcJWLA+Br7KBLH24ftX0w32vmi
         l1QE7HKbvWuFOV8etmtsI6J7klcZYa+pvLAVKF589b43qUCQxS9BOb3SdkbbiSN1/4zW
         RhnO82ZjouOYFTzpm84giPSnlYf7DB/qzcc3TQsWAZEeK3UjjJDEVrPFJvtjLRyYLLAd
         B5qy3u2D4juQo9eHPWup+3G/bMnfjSzXC6zlGoK7HhyfiuBtFY528d1l0DPc9mENwzWZ
         36MDxTA1XaU1HHbUAIQW/8aNq8F4St+JzZMfm5sAxVzjwPexM+v1QbcZV6IGj+iRqe3+
         QUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810687; x=1785415487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hiPXGv4jgjzWQcJFciSEaz+MHyjRNnFYQcUtVupcsGc=;
        b=Tr4K2dvkJEc/ARCTSKMCdVZlF6xigx5JpHSRTbtjd6aIzyHGGh9TJNfte4PIcSdv+X
         LuejsXJYeOLvEbJRWUgpdmboLc1J39xRUJZXFxWql0uJXfc/OII9oi82vrIZmnj4XWeq
         FGMnlMaZjrljobI08R3ZFHIRQ+WdxujQU6gN2TQQUOqA4xOl5dZr4OZqMo1w8iBvUwzd
         T6cPaXwsdwvvI8x/R9UL3HciIevi3w8pS7wdYilgek4CrFUKd2po5oKSRxwz6rrMXUmF
         3zEg6XmMlfPdId8KjPHF3S+1qZbuN56w0Th6mOkz0GsZpkjviNYG7Pd+WxkVlualfE0n
         faYg==
X-Gm-Message-State: AOJu0YwXn0dERd+TXqpN3RDMqMczxpgzn99HsfB9O9cNKqraQiPbhUNx
	zQBYftPM0TcMmmMJtchINQCoX9SPRIRyJiQovZdlhttt9c4mDe1iBxpczvleAhZ8zTM=
X-Gm-Gg: AR+sD1200L/smCqHbSIEh3X7T7CSGl7lW0p6s4Pe3jmMxydqhPW943hIeX6mxwui/MP
	p0mT0DhqxhPUkzu7TqM2MAuD8xST/fuigmpeL1NGk9lB/l3B8RWHcMT+Ni+a51X+M2lYQc49X07
	MBKZcUjEMfzETrHLvFDdT4FvKggwmClWNNwSlN4SO/qaT7UPqGtNF/CxMZh9B7DD7ASY52T/jEW
	oOGELba8LtjALy+4HKZ6HboPhGq2wVyMRHDsQ8n7u6nbjN7YiCOTLG0Rj1aekfsxLACWJEna1Eo
	qkK7Mi8fpgGkWTv14SiDnjjmsiIT9u8aw3kBcweHizGY4sedkib4rb9UzYb0A8ESMcTTlAyxLo6
	zuDiAPLqmrsV0GXskUJtVo5JQWPiZ9yzQki2iM5hpZKQ5JDjwcwIXuNRVc7Xb9d3P0OucUOk/k1
	geAtHuiWzHrAJziJ6hUx0MDP6IyDOdBe7J26vgfa92vJ3+Qqvs4KLNm0m59zkfqwnTah83UWCJX
	439YdBQrOC2N1Oe01Og0wx5
X-Received: by 2002:a17:90b:2b88:b0:38e:ab33:9551 with SMTP id 98e67ed59e1d1-38ec66604ddmr2925445a91.42.1784810686968;
        Thu, 23 Jul 2026 05:44:46 -0700 (PDT)
Received: from [127.0.1.1] ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13d1300401fsm21663197c88.3.2026.07.23.05.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:44:46 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Date: Thu, 23 Jul 2026 18:14:15 +0530
Subject: [PATCH v4 1/2] platform/x86: int1092: Fix potential memory leak in
 sar_probe()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260723-platx86-v4-1-93b4a178b595@cse.iitm.ac.in>
References: <20260723-platx86-v4-0-93b4a178b595@cse.iitm.ac.in>
In-Reply-To: <20260723-platx86-v4-0-93b4a178b595@cse.iitm.ac.in>
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
v3->v4:
- No change

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

