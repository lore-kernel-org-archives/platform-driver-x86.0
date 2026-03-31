Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789DB44CF5A
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980747; cv=none; b=OeEPFiTy+fp6iqjXvnwg/v56ZPDR0pZp2WEWL0ragjPzSlYa8wB9tTnSMzTccmrHwdwY9IAgcbxZ9KP1zvsgd/pxsmHeXUdV+F+RpSQ2JOXLdlEvRq4Mfgx3X+N4zblbQAhhVFd50ILgKqvMCimJexyOXkkmI1yBK7PmjQOIuJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980747; c=relaxed/simple;
	bh=JiWzgDAXej9In4o5iFPkUzYAAXMi/rkmJkGLb7EKJ3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPTFA+jX8tuurRCdTwbWI6T7Qr+12/fScAk8YjXp/S++W5BKmEdoUbCGwnyiDK6smXVn3Wgj3ws5XO1nC6zfdo8XoHCfAMk9pMKlB82IHApzWVvf4xO75/cWxI2B6ZSUI9FWSiEGwhAAgrcasHwWuMrECdPjMqAgJKQP+Wogyy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyaxuI74; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyaxuI74"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-126ea4b77adso8574194c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980742; x=1775585542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btToglq9X1YRie8VMe5VKgTtvJn2RACiXwu4CAtqAnI=;
        b=lyaxuI74g8nHkCBPLE5GgbbDStxZEwQbOAGYdAsoAF6uTZap6rkro1wQ3gvQnrNkzI
         THhFKiAcHS/xYpddSj3ZbK2+sE7HilY+7gefyvpIq6q8seqUv3swqYuuz0ZLM/WhdgGK
         2FcuMUdJGs3sU7ZuDWiSEe/LUhyhbjGWJVqgz7lWFXBanJEfXzCYuMixi9N0vJVUPC1U
         MtBFZLxWq3Bsy8J/rThKhD/CzdLXUJfGkffto9cnJ1WLRE89tWzaL9I8sf78FpNMVOdM
         SIRQp37j/QKcUuZXOAfOO1sBxP1WFxlOlDx7H3Eb9VWYhp6UR+CDTMo/KelnUw5595BB
         Wd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980742; x=1775585542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=btToglq9X1YRie8VMe5VKgTtvJn2RACiXwu4CAtqAnI=;
        b=HK6NtxZRysIzhtsxpYI7t6GoNOJnWRaiT7OKP+vsXnuljCOc//7AgGKXkj1bXBEl+W
         Jm4gR/SKtNDlK2gwZM9GSwWW2uVOSKfDWwBJ2gaxS2pb+3V6nDFCEbJBLeNAv3k8gW25
         z5+3MFYKTJkD1T450M7MlZCSEwXt908t2Dk9jt8rRoCzENxxjVjEPXMKp0mV6VByChgA
         iFqA/Ygs1nWCIPmfuGmfi9ZEqAYcQJPwRWWJ/cMGrn6xw0xANqDdSgt9IbF3Uak0CVeq
         KGhPR/KMfCS6uPF2HE4yL49H1oZR0F7aeTrKw+dQfScq2mhmeZj47NLz8bCwlRE/uGYU
         eVUA==
X-Forwarded-Encrypted: i=1; AJvYcCVWyIzikiwcbqK1o7d5nQxALzDUUu8FUivE5B6jL5T7kJDV4ZbdsKutPcerhQOQFK6SFhekGyf5PZ7WZjRSDI6m7nOo@vger.kernel.org
X-Gm-Message-State: AOJu0YxsKm0xakMXOYHRvY3Nu+BzrvSlmG8EO8WUtj82s4PU6zdM+lcE
	WTVH/+wlGc/kRncOl3jkxoo67vuLA225/bkphAPTny8q94dD7+AdG+K2
X-Gm-Gg: ATEYQzx98jOnaFnzn9bxKwz7oBe387Am/Uw+fRtIllJIk6wUgTVg8XqE4o086LhzGC1
	WXDTbRseLCE8q05/kLhH4ZyXrAP1dXG2WGI+QibyVf11DpdtxWAb/WKQym5Y1xG0YYg5dXB8YnL
	0WaC3mLrEbrsF9jZpQzR+myp7oAvLXKcAKLh3oVW5qoSdvrLs34YZ4s2Vn7SUAPKlO0dyI6aBPZ
	LX5gtvC6I1lM0zJ2QmKfIYpC+QlCehGOQvF/5yT8EaoDbkiJFT0k1/yIPhT7srMOcghEY+2/fc5
	/67xamjFBLqJdnqOaKLQMaE1nfWVkQyujkM4fCuYNPV5DrX9lO9LAXYxeMmd4V3oTjp+eWvuQi9
	gMu7WPpaYCBL/1cAWgSND+EggZlMtvbDsIdJi97xEvbGd+rjjtjQ4cJxxgCq8tfEcj56QSZA5rI
	30tVWSFMiI48xqOqmDsRR6pvE0qCOY6cZo/R4Ytyklhv1TcUQatfZfr5JqzNXhcnVF80shqamk+
	gKk
X-Received: by 2002:a05:7022:602:b0:128:d2f2:5cf8 with SMTP id a92af1059eb24-12be6575e03mr273151c88.34.1774980741768;
        Tue, 31 Mar 2026 11:12:21 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:21 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 12/13] platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
Date: Tue, 31 Mar 2026 18:12:07 +0000
Message-ID: <20260331181208.421552-13-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331181208.421552-1-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
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
 drivers/platform/x86/lenovo/wmi-helpers.c | 34 +++++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-helpers.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index e1cf869224d2..52a0c6a5a4bf 100644
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
+module_init(lwmi_helpers_init)
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

