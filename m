Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB84283CAF
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 14:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239699; cv=none; b=STOxO//kZjALCaepvfSu+7DUSMe/7LI15YpaxGHiJxCN0cBlaWHGn9lUM/3NxNULpVl3vVA5YXM4Vj7fMIQT3bTvzGayt9Xfc0xD1w/cKy0BwfEwtCK0yxZ2AjrexiRZImeOy6933+W2XlZf5VqjDMcuncQy45b1FexD/ygi9CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239699; c=relaxed/simple;
	bh=d1xZD8e5Zqlnnzv4l445DCWZ0qjTsvPnU+oHWRTh8oM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edq4K/t0ecFfauidF0iI6awce02dhPP6vHwaYX4H1cEnh3WOSkBhXYgGjiOsKnDT/VY/sj8jFeKiE8tbHx+phN5ErSNUbLCxoaPLPe6EtUoVU+P8CPpjckxG7ESOSTOkRMku/0aGlCLiobkiJOn/oSL+EdQYf/Ss57bqw8Yb9P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9mBn6w8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9mBn6w8"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae4e538abdso103651745ad.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 07:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773239698; x=1773844498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKn1lwhpqGitdeQ8yVxMlCmzH3bk1uwW/OQclThoMHA=;
        b=P9mBn6w8gn6segdRsEtfuG8I7x9EDCcCTGOTZLSn5K8RgHsO4y/nqzxXlJrObbV585
         zXjBpkKTG3bUL8gLnStaT6F1bv0Ow4lzyL2VSqTkt4DOJkbkqMnqJWDKNtSmdVVhidVb
         s9ZsI/8OK4dK5SyzeBLV3seiWHa+Lg3g+AF40JCv1BQz02DQJjfYT/bLwBqo/aGudx1N
         tXOuPwMMC4lEhIVTEzDTCkTZr87+GghNoaX1nw7UbNu6C6BgbwGUDX5YltgCkQauiber
         UDFh0d47d3bhdhC++cuhroe7pZcl917FgntTCknrmhdEPFyTBQQfc6C4iM7qq0QZtkBZ
         fdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773239698; x=1773844498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YKn1lwhpqGitdeQ8yVxMlCmzH3bk1uwW/OQclThoMHA=;
        b=UGx9mHPWcY4a31s25w+BQF5LbOiRc4bQcxehJKwBzZkDuWbzNPxTJs4cDdaWVLqNjZ
         2PD6NhLAndF2+vk36yPdPTyTwmot27oZIXWE1mKFb/kF/yp7/pNgy5F5H8/Tgb0PdQAS
         xqmqEQ08qq8IkxVmbBiUQEnplaKiZKb2mnMyk8CCJW18oQZhQ40Tz11oVXLrLk9pCVqP
         2N9+eeQPMqkx+SlgjCnbtVU7CiGImFsw/EylL7fZe88B+AR/64sE+pvfo7gTFvFwYdui
         OKBnq+qiBHA3Ef5H5jCABlNRbDo/d5kwBpj2RsEU+weazv5KP4zzvW3338GRpA5TxnNL
         qWuw==
X-Forwarded-Encrypted: i=1; AJvYcCVV/qRt9GRYdlOIfDsEq8vH6C/fu6eak3pFEawo1MkP9c0K440dRd4bNwJjrT9TupfnXIj4uhaCVv1zdXoN8AqJsrVq@vger.kernel.org
X-Gm-Message-State: AOJu0YyHbIKerLnEBeCFlR+60krRlNIHBpOVblryS8HRUaqhWEuKMVMa
	XxESShQL0ZEZ/+aqSGI3KO7VfREfUH60Y8c7RpAu8LylRIzBU1YG4k2B
X-Gm-Gg: ATEYQzzxHYRQUZw6zNt8sHiT6ow42Pagg9MiQ/bZFFg7YvQC4NPdIfur5fjUbCMzSI8
	XH69yluxp0RxpYyB9CsrImyP5puL4t9/Gj/leIA+8bjuvj0mXGORDLABtpoOhKq1Hd9MgPzaQR/
	wyvSzrqWsSYyGCq7gDpb4kUZE/a0qV5P8gSQFKp62IqammFAfh3F0YW4osC8py48baN1JYtCAir
	Syf5OUuTnP3+TDHbH1T5pw1DHHqLbagZuejavfRaxwkw+xqk7uvFvpo4d5+GvDrg92UBu3GaBTH
	g9uS0n7cxF6/nVnLy6XObSTOb5N4j3WMLBkBRWTMK1f0dV5f8zN/OpwTqhyXkXJ95UIfsyLC0rO
	nJKsddlSS7Sioom8zzc93TARkxPElbgwlnShOgTefnR0n1wgsDIuZPtLSYn2DjF/vtP9mreO09x
	zLT3+ZyNyYjy+Fu7nilMi2mKtXdIsucpFGkRDRbPWln5c94pRp
