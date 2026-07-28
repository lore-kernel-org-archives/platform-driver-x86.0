Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800EA3ABD96;
	Tue, 28 Jul 2026 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261239; cv=none; b=LdWtmoFEuXfALpzoZIbN2vekLvAKucZl30TGjs5jzzo0tzCc6l6b85xP+QUIPJfyuacQ88js7qlUdqPjHv5UMkTXFArlEuetFVa33auiojuS9PqqHJ1df9MBWd/1ediE0Asg/St3cpwjNOMVwT+kkiVrOTYDUd6KiEzm3rzv5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261239; c=relaxed/simple;
	bh=xLxy+VHtkw8RM1Czvq8n+fuRAbrgV3yT/gXJmoqdVQE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Yl6RKYF6wNHm14Xii4wIB/tQxwdzLy+EKqLlO00vY+jhsfyuRsPiuWH5ghS2ErEf/H9BNHXfuSumXnEi8KB3D+5QbD2ImjpNTjRTxh41JrIJe+w+neS+2p5kuf67FXtqVdia8fNhn7RZW+iQ5sBzoL0kEbUNH1tap8iU6R70ufM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=BmqzI0ky; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="BmqzI0ky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1785261228;
	bh=oswLEAHt+WehuH0TMqGQrzYiJ2pqxnxi/J9JtIHFNCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BmqzI0ky79wVnjYFYHpLsCGChP77gRgMhPRYEEMVSyeTLjts6X8eiTN1tGk+htJTv
	 W/QVvv+Dx3ZCmlXWD0MX/wYFRDG3XaJ4cIiSd9mtarFU0FqNJE97Ilo9rD9v2M7sZD
	 lmyscNnv6fpoGMDY+zsfFWIwAAm4oO0h6z0/2GUQ=
Received: from max-laptop-cachy ([240e:3a1:20e0:1ea0:2fa7:34d4:60dc:c367])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id D6A85AE0; Wed, 29 Jul 2026 01:53:42 +0800
X-QQ-mid: xmsmtpt1785261226t22sxd4qh
Message-ID: <tencent_E7EA7661A07F33AE6ED53F9F1C509CEC0905@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLFQET87fuTjjDBKtr5Zfe02dBxw9pNtugT2MiMcPbWUxiFycExo
	 Kw/5QoJ3U8lM6pyUQnKMcvdvvhFcOUffB6NMSvxzVYLn5lUsVz/EOki926WRhCOaqIjerPrKmhIf
	 VAY7R8JEv4czmuDWYkr86c3/hREV53b4crzCXPbwFjBVsm0aCMz0O2Px6L2TdODdiAy1k/ixtGGv
	 pr9Hp6DPLdBb86KLamxx8wBs3v6kl3yKbpbf/Yf/dhDsOx7wV0xzl9+CjfZ3cC27iWWHASkzds9+
	 0kSnHI1LncI9auoSIUqRxGd3DUvcpySlvm2U95szPT2e2Z/aaIGTFg8x1XNQuOOwrEmLomaVR7PN
	 PbxjXXg1tyq5kytrlAq7M+2xkuvI9O/V/DJi0o9oHReWT6fOPlkMZNDywBexq/x/h6q3CY5Jk7FW
	 IwCvCye3uKOHs8QcaJ1Jy0YAzMlzoMOkWZl+ly9ITaz9t6hX2TRwheaKe3YZonjEbhSSDyWGqJRY
	 Hsd07UkSAZ53qu4Kqmm25HlIpzXnbKNZL0tFjcR0QDBVaZrhAyeMUzPcqKR/pLpUpfAlQv/+gJNZ
	 BsBL9RkfjNu/GnDbVehioqC/vb9cJM4WL5jKIxuPnrQiVdpePHg+sLScx7J3grfSBBnOfMn4HkAP
	 pPI83n44to0uolQyevcrBK9MruDoKHwu1gHskHOawMoJvcw9WL89rTvEIrCnVJlWwsftH9+ruqtd
	 DxCCALFQXA072LrbTsnzz0XjyDK5R6ctEyA6w9PDUPA2Ny/1/JL4lwK1DUgkK/agsjOw4c8VdTeG
	 bJGiSRiHYk1j9bm+e4lm/TtwW3LNspqsCBnGwMTymNOO3AvvQ4SYa2TTS37BBCMawWdTBUtZ6Vzp
	 vtRdckB/I5WDla47cI+ZxbWkuOOOylvFF8SMpfRIuYW/kyP0JpdOVQL9LxAAkccQxu3AyjngiarA
	 O4QvYPsQ9fk5Hzs0ibEtMqMO6DCE7m5R5Sa+es5VTdUsLa524YdWrYky5mfqxtElYHmfjP+MidSN
	 lvY0smgwqanFZzFfqnINPEe3sNKULlKYva16p/7IjgAuVQfQKnxOp2f52KsIgFkBn2TQ9bbeCjQp
	 ggFMnksR0DQuWxLio=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: wolf109909 <wolf109909@foxmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nabil Danial <nabildanial.93@gmail.com>,
	Yuming Sun <wolf109909@foxmail.com>
Subject: [PATCH 3/5] platform/x86: bitland-mifs-wmi: read fan tach from EC window on MIFS v2
Date: Wed, 29 Jul 2026 01:53:39 +0800
X-OQ-MSGID: <20260728175341.45927-4-wolf109909@foxmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728175341.45927-1-wolf109909@foxmail.com>
References: <20260728175341.45927-1-wolf109909@foxmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuming Sun <wolf109909@foxmail.com>

