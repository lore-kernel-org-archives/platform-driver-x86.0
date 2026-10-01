Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EAE443C3B
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878779; cv=none; b=HyPHe8JvCwAO02TPmYNr/CU4PfqDwd88irJAppA6H/f1HcT1GtDyJkdb+6m29281C/qt7PWYSWNGyrBmPDGNWUjzxza9vOr0HId2nyRLwQfbOw/Kk1+TWJDKUacLw7h/SgFRI4TsinlvQUNvQCbBrLUvsqQeZULqv6TZKZpPTKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878779; c=relaxed/simple;
	bh=PS0vpssVNP4HkJO4FRKJxMjK8ZFJ/9MtSXIzEtOHOMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rvD9OQ1GivHgncwgXdf7Wtnjj1U+26s/ZcSBqztyzIKt5gwYpTifNZC1UfMHfHiBfZV+XSGprpjcdnSUAIWZAuTRySBrPE6RMFqfwZMqLx3r86Fh5KBIi4OyqoHfQO74682d4xemiXSD0/qohz6+cyy2Xj5LX0pHFiHgVw2LhF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6PgzZjq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2TKn+qu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T6PgzZjq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2TKn+qu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Fswot3512994
	for <platform-driver-x86@vger.kernel.org>; Thu, 1 Oct 2026 18:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mjnqYmbWaRlLvLQMu+6rEw
	mt24keW2klcIHefI3dX6w=; b=T6PgzZjqyCfKMX0Y47Kubht2mtCnsCT4gs7lDL
	VrDDEPn3/qj4Zcc6AkaIqgt4W2oDyLpvmfBAhmLvv/BnmgDKDJswBMFfnIdO/3cC
	PtkwminRWTJ6eU1MJRWMbsAySMu2gNUNwpKRkFbH8QbGCKfA/6AxSxdJtuSn/6l1
	6rG+2C6Ol/BSJ9+VH9BcjAxKYWeHVyKbISiO+xM6vVTDj7Np1im+bI030JaGabcq
	yzG7c7R0PQH4+rZn4vhwyekbKVo26ZZOqPNaKb2kY+Ug/wpVTNOddaMoJfxxAGu0
	1sDpNYbNNd2EGqXCUaNfKAipvD1nGrXb6/wq7uofJdOm0cng==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1quk9hyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 18:19:27 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9860de162cbso622115241.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790878767; x=1791483567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjnqYmbWaRlLvLQMu+6rEwmt24keW2klcIHefI3dX6w=;
        b=Q2TKn+quBzf8NH6TAC/SySNMjPrbIpA27g9961+Hzf+ESUWXA0+YNv0CvfKoOI/ize
         1lXKV58el3L2anPtWdxSOo7VlX0scYLd1PCsUW6Vu98yG9xNhKaqJnKxi7aIM8F/W0uu
         eX8iIWu6JvK3n4To7u1+cLRlpx83apwGTb8R5+oMEMZiI/UUEV4+KJwidj+bDUaluZvc
         lKjbFvyKPoVDW79p7CR6woSYup0DYD8DjqHqihQbPDJH2oRiJFAENNbALQykdiRH8XAP
         j8X4vqLlAlTYzoN/3ALRqkZubKpPdDPXEUgsCQrEqfJ9+qvQ4RGgXRkmFnBtqE+pWZS4
         1nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878767; x=1791483567;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mjnqYmbWaRlLvLQMu+6rEwmt24keW2klcIHefI3dX6w=;
        b=FYqKn4rsTkxz78PhizEA2XxQXPCdSVyKzubUiZdKIXlyf3k/uJSsOBYWbmaOunsUKT
         n+Y3GNsaLThH9TZeRgcsyOBDfRi0ndUbC+s1sEdRu2FhYlvKOJkWI9VqI7bviUskUWHT
         iGVUS+NCXBw8B70yydq+A8PeW3Ki/eCDhT/wVa0S9HixsGKBle+9Xg2yN1oSAj6rEvNf
         afgnFBfIzgvV1GRSZ+vg3KzgYO/arC8dJgTu7fFSkbuge9RpmbS/zrV27tMLTXGAWAxY
         GxNlXroxjxv0xW9gQRgaD9G1ThE8jQTVaeTs98+88LgQYSNTKDi2NMhYNULyq0GHBxy/
         FQhQ==
X-Gm-Message-State: AFq9FYIpmGfM45cuar3Tz0/6YmOtWGZhzh31dWz60S8oHG8WZU/VKZiY
	FHNi79bwPFpBVUE01XXTib8B1Izeq+OZIzpdLZWkAL5wmHWDONZ6dl31UeEJ8TDxUwwLhJOXyH8
	BEseVRoAu6+fAl4XLub9Cc5J8AHLlmOKiHXHa0AktKf/i8ywwzb8k0n0lkIk7opE41HBsM+Ugn9
	7M