X-Received: by 2002:a17:903:2446:b0:2a0:8be7:e3d7 with SMTP id d9443c01a7336-2aeae9179f5mr30006615ad.57.1773239697690;
        Wed, 11 Mar 2026 07:34:57 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:dd5:d7ff:1c94:3624])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34e070sm26399235ad.48.2026.03.11.07.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:34:57 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v8 2/3] platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint double-tap
Date: Wed, 11 Mar 2026 23:31:43 +0900
Message-ID: <20260311143144.482145-3-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260311143144.482145-1-vishnuocv@gmail.com>
References: <20260311143144.482145-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a sysfs attribute to enable or disable TrackPoint double-tap hotkey
events at the kernel level.

The TrackPoint firmware enables double-tap support automatically. This
interface allows userspace to control whether double-tap events are
forwarded to userspace.

The attribute is available at:

  /sys/devices/platform/thinkpad_acpi/doubletap_enable

  0 - Disable double-tap hotkey events
  1 - Enable double-tap hotkey events (default)

Filtering is implemented by suppressing ACPI hotkey delivery without
injecting synthetic input events.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v2:
- Updated commit message to clarify dependency on trackpoint driver
- Now handling sysfs read/write of trackpoint driver using file read/write
- Removed sysfs attribute creation of trackpoint double tap here
- Reversed the logic and return false right away
- Dropped unnecessary debug messages
- Using dev_dbg() instead of pr_xxxx()

Changes in v3:
- No changes

Changes in v4:
- Simplified approach: single sysfs attribute for user control
- Clear naming: doubletap_filter instead of doubletap_enabled
- Intuitive behavior: 0=process events, 1=filter events
- No cross-driver dependencies or complex interactions
- Minimal code changes using existing thinkpad_acpi infrastructure

Changes in v5:
- Rename doubletap_filter to doubletap_enable to match actual behavior
- Fix inverted logic so events are emitted only when doubletap is enabled
- Register sysfs attribute via hotkey_attributes[] (no device_create_file)
---
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 42 +++++++++++++++++----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 8982d92dfd97..1b29f1067d8f 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -374,7 +374,7 @@ static struct {
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
-	u32 trackpoint_doubletap:1;
+	u32 trackpoint_doubletap_enable:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -3019,6 +3019,31 @@ static const struct attribute_group adaptive_kbd_attr_group = {
 	.attrs = adaptive_kbd_attributes,
 };
 
+/* sysfs doubletap enable --------------------------------------------- */
+static ssize_t doubletap_enable_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	return sysfs_emit(buf, "%d\n", tp_features.trackpoint_doubletap_enable);
+}
+
+static ssize_t doubletap_enable_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	bool enable;
+	int err;
+
+	err = kstrtobool(buf, &enable);
+	if (err)
+		return err;
+
+	tp_features.trackpoint_doubletap_enable = enable;
+	return count;
+}
+
+static DEVICE_ATTR_RW(doubletap_enable);
+
 /* --------------------------------------------------------------------- */
 
 static struct attribute *hotkey_attributes[] = {
@@ -3033,6 +3058,7 @@ static struct attribute *hotkey_attributes[] = {
 	&dev_attr_hotkey_recommended_mask.attr,
 	&dev_attr_hotkey_tablet_mode.attr,
 	&dev_attr_hotkey_radio_sw.attr,
+	&dev_attr_doubletap_enable.attr,
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	&dev_attr_hotkey_source_mask.attr,
 	&dev_attr_hotkey_poll_freq.attr,
@@ -3558,8 +3584,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 
 	hotkey_poll_setup_safe(true);
 
-	/* Enable doubletap by default */
-	tp_features.trackpoint_doubletap = 1;
+	/* Enable TrackPoint doubletap event reporting by default. */
+	tp_features.trackpoint_doubletap_enable = 1;
 
 	return 0;
 }
@@ -3864,9 +3890,9 @@ static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
 {
 	switch (hkey) {
 	case TP_HKEY_EV_TRACK_DOUBLETAP:
-		if (tp_features.trackpoint_doubletap)
-			tpacpi_input_send_key(hkey, send_acpi_ev);
-
+		/* Only send event if doubletap is enabled */
+		if (!tp_features.trackpoint_doubletap_enable)
+			*send_acpi_ev = false;
 		return true;
 	default:
 		return false;
@@ -11488,7 +11514,9 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		mutex_unlock(&tpacpi_inputdev_send_mutex);
 		return true;
 	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
-		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
+		/* Toggle kernel-level doubletap event filtering */
+		tp_features.trackpoint_doubletap_enable =
+			!tp_features.trackpoint_doubletap_enable;
 		return true;
 	case TP_HKEY_EV_PROFILE_TOGGLE:
 	case TP_HKEY_EV_PROFILE_TOGGLE2:
-- 
2.51.0

