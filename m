Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E44367B81
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942057; cv=none; b=o8sRq7nzKfVBAUPqXQZN0W8jxT2otVxDQcqdj/b4kbPsH0SMnavZI1TETBexzA82Y8NTmTiiaL51XZd3GgaVppL431kCmT8fyhWHaZw3utG/pzPhRTvaTDHclwIGBC+qIfqC2T/ATW83sXKVEEUjv27eImsjwGU46b7mrrZ8dbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942057; c=relaxed/simple;
	bh=aT/K1XycEYUihno+/iWpp+Sa2KT2ztfRjBVZIVqzQnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhPUN7Szb0kbIxoSQI4SdAcB/0lp6+0+aZAaTwBpc+EYsldSAYSugjs9ygTsqW8bQsxu8xffQFDRbWRe0pF7cTa6/IKzF+OPh/NbSSe/FN8u/hwU+GflFXUxP6yP4e1wzZnv7n1gstILymAFwxVhb6nPzOfR+ZrIMMq64r2yJ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APIKqEkl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APIKqEkl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b613a17bso45734135e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780942054; x=1781546854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPC7tIhUwdVZkpX4evzvmorP3YRKGZkMKJ6Jf5hJ9Dg=;
        b=APIKqEklvn11WeV0s8CXFmxyLANOyXZMf+92KrXgqlZQ9+ANjdULmblywmR4lPPHz8
         GUJpS84kfihvhiZIv3qJw5CuhuXEY/OXYTsCrIuQC1QeuO7HPbUpLf1QsyzFC2/KVOOm
         bjyuPLAOn5N2HOiJ/Xt1q9zm6WHBTyhKcdX80EXubUr94dLwF/M72Ph260JYD/rrYtQ8
         Ab86IC21Rt8TOfi6wKHG/S8ryUppwBXmkNx4KkHomPn3+hcrIwkpVWC2q3Zu56HwlQ/F
         WPucsnhlLVE5m3c40LcvHTA2G8XXr9UC/zxBSOU2sJaZjeWro7ujtqAVnSDM9a3CE4fo
         G/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780942054; x=1781546854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mPC7tIhUwdVZkpX4evzvmorP3YRKGZkMKJ6Jf5hJ9Dg=;
        b=AyaWVoRYLUcxvyB9S5cMkfpCiPKLn43FNCuc1iD31bN2h1zoAdvwP2PB6OlCjGRY5I
         dQ2uzU1UgTzdwMP54e5qHGCJrYHDLEW30l5n5p3C9oETH4yBq6lT2iJnyRyfHlo09A2a
         qaTf16kkBtvEjP/DDa4cGc9MsgWUJ7nBnSVLb43JHPzfFzb0GvUajBar5AQwz2AmR2oQ
         FknQX+aGeLFAJA+lTZ481b2KOZCzWmwAhUmQwDm4312y4M8yzaj6sdrv+wTf6bDDCUEE
         QVCmhrgxkLI9nXNHgDdtMvWOKT59x/ae9j8R7FsSycqkzu/1u8Nzw/L+OTsdqZR20dtA
         dr7A==
X-Gm-Message-State: AOJu0YwPtLMAS/F1sRSbsYM6dRecZ0TgtWQpDjt938MknjGCO8gHPDls
	mSzqKeEQ7+XPknIHTDp3sd4Xp+G+bMGDZdGvGVUUqRFRYmMm/tcoa1gt
X-Gm-Gg: Acq92OG+Eivc97UiThOAqJbhnKg1d3uLDjSYUum05VXN0xO78pUjGV9XCw2xEzUQOlN
	GUl5ax2509WNjgve2palecFaA2dM8IiIrWvkibEusTfq0ZvWx0ZIgARiOK3geED9uDWitrZRwfv
	iO9lZsOuMzFervX3rjTl4R25+P7gLLwBMwL398ZxkIGS4TsDj5llmOp5wi1DUI/9WOp/0KYt8FM
	W2yF+2WTI2xQUqkCigOn9VAW6auVBsQWfyIoWwAHX2el2jvCzrf0DHynMqy9hHEvRiIvFQBGaWu
	GNu0BP2mX5KTijdXks5LSnvXadlm409cwk8+sM5dX/+QrQgIYNYIXgglrgITR2IyzFUr1GRt3dM
	UIGngsjteI54MC91+X4YfW4Eoz9UbA/VaopjNtLTLJIC7TuN76B0adFkJnyrfwQ3KZqi67bTkK6
	s2NFbuNOH6HStCMQTXXXqNSez9dJ94xV6v9ntmgtY7w9c=
X-Received: by 2002:a05:600c:35c9:b0:490:b8c0:d471 with SMTP id 5b1f17b1804b1-490c261317amr269358725e9.23.1780942053728;
        Mon, 08 Jun 2026 11:07:33 -0700 (PDT)
