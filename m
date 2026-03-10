Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72C386C1B;
	Tue, 10 Mar 2026 23:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773186030; cv=none; b=bZ1yI9/pvM78PdspAyBRlqgWGCYwXCe5gXnTPuLteiiAb+MbHQRDHe81nCzjMWjCu2g2mkkEWwLKwYnEfJDLvBQlqGuDFmHkhH0fgLObW35E5m5lKXVy3+KILGJB9TNt0/1MiW14kzkuRRwakJtSu1J/kyY6UojMo4/gKVb3/qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773186030; c=relaxed/simple;
	bh=fFuaXxXRcnavsSqX/KBHqCjEEt3KYioCwZ87CkBvz1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MhrKClJQboceml/CLrg6xwp4bXEl02bJxryP03e+XELs/m1WOphZaxbHbcJhhD4bEb7XnCg4Om18XUICJQZGvdnOU4X28o2ey4WW4tkj2iA9gQln6xhpel6YXlHnDjBqpOiRQ5ifjmhDxUfXQwDyO8juoxeY0HjiPItVfsViXeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ZsL6QAtG; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ZsL6QAtG"
Received: from wse-pc.fritz.box (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 08B272FC004D;
	Wed, 11 Mar 2026 00:40:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773186025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hA/Xh/shQGB0az6ZWD4A2njCJRUAAfWgKeI4yZ9LD+M=;
	b=ZsL6QAtGQphFsSMMRys+CtravjRev/uoJNd0vHx6DhQnTC+RWSCtWz5g+3vV2ERCFSSE17
	+JnHJUpAdtWPxbXOMi72EWVy7ynaFyeN15qPpQpfBysqIGlFj3KJjT5Va+hXVbg56ZPzx9
	p367mTH6HnQM36CCbt+KF1oCsRWDcGY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v5 1/5] platform/x86: uniwill-laptop: Rework hwmon feature defines
Date: Wed, 11 Mar 2026 00:34:16 +0100
Message-ID: <20260310234022.2085232-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310234022.2085232-1-wse@tuxedocomputers.com>
References: <20260310234022.2085232-1-wse@tuxedocomputers.com>
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

