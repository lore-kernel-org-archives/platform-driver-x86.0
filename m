Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E7E349B15;
	Tue, 24 Mar 2026 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774384461; cv=none; b=IVhb+K9cKnPrRTSyRg3fWdKTBYzpL+NXK4q2PaP34GZibc6wAtYY/y1q8A5SzuJRokG1WB7VNnyV+NGMcSWjWnwBD7cRMzntZ6Gj4uIx4sTCX+4p3oYCTfx+d7qjUDEEB8BSu2iIep/dsAXr9ZJNRjfL8rjsvTuexR+G4uYR79I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774384461; c=relaxed/simple;
	bh=fFuaXxXRcnavsSqX/KBHqCjEEt3KYioCwZ87CkBvz1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXmn/i5HJX2pjaODxQNLqfzb7Q57RKVprUKsUBwB+1TDiqbQ0L28+SDKMiiURvEyXZPerzvkFQkfknVEw1dr1pTC63UaGG9ExRAsZjhKnj9eRRBnv411cjgS947QMOq8+pU7SMSlPYsGMd7QtCwI4aprXOuiAQVszJDJK6jBZ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=SMhn/2Am; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="SMhn/2Am"
Received: from wse-pc.fritz.box (i5C75F50F.versanet.de [92.117.245.15])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 071AB2FC0218;
	Tue, 24 Mar 2026 21:34:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1774384457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hA/Xh/shQGB0az6ZWD4A2njCJRUAAfWgKeI4yZ9LD+M=;
	b=SMhn/2AmZ/yIpF0ORYmI2NmJJgbQvf4NyGfL7vUzrr9qE5pAt/21Mr0YeY1gGu7KYlI6Px
	bmv8f3VSy7ekfahEW8sb/bX+2N5jTiM6iyW+wODbx58Z024v6t/8+FJeGYFD/+m7nG6BgM
	v32y4nrmfM3V/70gFVmH5gRFTR4SNZQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v8 1/5] platform/x86: uniwill-laptop: Rework hwmon feature defines
Date: Tue, 24 Mar 2026 21:32:08 +0100
Message-ID: <20260324203413.454361-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324203413.454361-1-wse@tuxedocomputers.com>
References: <20260324203413.454361-1-wse@tuxedocomputers.com>
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

