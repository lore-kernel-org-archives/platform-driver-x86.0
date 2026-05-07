Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72C347DD4F
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 18:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177135; cv=none; b=jsJEWPSWaFYubVmQ2R50PEBOpPs6DxKf8i4e7MsiDi1WhfQnN3qGbSii9afi6CMx58hvsOc5yF0HMltnUCSoSP2VG2SyS217R0aIY3Iyb4GuxGjonC6d0jglT9cQL28dXYFaRIfJUjlGmxIRVriPcwH3IjFZxMJonAVaPuGhNRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177135; c=relaxed/simple;
	bh=nw7kdTs1biYqcCyLBgFFjUVOcmzqKE/6nPTRSBdw19M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVyOobXKS9piosPsbwcDCttL/AVGURm9+xF/xeQ76T126tEr/EliKsGnfgjt8bhE+omQul/gmJoUGjMyCizCELZwBHIso6YV2PapluxUS6ZtTTfzHgiKI8dSz3scIN7DKXazucRTaPK2HSwa0oRhxK5t8Hm2X1L14u5tly60Yfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2Ccr8uL; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2Ccr8uL"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c15849aa2cso1483612eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 11:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177133; x=1778781933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZGzwivOSp3+FMEX/5WCBroL/DIUwpA8g1utSU5YDlE=;
        b=s2Ccr8uLLWroO2D0Jtkli5piMafIJ+dGQSAMjPLg2cuE5acY6VEd7WVl9uXk15EWKZ
         sv60UENorRlnfFRcuTZsCuyBw9D7rY6VVVcOl3V6mZnSys2vJl4VPCZRtZmYTrQJorBa
         KH9tBFp6ki1UJ7iIl9YOG9vA8IK7sead6VOU1LajFZWZVimC5HY9fFcv1R5pUwBY5XGd
         yqpdF/BGqv/FGX62FXXzmjGz/H20sYZDvdHMP00SZdLB4ipSpWxNLEx53me61J0M6MPO
         R3bZ62yVkcsu4qDLZhanQ25RHG98JT8rH8dz+Ly6zPrwhuGf/62aFUiCAPH9xk8dzdd4
         KeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177133; x=1778781933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mZGzwivOSp3+FMEX/5WCBroL/DIUwpA8g1utSU5YDlE=;
        b=YUHNamzkJapBUoevbvs24WyqP1pPmvqU837d3opnkUBrus/vzTc5F68YVQqXlXQCNw
         dMVcqdI1FzDjXllly9hPKOD7/GGbZ2D/qEyB7k+6QJvX5sHowz761i0LOqxPMiA4clAn
         RBPsNev/dj48IavFaV9dJeZvhCGkD2AigVUR0cdHJ+jCB8hDh4HJVI2WFA7jGrrNGk0A
         t1FPB2VureXtmFg795sJHoQY9Kmv6kGepprZ259eNSOtDWGUmquHp9DPmESxjOFruzv9
         1GNMHLdY2SMHyKePCR2ohhgDwf0KkYIxPXEID2x3i84CX5niKvtsm24I9cm5yr8XogCP
         bl4w==
X-Forwarded-Encrypted: i=1; AFNElJ8YNxDwLh0X9IfNs41hQ+uMZTnSAWXRjpQpt+3smgav4caA5H4y7yrG1x9JHqhlWU55vzzr37M7p3PQt41w4i354zm8@vger.kernel.org
X-Gm-Message-State: AOJu0YzMwwRJQo2M6JKbZE5T20jqj6989zYibCEzgZ9FCdrbOUxi31h5
	0CDrcwsEQW8L3VMNDogw8HbR13xQXRUm/p+KPANhq5MCja44/25B50Rm
