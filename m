Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB2373BF4;
	Thu, 12 Mar 2026 19:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343631; cv=none; b=oy9Hjji5c8xKOxQKVfRjucCVM+ng/pPkK7axw+8fOfGJ2WxPG/z04nGAUCdl+TStgNjBRXkxcRCvsEJST9zTyEGDSWiHzMG2pOq2C5USMmYv0QUq+ibdGw/EZgmx1xPSpVgamYUXSpJK0UtKUYENSC101+9e4Z9a1rd761m91Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343631; c=relaxed/simple;
	bh=fFuaXxXRcnavsSqX/KBHqCjEEt3KYioCwZ87CkBvz1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OKgowCL/nIpGp9GLhbs7jg9tkgZ+iPgZEgHp+ecdogrqgXW7oU2cp6+pSGP4WyiPAC2aaL39goLPIte9J526G+0ivqq3kkAbc+WCxioBL2eIAEyC5niD604JzuvBp6DplZg/88QVtkvSCZzkb3NanKM2IjgEHPe+ezWN8Rf0PFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=QfY1YCBS; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="QfY1YCBS"
Received: from wse-pc.fritz.box (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id C31E42FC0050;
	Thu, 12 Mar 2026 20:27:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773343627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hA/Xh/shQGB0az6ZWD4A2njCJRUAAfWgKeI4yZ9LD+M=;
	b=QfY1YCBSl3xWhC1m4i9zUBpKCFiIZNuGwh0KOVDxrJ7nGWJl2H/IqIc8wna9Q7Q65Jzl9c
	ImLJuUajnjXzq1IU8Fq6oxSIcWmrV9nO6YymEg9UsNtzhT5wz7eikbJYquKgtGHi4YTEqU
	h0LmiYDvkX+Vi9xSm9Lb48CSMQ1g9LM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v6 1/5] platform/x86: uniwill-laptop: Rework hwmon feature defines
Date: Thu, 12 Mar 2026 20:25:24 +0100
Message-ID: <20260312192705.76576-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312192705.76576-1-wse@tuxedocomputers.com>
References: <20260312192705.76576-1-wse@tuxedocomputers.com>
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
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Tested-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 68 ++++++++++++++++++---
 1 file changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 6341dca20b76a..048b265bff374 100644
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
+		return 0444;
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

