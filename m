Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85B241F7F2
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354124; cv=none; b=ZyDeIWKLhH+/Ac1K7f4DerYzvwjYPmnBy8XwEswcVSHn6QRrIfwGSn4WW0wlWTqnSDKgjYPcXjX8+oATKbmSHK9wttVS02D1vF9kOK27W9act/d2kpKZV+n5wkkr4EDtGz08c6iJWo6TJq5aLmQ5tXxvP/ow6Rzgi30fucdAVVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354124; c=relaxed/simple;
	bh=aBJe19napSs6kyYETHjwpmtrLIRAU1o0VhwqTbuWJL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuU1QKL6XF1qB2ZrfE5RlBRZ90C2AnnmfpYfVVQyyXZv2WEG4VgkL5JPHH+15Rz5hM8r1lE0u8CSPpGtpxkmLaC/UCz9gxDu1WSysnFOWyivucIKYO1h/FrEH/DjiPPBbrK99VP9eLqD0KTEuG9ocv9V7YIUCagMPwkGqy96BLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PI8sTfGj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9YUY2Iu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PI8sTfGj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9YUY2Iu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFFx5762380
	for <platform-driver-x86@vger.kernel.org>; Mon, 6 Jul 2026 16:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wgArOPJwbc+
	DaWtG2tIECGMzRP1R/wtS6y7TeRFG/58=; b=PI8sTfGjNskLcLv8po2SkXPqFNe
	B5qj3LKDL7MZ6jtT60pf0A7+hgt5xsYHjV/yXYbsOEMkIlbcmkGCoLlJ3doGdx4O
	1t21ybT9svpsiOtx34oR4qBgvMirMUw47QHOswcIbnuv2g+fjXhJ4oVliQZCE5Ou
	yql4RgFLJ3UyRPanu/HqHTI+YKpyZKcKPNVTAZNipFnT2MuQzzOrCPrldGG6Wnal
	BkBjsf9V8LEYToAr681yj1cHAWZWYBwayKO6Ue3jdOmSUeqsvCgem3tGcRB/Dcaw
	6J4smeiyz9Ah4l7YsfEiN1lV9Hb/kIfxHoEbyHchyPZ9LGBRTDdVyq24OcA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxtcbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 16:08:41 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bbd4255f46so590678e0c.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354121; x=1783958921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgArOPJwbc+DaWtG2tIECGMzRP1R/wtS6y7TeRFG/58=;
        b=B9YUY2IuRk4Ts3DchCSO8dmWvdmC7EPz2qnvc61TNJXWywi71+3Hc+dhfK/yAgTCxa
         /RdkmCVg0TRJUriEUq+ZOEAo43xtlYnBHKGO+Vgb9GYfiNW9qX2TfvLthSn0w2tSUVUb
         Zc/ywaFTUgCfmlz50dIEGfcnrojsbOChcMZLN0KZTT2st7gePwwJgxLq9H2Ho4KQ9q2Q
         2F8X/g53c55E2qI8l4KrIcLyWWtXTHF2QBoEnWYubhVxYBN/MSpuki4o4uwVUDHeq5vf
         BIPIgg/radOQTD6PrP0ear9whnjfK9VoI3Uh2pWt2OUKrjkvmKP6bI56LVRlvnQLTQEc
         zt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354121; x=1783958921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgArOPJwbc+DaWtG2tIECGMzRP1R/wtS6y7TeRFG/58=;
        b=Ggw8bKKdgnrx4fCF+epMalVDa2KbyvQHxizyO1a8NibXUbtCLZg34gp867EP47a1A5
         G9f+v04J1jmfAFq+BHFI64ompZ8dBrXEDw6VaQlAgz9EDgNlkyFcwkycGfGQLWCwXb4L
         w6rkcQV1v3a3gIZ8AULXFFbAv6+A68x088N5OxNjywwyZ0ZiW4vy+UZChdMQ66gCNMNN
         roGUfcYzUTxVxHG4qBYiFYW0bUlpKrtiCHcpjQuNUEyKWJDvXthPCsoaQRWxKmji2dPH
         ea0SRFd19/1Ee0TmG0qQ0MhVIcUfd0W3nzKRfPRLWcJ81+A/EKAl/689/yoaPX/eGhp1
         hLrw==