X-Gm-Gg: Acq92OEeOnfeHqTA3kW+52RJrvUsso6ewRmK21pU6a3nB1icC5ZUDSDuc7CvFMsHJ8c
	tyiAYk6LQHSfHJeRLm3fSjJNTPN+UYRiWtnPv8OKefEJ2qbXRkIoRLJuizzvhGPrMIk0PeR0IIc
	2pW4HhJ2ir9J05mjVKhiiDQYK158IQFrGQVakjkmlBX9YIkQFsffWJGBVHUcjuR9bFaFEMQB3WY
	0pyQ+yVpPE8xyDOw901KXfq+rf7IULcIhm8/ZhIVTMqjzXfrhGVFRf6/xYiFYjdSTB7HX11Ksa/
	UX0pQLMYwPUFDfNgmtGqcYwfWOFcuQerDmw2LlWUBEU1yFFjLQ6xD3KJMh4KiBCYWp63mz+fZAT
	UYBvPeFGLJdCcqYh3HTxZvnttiUumHsKgEAKDnSaoT90m4v0sIG0xdkJ8ul/280yUbFoYJwv/Yi
	4zKoSf3z837727ETNEfuHylu5wGoX3A8Uex6BcF3dUJRVK/6X8M+qJHYY/4fcjrCzQFf3Lz2V+U
	RMY
X-Received: by 2002:a05:7300:6d03:b0:2de:3022:a459 with SMTP id 5a478bee46e88-2f549f7c266mr4428613eec.21.1778177132842;
        Thu, 07 May 2026 11:05:32 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82bd73a64sm44332eec.12.2026.05.07.11.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:05:32 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 14/15] platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
Date: Thu,  7 May 2026 18:05:06 +0000
Message-ID: <20260507180507.912966-15-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507180507.912966-1-derekjohn.clark@gmail.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

We are about to add debugfs support for lenovo-wmi-capdata. Let's setup
a debugfs directory called "lenovo_wmi" for tidiness, so that any
lenovo-wmi-* device can put its subdirectory under the directory.
Subdirectories will be named after the corresponding WMI devices.

Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v7:
  - Use subsys_initcall() instead of module_init().
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 34 +++++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-helpers.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 7a198259e393..82dfd26c9c2b 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -17,6 +17,8 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
 #include <linux/cleanup.h>
 #include <linux/errno.h>
 #include <linux/export.h>
@@ -185,6 +187,38 @@ int lwmi_tm_notifier_call(enum thermal_mode *mode)
 }
 EXPORT_SYMBOL_NS_GPL(lwmi_tm_notifier_call, "LENOVO_WMI_HELPERS");
 
+static struct dentry *lwmi_debugfs_dir;
+
+/**
+ * lwmi_debugfs_create_dir() - Helper function for creating a debugfs directory
+ * for a device.
+ * @wdev: Pointer to the WMI device to be called.
+ *
+ * Caller must remove the directory with debugfs_remove_recursive() on device
+ * removal.
+ *
+ * Return: Pointer to the created directory.
+ */
+struct dentry *lwmi_debugfs_create_dir(struct wmi_device *wdev)
+{
+	return debugfs_create_dir(dev_name(&wdev->dev), lwmi_debugfs_dir);
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_debugfs_create_dir, "LENOVO_WMI_HELPERS");
+
+static int __init lwmi_helpers_init(void)
+{
+	lwmi_debugfs_dir = debugfs_create_dir("lenovo_wmi", NULL);
+
+	return 0;
+}
+subsys_initcall(lwmi_helpers_init)
+
+static void __exit lwmi_helpers_exit(void)
+{
+	debugfs_remove_recursive(lwmi_debugfs_dir);
+}
+module_exit(lwmi_helpers_exit)
+
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
 MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/platform/x86/lenovo/wmi-helpers.h
index ed7db3ebba6c..039fe61003ce 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.h
+++ b/drivers/platform/x86/lenovo/wmi-helpers.h
@@ -16,6 +16,8 @@ struct wmi_method_args_32 {
 	u32 arg1;
 };
 
+struct dentry *lwmi_debugfs_create_dir(struct wmi_device *wdev);
+
 enum lwmi_event_type {
 	LWMI_GZ_GET_THERMAL_MODE = 0x01,
 };
-- 
2.53.0

