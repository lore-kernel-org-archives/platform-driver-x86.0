Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56320263C8A
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 23:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766793250; cv=none; b=aEww/uiLib31swUGit95VSskahCWItx51HkuaBTZnVJeCHsLa1mC3BbmsmNHTk28t9Jpt7DPA/XiVCzSDGQoKGHmo8QYKStO/dem8qmLBweM1t/JK352tPj6hc2p0kAaXuh+e+b0bhU69tIA4kc/+5lqqGR6gj7j5nyftZWDjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766793250; c=relaxed/simple;
	bh=EHO8zs+g1Ko8UHjpjUG4wCs7CJMj3UxzMt+d6rQqm7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUe7xFUpX2NMuCmy8bO23KllA9gWd8ouBqE53UsQ3GMMw4SluSfQlhJwQSplIsA0K3jye2WncURs8D/pjnBiT+AJX2E1AyyR95j3+ct7/iMFrEgpOB7hh4XWM7Os5AttHGC4Dq4c2VxMi3MAew+jgAW57Irqckc4MD+LnF4Syts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6lzhDdf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6lzhDdf"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0833b5aeeso102211785ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 15:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766793248; x=1767398048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5DU1y+/2ttdbcr+v/9sCW2fX8t95H3Z19WR35X2oK4=;
        b=j6lzhDdfGg1c3OQzxctuT0XS6lBZ7dk6RD6hCvaNbTmGB0a/FhEPY7/5kg4LsIIIUG
         ja7L+RBCw28iP2l8h3XrBFYD3RkkhJndl4F4j4JJXMt0qURBX3Oc7pAYADJYJQ0jM+xh
         ZW3/57S+SMa02uGMsCQ6iNTbNw4klpZgsaDGOchrko6ySpqT5E6zkzrEtcEFGCcLxE39
         26YVl2vbYF98ZEipxPU2YESSVOVhn+Rojptk94jStkN/Zkh2aoU+vmuFbFv6PgF5ZWm2
         MebYRFAqE63YKo9lkUl6CZaYFHy2pmL7FrkzKFBcgNND/x1rmB7FcVVE2P7tc5WnbxVp
         pTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766793248; x=1767398048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w5DU1y+/2ttdbcr+v/9sCW2fX8t95H3Z19WR35X2oK4=;
        b=JqHwftt0ghKAGhqBsZLKo4CdKaU2fyuEoEkEG0XyxjFCDxvJguqwhGAtVGk8mxWkKf
         7AwbZEsZHPVUZ0zlR9QpdsoNA0lIsxM73AXB+zl3VlDjDuRYDWSpGMTpBFqzlgRgRTlQ
         OYytkhPmJfO0n6icrHUrv8WcptpoTFnnXoZmRmLi9I3BLjFofiSFUqKFTTKvB1tAISEA
         ElxdP9E83YfuvwUlfSFSWdwvmGfG/JLHuOEmXFyVlTYsMvnpNzEbdmRaNtGOis5nTOld
         4r6djH/tEnaKAYlFFxZUin4lfXu7M9TCMX3VXB73Hx8gQfZpANplimE0sUgJ5NuVg9iv
         hIog==
X-Forwarded-Encrypted: i=1; AJvYcCUKlzhK6qN/iZuN8JvUI6LRPiyDz4fU1dtSCd/4OIrzZPDKbXdLPqkRAmR80yW+2eW7cqXezF47rFtFWomt8X3VQFib@vger.kernel.org
X-Gm-Message-State: AOJu0YwAxe7e66MVPYHme2UKcJ9EK44DarZfGPxz8ws2RaMusLbDFn8x
	h2eiifyKh9J1dIGLPKNm9OU7ln16zqxREay4gnVW12U7RWkO2rp4+xbl
X-Gm-Gg: AY/fxX4oBbDdPFGrGwNk57wVxRdHYVvZGpSOGHUV3AF0cggXOm03YIuGQdomy1WDI68
	iF4wx1mAJ+ADo9OX0bA9Bb5KLH7ZD7zIT4hF9bSqM4Uj+lz3QnmfydgPe8u6vNOPwbPwFqHV5FT
	fOPIdyUe5lqKoUjJr0j6Jc+EEzR4FuwF6840LfDHBme8MXlfliXOG7Yu39TTe+hlovCheSi/afo
	SHqGDqtAvOWzHpV/lNXSGZD9cFj+JenyRsJLG+qyXcJG3t95TkOozgQ0UhpEZylv8s3O0pM+Fz+
	cgRcivBqMr2WEiVl+RkIQzbzGmP15d9oKvwuzES0MadsKLE2OuIyMuvHl/ZTt5/Lrn2JB76UMxR
	7bgfx2+Hq+jF+OhKWgLHQ8XeoxMolB2lk1amDrwSMHKL+SXne6FXvmFUujB2WS8bHzZB6GkPl1u
	0CNaMcueCxXoqHwNCoZduCaFwEKPH851vYWetak4cRU82PjxPUt/rMVV81Xd7VqToBTQ==
X-Google-Smtp-Source: AGHT+IGHZNdiYUAkHVfUtkTTfJbCMz+mzs2nqIy6hLh/pD7Fj59xEYPwd2APipEMKlpWGct6gJgcbA==
X-Received: by 2002:a05:6a20:12c9:b0:34e:e0ba:7ab with SMTP id adf61e73a8af0-376aa4fc463mr26589388637.40.1766793248246;
        Fri, 26 Dec 2025 15:54:08 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm23395216b3a.45.2025.12.26.15.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 15:54:07 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net,
	derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v5 2/3] platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint double-tap
Date: Sat, 27 Dec 2025 08:51:00 +0900
Message-ID: <20251226235101.106451-3-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251226235101.106451-1-vishnuocv@gmail.com>
References: <20251226235101.106451-1-vishnuocv@gmail.com>
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
index cc19fe520ea9..ca01323c990a 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -373,7 +373,7 @@ static struct {
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
-	u32 trackpoint_doubletap:1;
+	u32 trackpoint_doubletap_enable:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -3018,6 +3018,31 @@ static const struct attribute_group adaptive_kbd_attr_group = {
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
@@ -3032,6 +3057,7 @@ static struct attribute *hotkey_attributes[] = {
 	&dev_attr_hotkey_recommended_mask.attr,
 	&dev_attr_hotkey_tablet_mode.attr,
 	&dev_attr_hotkey_radio_sw.attr,
+	&dev_attr_doubletap_enable.attr,
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	&dev_attr_hotkey_source_mask.attr,
 	&dev_attr_hotkey_poll_freq.attr,
@@ -3557,8 +3583,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 
 	hotkey_poll_setup_safe(true);
 
-	/* Enable doubletap by default */
-	tp_features.trackpoint_doubletap = 1;
+	/* Enable TrackPoint doubletap event reporting by default. */
+	tp_features.trackpoint_doubletap_enable = 1;
 
 	return 0;
 }
@@ -3863,9 +3889,9 @@ static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
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
@@ -11285,7 +11311,9 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
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

