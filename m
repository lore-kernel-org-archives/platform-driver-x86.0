Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E478F3C0619
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924630; cv=none; b=sQUM8LIHc4EOhsn+4dbsc9ZhLeHjdxNq6YyX+aUEAP8JIEzfezqnOiwCbsHCVXXGqU63e3Qj93FGMMLHLmLPiyJxf2zHOXf2+Y9rLMfMk3LLHhSKcQB9NlgSXotRFVc7LbOlojN4/guIhYbt4yCsCyWLLy/vHjStCgBBDKOxdj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924630; c=relaxed/simple;
	bh=nw7kdTs1biYqcCyLBgFFjUVOcmzqKE/6nPTRSBdw19M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3Q+dpz37YqHTdqzlhql7TKnuPZKIWL2pSnD8drFB7dEV+tdMpO9xkQje391ZWaM4hjY+ulgbsH9EmkqgGZAl6jeggrJ3NvIom6btKLCZPRcVnTe8v5ZemdYBBI/OV+hA7Rm7QR0U/S+Jmm0FV2bJoCm1a7+qGtfUPDPuntloHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZP8luJlb; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZP8luJlb"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2d64c756111so2184088eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924628; x=1776529428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZGzwivOSp3+FMEX/5WCBroL/DIUwpA8g1utSU5YDlE=;
        b=ZP8luJlbnRM9UbA61NFldvLVadf9xb7rcn/vhpJUYild6hB/Idg1VY9MpbBhh+FaM6
         82QnQEl5vnR1cZjkLZL7t4M6beKJEa2VntoL2G3i/lHPA3dvfpdzhQow6Vq2ofPhcI5Q
         wMTFH/ePzREBcaKdr9T+fgN+JWCncdHtUTATIOme9mOi/hhw0YRE4c6hgZbhUF0pClnu
         KdPdrOzfPZ+38CcN8MOgs9/EesoqNR3oG/T6Gdy/HxcCmg1SDu4m8cl1jdz0Stbcljt+
         lxKvDn0MhWGy3WHRNTG/vlhVOfYU3i3ab0AYoG/GdbJ9Mr5KAdiS1ncsXCWw/LaJadBM
         Qntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924628; x=1776529428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mZGzwivOSp3+FMEX/5WCBroL/DIUwpA8g1utSU5YDlE=;
        b=L3XNoULnhyrESCju0HBdK6DXIvcmxzMO2Ouf3Rs5xsYjfV8M63PYJAyObmJDETQB6R
         4hz6QSdJ5uIOe/wvgs5fL2WO1/eN1tLiQfEMqhyju4qyJj/nnp4zxGUZ/+7uDypXiUXa
         k48yMsxN75ZEaWn7AzAHRBQT8PF5ZWk0Qg2UyRyyyLRbNKdIl2oTW1BaFyApctsXbkRd
         cmAleZtWp00KE6nqxf29NKQhQ7AMIg9B4IzwsYuomGudiSgPaJllGYzXVplcAM5vFhjn
         nfi4KTl8NHfU74rOiBBcgShRNuCk2prfVTJm4A7n8N7EyYKcbJEKjxL9KEqKqD9es/my
         hJ3g==
X-Forwarded-Encrypted: i=1; AJvYcCW1EtK9uSeLsm9ZrBrzci5Zz/3h0nbITjmWwDjtshM1kOdDdYPRvT/VkBlOjKViaUpYKcGtandpN7amdhDz5xYEBu10@vger.kernel.org
X-Gm-Message-State: AOJu0YzEjSu1UN/QlYG4/gV0Z3vbYR4VeWS9EEeSVDAptHHWrrk1PE34
	6osJsqeWS3fRL373Aiw3tJAB0bGEHWYyRKkiR9MB3CkMSE+XwcUlEFq/
X-Gm-Gg: AeBDies4q8JbsZy9PT4ZKv/+6IWYLuPkJEAOLxWuMSxHslPTGjoSC8kt8WtGS1WE7Bl
	CZOoNESk5iTKRFLqXJSV1tagL+8q4m+h87fnRrj5CtNTAHfhkxuSGsVF87FI72aRPkxdfV34ujL
	sY3V+Mi7dno5osn2xD7TMOmL9dcDQ96CJpIYxYhInGhkQV5lI287MEn/KHrn81qK7jtOkeS6eMd
	cF0Z81JJhjkz2jj7a05tPomZuLae4RixjcE8URMbLzQmTWe1Jzhzd95+JVzuojGgf67BpOet9JU
	w1aqFVth2nznZQTBnS/LZzklGZq/t3loVjo1+PhVVv/DcJgiFvKgAmq38fZJBYkWcy6rJ1GXHJ2
	z8KkWo19Tc4dNK25prnUqSbq4AuWHQGRzoN0mOrcJo6zbhoT/GD8MYwfqXcBTO3Nqkxf+8eM9kn
	n5xUDUdAnlaweGkegwf8+VYrepiaPfJlPav0w4Y0DM4VjYi5RJiCplKWm64kyQbQIhG3ShR7Loj
	sBm0Wdp4i0kYlU=
X-Received: by 2002:a05:7300:df05:b0:2d2:d7b7:5c70 with SMTP id 5a478bee46e88-2d5881b0358mr5154606eec.15.1775924628184;
        Sat, 11 Apr 2026 09:23:48 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:47 -0700 (PDT)
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
Subject: [PATCH v9 15/16] platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
Date: Sat, 11 Apr 2026 16:23:33 +0000
Message-ID: <20260411162334.25682-16-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411162334.25682-1-derekjohn.clark@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
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

