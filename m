Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D793E5A08
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335331; cv=none; b=fK0YFPOvKAMVoKm+FkEgI7GNE0bbeHyeAe4OaZ+44VbjS9k++rgseXtOZrpQyuOHbZMUQzu4DsDm4BR3+hOA4OH6tnyRMLueLBCewM/Sik/nygnRxVPT+A5IC9qM7pEPbxPKJynSPnV3+mILZzh7wG/ig3PCrHJL7j8aS+O9Z1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335331; c=relaxed/simple;
	bh=YN71vB5TNvRZHNOUlfHwKLfcZQHkRE2nTU84RRDUJLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdO+NctWnDb+tEwe8qwKWUkp12H521BKwn8hfWTezi6mlSz86VsXx3K0y334z8XUeXA13p09BCm5sIqWM++tfH0EpXqCXc7xwTSe0Yy65cfeYijmDoG8HIBnF1Mb0GFM4xbP1LVkMcKB8fc+GGpGr3WhknQ8Uqru5c4sw2mRmcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sm5HRmGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/z01eg5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sm5HRmGO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/z01eg5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJwaRw3871205
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hmF4GeGvvM9
	dJdB+Z7GNN+bPdXgJkQupqVRBWjz1QFM=; b=Sm5HRmGO3Wd4QvIQg4PnF1BhJX3
	em6knUfynpQpkS2Dxg9GaKZiBzf/2box3qk4/5DnEtE1FwArbitrRfKd+06dy4qG
	Qlen68Z+xDCDFAfp2vt00Mly07VRk2ZyOsAGokkhAtJHsnIPuucKIUGn0plDPKHf
	MSixofy/Ytw0B7vYXCS7SsCKvMUJ4kl46IAovNBPbJS5g3+Iyox/V+BRvYK3gjTM
	IKn2kq3usAzCvNcpbXBHaP01Kxh1tDY4332/jla034uZoIut2iyV33Y8DXgL6w7k
	tRNrvBbnkje7O04zUf4kFJRFQKHzWbSZB1UsWvqpKUlhfCwaToWcwvsCEYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7g7cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d3261c5cso237651785a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 14:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335326; x=1782940126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmF4GeGvvM9dJdB+Z7GNN+bPdXgJkQupqVRBWjz1QFM=;
        b=e/z01eg5zc5CeXeuccvQqumZGlb6/ZHUnm7Ua7o4Xx6YqSZG9LLT+07+ZS0jMR4q6w
         IpMcTH6t/eKM1n7g7vqVUmGdB1jQejHHRZLklxYGtJdK1bq34oKTqVRJBO81imVsg3gP
         Dm5oiwXsGG4ag0ajP58iJQP6+MhK2Esx3RyYWjhK6a69J68BLBEDHJawgywKvZ4w33iS
         FEWht4ceM7H+SvYdmt3rIc7M9fFC58xhXcVWqmJows61EMrGVy9z5+Hm9TxqhIIKRDSR
         Ghn07X9y25NhLNv6SYtFUYF9Fmaf65hGGcn5n7TIy+J3Z5bl5TQY/lFHxa/JUenRs24D
         WOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335326; x=1782940126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmF4GeGvvM9dJdB+Z7GNN+bPdXgJkQupqVRBWjz1QFM=;
        b=eB/RavkBYHihkzEoeUAYEa0CA4BymVCRPoh8poUa3aLDaZVsZlqQs2gjLQHru2hymV
         jrdTQiFVhMrBWQMkA6JErS40+P42JMjuC7D+hwt3x5XeBJbZMEbOfjkORCzabY0AtGiX
         2MuajJyoRq89GNaNlQcReWZrYUuBKx1RS41jvq9qXPZN62ryA7nKKHwgiKC7XsFyoPxY
         CacIPt2E52cCYduGfO0J3XV69W3wMLoT5DGFXSSm8kjGjtwgACy6hmCKOp87Jvvs2nHI
         qFu3cbrDgwpdtYWfEYe/d8MlqvvSbn+n1z4+f1PKv+Mz471bVEzAka4MGzbyljGrtlSp
         7ydw==
X-Forwarded-Encrypted: i=1; AFNElJ/bafTEF0hvnSueU+ad+ucJfWDL1k/BUbsrPdwkAl3s19SnNUamp+n1SJY3CQJl8WMvPh301i5o7c6xfVfd6uQZwvGg@vger.kernel.org
X-Gm-Message-State: AOJu0YwA+1br3Z18aqD3MnEFtZOvgSazQc+PKGZ0xd6QSHzBRWapbvWM
	GBbJaY4nYY4dgv/mXSF6Mu1BaTd7xftAuRHqHkTDCvWMjUb4WwJ7q3VE49OgbHcEBhP+7OpNxAK
	1VdsoPwvZwJySFpqYHYnsyVx/Le/2wvKdsIZ+fVMLtGjE0JUufcnUGA9xh/d0rd0SZS5ryBMyW5
	NE
