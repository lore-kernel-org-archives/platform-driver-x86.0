Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1921630148C
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 23:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780701557; cv=none; b=H3MPX/MRRYHKepNdxixYE5LexZG6H6jFg1vIEAiA2Mo+w5ayUbnL0Ty/ZVByvhbGq8VCuNoroLpHaJYqOONFa2gplGyS4TpBU/jzdR+b4abt4z92seoN8iXt7pPuINA+ShKuFld8bTY2KOgp+/4AdZJvziZ7fBYOGDMYGJfEW6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780701557; c=relaxed/simple;
	bh=fkFsuzlcMW31KHviKljL3GrnqaRn2DUKOPOYu/Z3/i4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BuRPhGKfMRF6Ecv/hJfiCVxEvTPOWYNQ0AzoDlHt5O0FJzKaH5WzDwEyzyr5VUKmvGejOJ/D4xZMRHqLvdIf/qdtAUg73BhVtW9r0lATIU3/6uVHO9IYYYj1zKcoQ+hfnepuytBIVMiMx1M5fckF1AFuOSAhEd0X79cDXsFdzV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBJt0ogC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBJt0ogC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so20023385e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Jun 2026 16:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780701554; x=1781306354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pfCjHL7Z8sFsegg2MRdElxUNf+mctf7ZhTGeufyquJ0=;
        b=CBJt0ogCGdqo/1mWq2t0nIIyo61OXaHEIGIlVXwlBZQ0BQTa88h5EJSpdZGAZI0ms3
         GpxNgLDB20oMJuziKIsr16nGkHOLq65atqyArk77v5gHgkT2bj0zLgXvxtjCCPnXF8Ts
         nTAniUW2JigoySiwleFjwHZMMGbrf4McdHog0ZmuCyjSdyijK0S4fTLZ6raESy8sxESR
         pxzuz8Q7sjUghwcgJcZeQb8F6rSggTxDcpeSUxu80YD+yVPQobmlqRcAw4BqdlIRu2Wx
         qwmEHVxezK2r7ER6l30MR8o190fsfZtISXzhjJAFKYyWRJ2dgeyIVNRWw+Z1pjI6IUOq
         SUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780701554; x=1781306354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfCjHL7Z8sFsegg2MRdElxUNf+mctf7ZhTGeufyquJ0=;
        b=RjMQ+392xMDPYOnE9p8/+3kVRrib/4QFqZDY18OZZnMjZVLiEnB83gyYD5wpjHN7Lh
         IVmEvsn41Gh4njZUgO3ft46bZo36xyqm9US+vKxVjQc7IlB4DjxvRQTDJ2A1hVecYWqJ
         zyL35WFpda3d8EB791pTvzCoaXDEEAFK+QNsHXptUg/ibnjFzrJ9MRnYm56BjiSZllEV
         qmiU+vxWv5LwSyUk/8gqx5NxrHXS+FBtYjvJP01ME0/sDoP5LbtuSQt9LOtmpJTFGhqN
         /Cy0wXGe8v2923skwETckXE+vnPKeW7HRTlkN+2SHqNAuuFKhaizL4oafaIiIjA4JQ7V
         QE7Q==
X-Gm-Message-State: AOJu0YyAQXyBo+ezVX6V+z2bnnGFmmx3xhx6iYJiRuA7phrfGDg9OofT
	6OJ+RvQjhmxcH/KucWyAhgByGt6Ln4USQSLxh5oFEJsfpT1w4YJ6Dv5NlKjpue/9BY5MDA==
X-Gm-Gg: Acq92OH5wJ/vaGEny5mXBbb+Jo1FPZ7if80Pc0ejKGBDGFAuS9MdglUWNi2/jRsXe8+
	advbIoJnFPT2QjG/jCbydwSMZSvQCEHQh10fjpIGkFasod9Q+r/vy4rHkZlSm/4k+tK8/ecCtCt
	A93fH2yYSvF+rUMClviuJ4mB1W/vnQGjzqDnj/CntLLCQ9aR6p9v9wVxXMLSNvwDZ8aZHu4U6Ai
	APemI+C/HHSlu6KS6KmowyB6j/zW6SakUiPrrRQjEnz/5YIm5WFRO00lLd4sQ0NOBjDF2p8cZ2a
	rPp5JIHvYcPSo0q0ppIQGcZPX4XMXLU93outhyaTtbBL8UPQ/PDIhy1eMSxSv34+eqRlwNgr7j9
	e2NCJyHzE6YEotam+Y7EvsD7m2Pqs0mbru4MRnZhLpdN4um/XKneU94DiGj2dzqVC/7HjIwztLk
	QCmvB/PAS9rATXWT65sdqu46wroluhTGQl
X-Received: by 2002:a05:600c:608e:b0:490:b355:9c8c with SMTP id 5b1f17b1804b1-490c25f3f00mr87597665e9.23.1780701554352;
        Fri, 05 Jun 2026 16:19:14 -0700 (PDT)
Received: from user ([104.28.165.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm29455627f8f.33.2026.06.05.16.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 16:19:13 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yahia <yahia.a.abdrabou@gmail.com>
Subject: [PATCH] [PATCH] platform/x86: Add Battery Threshold support
Date: Sat,  6 Jun 2026 02:19:09 +0300
Message-ID: <20260605231909.17028-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
I aim in this patch to add support to
Battery threshold via SBCT and GBCT
acpi methods from the acpi table

Signed-off-by: yahia <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f63bc00d9a9b..3d035ad9f03d 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -59,6 +59,8 @@ enum hp_ec_offsets {
 #define HP_POWER_LIMIT_DEFAULT	 0x00
 #define HP_POWER_LIMIT_NO_CHANGE 0xFF
 
+#define HP_BATTERY_THRESHOLD_CAP 0x37
+
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
 
 enum hp_thermal_profile_omen_v0 {
@@ -448,6 +450,7 @@ static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
 static bool platform_profile_support;
 static bool zero_insize_support;
+static bool battery_threshold_support;
 
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
@@ -1130,6 +1133,22 @@ static struct attribute *hp_wmi_attrs[] = {
 };
 ATTRIBUTE_GROUPS(hp_wmi);
 
+static int hp_battery_threshold_check(void)
+{
+	u8 buffer[128] = {0};
+	int ret;
+	ret = hp_wmi_perform_query(HP_BATTERY_THRESHOLD_CAP, HPWMI_READ, buffer, 128, 128);
+	if (ret != 0) {
+		battery_threshold_support = false;
+		return -1;
+	}
+	if (buffer[28] == 0xAA) {
+		battery_threshold_support = true;
+		return 0;
+	}
+	return false;
+}
+
 static void hp_wmi_notify(union acpi_object *obj, void *context)
 {
 	u32 event_id, event_data;
@@ -2287,6 +2306,12 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 			hp_wmi_rfkill2_setup(device);
 	}
 
+	err = hp_battery_threshold_check();
+
+	if (err == 0) {
+		pr_info("Battery Threshold is supported");
+	}
+
 	err = hp_wmi_hwmon_init();
 
 	if (err < 0)
-- 
2.54.0

