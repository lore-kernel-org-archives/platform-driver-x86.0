Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C59382F32
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 23:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630298; cv=none; b=LlKgU/FDRcFQUE/h1f9eQFrTe6Wnr1JRNUg8MAwDcOa5Z/rwq5o+VpmSREfMkMtgA056YM2m2POv8m2UoswsOMbrXDH0C3NTDNc4+8Rts5VzNoBc8i4gjOI3/Duc8dq+UUDaSTy22WKGLr9U6CaAa8dkaJUr8r0atrfdZBb9K7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630298; c=relaxed/simple;
	bh=4d42TBYxhrEKUs/Ex72+YVx038OFOO6Efovah/WgVDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jKqhefzM0xLPbmlpWu2+XdY4eEhK++g8Ufvc08NkKeeAsxG1zFOZUpUGEKmaOBoCrw97hN0qRe7S2VzkKLxZHYOxadXvWPHRmmDMg7Za4jRgbDLvi1jJ+rxscHcPdt9iIGg7p7sfyqZhPZsKCmysRdkQYczosefzt5Qwn/ba19Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYGxL6ot; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYGxL6ot"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ee1054627bso5148170eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 16:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778630296; x=1779235096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81SlTE+HhOzFbiYLIxMeZjJ33RF64bMO8xaQDR8dKPg=;
        b=QYGxL6otiLtlmK447P56IU8e+uvYGajYv18BA2L4uaNUnAKhMUSE/t4980Mr0UtHvT
         fasEutzWwVveju9C2J5JfxfxOaNqsGGuGfAhh7U+R3cbvytEbGEOBwAleaJP4oxJrW5J
         XI8x+o9xFbhVlDSYeEwXKVWwpN7MdfhgyVe+NYShHmcxqP7BszNcUKC+/83oPfifJJpe
         s1FSXp5cqdlHd6F5mOUfDZTlJPaIYSXL7uYEcpPQsqlYcixp+DPsSs9cdvl5aoHN5389
         zsUYupWueuRoYzQFz4VQwThB6bQUe6QWRcMzSKNUzgV/NrpswTPkkZbtVEbrXtW4Srgs
         vYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630296; x=1779235096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=81SlTE+HhOzFbiYLIxMeZjJ33RF64bMO8xaQDR8dKPg=;
        b=EFjgp+Us4eAe2uFstR1OLYGo6GSm7Cb9899GJYH8sBhCMX47spYGgaWZpZG5uSPtdX
         PdqMtx2MOgOM5aG/+i4c/JB24Cpm/Jex8Y4VOvzxVDcPlsCe8EC5Iv4IRaIXrSqa7HGa
         NaPRb+TuUJbmqZz9Pj8RzQ5HU4miayadlJGsw2nqVm7RSLPgWC47OA6gC0AW1Mv9BpF7
         rnSbhp5DgELiUkQER3ynT4tWuw8QsRcOfsqF8igGCLFAypYzvHnIub7Or6Clotnjww63
         1I56qjseywZFLLna1QpCyP55ATkWFfFQj1WrzsNsGkoHLRCV+hb7asSGck0Kacfqqrhf
         FKmw==
X-Forwarded-Encrypted: i=1; AFNElJ9bz1XJzI28l9r0+GfxzJLm6M0OFGTnM0G09xzLzW113faN5r7CGefLkq6yuG8lmOtkodLhnvBWI+4amHdF+JVRTMZz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfy5DNyZ2inWZN1nE/8fHgGLhkCRXY4KLJS4S9wdW/G6C9nWrl
	1avMhe9xJb6JRbyliTIrCc0wScP8XpRdkkkLCFaPq0PvXVffqgTsXBQ1
X-Gm-Gg: Acq92OF+PQcipw3V9BD3AymDktrvCAW4gDYVYO+utRtt3CetGxJlxhbFnRCkwRavg1X
	HMwvGmA/i9rsrW+zNLKXYYA39z7to3niFIAkatUJUioZhYe51ncRfwHs8mTnfUyMgPlFmyQinon
	/WVwxHfdFXuopFWtWHOR99AvsBc5c+eQlUR7N9/VVGv4aZ5S4ZUl8YT09DFvHDj+UvpqC0IkF9Y
	0yduiSfwC2pIXP2/1ryyYQ2BJFuLipb8Xe6EH3v3jygmTImvYAxKM1a0R3X7XF7Jg1CB0WhU6KT
	6QlGlZvXDNBgRuyUDzifhE/iArjKNdwchkMXYrNhfa1Y1kFrqhg9FikW0XkzJFEkl+MAXG3aBkR
	4KDPX/C8gon1vC+GK7Yb8Se3Uku3GEHAJ1ROArD8Z4sGzQcyzKfJbBvChGxXKgvgehprt+ZCGYa
	yDj+KjmpfWrQJUCzADIv/Imr3L05HhFfyDpANHFUHPmz+jXp/eYWk6PMDobix2Fnd1d6ebbVqrd
	S1b
X-Received: by 2002:a05:7300:5720:b0:2c1:7480:ff9b with SMTP id 5a478bee46e88-2ff95e5e1cemr2922195eec.18.1778630295708;
        Tue, 12 May 2026 16:58:15 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm23625851eec.27.2026.05.12.16.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:58:15 -0700 (PDT)
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
Subject: [PATCH v13 6/7] platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
Date: Tue, 12 May 2026 23:58:07 +0000
Message-ID: <20260512235808.691046-7-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512235808.691046-1-derekjohn.clark@gmail.com>
References: <20260512235808.691046-1-derekjohn.clark@gmail.com>
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
index 7a198259e393..8f5766c391eb 100644
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

