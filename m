Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C15A3E5A30
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335335; cv=none; b=icMQdoCtb0oWuo6O5gCPMDKzOv+f5f6/CRgEC9xWCE9SeiCJNLTCpt9/FNs3xSsjNiqglWhEF9e5JP6GwSrao/+STKC7wxAcxCyZrgXikCuvtRSX0Ye4yYPnUHaenubxpbF01FIc1IpA+JgDppqYP+ulrTxE9Fc0PfGY+lxKn/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335335; c=relaxed/simple;
	bh=KubqS9d0YGkacDuDdgigJavlflu99724o5AA5cuLn4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5M5ksV6/d36E2IrZTczVbpuyKwgZpSy9tP0WFajn/l4+CVg1fLoa0ldzVhxtvoYcHtA8GcI9UlScKClZpYH7SdMF4iuVcoMM+pQV6boLiuQEfY/CdTaFPhwA0CsyX7vIKFqrH5Bhzm1Ud7VIIHQQH/l/gfbgVU0kEYTAZhBnV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UR7rsXj2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isUcarZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UR7rsXj2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isUcarZP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJjj762396025
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lXty0c8dvBU
	OMaVjegXOvn9okysmin+BPLP3AA3xoXg=; b=UR7rsXj2+H705/dAX4KecZIPdgd
	Nt3Xr8JRjg8RmxDc0l3pMaCPV/mdMGjAOF0+W/+RpzUGRmdSuafCec8JGH1hvYyU
	6eyvondGiqNmOpT+X9EuPlwtWXgZZL9+jKy+R1MW6SoTeooqBdM8h1p6WWtr+zSM
	+Jnw/GXLTLsHLE8abckErPD0sHwNUbWygaBS1rOO50xG9jO/atn84BiQIxTpu3c4
	BLwt3fUuGMEvJR3MqIHrIF9CZBYeAOBleC1OvP2JoRBiRHZHcNV9ZdTEZwhjWnyR
	7KMzZyH607pDKiPpDjd1I/IjT08LXv6Lrxn+0DO1D8JBgPWBzmCi8YuGZ4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r34286-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-926e8e6592eso235218885a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 14:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335327; x=1782940127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXty0c8dvBUOMaVjegXOvn9okysmin+BPLP3AA3xoXg=;
        b=isUcarZP9gN7zFWeGzfQQI0qfGKsX9X1HzjmSjZ5mjtZtGvdT65WmmcMmZN/wyD/5T
         M3EvPWFJcj694HKVIRjjP3nBtP9G+ay60AhI8sQqd+GIUphaFpzNFKZQZ+fNcXLOOXoX
         d8lyj5otw0IDFKrDiOX8+lB1dkjcJGewABCohnSJefzrjnOY0WnA8az+FZDNJ38d5J2z
         rBwiFs+m8QQdjiqBm0AH6mEAJfYjeOrgWoOFLnJkfqxAp6rWGa8GU69XNV1twQneukr2
         HzAEVsOtT5BpqEaU7E7vfHKyidvRqkrvLj2ckK+KsWeEzM6CHYjHMWZkbibW8z+3ih8O
         GgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335327; x=1782940127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXty0c8dvBUOMaVjegXOvn9okysmin+BPLP3AA3xoXg=;
        b=ewbcM/Owgdrj8gmepF0yTHYMLJwtifgvpHeMUOgG5YHZlZezXFrD+l/tpz86uuNPRl
         rSJ48jmapMhYHr/FNRL5eywX01MaNVn8awVq9YAMCl1BSOel8f7pXelkOgnE6GfeojAR
         dMoxXnwiEOTqsMqp+GkmW6eMu2SBFDiVZb2Sm44fXOGc5/NzG6ZWyX8T/sgW7o1PX8DK
         bdaWxesmhOPYRnraS7NvHctOMcGgl2hhqqAj6pMtBmGsCufoPVNVsTR/L7Q0RDtLVU/S
         Ua+haKNh2YyIUlGCZOB0dWSKTFZEG/60lIhRt7+XJr+IgDYzZHh6VH7uglrqIw++nQvv
         GLsg==
