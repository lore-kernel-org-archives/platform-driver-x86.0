Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6967C3845B4
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028297; cv=none; b=dtuRfDlvB3G65L8JbOp4qHad3d8jJqwOtAMxbDzSZ1YMDCCo4vwMY2A0WL04vZ9k85XrRixoSFH+kyucDFco3SXPoGGaYGc0dI4elm6q8RgGr2W2euq9yTWjRACZ6l8did6ubKLOPDMY7yGnXNEAypqEjZqtMZN3sr0WWrmUASU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028297; c=relaxed/simple;
	bh=nw7kdTs1biYqcCyLBgFFjUVOcmzqKE/6nPTRSBdw19M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVzM3xfZ4AaV6Dd+fmkFfhkLCOQus79tXNELJ0mIdCL9cGM4I4ckS87Z8o3pudJhrjaMU9reLOnG0mmvqDPrX6yD4THWFC2tZs/T/dNEYC3FxYRmsiO6QX2m1kCS4yfwWf83hA0BptDfw9XFALUhf2ma+zfybcf8xmDdEm4TEeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lr9qewzt; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lr9qewzt"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c25b90264so3867834c88.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028294; x=1776633094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZGzwivOSp3+FMEX/5WCBroL/DIUwpA8g1utSU5YDlE=;
        b=Lr9qewztfc3uwjueYDuRk/DWOvcDt1pknRIzDVLNCoRqqqme4nEyA8I28d46N2+36F
         69gr93A8F1l38P6KIF+gH0/joy2GHYILSzlH4+d2pJOR/ytqkrL/YU5CldsztaZJrwor
         jM+Xh9fuoBtkSTp8Py129U0H0jb+Uk5HRCsbWMxsJMv8bFptRIAmtwrGc4tg70NxnlrO
         8mCHhxjeCNvNrdgyUiRcOOpBCHFuRkUcMFWvSKwj64kDD2k6wmoCWoDbg60jofYimFpg
         56tSxsw26oml1h7vInjr1iDUsrHxE2HBTVI+coxS1NZzuuoWnTW/bBjfdnNAbz5I0kKG
         ybUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028294; x=1776633094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mZGzwivOSp3+FMEX/5WCBroL/DIUwpA8g1utSU5YDlE=;
        b=BJDCf5/CIAR9yDzzsmNl1yA10EKdZNKqpbjiXCtYPBSJbLxVbe+IgqOXtWrCj1qy7V
         8FSy/N3LFNnwHs7YKVLLnwj/adcLryeKr6dlwLqvVYP13BtlRfLiSBWr2cs/VK8g73ML
         Y9eNG6SPk7r9JWuemdHb5Qj5wnwopOsBf32UpZ2es8R3lMIVnPKLGujnLv6NcK/NyU7U
         vNB3B/SNLetms55/oP3dmHMyGP4Qf0JtQ6XWo3r6Wij7njfDj+y0PkAJm/oks96dqqEO
         BlF1j+YptVW2cHYH61q8rvuT9ERKwysp48MkmZtlFok3SyRj6zUrDWQT6cKO6Dv03l3E
         57wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVInf1w9VI4xCa7k7LltzfEF4oEzScuxsCkLsmzdg88+t0eISXo9j5Ot9nKRKeJmQLaT7PVVnTWzOBT4koWhFlEWF5l@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8q0XGKpH2Hsrcj+PBd6gR7dqxQcc+pfLQnltGmKWXrBdl7c+9
	7Mvle6bRo/ZZ2wTDqyDnN0o2aNIXdR+MUlLxcYIdpW7FK7TIHN4Ah+s0
X-Gm-Gg: AeBDiesNBTZC+eyIV6u5mbMHIdnmN5Resf+XUx38XCN9sf9tfrp+Xdx2z+dgeNCJJ/v
	eGhWigfjk/84m/+KBAjdHbWHTUdBSzYWQGOI8EpROSJ+UfZKTVRHvshzEjph9BE51xDj3ZM3c5z
	nHPUstKJlY13n3tb1GdgMUk7Mogl48tGQm4CzHrcVCBk1ldKCVhaofbg2b5qAJTmv8hYDU8l07Y
	WHrXvM+jl7PRexgaY0/8RpnwnAt8CWlmdbLH0JJ9VXt/VH7zr9P1NOSU8UDiqfKvy2joPRRugxI
	aq/hkpw/PehalRPA77nHuMG6BVZasOJDY7reuGFPcysPY2GPDdhHkDit0JfiJGg6+jRSdphBoXz
	NdQtR+w91kDPnsNszf/c9M9fqYPKMxMsBoTUrj4/1r6IK9KNxi4Qyyi8+HMxHMj+x+e8oKtgGVv
	hgyItmU4E+62pMBYSqmzDtsWQX5h+QzKjEH6LT+O315Rf81g0STqwKclgMQsYyEsh9c69jqtvBe
	Xb8
X-Received: by 2002:a05:7022:b97:b0:121:dea2:d54d with SMTP id a92af1059eb24-12c34ececbfmr7373550c88.20.1776028294281;
        Sun, 12 Apr 2026 14:11:34 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:11:34 -0700 (PDT)
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
Subject: [PATCH v10 15/16] platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
Date: Sun, 12 Apr 2026 14:11:20 -0700
Message-ID: <20260412211121.2220556-16-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
References: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
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

