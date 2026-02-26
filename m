Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D732BCF45;
	Thu, 26 Feb 2026 00:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772066081; cv=none; b=mAQXR2n6IZtz3sBNsLuV+aaTmtc8TxRRjiKv7JkbATRi2NKITpEkXAEjzK1Umr8h2cLJC9Q/sHf9JwAmda00vPYo5ui6pF/vWkVvbqcuzvHz3qd92N4i5ydE+awqwQXFVVUVP652u4wtvogkW2lqrzTBoTx4J0XEe3+kiBhiNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772066081; c=relaxed/simple;
	bh=g/YxkbAoL6RVnjN/gHfSHvr2wR8NgFjkML8MissOkug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/kRy+ErkAmcL7yC8IN1GICKNlL2yOk7SycRKxlc2+vFsPzVCCmwZ2OD12Vxqm4KSdkqTxbpGHvOPvYwQNvdi37Ug0qykwtGyCyILofdt4irQGQWvDUTcf+e7bSsUwwbu33nPii+T20XJgANC6ZcLM83y+U9OeiCtdZqFL90OdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=F489gfgN; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="F489gfgN"
Received: from wse-pc.fritz.box (i5C75F712.versanet.de [92.117.247.18])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id E664E2FC004D;
	Thu, 26 Feb 2026 01:34:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772066069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nZdwkTKegxiZwyIzsjXKt0wrvNPQTN7YQUL0u2OgArw=;
	b=F489gfgNtEGC0etaADLTXYnTk7ZuboiKW2B10Wmo16SXaMxsD6nPQe3fmm/0Wf/WHfegea
	tzp7Ix7RhKx95flmlCVGeTQSG2kNbm7elwfl9ozV/FFz4MgwSOSKtT1IBExZk2ahDq5Xyh
	dnrDtrqIgvBLFetoUrWsA8bFgZWTfqM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] platform/x86/uniwill: uniwill-laptop: Rework hwmon feature defines
Date: Thu, 26 Feb 2026 01:31:37 +0100
Message-ID: <20260226003408.1623547-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Wolf <W_Armin@gmx.de>

Split hwmon feature define in smaller parts to accommodate for diverse
hardware. You can now specify the presence of a cpu and/or a gpu temp
sensor separately and if one or 2 fans exists.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 68 ++++++++++++++++++---
 1 file changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 6341dca20b76a..7ab82cf16f388 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -319,8 +319,11 @@
 #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
 #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
 #define UNIWILL_FEATURE_BATTERY			BIT(4)
-#define UNIWILL_FEATURE_HWMON			BIT(5)
-#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(6)
+#define UNIWILL_FEATURE_CPU_TEMP		BIT(5)
+#define UNIWILL_FEATURE_GPU_TEMP		BIT(6)
+#define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
+#define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
+#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
 
 struct uniwill_data {
 	struct device *dev;
@@ -427,7 +430,7 @@ static const struct key_entry uniwill_keymap[] = {
 	{ KE_END }
 };
 
-static inline bool uniwill_device_supports(struct uniwill_data *data,
+static inline bool uniwill_device_supports(const struct uniwill_data *data,
 					   unsigned int features)
 {
 	return (data->features & features) == features;
@@ -937,6 +940,48 @@ static const struct attribute_group *uniwill_groups[] = {
 	NULL
 };
 
+static umode_t uniwill_is_visible(const void *drvdata, enum hwmon_sensor_types type, u32 attr,
+				  int channel)
+{
+	const struct uniwill_data *data = drvdata;
+	unsigned int feature;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (channel) {
+		case 0:
+			feature = UNIWILL_FEATURE_CPU_TEMP;
+			break;
+		case 1:
+			feature = UNIWILL_FEATURE_GPU_TEMP;
+			break;
+		default:
+			return 0;
+		}
+		break;
+	case hwmon_fan:
+	case hwmon_pwm:
+		switch (channel) {
+		case 0:
+			feature = UNIWILL_FEATURE_PRIMARY_FAN;
+			break;
+		case 1:
+			feature = UNIWILL_FEATURE_SECONDARY_FAN;
+			break;
+		default:
+			return 0;
+		}
+		break;
+	default:
+		return 0;
+	}
+
+	if (uniwill_device_supports(data, feature))
+		return 0440;
+
+	return 0;
+}
+
 static int uniwill_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
 			long *val)
 {
@@ -1020,7 +1065,7 @@ static int uniwill_read_string(struct device *dev, enum hwmon_sensor_types type,
 }
 
 static const struct hwmon_ops uniwill_ops = {
-	.visible = 0444,
+	.is_visible = uniwill_is_visible,
 	.read = uniwill_read,
 	.read_string = uniwill_read_string,
 };
@@ -1048,7 +1093,10 @@ static int uniwill_hwmon_init(struct uniwill_data *data)
 {
 	struct device *hdev;
 
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_HWMON))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_CPU_TEMP) &&
+	    !uniwill_device_supports(data, UNIWILL_FEATURE_GPU_TEMP) &&
+	    !uniwill_device_supports(data, UNIWILL_FEATURE_PRIMARY_FAN) &&
+	    !uniwill_device_supports(data, UNIWILL_FEATURE_SECONDARY_FAN))
 		return 0;
 
 	hdev = devm_hwmon_device_register_with_info(data->dev, "uniwill", data,
@@ -1687,7 +1735,10 @@ static struct uniwill_device_descriptor lapac71h_descriptor __initdata = {
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
 		    UNIWILL_FEATURE_BATTERY |
-		    UNIWILL_FEATURE_HWMON,
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN,
 };
 
 static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
@@ -1696,7 +1747,10 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
 		    UNIWILL_FEATURE_LIGHTBAR |
 		    UNIWILL_FEATURE_BATTERY |
-		    UNIWILL_FEATURE_HWMON,
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN,
 };
 
 static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
-- 
2.43.0

