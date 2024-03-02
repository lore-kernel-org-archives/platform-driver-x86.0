Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEF9241E7
	for <platform-driver-x86@vger.kernel.org>; Sat,  2 Mar 2024 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709398915; cv=none; b=dPWjm67z9sUkQAXUq7ugAfkZS1e63oLiz/euKKtGVos6EYjfNhh4ZRQcMLAQHiHgt70qz/0XJYtMsf0NWSz1fNQwDdjfytrzclul/3hRSoTVrs0isu35VuBlisrIwZvNDsZOa05X1N34c7Pm8/zNQlUq93KC9Fk9RdZxqUkkqjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709398915; c=relaxed/simple;
	bh=U1acnAJ/wgnrq3yLvFuauf+B9G53rUdQ4yfEFVUHlpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=RMOZIYJ2v0fWCE7W0GYlUZl2kkBrYAp5ghkEVXuwOBM6ar1fXkbEnQ9ETobJc43klYex/ChWp2K0LV6VI0g3/FWlDDlJI15AU90nLjXEnRPaRB/xI+Oe4S/LgTvvMV7I8DN1cYIclQc7YOJ2er2EOtC8DSjbPuXUbgha4SDsmfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=dVSwYfue; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="dVSwYfue"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-788201e3a87so23116685a.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 02 Mar 2024 09:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1709398912; x=1710003712; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c9fwuh8oCKIZyIz0PJcapjAHJQL1lsI+nQ02gZDDkxM=;
        b=dVSwYfueodbvm5nB8ao8xh6YD+6Mr0DHUKA9nKEHORmk0XZGn+bSzANzYeh8JDF7kr
         6y2c3/1DymVSxlI9klxdTgzA5y94wc0PVImfNrjRcBC3KhXJs8kFNR3eiYtuDHdRHmNE
         S13kIOnM0xyWSM4Fwe93uH7mLAHTxtRMdqbzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709398912; x=1710003712;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9fwuh8oCKIZyIz0PJcapjAHJQL1lsI+nQ02gZDDkxM=;
        b=GIQWpO1G0aZ+Xm+ykANKeelmzbLhqnJ8Ci6wjIBdqRwFB4Vug5X6V6jp838OX86cik
         tU5v+kOJVB8tIHXrb9ZNSQFEbT9KUsJ7YZZZ08BwTdk/fDugfl8QqSDPhA5AqPup+wvo
         WP/S0pw4uLuYCH65gdEtlH5wE3mXI2dpSr5pnnh7YwoozvgpeVEFTmyEQMm/0JcLvYpO
         UQOoAD8Ed6FCTe0NFLZWfkPp4d2/syi8DvMm0IaWqnZ+wHcAe9eH6WG/ShnWO++Vp/W7
         zEXl3UHR8fKgVVykguvsJrjExEl8q3ICNxQAXXIBPjbh1wC5tMVE3DxrExpuQGFZPJ9L
         86BA==
X-Forwarded-Encrypted: i=1; AJvYcCVwNSpPRngIALecwLGm745YzmRprFCwrKNxVXj5t4iHdZJl5kIo8Q0Sh0CZy+ZBB4KwSXYsn8yCYCAGvWP9fJsCMvsTmVHohznZRXiwYsjSXKqYSg==
X-Gm-Message-State: AOJu0YwnGJpNHnOhMrMByUZOPqX6ie5uGKUxOTyn76iEz4vUI1o127rf
	etN40npDkJ0IL2t5dY9/hJQ2b7YSnvgTKnTytNNMXiE+somfp0/2LV1qA79Fjm8=
X-Google-Smtp-Source: AGHT+IHv+wTnNFJRD3hMTRAbNsYVVdn4TeJdhmOtSkYucuXpGLsKq6UpRnEx/X7c3yWyJZo/zDrm5w==
X-Received: by 2002:a05:620a:1721:b0:787:a64a:b05a with SMTP id az33-20020a05620a172100b00787a64ab05amr6236601qkb.6.1709398912448;
        Sat, 02 Mar 2024 09:01:52 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id z8-20020ae9f448000000b00787c6ed9a68sm2684871qkl.91.2024.03.02.09.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 09:01:52 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ivor Wanders <ivor@iwanders.net>
