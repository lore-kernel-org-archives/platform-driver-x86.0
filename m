Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72928371889
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 06:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779257278; cv=none; b=gvngw/w9JPQHBhURLgoFIw/sk1oUi9BJEcy5tn8ycPPm37vNKwTJJtaNj4Zzc72kgVt2g8LhMuBekoj0Oe0156kHTjgUDSsjF7tFlo9CJgqXQI3XQ2ztCkeNiBdU5+f/6gF3tTkK7mZgQCYzj7AtgqwZmKmacGTw90dLXiAbHrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779257278; c=relaxed/simple;
	bh=GxCFq9AI+jwh0+r6j6wu66r8AXdJi64J9r/mRxaMYII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHXxFsKGhx9hM2dg0XCxZamgLAjrRoCCtY6CCD/k47jn79gs6ZxukYEYlVPJRDPc8RO1DVhRjIO3VuRCcbiuyZBk8xd9H7u4aNkpUSU7F86hgDuXoBECWgiKMmcGPZljhVzHQg2+ZXWDkvBcbM8qBQuxrRW8ZBNdTEKeJ02W8oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoFQ3VTu; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoFQ3VTu"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1332772f6b3so5568385c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 23:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779257270; x=1779862070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/FEk053G9MxEw/xHdJE9UEmMYwdRskL+c4zHyrhNvk=;
        b=AoFQ3VTuJaB7ok0ehxhYsdyhpeHSJkVgHVToNMWE7ZTgqrcduNaF3juSrbSa4KKUlV
         U4P+/Lx5NIb+o16K6o38/iqq/hOlYW54KqXZbTaCvUMBsKx65KUV8aPm8JLViaKy6Tr0
         SJLXXva7ca1uSZECr3DODsmux/+5ngoar+DJWSDajEtN2cGX1MzH5dKtHozVF0tw03wG
         D4wrSe6psB4QT+JBjvF2yX1fneYN0S7qN/TIPFqCSHcO9/dqM7L1SdnFTW4q7XZX+zXO
         KevxfvAQmc84QyhBPMqVYVDoP+qhZCOpbsq7u91s9ZRa6KH823OmLYtZLT1sZZl4LjXS
         VjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779257270; x=1779862070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y/FEk053G9MxEw/xHdJE9UEmMYwdRskL+c4zHyrhNvk=;
        b=QK7pbXG1Z6MMpLVIeSw6D39UtDb8DGS1HE/E4QZkrI6j8kuX8zneCpoIq+QnS0RcFH
         IxDaFz0NuMaiGcHga2zs6AEe+DML6J5zTbZGtmPwOWsdhf/VYF6k9ENSk3vhcRRSdREB
         rKatJ1QXp0v4tTCCjOYKR9WAKbNEhwkMOT2KK6jSL7LoOSG9KtztNF2kue0PuaogCNq6
         m83cU+gEByLg7Il6iHw0sDnCwQieV+izcijXtzUqiZyLMY20RH0eyVLzXV6roooM/BT4
         AVKvApA9zgWW+kG/negwvQXLFvAR9BxoYHqiIyzwHtrsFR98jWUF84J37W6Pw2JTNcq7
         kUsw==
X-Forwarded-Encrypted: i=1; AFNElJ/CJEJsaGujNy82uSSqQqAZvNb9dVCOh4jQ3BlPG/hC2tzdGr1OEI+qfHZU0g32BizYkJgmn1xQOaPr1zee2jmVyfk2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9c/qyQ8GiInIvWiAQhgBqC7WtidrwMRJdgt0XZp4X6Yj2U7Cw
	kmY+Aw6l7ci4RQHVKQlnvalOzn791JX+rnVBKWvrM0CU7WwIg+qCYtaH
X-Gm-Gg: Acq92OH4Uch3ThWJzpuBRIiL6UjR8hHb/E7KfMyTJ2Dkb4B4sOT4293kNOxiJq6e8f3
	qtyIcgBlj4a5xxokMd/RaM0c/QjpUWokF03ajr5xyZugDDPo9F+36CORkZrJr6N1YVHly+QP54v
	KGIw36sMZ8CddbNypepFH5B7gq5M1KX3b3ngE3JjvAXKmmflV4872x531fN5XdDPBYawqJJ7vCX
	sK4T/d2xpw59V/stPQLrG6dToqFT2HRZqBh1vYhVqu3FMFghSIENbraSzRWG+DJIxBrg0tAyI32
	HhuuUO99YA8OpB0lDkoK/WVW7/YhoVmCor4xl8FvdROiHuiMhCcs/pdxJW/YHKGkcIwvMTqXjZX
	u782HZ5V/0ON8G8W/SqyvwQov+BWQYKuznVHYpHT0xhxJhO7N98pYrY79vz+mnEyycaQj7qZTzb
	ZFBYnmbAeJ+hIpFQJ4sDp8d0yWih85+U3245aM8QPlA3jYxWPNzpoGrWYqiWVty8YLRNPaEZRnc
	TmI
X-Received: by 2002:a05:7022:2523:b0:12a:6c4b:9d01 with SMTP id a92af1059eb24-1350430f349mr8673149c88.7.1779257270470;
        Tue, 19 May 2026 23:07:50 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm27906026c88.11.2026.05.19.23.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:07:50 -0700 (PDT)
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
Subject: [PATCH v14 6/7] platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
Date: Wed, 20 May 2026 06:07:39 +0000
Message-ID: <20260520060740.119554-7-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520060740.119554-1-derekjohn.clark@gmail.com>
References: <20260520060740.119554-1-derekjohn.clark@gmail.com>
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
v13:
  - Fix alphabetical include order.
v7:
  - Use subsys_initcall() instead of module_init().
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 34 +++++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-helpers.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 7a198259e3933..8f5766c391eb4 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -18,6 +18,8 @@
 
 #include <linux/acpi.h>
 #include <linux/cleanup.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/module.h>
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
index ed7db3ebba6cc..039fe61003ceb 100644
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