X-Forwarded-Encrypted: i=1; AHgh+Roo8d3Yv4ZxWCBrGajTu0mKJXbw2mIEb+QLfXbzRZ84eFETRA3Mijzp9heb9ijs/wbzzcF5PXHtTcpwZws20TOtbwy3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd7/+sZVahNQkHLVI2LyuX+N3FjIH5LrT1c2vOVTdpiLlNxb/+
	qPU49NcgW/9jrTDsSsvGSaSoPymiq0eZYl8xo9rDbN7BNfyAYLh5kzgADr0zRz9tgME34wvUfMX
	Z4QpNU3F8BiD7hdOMzFI3iGiTtN337EJW+mwOJRGQ3fT4pxEliptuS+j2GZGOTzbTUA0X2Q3eRQ
	rF
X-Gm-Gg: AfdE7cnFEsQhBFNcySnRWAUhCzV10V4jQYc8NYVY0XKdjJil0jHSppJgOLt56Bq0TWs
	+dmyGvTHHn9FyODxzjYGgR2kitIFg0ScPhPONyZlpUy8cWIYccrn2qPaaUDhPxOenX10n408RE5
	XkbA51MBFHyJKhnaHpifSdOSRY/qPOmYD83EXEG2o4j/XX/X93c8ZrGxem3aPQXVYk+6syRg199
	PRDn8coMmvHFZL5Oeg90Ncyt/ERiCpSL3YqiS3yRyc4Z451HVfh1Tk6K3RV3W0Il5JqeOzVYLrf
	zk9XHqTLvlNMQur4eqKLOU5lF5DUxPBmUZz4drCGHkEYY7EQlKz2wvoaPqYevx2N/y8ptSnaJxF
	/uTp8AQwQ+dr0hAvmcZnuC69yP+Pziu7vNSJbnN/Kb1lZFg==
X-Received: by 2002:a05:6122:1793:b0:5bd:fc20:b7ed with SMTP id 71dfb90a1353d-5be90755ccfmr680921e0c.7.1783354120155;
        Mon, 06 Jul 2026 09:08:40 -0700 (PDT)
X-Received: by 2002:a05:6122:1793:b0:5bd:fc20:b7ed with SMTP id 71dfb90a1353d-5be90755ccfmr680797e0c.7.1783354119220;
        Mon, 06 Jul 2026 09:08:39 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8405:4a9c:95fc:4b8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm26071966f8f.9.2026.07.06.09.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:08:38 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v4 1/2] platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures
Date: Mon,  6 Jul 2026 18:08:28 +0200
Message-ID: <20260706160830.17698-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4xFPxzDFm0-Coxtt8mh76FGgPpG1UupW
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bd309 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=9Fj74KSAFJAma6AI3IUA:9 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX0PXwmdHTU0DR
 xEoN3K861G6wcfhLA2jBELW+Vk7CDLx4anXuIAbeZ8AiXaSVyKVl+Ax6YlxyHw33ojeKdWEyYL6
 o2qqIT1EfWdHulVjHa3sHeVN5DFf1V8=