Subject: [PATCH 1/1] platform/surface: platform_profile: add fan profile switching
Date: Sat,  2 Mar 2024 12:01:47 -0500
Message-Id: <20240302170147.13026-2-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240302170147.13026-1-ivor@iwanders.net>
References: <20240302170147.13026-1-ivor@iwanders.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

Change naming from tmp to platform profile to clarify the module may
interact with both the TMP and FAN subystems. Add functionality that
switches the fan profile when the platform profile is changed when
a fan is present.

Signed-off-by: Ivor Wanders <ivor@iwanders.net>
---
 .../surface/surface_aggregator_registry.c     | 36 +++++---
 .../surface/surface_platform_profile.c        | 86 ++++++++++++++++---
 2 files changed, 99 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index aeb3feae40ff..05fd98998d67 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -68,12 +68,26 @@ static const struct software_node ssam_node_bat_sb3base = {
 	.parent = &ssam_node_hub_base,
 };
 
-/* Platform profile / performance-mode device. */
-static const struct software_node ssam_node_tmp_pprof = {
+/* Platform profile / performance-mode device without a fan. */
+static const struct software_node ssam_node_tmp_perf_profile = {
 	.name = "ssam:01:03:01:00:01",
 	.parent = &ssam_node_root,
 };
 
+/* Platform profile / performance-mode device with a fan, such that
+ * the fan controller profile can also be switched.
+ */
+static const struct property_entry ssam_node_tmp_perf_profile_has_fan[] = {
+	PROPERTY_ENTRY_BOOL("has_fan"),
+	{ }
+};
+
+static const struct software_node ssam_node_tmp_perf_profile_with_fan = {
+	.name = "ssam:01:03:01:00:01",
+	.parent = &ssam_node_root,
+	.properties = ssam_node_tmp_perf_profile_has_fan,
+};
+
 /* Tablet-mode switch via KIP subsystem. */
 static const struct software_node ssam_node_kip_tablet_switch = {
 	.name = "ssam:01:0e:01:00:01",
@@ -202,7 +216,7 @@ static const struct software_node ssam_node_pos_tablet_switch = {
  */
 static const struct software_node *ssam_node_group_gen5[] = {
 	&ssam_node_root,
-	&ssam_node_tmp_pprof,
+	&ssam_node_tmp_perf_profile,
 	NULL,
 };
 
@@ -213,7 +227,7 @@ static const struct software_node *ssam_node_group_sb3[] = {
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
 	&ssam_node_bat_sb3base,
-	&ssam_node_tmp_pprof,
+	&ssam_node_tmp_perf_profile,
 	&ssam_node_bas_dtx,
 	&ssam_node_hid_base_keyboard,
 	&ssam_node_hid_base_touchpad,
@@ -227,7 +241,7 @@ static const struct software_node *ssam_node_group_sl3[] = {
 	&ssam_node_root,
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
-	&ssam_node_tmp_pprof,
+	&ssam_node_tmp_perf_profile,
 	&ssam_node_hid_main_keyboard,
 	&ssam_node_hid_main_touchpad,
 	&ssam_node_hid_main_iid5,
@@ -239,7 +253,7 @@ static const struct software_node *ssam_node_group_sl5[] = {
 	&ssam_node_root,
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
-	&ssam_node_tmp_pprof,
+	&ssam_node_tmp_perf_profile,
 	&ssam_node_hid_main_keyboard,
 	&ssam_node_hid_main_touchpad,
 	&ssam_node_hid_main_iid5,
@@ -252,7 +266,7 @@ static const struct software_node *ssam_node_group_sls[] = {
 	&ssam_node_root,
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
-	&ssam_node_tmp_pprof,
+	&ssam_node_tmp_perf_profile,
 	&ssam_node_pos_tablet_switch,
 	&ssam_node_hid_sam_keyboard,
 	&ssam_node_hid_sam_penstash,
@@ -268,7 +282,7 @@ static const struct software_node *ssam_node_group_slg1[] = {
 	&ssam_node_root,
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
-	&ssam_node_tmp_pprof,
+	&ssam_node_tmp_perf_profile,
 	NULL,
 };
 
@@ -277,7 +291,7 @@ static const struct software_node *ssam_node_group_sp7[] = {
 	&ssam_node_root,
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
-	&ssam_node_tmp_pprof,
+	&ssam_node_tmp_perf_profile,
 	NULL,
 };
 
@@ -287,7 +301,7 @@ static const struct software_node *ssam_node_group_sp8[] = {
 	&ssam_node_hub_kip,
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
-	&ssam_node_tmp_pprof,
+	&ssam_node_tmp_perf_profile,
 	&ssam_node_kip_tablet_switch,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
@@ -304,7 +318,7 @@ static const struct software_node *ssam_node_group_sp9[] = {
 	&ssam_node_hub_kip,
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
-	&ssam_node_tmp_pprof,
+	&ssam_node_tmp_perf_profile_with_fan,
 	&ssam_node_pos_tablet_switch,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
diff --git a/drivers/platform/surface/surface_platform_profile.c b/drivers/platform/surface/surface_platform_profile.c
index a5a3941b3f43..e54d0a8f7daa 100644
--- a/drivers/platform/surface/surface_platform_profile.c
+++ b/drivers/platform/surface/surface_platform_profile.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Surface Platform Profile / Performance Mode driver for Surface System
- * Aggregator Module (thermal subsystem).
+ * Aggregator Module (thermal and fan subsystem).
  *
  * Copyright (C) 2021-2022 Maximilian Luz <luzmaximilian@gmail.com>
  */
@@ -14,6 +14,7 @@
 
 #include <linux/surface_aggregator/device.h>
 
+// Enum for the platform performance profile sent to the TMP module.
 enum ssam_tmp_profile {
 	SSAM_TMP_PROFILE_NORMAL             = 1,
 	SSAM_TMP_PROFILE_BATTERY_SAVER      = 2,
@@ -21,15 +22,26 @@ enum ssam_tmp_profile {
 	SSAM_TMP_PROFILE_BEST_PERFORMANCE   = 4,
 };
 
+// Enum for the fan profile sent to the FAN module. This fan profile is
+// only sent to the EC if the 'has_fan' property is set. The integers are
+// not a typo, they differ from the performance profile indices.
+enum ssam_fan_profile {
+	SSAM_FAN_PROFILE_NORMAL             = 2,
+	SSAM_FAN_PROFILE_BATTERY_SAVER      = 1,
+	SSAM_FAN_PROFILE_BETTER_PERFORMANCE = 3,
+	SSAM_FAN_PROFILE_BEST_PERFORMANCE   = 4,
+};
+
 struct ssam_tmp_profile_info {
 	__le32 profile;
 	__le16 unknown1;
 	__le16 unknown2;
 } __packed;
 
-struct ssam_tmp_profile_device {
+struct ssam_platform_profile_device {
 	struct ssam_device *sdev;
 	struct platform_profile_handler handler;
+	bool has_fan;
 };
 
 SSAM_DEFINE_SYNC_REQUEST_CL_R(__ssam_tmp_profile_get, struct ssam_tmp_profile_info, {
@@ -42,6 +54,13 @@ SSAM_DEFINE_SYNC_REQUEST_CL_W(__ssam_tmp_profile_set, __le32, {
 	.command_id      = 0x03,
 });
 
+SSAM_DEFINE_SYNC_REQUEST_W(__ssam_fan_profile_set, char, {
+	.target_category = SSAM_SSH_TC_FAN,
+	.target_id = SSAM_SSH_TID_SAM,
+	.command_id = 0x0e,
+	.instance_id = 0x01,
+});
+
 static int ssam_tmp_profile_get(struct ssam_device *sdev, enum ssam_tmp_profile *p)
 {
 	struct ssam_tmp_profile_info info;
@@ -62,7 +81,14 @@ static int ssam_tmp_profile_set(struct ssam_device *sdev, enum ssam_tmp_profile
 	return ssam_retry(__ssam_tmp_profile_set, sdev, &profile_le);
 }
 
-static int convert_ssam_to_profile(struct ssam_device *sdev, enum ssam_tmp_profile p)
+static int ssam_fan_profile_set(struct ssam_device *sdev, enum ssam_fan_profile p)
+{
+	char profile = p;
+
+	return ssam_retry(__ssam_fan_profile_set, sdev->ctrl, &profile);
+}
+
+static int convert_ssam_tmp_to_profile(struct ssam_device *sdev, enum ssam_tmp_profile p)
 {
 	switch (p) {
 	case SSAM_TMP_PROFILE_NORMAL:
@@ -83,7 +109,8 @@ static int convert_ssam_to_profile(struct ssam_device *sdev, enum ssam_tmp_profi
 	}
 }
 
-static int convert_profile_to_ssam(struct ssam_device *sdev, enum platform_profile_option p)
+
+static int convert_profile_to_ssam_tmp(struct ssam_device *sdev, enum platform_profile_option p)
 {
 	switch (p) {
 	case PLATFORM_PROFILE_LOW_POWER:
@@ -105,20 +132,42 @@ static int convert_profile_to_ssam(struct ssam_device *sdev, enum platform_profi
 	}
 }
 
+static int convert_profile_to_ssam_fan(struct ssam_device *sdev, enum platform_profile_option p)
+{
+	switch (p) {
+	case PLATFORM_PROFILE_LOW_POWER:
+		return SSAM_FAN_PROFILE_BATTERY_SAVER;
+
+	case PLATFORM_PROFILE_BALANCED:
+		return SSAM_FAN_PROFILE_NORMAL;
+
+	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
+		return SSAM_FAN_PROFILE_BETTER_PERFORMANCE;
+
+	case PLATFORM_PROFILE_PERFORMANCE:
+		return SSAM_FAN_PROFILE_BEST_PERFORMANCE;
+
+	default:
+		/* This should have already been caught by platform_profile_store(). */
+		WARN(true, "unsupported platform profile");
+		return -EOPNOTSUPP;
+	}
+}
+
 static int ssam_platform_profile_get(struct platform_profile_handler *pprof,
 				     enum platform_profile_option *profile)
 {
-	struct ssam_tmp_profile_device *tpd;
+	struct ssam_platform_profile_device *tpd;
 	enum ssam_tmp_profile tp;
 	int status;
 
-	tpd = container_of(pprof, struct ssam_tmp_profile_device, handler);
+	tpd = container_of(pprof, struct ssam_platform_profile_device, handler);
 
 	status = ssam_tmp_profile_get(tpd->sdev, &tp);
 	if (status)
 		return status;
 
-	status = convert_ssam_to_profile(tpd->sdev, tp);
+	status = convert_ssam_tmp_to_profile(tpd->sdev, tp);
 	if (status < 0)
 		return status;
 
@@ -129,21 +178,32 @@ static int ssam_platform_profile_get(struct platform_profile_handler *pprof,
 static int ssam_platform_profile_set(struct platform_profile_handler *pprof,
 				     enum platform_profile_option profile)
 {
-	struct ssam_tmp_profile_device *tpd;
+	struct ssam_platform_profile_device *tpd;
 	int tp;
 
-	tpd = container_of(pprof, struct ssam_tmp_profile_device, handler);
+	tpd = container_of(pprof, struct ssam_platform_profile_device, handler);
+
+	tp = convert_profile_to_ssam_tmp(tpd->sdev, profile);
+	if (tp < 0)
+		return tp;
 
-	tp = convert_profile_to_ssam(tpd->sdev, profile);
+	tp = ssam_tmp_profile_set(tpd->sdev, tp);
 	if (tp < 0)
 		return tp;
 
-	return ssam_tmp_profile_set(tpd->sdev, tp);
+	if (tpd->has_fan) {
+		tp = convert_profile_to_ssam_fan(tpd->sdev, profile);
+		if (tp < 0)
+			return tp;
+		tp = ssam_fan_profile_set(tpd->sdev, tp);
+	}
+
+	return tp;
 }
 
 static int surface_platform_profile_probe(struct ssam_device *sdev)
 {
-	struct ssam_tmp_profile_device *tpd;
+	struct ssam_platform_profile_device *tpd;
 
 	tpd = devm_kzalloc(&sdev->dev, sizeof(*tpd), GFP_KERNEL);
 	if (!tpd)
@@ -154,6 +214,8 @@ static int surface_platform_profile_probe(struct ssam_device *sdev)
 	tpd->handler.profile_get = ssam_platform_profile_get;
 	tpd->handler.profile_set = ssam_platform_profile_set;
 
+	tpd->has_fan = device_property_read_bool(&sdev->dev, "has_fan");
+
 	set_bit(PLATFORM_PROFILE_LOW_POWER, tpd->handler.choices);
 	set_bit(PLATFORM_PROFILE_BALANCED, tpd->handler.choices);
 	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, tpd->handler.choices);
-- 
2.17.1