Received: from user ([104.28.154.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3a87dasm398300745e9.7.2026.06.08.11.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 11:07:33 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH v3] hp-wmi: add battery threshold support
Date: Mon,  8 Jun 2026 21:07:28 +0300
Message-ID: <20260608180728.27348-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <41309386-12fb-71bf-3ced-8377bf8aaa8b@linux.intel.com>
References: <41309386-12fb-71bf-3ced-8377bf8aaa8b@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Implement battery threshold support using the SBCO and GBCO ACPI methods,
Add battery_get to retrieve the current battery mode and provide a function
to set the battery threshold.

Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
v3:
- Fix coding style errors and warning
- Refine the changelogs for clarity

v2:
- Simplify detection logic via battery_get
- Add Battery Profiles enum table
- Add functions to set the battery mode
---
 drivers/platform/x86/hp/hp-wmi.c | 37 ++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f2180b61b84e..c50fe78099d9 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -11,7 +11,6 @@
  * Copyright (C) 2005 Dmitry Torokhov <dtor@mail.ru>
  */
 
-#include <asm-generic/errno.h>
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
@@ -297,15 +296,16 @@ enum hp_wmi_event_ids {
  * Profiles for hp battery threshold profile 0x05 and 0x06 map to 4 and 5 respectively
  */
 enum hp_battery_modes {
-	HP_BATTERY_MODE_NORMAL = 0x00,
+	HP_BATTERY_MODE_NORMAL   = 0x00,
 	HP_BATTERY_MODE_ADAPTIVE = 0x02,
-	HP_BATTERY_THRESHOLD_4 = 0x05,
-	HP_BATTERY_THRESHOLD_5 = 0x06,
+	HP_BATTERY_THRESHOLD_4   = 0x05,
+	HP_BATTERY_THRESHOLD_5   = 0x06,
 };
 
-#define HPWMI_BATTERY_THRESHOLD_SBCO 0x2B // SBCO Command id
-#define HPWMI_AC_REQUIRED 0x35 // obscure edge case where the bios requires the user to be charged while setting a profile
-/*
+#define HPWMI_BATTERY_THRESHOLD_SBCO 0x2B /* SBCO Command id */
+#define HPWMI_AC_REQUIRED	     0x35
+/* obscure edge case where the bios requires the user to be charging while setting a profile
+ *
  * struct bios_args buffer is dynamically allocated.  New WMI command types
  * were introduced that exceeds 128-byte data size.  Changes to handle
  * the data size allocation scheme were kept in hp_wmi_perform_qurey function.
@@ -1099,21 +1099,26 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static int battery_get(void) {
+static int battery_get(void)
+{
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	int mode = -1;
+
 	if (ACPI_SUCCESS(acpi_evaluate_object(NULL, "\\_SB.WMID.GBCO", NULL, &output))) {
 		union acpi_object *obj = (union acpi_object *)output.pointer;
-		if (obj && obj->type == ACPI_TYPE_PACKAGE && obj->package.count >= 3) { // standard package sent by bios
-			mode = (int)obj->package.elements[2].buffer.pointer[0]; // bios returns the result in the third buffer 
+
+		if (obj && obj->type == ACPI_TYPE_PACKAGE  /* standard package sent by bios */
+				&& obj->package.count >= 3) {
+			 /* bios returns the result in the third buffer */
+			mode = (int)obj->package.elements[2].buffer.pointer[0];
 		}
 		kfree(output.pointer);
-	} else 
+	} else
 		mode = -EIO;
 	return mode;
 }
 
-static int battery_set(int profile) 
+static int battery_set(int profile)
 {
 	if (!battery_threshold_support) {
 		pr_err("Battery threshold is not supported");
@@ -1122,18 +1127,21 @@ static int battery_set(int profile)
 	union acpi_object args[4];
 	acpi_status status;
 	struct acpi_object_list arg_list = { .count = 4, .pointer = args };
+
 	memset(args, 0, sizeof(args));
 	args[0].type = ACPI_TYPE_INTEGER;
 	args[0].integer.value = 0;
 	args[1].type = ACPI_TYPE_INTEGER;
 	args[1].integer.value = profile;
-	args[2].type = ACPI_TYPE_INTEGER; // padding required by bios
+	args[2].type = ACPI_TYPE_INTEGER; /* padding required by bios */
 	args[2].integer.value = 0;
 	args[3].type = ACPI_TYPE_INTEGER;
 	args[3].integer.value = 0;
 	status = acpi_evaluate_object(NULL, "\\_SB.WMID.SBCO", &arg_list, NULL);
+
 	if (unlikely(status == HPWMI_AC_REQUIRED)) {
-		pr_err("You have to be plugged in while setting a battery profile"); // random edge case in the bios
+		 /* random edge case in the bios */
+		pr_err("You have to be plugged in while setting a battery profile");
 		return -EIO;
 	}
 	if (ACPI_FAILURE(status)) {
@@ -2351,6 +2359,7 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 		return err;
 
 	int ret = battery_get();
+
 	if (ret >= 0)
 		battery_threshold_support = true;
 	thermal_profile_setup(device);
-- 
2.54.0