X-Proofpoint-GUID: 4xFPxzDFm0-Coxtt8mh76FGgPpG1UupW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX7FELEEQfcEZj
 pa8wwMaz1Pj5HBQBuucB4vgnXxtusjrD1oDsvqQjRVcZWHo3ZyqDOB1NzogQ1hpaVvDpF/HG0nj
 ISXsIeN1uISJATliOWMfFbG2zi/d48IVt2ImuadTNN+fK7sbNV7b5FBVvRd+j1XNPwdaXlhmCjf
 ma+iggQUd5YvgMAJ7I5fcbrTmNHVyENzzljJejZ/xROeThV3qaeIaVHl3DhPbQSDwaJaOcDMUCK
 jbvIHtd6xMgLKXMsyxna1bQKlHE8eDdzElOUSB/0DZbk3VJMDUEi6oJRbDAlmAdMCODwtX2oXLo
 9fGkC8qIs23sRDaSYIUFIe+4UJAlk4HVFHy+vPjDj9+l7NY+0XtKAu/jAlZKzBM7KyKOC/bNGxH
 eUgE+A6LzIdj1N3bmWNkX+CdnCLjMYGiJZx60YhseDnFEKtWgYJcplPx85+QXAYC0DWRE8DnU+3
 GFtGqwuDwqVmsB43xgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060164

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 10f905d7d6bf..121043348740 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -75,6 +75,7 @@ config EC_LENOVO_THINKPAD_T14S
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on I2C
 	depends on INPUT
+	depends on HWMON
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..fc480f093238 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -21,6 +22,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/pm.h>
+#include <linux/units.h>
 
 #define T14S_EC_CMD_ECRD	0x02
 #define T14S_EC_CMD_ECWR	0x03
@@ -67,6 +69,13 @@
 #define T14S_EC_EVT_KEY_FN_F11			0x7a
 #define T14S_EC_EVT_KEY_FN_G			0x7e
 
+#define T14S_EC_SYS_THERM0 0x78 /* SoC (CPU+GPU)  */
+#define T14S_EC_SYS_THERM1 0x79 /* Keyboard       */
+#define T14S_EC_SYS_THERM2 0x7a /* Back cover     */
+#define T14S_EC_SYS_THERM3 0x7b /* Charger / PMIC */
+#define T14S_EC_SYS_THERM6 0x7c /* QTM West       */
+#define T14S_EC_SYS_THERM7 0x7d /* SSD            */
+
 /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
 #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
 
@@ -93,9 +102,19 @@ struct t14s_ec_led_classdev {
 	struct t14s_ec *ec;
 };
 
+struct t14s_ec_hwmon_sys_thermx {
+	const char *label;
+	int reg;
+};
+
+struct t14s_ec_hwmon {
+	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
+};
+
 struct t14s_ec {
 	struct regmap *regmap;
 	struct device *dev;
+	struct t14s_ec_hwmon ec_hwmon;
 	struct t14s_ec_led_classdev led_pwr_btn;
 	struct t14s_ec_led_classdev led_chrg_orange;
 	struct t14s_ec_led_classdev led_chrg_white;
@@ -555,6 +574,114 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input ||
+		    attr == hwmon_temp_label)
+			return 0444;
+		break;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static int t14s_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_label) {
+			*str = ec->ec_hwmon.sys_thermx[channel].label;
+			return 0;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int t14s_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input) {
+			ret = t14s_ec_read(ec, ec->ec_hwmon.sys_thermx[channel].reg, &value);
+			if (ret)
+				return ret;
+			*val = value * MILLIDEGREE_PER_DEGREE;
+
+			return 0;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops t14s_ec_hwmon_ops = {
+	.is_visible = t14s_ec_hwmon_is_visible,
+	.read = t14s_ec_hwmon_read,
+	.read_string = t14s_ec_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info t14s_ec_chip_info = {
+	.ops = &t14s_ec_hwmon_ops,
+	.info = t14s_ec_hwmon_info,
+};
+
+static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
+{
+	struct device *dev;
+	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
+		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
+		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
+		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
+		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
+		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
+		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
+	};
+
+	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
+						     ARRAY_SIZE(sys_thermx),
+						     sizeof(sys_thermx[0]), GFP_KERNEL);
+	if (!ec->ec_hwmon.sys_thermx)
+		return -ENOMEM;
+
+	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
+						   &t14s_ec_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(dev);
+}
+
 static int t14s_ec_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -590,6 +717,10 @@ static int t14s_ec_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = t14s_ec_hwmon_probe(ec);
+	if (ret < 0)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					t14s_ec_irq_handler,
 					IRQF_ONESHOT, dev_name(dev), ec);
-- 
2.53.0

