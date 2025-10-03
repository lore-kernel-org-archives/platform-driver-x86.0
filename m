Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94DC2DF15F
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Oct 2025 18:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517742; cv=none; b=J6BtAZNhoWRLA/XWpGBmo474iSB7+9qNylVE3OqVeUd70H2BQ/xYZbI18DY1MHM7E/iR5CO3ZgYV5b6jlnWnm7NRHVXNRUTiJlfhxwxHr6V0NEFoq6WKz4LZEg+wTPyhleDcQKnJahzsQprWnpMuQbJN6O7ZImR4IF3ruzWl59c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517742; c=relaxed/simple;
	bh=JCk7VqzZDm0N9em80Jlh9Edcp6PBHzBN9/7plUWcVDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bt7ukUGMvHtvEr1w5AvbW+Ef107CE9jr3/uxWprsq2jBMFLqT5UnEbZa20q7HPpvXAY0P4/4l/DxF5t4q32DkSef71dON0o8CYSJ/iKFqmBVQ4hNMGmPAU9PDHR3uVxNx33ybSrzTodO8cf8TvK+lPv9a2Ng8Z5uIIu7czHUjGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkujKlcZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkujKlcZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e542196c7so21151555e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Oct 2025 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759517739; x=1760122539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Fxy/cL1NOLAJha530jz1vfM7F1ZmkTYxBgTPvWr6HI=;
        b=SkujKlcZ444nCHDWiczLu+rKBNh6z4rs7hRKkRt79Zoa0WRb7BhE+QZbWAxS/BS5hi
         B9P6vV0p/DDmfAUyadcRMQLqp0qKXMppKHr6T09MuE17ERB3OawVNJdqnhsX4yeiTAbM
         Xk1sq6AHqKFKeEBy7G6Cv3JWhgkwKuXnXcua3tPilZc0fEgqE21ponmyUxTTQvm7asOy
         ePbT53KNzGrO8kZlXk4wVYJTbV2tkiEthfVgVstDk4TSdZsTdW+NR4cXWm7Q0upttlap
         s+uuqmdqftjrBmifIIIZwWhC28ntlZH6rRDxugGfxp0PqU9LMHx5chNQ4eDXHkJUktep
         b8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759517739; x=1760122539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Fxy/cL1NOLAJha530jz1vfM7F1ZmkTYxBgTPvWr6HI=;
        b=VEJ/sx6yrGUU5iHoTB579VOgIMKF2m5+nIH4JhMDmcoqH+aD7jZUg46FO7UHvJPm6+
         QOz54iFAUipSuZNxdOvZyiMQdk7/B/zv8GO6+Kr6zZYj9DLVwT5ijcUaWAl8JrQpXNMq
         wP8+pLinrx7yYFKCxHQUKn9jocTuD5TqdyrW1D1PLpt7g7iXQBAjv5FZbfmmT2Au0bC9
         GTWDziMALEyDHpO+Wk7bl8bZkOODvQBaBxaHx3k6Oqa1Bp72YUj9F9aULzFsDXPyUVEz
         JY9AlIHgDEsZf9B82FSt34VVMAaW57ZUaYxuQzKbo0pAqmKrlrzfg/8q8OqoHJr5LeAA
         pq4g==
X-Gm-Message-State: AOJu0Yzobts5jFGJLZmYTNavTZlKghsjRBrlKtfR/XcN76mki3oZoXOz
	OsQzNy/EfaPOtgLp4LV4BDRJILd9qLiqqWq8TKI5Y2ejDDPyMrZMLui/
X-Gm-Gg: ASbGncuRNvX2Z60mhOWY6HhXq+edY5vi1RmHGPgQxE008D5+qtNXihTEB4OgjLUnmgD
	GLiLXGrkd9c7NXaFyPClH+L+zsAmyyONWzOyrTvJFyEpPX88S400ToQDoNzia6ADtKoM6tfFjsO
	Mt+SPp5HSmR011TExYy4hbeljOmjYON8IvsOWDXn5Hd1xWtj7AXBPhF0DI5elM+am//qnmW6HNc
	fNsIY41JwR8/SY+vyCA1SGa67udgVPmtnQlx68kpu7MzUVQeq9O6pAQF+YedW43LPTwF8AAUPI1
	XPT23EJfF9kD7T5girJXQRMJ+WLyU5HxQ3LqnAMDRCG0sstuWeoQFb+8c9wTPvhaHGhqzrNRY3M
	TNnEfzGgnrV8W8SZ/JCbxE8fTeWazwPvhFJCXI8a9OMHHh4cAms3VJrx0kXb7n5TXuYBfeLb6
X-Google-Smtp-Source: AGHT+IFYFP078sRLCamY+MbXneSKWbxK4prNXYDUkjO0MDBhgDCDp2ldzZac5f7foMrbwM68kfavYw==
X-Received: by 2002:a05:6000:4023:b0:3b9:14f2:7edf with SMTP id ffacd0b85a97d-4255d294cdfmr4898051f8f.1.1759517738878;
        Fri, 03 Oct 2025 11:55:38 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9762sm8946927f8f.38.2025.10.03.11.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 11:55:38 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>
Subject: [PATCH v12 3/8] platform/x86: asus-armoury: add panel_hd_mode attribute
Date: Fri,  3 Oct 2025 20:55:15 +0200
Message-ID: <20251003185520.1083875-4-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003185520.1083875-1-benato.denis96@gmail.com>
References: <20251003185520.1083875-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Add panel_hd_mode to toggle the panel mode between single and high
definition modes.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/asus-armoury.c        | 6 +++++-
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 57ed9449ec5f..68ce2c159ae1 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -92,7 +92,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 
 static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
 {
-	return !strcmp(attr->attr.name, "gpu_mux_mode");
+	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
+	       !strcmp(attr->attr.name, "panel_hd_mode");
 }
 
 static int armoury_wmi_set_devstate(struct kobj_attribute *attr, u32 value, u32 wmi_dev)
@@ -403,6 +404,8 @@ ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
 		   "Set MCU powersaving mode");
 ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
 		   "Set the panel refresh overdrive");
+ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
+		   "Set the panel HD mode to UHD<0> or FHD<1>");
 ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 		   "Show the eGPU connection status");
 
@@ -416,6 +419,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
 	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
 	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
+	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
 };
 
 static int asus_fw_attr_add(void)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 71c68425b3b9..10acd5d52e38 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -76,6 +76,7 @@
 #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO 0x00110019
 
 /* Misc */
+#define ASUS_WMI_DEVID_PANEL_HD		0x0005001C
 #define ASUS_WMI_DEVID_PANEL_OD		0x00050019
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
 #define ASUS_WMI_DEVID_LID_FLIP		0x00060062
-- 
2.51.0