X-Forwarded-Encrypted: i=1; AFNElJ//wYxqxOUAqGyOeOqu6vlsEWR5BaeOc1VlUBp2Pp7fxcJT+cMy03YcHl1K2/uiET4NO65Qv3wN8IZj20l1suLbr81K@vger.kernel.org
X-Gm-Message-State: AOJu0YzP+AAGI40t7/f2ZssgFUoJFwPJ5VcO4pbcuBvL/LZvhZLrhFaq
	FpL9acm7BgRknq23cl4pWOwHRo9pefGpCdQzGP2GArLJGSy18VtGqoBAMmdYcieY8zer7EGIN/7
	bECLQ15b3akaBEi4vqGAZMPeL2vB8hgT/CTGcZxAY6kgsfn13rKtZMhsKqAZxsaob1tHs7ylrw3
	DO
X-Gm-Gg: AfdE7clQQTQl5fsvLQn483UuNctpeT4ZF+016kGbyJTcPQ89BZczJZAFrQYxTHgqc6G
	R4KXCUDhkXncQ0Mzgh3d2zE2E8Ytae6d0PqZp8KUUrHfd2jZ0g1Gh6rkG4VblkDHNHdgvI8+o2p
	JN22IDI+jUsYvOCjzQI/tivSo35uuKaM2DEwMWYNYme/tLByxE6fNHxwpbASRmKrLcKsjK0leg2
	FxGOLOFwplu8+fnqmgHnmWYf9ry49ezpxw+KuZxhBXkW/kklj2B+D4BwTa8Y5X/HZU7KlCij3JX
	vN5wKZ5ed7BFE6o8pZvKBdvlG7O7ETR1azoaXL2vn/CwgPFgrwD0Hepnj8gKiimsPdJUKqvWpkR
	7UJpsfT67G4Aj0uBRnAyEnqIYOnN/ypYJs19N682TJ2UCFg==
X-Received: by 2002:a05:620a:40c2:b0:912:8fd0:4a5d with SMTP id af79cd13be357-9277f1f4f11mr823242785a.55.1782335327081;
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
X-Received: by 2002:a05:620a:40c2:b0:912:8fd0:4a5d with SMTP id af79cd13be357-9277f1f4f11mr823235585a.55.1782335326522;
        Wed, 24 Jun 2026 14:08:46 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 2/3] platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon
Date: Wed, 24 Jun 2026 23:08:24 +0200
Message-ID: <20260624210825.264454-3-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfXxkbX6U9Ib006
 BO6MFdID+bNGJ2JJMCLENjHFaZp9UCOS7xGcapREBY9qYfWMsOYsC92WNrsrqVo1+uDJIpx+WxN
 nnAPqa2/Oh6Ccdbg+KskRj7McsUfGp57ODZRSK48CzaK9TPe8IPxfte37TXO/JJXpH7L/MdPQNt
 E+Q9ZAwGARwlNNxJrw4ssw+hv8tl/OPPnKrkUyMfjVx+Kt8GHGteOZ9h39EbHEWd73qzX3dd3Kn
 +QFvC5c/j60Bq7g9uv80Ey9Dq9s+QmCRhsZyOLpOB7zlAOnUWvCG3upAdQPU5ScPY0p7G6/MXae
 hxyJGoSc3VMDgYLcgXFM5b9iRtMlY1tZxYe5uOxlY/7c9Xtw1H8em4cdYQGp8PMqmakjoNq8TXv
 neI0qoS0gV2j36xAcN6SoIieYGb8Dc9E5hGegzcuipd38o0Ep5Uelx3Bhc3ouObI0svaj40z47h
 m17DtXMIOGznqH2omAQ==
X-Proofpoint-ORIG-GUID: 7oXnA5YBce7vNZa-6ZNoIwZr5NjfeD98
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3c4760 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=ImW1d6Yn9UAQwwTZzW4A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7oXnA5YBce7vNZa-6ZNoIwZr5NjfeD98
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX1VwSk1mrh5Dn
 6UifcTCfzBKo3JYVLYgpVWJ2/sZmNWCckHDGA9ELi+s8c0+ZJh/2DyXRIlK75gf5FQEI4k2uCeN
 +7ks6qT3Ar9zGmtrRQmnxmxbKysKuW8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1011 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240177

The EC generates thermal zone status change notifications for a subset
of the exposed temperature sensors. Wire these EC events to the hwmon
notification framework so userspace can be informed when a thermal alarm
state changes.

Associate each hwmon temperature channel with its corresponding EC
thermal event and emit hwmon_temp_alarm notifications through
hwmon_notify_event() when the EC reports a thermal zone status change.

Also register thermal zones in the hwmon chip capabilities and keep a
reference to the hwmon device to allow event propagation from the IRQ
handler.

