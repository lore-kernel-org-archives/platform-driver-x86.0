Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE6C423EBA
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352074; cv=none; b=Yxb3cA84MQr/bD9zURKKxvLDCjUwwfZoEPFNcv3QtYCzEND711pDmX+z+wAU0q3gjrUeBocH4dHmeG3EQP4haA9/uozyrITyn+emuHhsPFl6+80SYtsKH5/XCL/ib4kAI1PZBikb1fKbf/TJz3WgY5QCMlgBHT9JhhhRvz5W0x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352074; c=relaxed/simple;
	bh=9afkvubOz18LHtF1BuW6suiYxV/PEHEmT4VezTlmj68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zef5YrZS9TKVmK+4RVqXcUePwjnCJF/Y4MW4mQg+mv6pr7tH6T5151VSkea/ME9y6FP6qNH7q5vy6oWn7s68WdbROa5CrUlsAG73xcRFNSTLco8Iux3iHEK/tswFCLFDLXe2yL4N/ZqrEgAxQIEcpDqlkrn9aFrx56yu0MApLCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=qQkljqyK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R3ll+uVW; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="qQkljqyK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R3ll+uVW"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E59C57A0140;
	Fri, 25 Sep 2026 12:01:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 25 Sep 2026 12:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1790352070; x=
	1790438470; bh=hPURyTjuVW9/3dqtL5hT7RHB0zQl3FSn53U76VoG8KI=; b=q
	QkljqyK5G8ft4GT/9YqMEh6d0qyN+QReUQR/66QVAgoZzZBcluOpfQqN3/vTSpYT
	Uz78hL9ubE3KQiahptE6qxz6FLAfMNBZ3PHKJW3KNSe3I6V8RJX2dHhceeRJ262P
	hnkCddOFv7xevfg85bQK3ycyqB73jRPS2lrNAdbLpNZ6a4WCo5R8H+ba5uoY4ITy
	JK3kVnHEc+XqqhR3KytNK4FhKoksqtlKCkHw9ulSdxA7js3NExZ2J6HBwM1eKbFi
	+55VkTdwb1h72eqL+Gjk6c7RCR8Td0F5QLnAux2KiMlmsf1Oy/V2Y4mnWxFsPLwh
	LTiS+nD9mzOGet9DxTy7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790352070; x=1790438470; bh=h
	PURyTjuVW9/3dqtL5hT7RHB0zQl3FSn53U76VoG8KI=; b=R3ll+uVWpOKYvy3ZM
	VXCTjh7BWbq1gS+4FeIy06YWJ3ooWFXGovQRZKT/jhMUUi6W2XhwDFTmQ8pORV7s
	oleFdSEp9JzPR1I4HxoFxDw0ahWHBQctc7pjBOjWSrUUprXLTeBhuXOvRBY8E9YB
	rWnLwqt8r3f3s02ncXzJT9+AjxVFei5MMxTaa806KifeuEYkQalVZ+Z9+toG5cfq
	bazg6USDmD53z/iG+M5hguFD6cJOdELFlYcFLRNFCVLcOxr/fz75KU9qyEr5npmH
	zXHyV+JPxyHwW2QUxG3ZWa0pa6C/ytTaOrvQIYp6cdFOdOTFjK+szRsoCRbC7GeY
	ZSL+g==
X-ME-Sender: <xms:xpq2al3ZyLcJiJ7zeNHtbYjcrXnlKQzl3LAlCz82PxJZn-VorI-e3w>
    <xme:xpq2amE4czDLLSLRxKKNKDSNS1cwGeqeSTwawoB7-EHWNn849nsEc-0zicsN8CYPu
    z4n3U50wFct1ZGYMaOM6m6J6Kmi3TNdH87nriEqaIlnk8fl6tuuO781>
X-ME-Received: <xmr:xpq2asi1YGXyqcfqr75Blnk3Z3qvNh7zr8m93gkrKnuzR8sY4G_9W5ESd69jAr-vPRf75T3JeLFZcscgnxA>
X-ME-Proxy-Cause: dmFkZTFeznFHdzKYyGHmAqc0l5i7XZM9PfQP0JIdLDlKu9DooSJb4nyFJ8AM8iqC0bx8Ob
    v30yj+KXSN6UV7v0Y6v9ZrkDmhxSk8pOtpowAsvdd1+MOOqlN/JB05gRuk1yRxbqvChovT
    1XhZjVQ6ziAgxLWFW/UfWDUBRNkmsSWq3pjGTLvGmTRljZQgkidKO131rztyQVCJx5falM
    uq0QGaanXoBXi7RpeZJHYTPClVp0hOY7tAXEjkn/wSmO090y5Qv4ZQE0Mlr62h2HClazYk
    VGJASFTcYRtvAiKrPh4AnNzI5m6b+GHle9lEwL1lvx7s4bgmAgwVDNbiuxDGT6dKp2O0Of
    wTjlWUNUQbG9Oih427DkrpV40HcTTZ+CmK0jK4uqS5/dWUqtwIExqfk4h/du9gn7vqIL2l
    F8ipjE4D3/E8RbRjEikoeypdqttGscGCZuGedktDmaXavQDxpFM6VnkYydJDZKMXQSWF9U
    fz/T7o+E7Q62+ecE1UkyUxgP11Nn7MNVqGGb48QrdshARfSZYfgEvyyuz6s8+vax2lWDoQ
    92a9taTTk+0OxhZcyTLrgOXv3guL3h3T94Xz0HWAjW2Is4abO3Fc277RijTzart4TPxsLX
    PlXuOgRomxVVUZ6OgnOoG9DT2v4HY/q8MyTRK0zOLLAs+Q7TIWhlNbkvOPbw
