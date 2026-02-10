Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA7B2DECC5;
	Tue, 10 Feb 2026 19:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770751198; cv=pass; b=kY0j6AVc0jwnZO/VxqElDOikIWczJrmOlTy/bO+iS7CmklMqb7KqJBVnhnXgDiUhZQzoExwAw43epXNSuPvkAQPd1mq/QslCV7jJceX7Da06Ll1XsO3Ykv8h8jpLwmZT6PDTYxNETx7qd1o1GRPc4zvojSJ6Q2gr+3ai8wz1/AU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770751198; c=relaxed/simple;
	bh=YLqqNnjtsPQ6xb3gIuE9s5jiF6SHI/Nm8MYCtSwQukI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1aVSZHsHWJesS/y6iOStZrByt+SUL8G0hzcmH+stqV1u/9BohWgMmjlSJPdY5WL+pSwYu0lZbfgfxLhY/6BeVeZ80xXqb5t2/NzDKgIs97wKAPDlijTCmI3lve8Bem0rzoMEFtJ4+82wYTGAmCohUaatRVCkbmGl4mlNPnSdSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=K5eBOr7J; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="K5eBOr7J"
ARC-Seal: i=1; a=rsa-sha256; t=1770751188; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ho8a3ahyop91WJI7Od3mATb7sxU8v3dQAkWcLlThyLN0UnVtVjTCLgDDXE2JOGEaerbkJYEwYYn0RL1msIbZ4m5cuL3pALQEp72U0Ab//qo6K6kWkhr9ambua+piQO15pvOyHWMow/2Qpo73Wz8Eo9nGvqPDOwvb/f6C1S4h+s4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770751188; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=O01NgmcagJrA9SCxU0brpKV2Q0ijTxgfec7/rgbf+lI=; 
	b=GzB1fO72PbtgsuBN3rfy4vIS0FpUxRG1kU9KplNzl/38mWB9kqD8TH/0B0pjYFxOaWtPoDoQHouSKG7FEHn8JAhyZwXLsfjq+ac62KyJWsoAWkUvsj2ZLVvgYcHkJxKjT9he2E9yi+raSf6QuGpHiW6MJGX6qHDzWniBWL5ebaQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770751188;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=O01NgmcagJrA9SCxU0brpKV2Q0ijTxgfec7/rgbf+lI=;
	b=K5eBOr7JFdOO6o2rChH34zhJEd2VgRoFVINTy3JxCuyz4qwvC/XzgWtfU7M5XRZO
	g0yt52taUVB+CY/1PVyLkqWA5VnATPa005nOGmG69583hbH2kXSZruY1XRjSbvHkJpO
	o07lM382RrBX5crmVPN7ltbtMbido0in7Q61lHWr05neWy3Bn2pkQ8TCO+Gat9tPByc
	RRDgPbW8cDsaia5f+wUqYEoZbaDcTdQf3NWZe5HBrgzpKcfnKEfyY0e4D0M2vDvj2pe
	a35Fg7+BT1sxQWsJ1uiSemVlLeWFMJpfLMk/03cvT+8WAKeEDYT33BKa86+3MX1kBmx
	/vHGjChEcQ==
Received: by mx.zohomail.com with SMTPS id 1770751186444957.19458311809;
	Tue, 10 Feb 2026 11:19:46 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
Date: Wed, 11 Feb 2026 03:19:36 +0800
Message-ID: <20260210191938.137234-2-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210191938.137234-1-i@rong.moe>
References: <20260210191938.137234-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

We are about to add debugfs support for lenovo-wmi-capdata. Let's setup
a debugfs directory called "lenovo_wmi" for tidiness, so that any
lenovo-wmi-* device can put its subdirectory under the directory.
Subdirectories will be named after the corresponding WMI devices.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 34 +++++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-helpers.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 7379defac5002..e615da0d14a18 100644
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
@@ -84,6 +86,38 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 };
 EXPORT_SYMBOL_NS_GPL(lwmi_dev_evaluate_int, "LENOVO_WMI_HELPERS");
 
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
index 20fd217498035..3df49427567ee 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.h
+++ b/drivers/platform/x86/lenovo/wmi-helpers.h
@@ -17,4 +17,6 @@ struct wmi_method_args_32 {
 int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 			  unsigned char *buf, size_t size, u32 *retval);
 
+struct dentry *lwmi_debugfs_create_dir(struct wmi_device *wdev);
+
 #endif /* !_LENOVO_WMI_HELPERS_H_ */
-- 
2.51.0

