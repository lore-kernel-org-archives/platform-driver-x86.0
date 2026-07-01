Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EFA409624
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jul 2026 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902246; cv=none; b=jXRS3ddSg9U2uvch5KVVjkf7mc3qHat7geyosMhWGZVdzbLIdL2upqPJGSlXuF9BNC/yitJx1Numta+gJ2cz62IE+xfBWB/zrJrnRaYs2iUjNUZvf6UCu9pfD5FNPp+ljz3jHXeEjGLleSsof1DGv6VOha5HcsfnL0GHeLSYi40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902246; c=relaxed/simple;
	bh=GY8/lSLJrWV6vudjyzgth2Koav1F2hxuL2KYZuGjkcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l73ZIxn7eFwReTbsEJwV730ZxveQLCCoLqC3wI7fYdF1vmhihf9Zc8yBR/KqL8Xh2com77NSKekcW4Zy+MEIfLMq+n285QDCYniDUu8Ln3SaG9UFtf1f92jlawCqknRoKICmnDINxh0AfGuS3QRGBp9uTuvGo1HF6sOpnNPPO7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ef73pj4S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxvbajwV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ef73pj4S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxvbajwV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGDOF793713
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Jul 2026 10:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x9XckNnjIaL
	LOOJegY3jwlZqepfLceFjKldmtuVP3wU=; b=ef73pj4SxFBWEfZ0LhLT4rAk3L/
	ciunFVqHbGEy/o8VxdR42IILpPUoxZR7hn2IfQN+y0E7NIFk0T6bs83dI1ZISfLL
	86AamNxLZf08jtIiBzXRKgaIMQzwM2z49ilRjdiFQ25juTaWJm4ycbWaNA+88n58
	Tpe2KQL9Aflz+0MwIHULOYG1fz8cqpP0rfdwxqzGQ/iOv82ocYBkSRJh2l7aXyrf
	OXIBp8rk8N6pEyVOzorKZ79AuXfe2IuGbEN0D+KC9fXRnWS2tmJ0IKDUzSOvfmGp
	aC8myIiakey9sYQbyEBzSTcqaIvhqNysXRpg1NhNh/pXO40iNxXCS1eAnPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ag3hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2026 10:37:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91931144870so58482485a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2026 03:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902239; x=1783507039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9XckNnjIaLLOOJegY3jwlZqepfLceFjKldmtuVP3wU=;
        b=IxvbajwVsC6ZQA0c2IS9gwFLBoZGLCeZeNK98J9cpvh2F1vlCauwOfwY15MMtlMOZd
         W6TdC4+6iUCcMLvXNK2jjGaWlzyWpL6q9Da1FfS22OYgKhTOCxSCRrOlhIXOPRfn/taP
         qycj2R9SeUvI9XSveuTj7HM0MjcQR7OCxM+fMMb0k7S4MV2cZLhxUFkvGkZK4T9oZ036
         SCLOKMkB5sQz0/DHMJS9oZUdpOzbIo9tw+ClH7rhsEbadHF8dxQNIQPVT0Hn+kkEF/Td
         coQFe9EVXP+1/W67AtOTbwOXEY7tJHkPN3LdBjlbjcDLF4xWUyFrkYad9YXUegl0eC9D
         iNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902239; x=1783507039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9XckNnjIaLLOOJegY3jwlZqepfLceFjKldmtuVP3wU=;
        b=JWBfXrRAgfT1n7Op935ij35VpgXqaUStizhZdx41F9vSNnyQ4Ou1R/Q8fVqLDI65gs
         oD1eoS7mQmcz1ZrHW0kTbd0Pnth+Qh2i/7v+2qQntX7lOeNx9MZeJjn1w/qreJYWdb8I
         oxtt4RNKjr7JeTeUxwI4HnDZBLdlGFGd5q4TWnrMpicin4Kqo2L+6IEC9UQ5uWLGYPxu
         uv0EMc1n3mj4CLR0bPu4CmkCK2onXCbmm7wLeBeZCmBva9BEA6hgZ3TIdHcns00ziZHC
         OrfVis4vs1qwr/2nbWQvrELKSu7PxflyjtaOmMcKA/2DPmjWIP9ZFNSI9+fD9MovX0Gz
         7+Lg==