The MIFS v2 firmware implements no WMI function for fan speeds (nor
for the CPU thermometer), so on these machines the hwmon device
reported zero RPM on every channel.

The fan tachometers instead live in the EC shared-memory window at
0xFE0B0300 (DSDT \_SB.PC00.LPCB.Q_EC region "ERAM") as little-endian
u16 RPM values at offsets 0x69 and 0x6B (0 = fan stopped). Map the
window on v2 systems and expose the two fans with proper labels; hide
the non-existent third fan and temperature channels.

Offsets verified by diffing the window between idle and sustained load
(tach values ramp 0 -> ~2700 RPM and back) on a Xiaomi Book Pro 14.

Signed-off-by: Yuming Sun <wolf109909@foxmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 68 +++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 342dd7e1..5f7c85a8 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -17,6 +17,7 @@
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/input-event-codes.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -151,6 +152,16 @@ struct bitland_mifs_output {
  */
 #define MIFS_STATUS_ERROR	0xe000
 
+/*
+ * MIFS v2 EC shared-memory window (DSDT \_SB.PC00.LPCB.Q_EC region
+ * "ERAM"). The firmware exposes no WMI fan function, but the fan
+ * tachometers live here as little-endian u16 RPM (0 = fan stopped).
+ */
+#define MIFS_V2_EC_MEM_BASE	0xFE0B0300
+#define MIFS_V2_EC_MEM_SIZE	0x100
+#define MIFS_V2_EC_REG_FAN1	0x69
+#define MIFS_V2_EC_REG_FAN2	0x6B
+
 static u16 mifs_status(const struct bitland_mifs_output *out)
 {
 	return out->reserved1 | (out->operation << 8);
@@ -188,6 +199,7 @@ struct bitland_mifs_wmi_data {
 	enum platform_profile_option saved_profile;
 	bool profile_valid;
 	bool is_v2;	/* MIFS v2 firmware: QFAN perf-mode codes */
+	u8 __iomem *ec_mem;	/* v2 EC shared-memory window */
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -421,6 +433,27 @@ static const char *const fan_labels[] = {
 	"SYS", /* 2 */
 };
 
+static const char *const fan_labels_v2[] = {
+	"Left Fan", /* 0 */
+	"Right Fan", /* 1 */
+};
+
+static umode_t laptop_hwmon_visible(const void *drvdata,
+				    enum hwmon_sensor_types type,
+				    u32 attr, int channel)
+{
+	const struct bitland_mifs_wmi_data *data = drvdata;
+
+	/* v2 firmware: two fans, no CPU temperature channel */
+	if (data->is_v2) {
+		if (type == hwmon_fan && channel < 2)
+			return 0444;
+		return 0;
+	}
+
+	return 0444;
+}
+
 static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			     u32 attr, int channel, long *val)
 {
@@ -433,6 +466,22 @@ static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	struct bitland_mifs_output res;
 	int ret;
 
+	/* v2: tachometers are u16 RPM in the EC shared-memory window */
+	if (data->is_v2) {
+		if (type != hwmon_fan || !data->ec_mem)
+			return -EINVAL;
+		switch (channel) {
+		case 0:
+			*val = get_unaligned_le16(data->ec_mem + MIFS_V2_EC_REG_FAN1);
+			return 0;
+		case 1:
+			*val = get_unaligned_le16(data->ec_mem + MIFS_V2_EC_REG_FAN2);
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
 	switch (type) {
 	case hwmon_temp:
 		input.function = WMI_FN_CPU_THERMOMETER;
@@ -468,9 +517,13 @@ static int laptop_hwmon_read_string(struct device *dev,
 				    enum hwmon_sensor_types type, u32 attr,
 				    int channel, const char **str)
 {
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const char *const *labels = data->is_v2 ? fan_labels_v2 : fan_labels;
+	int nlabels = data->is_v2 ? ARRAY_SIZE(fan_labels_v2) : ARRAY_SIZE(fan_labels);
+
 	if (type == hwmon_fan && attr == hwmon_fan_label) {
-		if (channel >= 0 && channel < ARRAY_SIZE(fan_labels)) {
-			*str = fan_labels[channel];
+		if (channel >= 0 && channel < nlabels) {
+			*str = labels[channel];
 			return 0;
 		}
 	}
@@ -486,7 +539,7 @@ static const struct hwmon_channel_info *laptop_hwmon_info[] = {
 };
 
 static const struct hwmon_ops laptop_hwmon_ops = {
-	.visible = 0444,
+	.is_visible = laptop_hwmon_visible,
 	.read = laptop_hwmon_read,
 	.read_string = laptop_hwmon_read_string,
 };
@@ -782,6 +835,15 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 			dev_info(&wdev->dev,
 				 "MIFS v2 firmware detected (QFAN mode codes)\n");
 		}
+
+		if (drv_data->is_v2) {
+			drv_data->ec_mem = devm_ioremap(&wdev->dev,
+							MIFS_V2_EC_MEM_BASE,
+							MIFS_V2_EC_MEM_SIZE);
+			if (!drv_data->ec_mem)
+				dev_warn(&wdev->dev,
+					 "cannot map EC window, fan tach unavailable\n");
+		}
 	}
 
 	if (dev_type == BITLAND_WMI_EVENT) {
-- 
2.55.0