X-Gm-Gg: AfdE7cmLHW+smVuHfuNfWnCiltYskq3tPFYKlNetmuxNT/R7JIKPrfa0asgyicAo9eD
	fIg47Arg1dUuDRkcRDVkUBSyeqgsE5QRHXaPvCzBYHiMo7T/xoo+WlKjpi4a//oVvPornflInch
	Oio6o2PqQwdbRI/0cN2LwQR3ObhUGFtlTCw9pWVg127OCOSQR/42imjAVdwAvqLliiTGj3phCby
	m2bH9X2srgBtnL7H+TG5W9/sWL/0yLlrctEzpacCgcxaN5OTBeTtfeHmqdjPdPTJw9yd2U6ua8n
	Mc5b4hhzgvTThzrMcrluDu6UksQgRo7JoQE6XOZu0vP1R2EDxBSm93ZBsxbC8Z5ApDQW5aDP/YN
	reVur0HLoVB7AGg58dua245gH4rJhnHkm7N9OcwLy98JzfA==
X-Received: by 2002:a05:620a:4623:b0:915:9273:9237 with SMTP id af79cd13be357-92781340d3fmr815922385a.10.1782335325667;
        Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:915:9273:9237 with SMTP id af79cd13be357-92781340d3fmr815914585a.10.1782335325054;
        Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:44 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon support for temperatures and fan speed
Date: Wed, 24 Jun 2026 23:08:23 +0200
Message-ID: <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX+oDTPyi8lA25
 tCgo+GvcfPf2oTMbB/0CBq0OPMmPbhecTo90/0EQ/EEd6pfRRmi12/c54X+d5IBdUOwO6d3AaBx
 8N1oBhVogW+zhZq0BQeAPQVoEC4V2T8=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3c475e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=dabdHXUdFSiLoprLzZ8A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: x3s2a2YdG-hChGB5zLWa7_VhykKSFWzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX8LwOK0y7jzb4
 UQQ9iQBklfEiIlWv9M2wS3dKUHRhuGI4bRZQ31WrwkcVe0Mo2qpDHdVRytV8UDrfcDbwixkodyO
 D2K/C2EPAkSr2jGSfGPhPTVcor3TTrJJndijkUcemJd64o7UlBezUTLuCQci94jEHT1ySA7ENLK
 gTYpgkiod2sfYs5uNMnc3rS5+7Fu2Fp8vqeiFVMI+Usqf/kG/bVWRwwukZtugRT0Oq7SbYyobM8
 YxxrM/bs9YrTY5geZTPEmhpBHPeASzNHH7PA3LrczgKZ15e+p058G1jidRr0pIXJ7G7YnPFzKpS
 Xd6T7CAGCL5Q9lkaGC2b+yzTIB1kg06JbcURa7FwW5QOlnEN05vG6rKg5AHTNIW71/rAfkBgITR
 eJczW317H5r2op4NyQITBXnDHqSizkxQonpGt2FZEUbBSw+CLyeG9ByklUolhmq8geFSOJutQ0P
 vx97UhYGBMBQSQlhAlA==
X-Proofpoint-GUID: x3s2a2YdG-hChGB5zLWa7_VhykKSFWzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240177

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

Additionally, expose the system fan speed by reading the fan RPM
registers from the embedded controller.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures and fan speed.

Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..142464623f0e 100644
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
@@ -67,6 +68,16 @@
 #define T14S_EC_EVT_KEY_FN_F11			0x7a
 #define T14S_EC_EVT_KEY_FN_G			0x7e
 
+#define T14S_EC_SYS_THERM0 0x78 /* SoC (CPU+GPU)  */
+#define T14S_EC_SYS_THERM1 0x79 /* Keyboard       */
+#define T14S_EC_SYS_THERM2 0x7a /* Back cover     */
+#define T14S_EC_SYS_THERM3 0x7b /* Charger / PMIC */
+#define T14S_EC_SYS_THERM6 0x7c /* QTM West       */
+#define T14S_EC_SYS_THERM7 0x7d /* SSD            */
+
+#define T14S_EC_FAN_RPM_LSB 0x84
+#define T14S_EC_FAN_RPM_MSB 0x85
+
 /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
 #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
 
@@ -93,9 +104,19 @@ struct t14s_ec_led_classdev {
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
@@ -555,6 +576,128 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		return 0444;
+	case hwmon_fan:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static int t14s_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
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
+			*val = value * 1000;
+
+			return 0;
+		}
+		break;
+
+	case hwmon_fan:
+		if (attr == hwmon_fan_input) {
+			int lsb, msb;
+			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_LSB, &lsb);
+			if (ret)
+				return ret;
+
+			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_MSB, &msb);
+			if (ret)
+				return ret;
+
+			*val = 0;
+			*val = lsb + (msb << 8);
+
+			return 0;
+		}
+		break;
+	default:
+		break;
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
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
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
+		{ T14S_EC_SYS_THERM0, "soc" },
+		{ T14S_EC_SYS_THERM1, "keyboard" },
+		{ T14S_EC_SYS_THERM2, "base" },
+		{ T14S_EC_SYS_THERM3, "pmbm" },
+		{ T14S_EC_SYS_THERM6, "qtm" },
+		{ T14S_EC_SYS_THERM7, "ssd" },
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
@@ -590,6 +733,10 @@ static int t14s_ec_probe(struct i2c_client *client)
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