X-Forwarded-Encrypted: i=1; AFNElJ/c85RuT2x6oCsVHHPStHalLOqqMLOU1DLBkyyF57FiHBMMsgZhz7DyQFdIvD2F5/GIWrR4M5/0UR1nSqr1Y4E7FncH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3YVbbrKvxPFyrLQngiDbtoWP+TQ7Z8JLGpcxxbxVikPrAPmDS
	HzSRuuzbLcbXcPwX0QSI1jKp5JkKL7paXlI6EDdaouuuMTR2CV/ripibk9jepXaj5PhPoLJVysY
	Ifzd3aukkXHwwEycVgl7BPxhaSERNqX503nP4pN4ihQ3jn7P41O0yBtdOVsmq6DF2SJKOwMJRUq
	vp
X-Gm-Gg: AfdE7ckQoGxd1+403jnWHigVv5B/NVfjhxwi40DKpYLuewG6rA/s00y0LmMVAs9eqCg
	twygAqP5eXivYREkjIvFlQXGC6FcydCPP0xb+fkjtenN4MbI/7d8vOyJXT/8q+o3roTmjDT6PSe
	ZXA+iWV4CaPwZjHLfwf1fg1UmiVbi/XROOj1JNCqoNTUo686fmk11h8IJpuhOYwrPQX3z7vph7z
	0R6BCXUOUPIMwkKkAISyto9586sJc1gdGHP0R7c1TeDmH4c49MUgjd8Ibls67jrVT3pJwD5mClu
	tHc8RVJ3kMOkFKVcGLYTwVv6QY96jw7x+Hg0/d10pqCB6hz0i9VXQOeS2clLfXMl+/A1R0UGacu
	U6YOdqsQiC04uHMo2D/4giAag2S29DQjKbzZraXqCU6c=
X-Received: by 2002:a05:620a:414b:b0:92c:44c3:34d0 with SMTP id af79cd13be357-92e784cdcb4mr132130085a.46.1782902239188;
        Wed, 01 Jul 2026 03:37:19 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:92c:44c3:34d0 with SMTP id af79cd13be357-92e784cdcb4mr132127085a.46.1782902238806;
        Wed, 01 Jul 2026 03:37:18 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:cab:bdb4:a76b:614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d2bc5sm69130655e9.5.2026.07.01.03.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:18 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures
Date: Wed,  1 Jul 2026 12:37:10 +0200
Message-ID: <20260701103714.22583-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 60ZtDyHjFu7qdd3ULRTbla43GIeNaftZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXyEOXpbzBovdX
 llhvUSMV3EcgAduNsEi/WILfK1ymtbzkDDDgslpaQsg5fJA3YST467gkSxBscU/tqJkWZuQ2Spg
 J2fdaYsxbhhTvErKuoH4AIh4bxHhOTF+/yyntGrk5+gEJHi8/A1EiDhaNf9JS/hpit7jra4vHCT
 C0dbwZ5lgjdaNXs1kU9ljWICoz5tGmlSmi7uRZc2LAixm8qWlOZxX6Zmh7Vokl/tgHecFQWCpTR
 9EUZq56YOyn7nUszNHHpgoKKQHKJ+Aj+Vn3+TEtAUqQaAZJfZgeCq0OZB4/5/KZIfLEXfvc3EnQ
 Hsnj+TmXihghkRzggn/3AysH2DkOJ2gdgIGXJ9iseiheZwFwgO/AUXKAz6zhHNPh+4+LQEMaS9t
 hKgIcZZw4RGTRv3/cpoa5xvVdmDlQ6Tr7z89OhbKNSgA/RT3xtfSvE0S/kq6ImX/rklhWzPoCbH
 hlowVivrTDq8P2Mj0vA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX86h5J5y6V9dy
 6fUeyshirnqs3LpAUR+82RXZwf0x1HtYTHOYxL7fjlPic6Ln3oHso303zf545lb7nfCR/8oAO/U
 sfM5ZuSOLXnZIjWlVAZxQetbxho5vmQ=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a44ede0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=O3gN3AO8kzc7p6n7zlUA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 60ZtDyHjFu7qdd3ULRTbla43GIeNaftZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures.

Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..c9917a1d2bd7 100644
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
@@ -555,6 +574,113 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
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
@@ -590,6 +716,10 @@ static int t14s_ec_probe(struct i2c_client *client)
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

