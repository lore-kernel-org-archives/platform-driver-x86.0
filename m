Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7788D1DFF0
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932984; cv=none; b=Lg61jZSgVU9M7ygRFDJkhiRYTSy08jDuiD9Ja5f6B3bQlMvVh34CIJZQyMDpbT+50n2yJ17xX64NwUCPT1IexeWgEIlvifPZJ7fjKNFOullw9fGqDNxm7oLHhW3eaQN+wTVjOJBMMuxA8zVKFpe+N/KGGVKZQPeJz/ftXPpN1Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932984; c=relaxed/simple;
	bh=nTG9ojLV3hroHm4CA6x/kqeDk8oC24KhyKRb3VnH8G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LLd7odljJEaT7hLZJp6SI0r7gv8OTXK6AJr39WDq27gvRIxGCBz6h9nkjr+lBkG1tSoFB3Rnpr2HaKF67Ja0OqdVt0PqmegddxqN8xW0T1AU+qdswBqHfGNiWW5N6qkSaTxsiMolMKr11uKgZBPckEo0EbJoKzt0P+vgtNkB+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mzz8KsAg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mzz8KsAg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso2292058f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780932981; x=1781537781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRNK1bYlC52bZpon17vtUhQqmZH3ElbF2pGLYTn/j+Q=;
        b=Mzz8KsAgAdjeRb47plYHmwQXHr1QUmuGIWvYwH7UTOd3nxv8UQx91SJ3N9Uxsma2Yc
         xVY6VYragNNNA9tNKjboF4IKh7APe9L7eUfngMrz/meYSfkqgQIGFuPwSpHK4hwgvmiY
         gBr448pym5rhYmTeYkWHu2eyprYjcy1UDC61Sm4jFui7B54t/vY4rrt05FroEk1h8QA5
         iFQhuEZW375jImRmUrwXS1IrXrp4E+4WZM/u9Ein4+mz3Ygqu+XoYhCelaoxqjyhzUAU
         EI6qjh2GJA1ly1DbiGZjmZtg3Fx7uHfHJFL4DoigdwCjg/onxipQWnLMH4sLzIA+RfMW
         j/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780932981; x=1781537781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRNK1bYlC52bZpon17vtUhQqmZH3ElbF2pGLYTn/j+Q=;
        b=nazJd68eXglOLLlPJGn10gr1+MYQHGpWW7xEcHH+4FXxO+iSk1PQGy6uV/kxQVbtqK
         yOqfNo7zG4jYh9FohwBfBQnJkjzYr5go8reYCLqujp3hZJLDYkQaoO2GPevVoYZixWKL
         f6K63BWnu1M6qnxsFv58Y1JHhjtqzn1bFkdbF71A/ufvHNWUT5mbebDw1msDe9nFzhCH
         pUygeEW7MiXKESteBPlugpx3u/mFc/bCeqtcPeU6zEIEn2EbSp3nNWVFCVpTbVWp32qN
         gZm1xRa/zz35dkoaD7UeZqPDtrswPD/ui6DPrmJtfFC0na82wkNN1iidO7EbqxFrNvZI
         3pzw==
X-Gm-Message-State: AOJu0Yy53cXyEpmNIesjD6nuI9y5pMGgblX5r/nF6Nqmcya4fWyEt5dc
	rTNPoWcRdC5BInwxPkKLO2xJfeIIRbtQXp8xKTt/KV0Y32tiC8Sfashc
X-Gm-Gg: Acq92OFHetOTNEYtWdvc+s9Tdp/nC1i6VlG+k9WZeB8o/ksYAe4QbElFJyC9GNRTZX0
	m3fhEjAKCbMnHxaxucu6cps+7dTB5kP9Pc+Yh5rNmtpGouq5YGtZ30JKpXsk0tZRxM4qpb/2JwC
	wdmBwIt5jv34Zy/28JgtK+ITdclfKpmAqR3xAmp+65QYjasawAiIeE1Kv6MdqXyZzG1w4HqtlVe
	mFjJYqtkkWJzA/V4HqKLw5ZxI6sFVsRE5nVfpU0uqE5pEw0PeLgRvYFYPyX2D2tuHi0jXNfNZ/p
	2cK4o0Fm4N1lZYcnyNKmx7uQX76X55xlpveYnASrjkPjujjISHGUsxlf6mscZPC3eIwdeS21iWe
	QxvIOx9hVcr8U96iXjqZ2sbY4CgvdiA69lad+Vdele9Oj0Seo+kehhYpNr0dDsPz35OR21Eokq0
	nfawJH/vYt3Gb60LA/AiRVDKjFCO5lzfnu