This allows userspace monitoring tools to receive thermal alarm
updates without polling the sensors and gives the opportuniy to the
kernel to cool them down.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 66 ++++++++++++++-----
 1 file changed, 51 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 142464623f0e..276bb51da33a 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -107,10 +107,13 @@ struct t14s_ec_led_classdev {
 struct t14s_ec_hwmon_sys_thermx {
 	const char *label;
 	int reg;
+	u8 event;
 };
 
 struct t14s_ec_hwmon {
+	struct device *dev;
 	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
+	size_t num_sys_thermx;
 };
 
 struct t14s_ec {
@@ -493,6 +496,20 @@ static int t14s_input_probe(struct t14s_ec *ec)
 	return input_register_device(ec->inputdev);
 }
 
+static void t14s_ec_hwmon_notify_event(struct t14s_ec *ec, u8 event)
+{
+	for (int i = 0; i < ec->ec_hwmon.num_sys_thermx; i++) {
+		if (ec->ec_hwmon.sys_thermx[i].event != event)
+			continue;
+
+		hwmon_notify_event(ec->ec_hwmon.dev, hwmon_temp,
+				   hwmon_temp_alarm, i);
+
+		dev_dbg(ec->dev, "Thermal Zone (%s) Status Change Event\n",
+			ec->ec_hwmon.sys_thermx[i].label);
+	}
+}
+
 static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 {
 	struct t14s_ec *ec = data;
@@ -542,13 +559,9 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 		dev_dbg(ec->dev, "LID closed\n");
 		break;
 	case T14S_EC_EVT_THERMAL_TZ40:
-		dev_dbg(ec->dev, "Thermal Zone 40 Status Change Event (CPU/GPU)\n");
-		break;
 	case T14S_EC_EVT_THERMAL_TZ42:
-		dev_dbg(ec->dev, "Thermal Zone 42 Status Change Event (Battery)\n");
-		break;
 	case T14S_EC_EVT_THERMAL_TZ39:
-		dev_dbg(ec->dev, "Thermal Zone 39 Status Change Event (CPU/GPU)\n");
+		t14s_ec_hwmon_notify_event(ec, val);
 		break;
 	case T14S_EC_EVT_KEY_FN_G:
 		dev_dbg(ec->dev, "FN + G - toggle double-tapping\n");
@@ -658,6 +671,7 @@ static const struct hwmon_ops t14s_ec_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL,
@@ -676,14 +690,34 @@ static const struct hwmon_chip_info t14s_ec_chip_info = {
 
 static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
 {
-	struct device *dev;
 	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
-		{ T14S_EC_SYS_THERM0, "soc" },
-		{ T14S_EC_SYS_THERM1, "keyboard" },
-		{ T14S_EC_SYS_THERM2, "base" },
-		{ T14S_EC_SYS_THERM3, "pmbm" },
-		{ T14S_EC_SYS_THERM6, "qtm" },
-		{ T14S_EC_SYS_THERM7, "ssd" },
+		{
+			.label = "soc",
+			.reg = T14S_EC_SYS_THERM0,
+			.event = T14S_EC_EVT_THERMAL_TZ39
+		},
+		{
+			.label = "keyboard",
+			.reg = T14S_EC_SYS_THERM1,
+			.event = T14S_EC_EVT_THERMAL_TZ40
+		},
+		{
+			.label = "base",
+			.reg = T14S_EC_SYS_THERM2,
+		},
+		{
+			.label = "pmbm",
+			.reg = T14S_EC_SYS_THERM3,
+			.event = T14S_EC_EVT_THERMAL_TZ42
+		},
+		{
+			.label = "qtm",
+			.reg = T14S_EC_SYS_THERM6
+		},
+		{
+			.label = "ssd",
+			.reg = T14S_EC_SYS_THERM7
+		},
 	};
 
 	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
@@ -692,10 +726,12 @@ static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
 	if (!ec->ec_hwmon.sys_thermx)
 		return -ENOMEM;
 
-	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
-						   &t14s_ec_chip_info, NULL);
+	ec->ec_hwmon.num_sys_thermx = ARRAY_SIZE(sys_thermx);
+
+	ec->ec_hwmon.dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
+								&t14s_ec_chip_info, NULL);
 
-	return PTR_ERR_OR_ZERO(dev);
+	return PTR_ERR_OR_ZERO(ec->ec_hwmon.dev);
 }
 
 static int t14s_ec_probe(struct i2c_client *client)
-- 
2.53.0