X-Gm-Gg: AYBFou3G/jsdJ0ZpXX1ibE3uCFDYeyFwnXvJ0eMPDOAHg8+fYbjHkdIpH0UI5JuohE5
	HG+3Yas8iQ7W1GtwqDa8z4fR58l1wuJHlfZYx1XxiY+HlEZR0JRrY4qMsUkMx7dzxDE1vj442Cv
	6UendOzb0EiuAjA6LtY7+Slcsftj1cWTrorkXhF371DEVU6AS4I/oJXMSNln3xPzPSdGiF/wTnN
	UFdVpCO1wcy1j2iT7l6cnmXb6Yyvz29z/0X53WSGXRZ7CHEmcHQ+FakHtQbpcDYCmvoT3+E023U
	qsM7ru0+upHwhE0sSMtwLoD/N+rGiFdLekuS8xSoc83kqm03zaBrmp5UjbwkyTFaOTvXASmEfx+
	pEFaD9KPsQ7s7y337LQNgLaPiGIbrGhwspw==
X-Received: by 2002:a05:6102:334d:b0:7c0:87c2:df32 with SMTP id ada2fe7eead31-7c0f51a3cf4mr59081137.24.1790878766623;
        Thu, 01 Oct 2026 11:19:26 -0700 (PDT)
X-Received: by 2002:a05:6102:334d:b0:7c0:87c2:df32 with SMTP id ada2fe7eead31-7c0f51a3cf4mr59068137.24.1790878766009;
        Thu, 01 Oct 2026 11:19:26 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:f181:ebcf:f9bc:fbcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fa61csm33021f8f.17.2026.10.01.11.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:19:25 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        bryan.odonoghue@linaro.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        stephan.gerhold@linaro.org
Subject: [RFC PATCH] platform/arm64: lenovo-thinkpad-t14s: Adjust thermal trip with platform profile
Date: Thu,  1 Oct 2026 20:19:17 +0200
Message-ID: <20261001181917.9367-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA3MyBTYWx0ZWRfX5PkVR6qpuyAL
 1aqb1AHIUYvQ1T0lz8LziMFRV0FNvWf1UEifmiI3rijL/wyMNNE6EOu+YNM14wFwmxFdIY5YC7X
 0rSlYHzR48LtppJElbruyPc7hlffync=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA3MyBTYWx0ZWRfX3NP2wMEjAd1r
 WQZNaAl1f4uc69yKr8OQ6MlKGUWpFdTpX8hUOOHeWkZgnmo2a5S/hEmofpJWIvPOXorViMVqlGS
 Ntw8r7HOJt0Xaz0fHZlP3t+2rdgCPjgtYw0bYXBhZD1pMoezUBEUm6B0RqHvwHtT1N4cJlXmz5v
 RiHf9ZUffCzaaPJix2rVxCTWqu77+mGezGGN1Mq6FIpZL5zRHAtmSKrvqUoNF3hiBihI4RMngYr
 1KM9/5e+YfojvsH/V+eJzytcTCSn0W6V3yIpDEeS7s5rprZcTqLe/fI3r1yQ/0BwuE3pYDxUpJF
 0TD+H4pQjNSeX4hsZRv1vGlKqT4GxEBM6dkugG2Yj9eCExJgzc37bmYBRH2GEvvmfzIrdZYNNy3
 p9+nI4pmkCZTtRf99zb9Z4MKbDQmOp5VhHi3Wr+kdb+XaiUwrlBACPhDnzabQFKcynmUZlfYQYb
 AWol+5bQWvf/4g9xxww==
X-Proofpoint-GUID: WLlbPXwdQWRN8SN_b4aJgFcXg59gPW2R
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abea42f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sehVV5_9S5bK-sMByaQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: WLlbPXwdQWRN8SN_b4aJgFcXg59gPW2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010073

Tie the keyboard thermal mitigation temperature to the platform profile
selected through the ThinkPad embedded controller.

The EC reports Fn+L, Fn+M and Fn+H events corresponding to low-power,
balanced and performance operating modes. Use these events to update the
passive trip point of the "keyboard-thermal" zone to 49.85°C, 57.85°C
and 59.85°C respectively.

These thresholds match the thermal mitigation temperatures used by the
platform for the corresponding operating profiles.

Look up the keyboard thermal zone at probe time and locate the passive
trip named "keyboard-ec-alert". The trip name is used deliberately so
the EC driver can identify the device-tree trip associated with the
platform thermal profile without depending on its position in the trip
table.

Initialize the thermal mitigation threshold to the balanced profile,
matching the default platform behaviour, and update the thermal zone
whenever a profile change event is reported by the EC so that the new
mitigation temperature takes effect immediately.

Using the platform_profile API would provide a more appropriate interface
for exposing and managing these operating modes. However, while the API
itself is generic, the platform profile core implementation currently
lives under the ACPI framework. Making it available to device-tree based
platforms requires separating the generic infrastructure from ACPI,
which is a larger and independent piece of work.

For now, handle the EC profile events directly and use them to adjust the
thermal mitigation threshold while keeping the thermal policy described
in the device tree.

This change depends on the keyboard thermal zone and the
"keyboard-ec-alert" trip introduced by the following series.