X-ME-Proxy: <xmx:xpq2ahAUl_L2jGU-e_wTy3R-e1Ixnq2U0NMsyVh4L7qr7a5FoEjoYg>
    <xmx:xpq2amQ73echrPS37EPmQji0FJDNe2osenl90IHgB4jzO1n9d95H_A>
    <xmx:xpq2auUBcidrLAZmdFzqWVFKdhiCwYrKjmPBVEG-7uvdSWRbbbI1Pw>
    <xmx:xpq2andheBW2nsSd6wmjV3bzT_3MJiBDjJX8KeKmbDgajzx44QCKxg>
    <xmx:xpq2atoO9TsAWDqjtdgbXeIClbzgl5tgWi-kVqIULmVSrx8WJUmHln62>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Sep 2026 12:01:09 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: prasanth.ksr@dell.com,
	W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	derekjohn.clark@gmail.com,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 2/7] platform/x86: think-lmi: think-lmi driver to load v1 or v2
Date: Fri, 25 Sep 2026 12:00:30 -0400
Message-ID: <20260925160047.2063361-3-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More preparation for think-lmi-v2 driver.

Create think-lmi driver that will be able to determine if v1 or v2
driver should be used.

Add main GUIDs into think-lmi.h file

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/lenovo/Makefile       |  1 +
 drivers/platform/x86/lenovo/think-lmi-v1.c | 36 +++-----
 drivers/platform/x86/lenovo/think-lmi.c    | 99 ++++++++++++++++++++++
 drivers/platform/x86/lenovo/think-lmi.h    |  6 ++
 4 files changed, 120 insertions(+), 22 deletions(-)
 create mode 100644 drivers/platform/x86/lenovo/think-lmi.c

diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
index 98a3baa45fa6..c404cff99d35 100644
--- a/drivers/platform/x86/lenovo/Makefile
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -4,6 +4,7 @@
 # Lenovo x86 Platform Specific Drivers
 #
 obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
+obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi-v1.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
 
diff --git a/drivers/platform/x86/lenovo/think-lmi-v1.c b/drivers/platform/x86/lenovo/think-lmi-v1.c
index e215e86e3db7..26a62e1a709b 100644
--- a/drivers/platform/x86/lenovo/think-lmi-v1.c
+++ b/drivers/platform/x86/lenovo/think-lmi-v1.c
@@ -34,7 +34,7 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
  * Returns: "Item,Value"
  * Example: "WakeOnLAN,Enable"
  */
