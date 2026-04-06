Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9825339F170
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506456; cv=none; b=VhIi7wlolEQsgMNzk62P+0f8oqIGXF7NqLDe0ZJwijCURDIcACJAOoAfZxWDeyonX/xb33qeYLuzTUwbYYUorAFKBAzJWlCuvzfI5aRMnzfo6pTrUwiFsLWseu07Bi0RnN5lnITPEui7uiv4sjXvdzAvj5sqGAjK08BRvPkxFSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506456; c=relaxed/simple;
	bh=nw7kdTs1biYqcCyLBgFFjUVOcmzqKE/6nPTRSBdw19M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kx7y+Q3ggB1gI3IwsF10vjlNNoqFIzUAbkDbRtLNEJV89nj5HLPSM1SALETCE+Rj/rux+hlqZ/bNICbTatrndFS2vm+SAFTjqg7dqMRDGmqnU7P6SW1QnJpO/QHhWHCYhZSOmMAv3xIp79tbww5pzAJP4/ghr7vaIASKF1x0H3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjB2Q3c+; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjB2Q3c+"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c0b72daf7so3255270c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506453; x=1776111253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZGzwivOSp3+FMEX/5WCBroL/DIUwpA8g1utSU5YDlE=;
        b=GjB2Q3c+2JDVui1uAzw8VobU1URLeJFABidtiPXFPSGj835zEJ7JQk678iksuBhZEj
         UAb05qOUdV+HwGx9dEGIfyC/mH5eeUkMCyzJ7f8jTyDcRzITXUJr2oPs7vEwYRPEoUaE
         pw4QUrkaUVlNRMtj/jZCaxnf2bUyyC0mmlEbkfh+pAP/07FClsjP/CyX5qFNMFuAQuE5
         xinZGVKm9G0RdzPfBgtq06ldWziQL83LTegHwTHiRpnw88gKEsjgwGStGoXLQAsPzrqD
         j3BlDt17vm1uGgmJXhx3tsObH0jkaMzzbjO6DWq6BCl5IEe03Wd/zkAiedN3TctVlUXQ
         p47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506453; x=1776111253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mZGzwivOSp3+FMEX/5WCBroL/DIUwpA8g1utSU5YDlE=;
        b=ZTTTk8g9s8938hK3qqyKekXvRhMsYcIWTrZoxl/KP2OKQVHVrQW1ZGR3ETgF/if02t
         rMOMmd4hZyZ78ym5cEWl3dNi3+hcGY1ST5X6Q4uVfnMMlanBeeVRIDG7RmRdtMvoiHgg
         VzBxnbXBRLHoGOXzSyfg9UNrf0XjyO3hD1jK6NgzqE6fL6+p1Q6Qh/0SZO5bwV0xoCfw
         PjjnvbM89wSDsUZc4lj7rcLdtkWS7aMzm/0ZnQ+Bz8GzNCwUGjLPqwqGwIaessy2apXl
         xIbBYsYnQEKSO6zJT7YBn3YyDNGW0sREENHG/kGXAbOpbxp+NSA0wBYfNXvRPEgz863q
         ffrg==
X-Forwarded-Encrypted: i=1; AJvYcCVNB3wtqjPEqDY35RW4nhMMFvyaSxVMqRugpxpQOmhRyp3+fb3AfSGBBiNg9JuWtMjX/hihg/hH8Ps3CHaT6w0ZpgTj@vger.kernel.org
X-Gm-Message-State: AOJu0YzKdWlPj/ynmIFmyABYP5rHY/OzYNMwDHmL6uDGqH3UBjA73Vph
	jFGJNGI7cuamjnFozvefmPt5LrUKEMKaj+pLM95cZA90jIoHh0vMOOnH
X-Gm-Gg: AeBDieuB2NC1F97xboiNVt+YQvi2/UOIkuozPFGW7i7lL8ttDXlewKhbCQlsKmPUcZb
	FtsjO9FNLMhtN329PN4909Tigr0kQFPplpk3bISsDedl2q907gTUuHGi/8qe14k4E9whgoM6nmF
	kCcn/tCk69qzZcEguFefvOHmnPZ+T8tEDUe84D0CNbQ4HPmYcrFtSqK2ZTdW+Fwofo4uWgOJj0F
	JIOCm0u4XwNynWNl4ZCTipxM3/BSk2RMx6Q6b745Tnftetq/Cph6v1wpHhGkzNLRiPUNcEUDZfc
	rU7nn5NLbVgjfR2F0T3YIBQzjskhk2nJqrEBS7cWQ2Js2yYwRwHniTmymm+Zag8NYzlfxoxtVRp
	OwhMpigIaJavDDCMjj8lAYvbb6suQRPEjrO9LVol92EKQSSbYxAxZJO7ioPwTZYj6pKzu4iGMeE
	dYpkOa4E3C69iAFan4bZbC5k+vXvAeWwoGsPRkrn0m+gCEY1awqRrDRcoWXaKsjEa235/Ju9Gbr
	nc/
X-Received: by 2002:a05:7022:229:b0:119:e56b:957b with SMTP id a92af1059eb24-12bfb638cc7mr6781613c88.0.1775506453454;
        Mon, 06 Apr 2026 13:14:13 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:13 -0700 (PDT)
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
Subject: [PATCH v8 15/16] platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
Date: Mon,  6 Apr 2026 20:13:59 +0000
Message-ID: <20260406201400.438221-16-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
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