Link: https://lore.kernel.org/all/20261001181055.9149-1-daniel.lezcano@oss.qualcomm.com/
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index e7acb66b77f2..ee39b0382219 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -18,8 +18,10 @@
 #include <linux/leds.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/platform_profile.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/thermal.h>
 #include <linux/pm.h>
 
 #define T14S_EC_CMD_ECRD	0x02
@@ -93,9 +95,16 @@ struct t14s_ec_led_classdev {
 	struct t14s_ec *ec;
 };
 
+struct t14s_ec_thermal_profile {
+	struct thermal_zone_device *tzd;
+	struct thermal_trip *keyboard_alert;
+	enum platform_profile_option current_profile;
+};
+
 struct t14s_ec {
 	struct regmap *regmap;
 	struct device *dev;
+	struct t14s_ec_thermal_profile profile;
 	struct t14s_ec_led_classdev led_pwr_btn;
 	struct t14s_ec_led_classdev led_chrg_orange;
 	struct t14s_ec_led_classdev led_chrg_white;
@@ -472,6 +481,99 @@ static int t14s_input_probe(struct t14s_ec *ec)
 	return input_register_device(ec->inputdev);
 }
 
+static int t14s_platform_profile_temp(enum platform_profile_option profile)
+{
+	/*
+	 * These thresholds match the temperatures used by the
+	 * platform firmware for the corresponding operating profiles.
+	 */
+	switch (profile) {
+	case PLATFORM_PROFILE_LOW_POWER:
+		return 49850;
+	case PLATFORM_PROFILE_BALANCED:
+		return 57850;
+	case PLATFORM_PROFILE_PERFORMANCE:
+		return 59850;
+	default:
+		return THERMAL_TEMP_INVALID;
+	}
+}
+
+static int t14s_platform_profile_set(struct t14s_ec_thermal_profile *tp,
+				     enum platform_profile_option profile)
+{
+	int temp;
+
+	if (!tp->tzd)
+		return -ENODEV;
+
+	if (tp->current_profile == profile)
+		return 0;
+
+	temp = t14s_platform_profile_temp(profile);
+	if (temp == THERMAL_TEMP_INVALID)
+		return -EINVAL;
+
+	thermal_zone_set_trip_temp(tp->tzd, tp->keyboard_alert, temp);
+	thermal_zone_device_update(tp->tzd, THERMAL_TRIP_CHANGED);
+
+	tp->current_profile = profile;
+
+	return 0;
+}
+
+static int t14s_profile_find_keyboard_alert(struct thermal_trip *tt, void *data)
+{
+	struct device_node *np;
+	struct t14s_ec_thermal_profile *tp = data;
+
+	if (tt->type != THERMAL_TRIP_PASSIVE)
+		return 0;
+
+	np = tt->priv;
+
+	if (!np)
+		return -EINVAL;
+
+	if (!of_node_name_eq(np, "keyboard-ec-alert"))
+		return 0;
+
+	tp->keyboard_alert = tt;
+
+	return 1;
+}
+
+static int t14s_profile_probe(struct t14s_ec_thermal_profile *tp)
+{
+	struct thermal_zone_device *tzd;
+	int ret;
+
+	tzd = thermal_zone_get_zone_by_name("keyboard-thermal");
+	if (IS_ERR(tzd)) {
+		ret = PTR_ERR(tzd);
+
+		if (ret == -ENODEV)
+			return -EPROBE_DEFER;
+
+		return ret;
+	}
+
+	tp->tzd = tzd;
+
+	ret = thermal_zone_for_each_trip(tzd, t14s_profile_find_keyboard_alert, tp);
+	if (ret < 0)
+		return ret;
+
+	if (!tp->keyboard_alert)
+		return -ENODEV;
+
+	ret = t14s_platform_profile_set(tp, PLATFORM_PROFILE_BALANCED);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 {
 	struct t14s_ec *ec = data;
@@ -534,12 +636,15 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 		break;
 	case T14S_EC_EVT_KEY_FN_L:
 		dev_dbg(ec->dev, "FN + L - low performance mode\n");
+		t14s_platform_profile_set(&ec->profile, PLATFORM_PROFILE_LOW_POWER);
 		break;
 	case T14S_EC_EVT_KEY_FN_M:
 		dev_dbg(ec->dev, "FN + M - medium performance mode\n");
+		t14s_platform_profile_set(&ec->profile, PLATFORM_PROFILE_BALANCED);
 		break;
 	case T14S_EC_EVT_KEY_FN_H:
 		dev_dbg(ec->dev, "FN + H - high performance mode\n");
+		t14s_platform_profile_set(&ec->profile, PLATFORM_PROFILE_PERFORMANCE);
 		break;
 	case T14S_EC_EVT_KEY_FN_T:
 		dev_dbg(ec->dev, "FN + T - toggle intelligent cooling mode\n");
@@ -590,6 +695,10 @@ static int t14s_ec_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = t14s_profile_probe(&ec->profile);
+	if (ret < 0)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					t14s_ec_irq_handler,
 					IRQF_ONESHOT, dev_name(dev), ec);
-- 
2.53.0