-#define LENOVO_BIOS_SETTING_GUID "51F5230E-9677-46CD-A1CF-C0B23EE34DB7"
+#define LENOVO_BIOS_SETTING_GUID TLMI_V1_BIOS_SETTING_GUID
 
 /*
  * Name: SetBiosSetting
@@ -233,6 +233,7 @@ static const char * const level_options[] = {
 };
 static struct think_lmi tlmi_priv;
 static DEFINE_MUTEX(tlmi_mutex);
+static bool tlmi_initialised;
 
 static inline struct tlmi_pwd_setting *to_tlmi_pwd_setting(struct kobject *kobj)
 {
@@ -1818,13 +1819,17 @@ static int tlmi_analyze(struct wmi_device *wdev)
 	return ret;
 }
 
-static void tlmi_remove(struct wmi_device *wdev)
+void tlmi_v1_remove(struct wmi_device *wdev)
 {
-	tlmi_release_attr();
-	device_unregister(tlmi_priv.class_dev);
+	if (tlmi_initialised) {
+		tlmi_release_attr();
+		device_unregister(tlmi_priv.class_dev);
+		tlmi_initialised = false;
+	}
 }
+EXPORT_SYMBOL(tlmi_v1_remove);
 
-static int tlmi_probe(struct wmi_device *wdev, const void *context)
+int tlmi_v1_initialise(struct wmi_device *wdev, const void *context)
 {
 	int ret;
 
@@ -1832,23 +1837,11 @@ static int tlmi_probe(struct wmi_device *wdev, const void *context)
 	if (ret)
 		return ret;
 
-	return tlmi_sysfs_init();
+	ret = tlmi_sysfs_init();
+	tlmi_initialised = true;
+	return ret;
 }
-
-static const struct wmi_device_id tlmi_id_table[] = {
-	{ .guid_string = LENOVO_BIOS_SETTING_GUID },
-	{ }
-};
-MODULE_DEVICE_TABLE(wmi, tlmi_id_table);
-
-static struct wmi_driver tlmi_driver = {
-	.driver = {
-		.name = "think-lmi",
-	},
-	.id_table = tlmi_id_table,
-	.probe = tlmi_probe,
-	.remove = tlmi_remove,
-};
+EXPORT_SYMBOL(tlmi_v1_initialise);
 
 MODULE_AUTHOR("Sugumaran L <slacshiminar@lenovo.com>");
 MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
@@ -1856,4 +1849,3 @@ MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>");
 MODULE_DESCRIPTION("ThinkLMI Driver");
 MODULE_LICENSE("GPL");
 
-module_wmi_driver(tlmi_driver);
diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
new file mode 100644
index 000000000000..da1e54dab2d1
--- /dev/null
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Think LMI BIOS configuration supprt driver
+ *
+ * Copyright(C) 2025 Lenovo
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/errno.h>
+#include <linux/fs.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+#include "think-lmi.h"
+
+#define THINKLMI_DEVICE(guid, version)		\
+	.guid_string = (guid),			\
+	.context = &(const unsigned int){version}
+
+static int use_version;
+module_param(use_version, int, 0444);
+MODULE_PARM_DESC(use_version, "Force use of version (1 or 2)");
+
+static int tlmi_version;
+static bool tlmi_initialised;
+
+static void tlmi_remove(struct wmi_device *wdev)
+{
+	switch (tlmi_version) {
+	case 1:
+		tlmi_v1_remove(wdev);
+		break;
+	case 2:
+		pr_err("Not yet implemented\n");
+	}
+}
+
+static int tlmi_probe(struct wmi_device *wdev, const void *context)
+{
+	int ret, ver;
+
+	if (tlmi_initialised)
+		return 0;
+
+	ver = *((const unsigned int *)context);
+
+	/* Until support is complete - we're going to ignore V2 */
+	if (!use_version && ver == 2) {
+		pr_info("TLMI version 2 detected but ignored as support not ready\n");
+		return 0;
+	}
+
+	/* Force use of version if requested */
+	if (use_version && use_version != ver) {
+		pr_info("Ignoring version %d as requested\n", ver);
+		return 0;
+	}
+
+	tlmi_version = ver;
+
+	switch (tlmi_version) {
+	case 1:
+		ret = tlmi_v1_initialise(wdev, context);
+		break;
+	case 2:
+		pr_err("Not yet implemented\n");
+		return -EOPNOTSUPP;
+	default:
+		return -EINVAL;
+	}
+	if (ret)
+		return ret;
+	tlmi_initialised = true;
+
+	return 0;
+}
+
+static const struct wmi_device_id tlmi_id_table[] = {
+	{ THINKLMI_DEVICE(TLMI_V1_BIOS_SETTING_GUID, 1) },
+	{ THINKLMI_DEVICE(TLMI_V2_BIOS_SETTING_GUID, 2) },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, tlmi_id_table);
+
+static struct wmi_driver tlmi_driver = {
+	.driver = {
+		.name = "think-lmi",
+	},
+	.id_table = tlmi_id_table,
+	.probe = tlmi_probe,
+	.remove = tlmi_remove,
+};
+
+MODULE_AUTHOR("Mark Pearson <mpearson-lenovo@squebb.ca>");
+MODULE_DESCRIPTION("ThinkLMI Support Driver");
+MODULE_LICENSE("GPL");
+
+module_wmi_driver(tlmi_driver);
diff --git a/drivers/platform/x86/lenovo/think-lmi.h b/drivers/platform/x86/lenovo/think-lmi.h
index 017644323d46..31359879629e 100644
--- a/drivers/platform/x86/lenovo/think-lmi.h
+++ b/drivers/platform/x86/lenovo/think-lmi.h
@@ -12,6 +12,9 @@
 #define TLMI_LANG_MAXLEN       4
 #define TLMI_INDEX_MAX        32
 
+#define TLMI_V1_BIOS_SETTING_GUID "51F5230E-9677-46CD-A1CF-C0B23EE34DB7"
+#define TLMI_V2_BIOS_SETTING_GUID "4B79FBA6-FFD4-41B6-8EA8-E81CDA0F5FC3"
+
 /* Possible error values */
 struct tlmi_err_codes {
 	const char *err_str;
@@ -137,4 +140,7 @@ struct think_lmi {
 	const struct tlmi_cert_guids *cert_guid;
 };
 
+void tlmi_v1_remove(struct wmi_device *wdev);
+int tlmi_v1_initialise(struct wmi_device *wdev, const void *context);
+
 #endif /* !_THINK_LMI_H_ */
-- 
2.43.0