X-Received: by 2002:a05:6000:41d5:b0:460:3210:b6e9 with SMTP id ffacd0b85a97d-4603210b750mr25657652f8f.41.1780932980614;
        Mon, 08 Jun 2026 08:36:20 -0700 (PDT)
Received: from user ([104.28.162.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm41079640f8f.10.2026.06.08.08.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:36:20 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia <yahia.a.abdrabou@gmail.com>
Subject: [PATCH v2] hp-wmi: add battery threshold support
Date: Mon,  8 Jun 2026 18:36:13 +0300
Message-ID: <20260608153613.38780-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <0d81219b-7a0b-fe57-aa28-f36967e414c4@linux.intel.com>
References: <0d81219b-7a0b-fe57-aa28-f36967e414c4@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello, Ilpo
Thanks for your review,
This V2 patch implements Battery threshold support via ACPI methods
SBCO and GBCO,This Implementation adds battery_get function to retrieve
the current battery threshold mode and use it to identify capabilities
to simplify code instead of another function specifically for detection

Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 61 ++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f63bc00d9a9b..f2180b61b84e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2005 Dmitry Torokhov <dtor@mail.ru>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
@@ -292,6 +293,18 @@ enum hp_wmi_event_ids {
 	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
 };
 
+/*
+ * Profiles for hp battery threshold profile 0x05 and 0x06 map to 4 and 5 respectively
+ */
+enum hp_battery_modes {
+	HP_BATTERY_MODE_NORMAL = 0x00,
+	HP_BATTERY_MODE_ADAPTIVE = 0x02,
+	HP_BATTERY_THRESHOLD_4 = 0x05,
+	HP_BATTERY_THRESHOLD_5 = 0x06,
+};
+
+#define HPWMI_BATTERY_THRESHOLD_SBCO 0x2B // SBCO Command id
+#define HPWMI_AC_REQUIRED 0x35 // obscure edge case where the bios requires the user to be charged while setting a profile
 /*
  * struct bios_args buffer is dynamically allocated.  New WMI command types
  * were introduced that exceeds 128-byte data size.  Changes to handle
@@ -448,6 +461,7 @@ static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
 static bool platform_profile_support;
 static bool zero_insize_support;
+static bool battery_threshold_support;
 
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
@@ -1085,6 +1099,50 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static int battery_get(void) {
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	int mode = -1;
+	if (ACPI_SUCCESS(acpi_evaluate_object(NULL, "\\_SB.WMID.GBCO", NULL, &output))) {
+		union acpi_object *obj = (union acpi_object *)output.pointer;
+		if (obj && obj->type == ACPI_TYPE_PACKAGE && obj->package.count >= 3) { // standard package sent by bios
+			mode = (int)obj->package.elements[2].buffer.pointer[0]; // bios returns the result in the third buffer 
+		}
+		kfree(output.pointer);
+	} else 
+		mode = -EIO;
+	return mode;
+}
+
+static int battery_set(int profile) 
+{
+	if (!battery_threshold_support) {
+		pr_err("Battery threshold is not supported");
+		return -EOPNOTSUPP;
+	}
+	union acpi_object args[4];
+	acpi_status status;
+	struct acpi_object_list arg_list = { .count = 4, .pointer = args };
+	memset(args, 0, sizeof(args));
+	args[0].type = ACPI_TYPE_INTEGER;
+	args[0].integer.value = 0;
+	args[1].type = ACPI_TYPE_INTEGER;
+	args[1].integer.value = profile;
+	args[2].type = ACPI_TYPE_INTEGER; // padding required by bios
+	args[2].integer.value = 0;
+	args[3].type = ACPI_TYPE_INTEGER;
+	args[3].integer.value = 0;
+	status = acpi_evaluate_object(NULL, "\\_SB.WMID.SBCO", &arg_list, NULL);
+	if (unlikely(status == HPWMI_AC_REQUIRED)) {
+		pr_err("You have to be plugged in while setting a battery profile"); // random edge case in the bios
+		return -EIO;
+	}
+	if (ACPI_FAILURE(status)) {
+		pr_info("Write failed with Error code 0x%08x\n", status);
+		return -EIO;
+	}
+	return status;
+}
+
 static int camera_shutter_input_setup(void)
 {
 	int err;
@@ -2292,6 +2350,9 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 	if (err < 0)
 		return err;
 
+	int ret = battery_get();
+	if (ret >= 0)
+		battery_threshold_support = true;
 	thermal_profile_setup(device);
 
 	return 0;
-- 
2.54.0

