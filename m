Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2073019BE
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411698; cv=none; b=nyUIU0xFLPWGFjTXzEcpaORTUF/tXbKPoKmeBGOUCrcBXXQopNeedEeL6gO2loaoEmprf+/ZuuQq85BBnVhBz9Myj7zCFk8V5Z9eP8SEjaqqU8mFXxE1haWFLqSjMOEoQfpkSrayx5464B+TLcxpTQSvYtk5uaAk8vREc36JY+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411698; c=relaxed/simple;
	bh=qSzMCH9vDuQrytwQS9UnczqlBXpwfFZ/nl87MpnPL64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hs0QwGv5CCL0MGQP+53ASEiPWCMEAomk7snN0RW2yKhBEkXctl7bU8Xaq8YWFt67HYBRK5ve2kItVD48Vn0UXqvmXz4K66CdkGFOzLUHyFxaIEEcavM2HUvXaqWfmj2ByhnNi8t+3fVgbkptkixuxn1iBFouysW9hJF7d0RJ9d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FA4kdaGV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoeKhFex; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FA4kdaGV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoeKhFex"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8qEPU3693985
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 10:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FRBvhuXzvtNk4uG53SKU5LRgXXVe4E52h4IWyqfGWO4=; b=FA4kdaGVDgT8te9r
	p78IjjRhMSkRXBQLuVGQpqW4kfFkGzW9NiCYn13n5qQbSoLUuj9tUnbVCIoqA1lc
	MM+pK5aCuF05buKzH/R0/y/hM9EPDPRdZp1q497Lg3T04fTcMmnP2GPcYed16G0j
	RjoLt0U+wOV9Mr/rsRSMDV1ZMg1Wy4r++WS4Wy0lz88j3QDtWdEY37z8qIx6ljfD
	NRRWWN9DJp7l46YG7q/2HLLLe4Rm9wbyiUp584uKMaKkj9CwOtVOm9yxHhaRdvaY
	lsrExXS92p4hyoO+Q/UwQqbbuKiUo5kAkkUHMfGl4zNhf8H5FgerhTXO9leikQCL
	FiGnOA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyfb20jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 10:48:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896fa0fcf27so481437686d6.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 02:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771411695; x=1772016495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRBvhuXzvtNk4uG53SKU5LRgXXVe4E52h4IWyqfGWO4=;
        b=FoeKhFex4XGZVJctDRkUXh/Fd5zXtGt5xLLkYJG8S+Ja5dTb3YtWqydUUk1KbwacjO
         M41I1D8Uisopv7jEtUkbdXH66z+nUZ6N4BmWvcmVQBiyU+35VRXJexKT8/78yRx1RHNG
         s5sR8CTI+lQlFEguvk32YrIiqeZEg4p0CSS+/xeNpSwpwh9tgC6xgrz09Ll1aCitKlYm
         UpykczewBbAXgxNRM7MPDN4Hikh3vJWIU+vLIkCBIyKHfjATqSd1XnV5/0GlmJ7f7z9H
         R+lm73TSyHRqhMX9WTBTa9PqKGpZ/z4pSWmy2dPJd5xUElSVtd1NFjDEi9TmDFBwY21v
         mvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771411695; x=1772016495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FRBvhuXzvtNk4uG53SKU5LRgXXVe4E52h4IWyqfGWO4=;
        b=CVwxuvhlVfVDsg34uHm61xipZgn5bm+ozdMTBs19yLWU+lH/4HSTSkZBNAh1eX/DaS
         16xevd8M9x8oFpYlrizUfAvRcBVEk+4nrGGO/IkFwLNa1KtGuAuwvH/vFVMDOy/RMpMS
         q145b4RtyyyWhnXhjCAMXda1W7Vp4B4s1SiAoEmT6s9aq/xaWgR1Jg0qs/3vYNPeCFSX
         HAnEnEdpDb1me5L8Moh99++BBq+y6bu1tYKhLZw8b7Y5xrIlupG3RyFrBNX+gIxuIWsS
         gCV0rDfNiL6cAb3tO4E3UWSt9RBGSZBfUY0AS9pueKlx0PF5g/kBWoonSIuMhjXI7E4d
         rn4w==
X-Forwarded-Encrypted: i=1; AJvYcCUDC9bYfk6grAnVl5UAXAlfOCxMzMrK1w1fPB4vBuitsFuHVBp58RrwZ3lIsjHDn7DAmol80kG5KQwarNsqZd/z1eYG@vger.kernel.org
X-Gm-Message-State: AOJu0YzvbjW8I+F174XORp3FfIniN0R7J7qy+DBRilVrRlULAiZrO/DY
	D9d99Ioj0od5c5bQN/OsPE+dqRQUpogfFBwUpkRCZ+G1tZPfmKoKyAslYJdVmnRYTOUSq+OO4Ou
	1Qmm/qOWc+q9fB7cnN9k6j4SH79OfBxWC2DPE4NtMria+gqtUoYp5AGmS8jkXQX0JiZLtoMejSE
	U2sxgseWVV
X-Gm-Gg: AZuq6aK+hSvOSAC9CmI0tx6INbvr7DANsdhDq1WKF1ekgRX7U7SvJH4Y6XiFhbXn3pp
	Ilbz+O3ii2EJDcmQu/zbEXrOxa+G0hEH1DqpCyI5W0N3+b4daKwY2Lfb6PF4VnPmeAiHVri9z8n
	G2VKSaYjvIKGGqnWiRzH5os/EYfnECOB7/JvsLWDsN+iJk4D5z4VRXJySPP8kuziZfL6Z0bDR/L
	PwUGBmnnixMJP/8rUCz2Q6GjD5M/l1UZOOYao2CQY0PclG9iLhncr0GJVCPgquxxDRbFJn1TPVv
	5Jioa/kRxk1yxhETR7Ki80qcV5k7K862aGzcfCNT+gfdsIfCpV7ye3uDA2pri8FFw3wa4/NCUec
	eJKmvLSE0yhaJ/jeD22JSeLuhNrfJ1FEkkex7FLUmOnAHmedDdGBL
X-Received: by 2002:a05:620a:46a1:b0:8ca:4545:aedc with SMTP id af79cd13be357-8cb422b3a9dmr1878113985a.36.1771411694862;
        Wed, 18 Feb 2026 02:48:14 -0800 (PST)
X-Received: by 2002:a05:620a:46a1:b0:8ca:4545:aedc with SMTP id af79cd13be357-8cb422b3a9dmr1878111185a.36.1771411694443;
        Wed, 18 Feb 2026 02:48:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6f70:9a29:d138:f5ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm41907451f8f.32.2026.02.18.02.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 02:48:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 11:48:02 +0100
Subject: [PATCH v2 2/2] platform/x86: meraki-mx100: use real software node
 references
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-meraki-swnodes-v2-2-92c521da241c@oss.qualcomm.com>
References: <20260218-meraki-swnodes-v2-0-92c521da241c@oss.qualcomm.com>
In-Reply-To: <20260218-meraki-swnodes-v2-0-92c521da241c@oss.qualcomm.com>
To: Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7730;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qSzMCH9vDuQrytwQS9UnczqlBXpwfFZ/nl87MpnPL64=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBplZjpp+lt1rK+iVL5nqM3AjlfShTPdfEaSe0RT
 j/LtVxrbZGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZWY6QAKCRAFnS7L/zaE
 w1/4D/4k1ArDcKQU6Vk+CQl8UzTWb6rV4yfJfADJWTzqeadW6kWQpeoBSiemZ4c6LmB9vX1KLyb
 K99QhrWNlmZUQfZAeT/uo7AnWQ58xVJiazMwRYmAS9FZznALr3SYBLvQSwZPqHvL9e5M0gKltTc
 AaDNaxlMxLZB089JZozqUF6DzEfksXrZbPfo9nkivzMYsUhGOTJh9F0gYvOli1t3F1Fy8E9+BqY
 HBTKf2nlfGOiHTRhYqh4FKa88v3BQN09DB2NYMzLMjFQr3XPp1sYMljb3TYVFAy4nfpToKRg5MZ
 LFK7HeaW/7BY1duB9GJenvI+8ep0OvTLKvMK0nvJlV0PpQ5C7WJVz1TWILOI5+mspjzSoaDea/K
 sduF3WvJQSM5Ng2guvhNCVwQmmQrDq5WhgS4FJRdHY+OiKBajQDQrqPfTtfFlz49PBXDbvQARoC
 iInWcpHeRAEfVYwtF5lmyeAw0+YkenM07CsY66YxdO/hRaFzxzffoLKJGfJRgJW5qtLf+T/WGPJ
 K8JBoWuimA/O9l42T2VWKlajmCBMa1N1ZguKvAD0EKH4wIerQdcE1XgzrGSCldkwz7mC6ri0K+l
 ku5gv0My2wk0zRqj4ZDaO58ZfHOMUWPBzYBvBzqOHYldbAiOKWLiiQdVqoaOxbnkd5ynJOiiM9L
 mtpHxCJ8qvRzgIg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: TA8S5FDgdombkXlsO4ozQRhDSUiA647U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5NiBTYWx0ZWRfX4z61SSPNAyrf
 UjsnuWwnVH+3wDz02eIww5n6AMLzfVKQwi8yo++UPdw8zlleL8rgtB0rBc8sO/GFNn7VZeKPyLP
 ZLHeqHjIXGogcS5hxcmmlEFMK0mp/eUhzjH1lI5yUq9AYXG1g9VRG9ANteC2ieimIWw4YzwggSx
 A7fXJHJhpKSz2SxrueBwYFt/t5ftVXGuxkoSwhGzdMNM85elmcdOi7jxY6E2sbEHHNqiLv72kKk
 qT529CogphteSnQcrZKxr6fKHFmLyXAof5boZDHFYRmW2J6qqpiKG+WNkb4hiQwBudiEgF75UiN
 d1yb1x870UZOeKST94lg4dcFqhjW6j+8D1Bkx0TNYiE4ERWZ1OfgrOcC4vkmfosNrJlOCMgJZ3v
 F/anovjEu2dUu86174Yz4szbCQX2lnPQVkIIQIRhEmENqH6TBypEQYJ5kTXT7JIIaU1qPA7stWe
 IrRH4FtINEDLPimGTcg==
X-Authority-Analysis: v=2.4 cv=JNo2csKb c=1 sm=1 tr=0 ts=699598ef cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=3wPGFFiRJwkw2PFd6LQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: TA8S5FDgdombkXlsO4ozQRhDSUiA647U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180096

The lpc_ich MFD driver now exposes the software node associated with the
its GPIO controller cell. Remove the dummy software node from the
meraki-mx100 driver and reference the real one instead.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/x86/meraki-mx100.c | 41 ++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/meraki-mx100.c b/drivers/platform/x86/meraki-mx100.c
index 8c5276d98512390effcc9f2258a6061684420d11..9f4caa1f3a923164eeaf31765a4e83c874cff181 100644
--- a/drivers/platform/x86/meraki-mx100.c
+++ b/drivers/platform/x86/meraki-mx100.c
@@ -20,16 +20,11 @@
 #include <linux/input-event-codes.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/lpc_ich.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
-#define TINK_GPIO_DRIVER_NAME "gpio_ich"
-
-static const struct software_node gpio_ich_node = {
-	.name = TINK_GPIO_DRIVER_NAME,
-};
-
 /* LEDs */
 static const struct software_node tink_gpio_leds_node = {
 	.name = "meraki-mx100-leds",
@@ -38,7 +33,7 @@ static const struct software_node tink_gpio_leds_node = {
 static const struct property_entry tink_internet_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:internet"),
 	PROPERTY_ENTRY_STRING("linux,default-trigger", "default-on"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 11, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 11, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -50,7 +45,7 @@ static const struct software_node tink_internet_led_node = {
 
 static const struct property_entry tink_lan2_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan2"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 18, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 18, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -62,7 +57,7 @@ static const struct software_node tink_lan2_led_node = {
 
 static const struct property_entry tink_lan3_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan3"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 20, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 20, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -74,7 +69,7 @@ static const struct software_node tink_lan3_led_node = {
 
 static const struct property_entry tink_lan4_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan4"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 22, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 22, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -86,7 +81,7 @@ static const struct software_node tink_lan4_led_node = {
 
 static const struct property_entry tink_lan5_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan5"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 23, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 23, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -98,7 +93,7 @@ static const struct software_node tink_lan5_led_node = {
 
 static const struct property_entry tink_lan6_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan6"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 32, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 32, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -110,7 +105,7 @@ static const struct software_node tink_lan6_led_node = {
 
 static const struct property_entry tink_lan7_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan7"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 34, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 34, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -122,7 +117,7 @@ static const struct software_node tink_lan7_led_node = {
 
 static const struct property_entry tink_lan8_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan8"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 35, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 35, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -134,7 +129,7 @@ static const struct software_node tink_lan8_led_node = {
 
 static const struct property_entry tink_lan9_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan9"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 36, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 36, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -146,7 +141,7 @@ static const struct software_node tink_lan9_led_node = {
 
 static const struct property_entry tink_lan10_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan10"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 37, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 37, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -158,7 +153,7 @@ static const struct software_node tink_lan10_led_node = {
 
 static const struct property_entry tink_lan11_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan11"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 48, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 48, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -170,7 +165,7 @@ static const struct software_node tink_lan11_led_node = {
 
 static const struct property_entry tink_ha_green_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:ha"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 16, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 16, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -182,7 +177,7 @@ static const struct software_node tink_ha_green_led_node = {
 
 static const struct property_entry tink_ha_orange_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:orange:ha"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 7, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 7, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -194,7 +189,7 @@ static const struct software_node tink_ha_orange_led_node = {
 
 static const struct property_entry tink_usb_green_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:usb"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 21, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 21, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -206,7 +201,7 @@ static const struct software_node tink_usb_green_led_node = {
 
 static const struct property_entry tink_usb_orange_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:orange:usb"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 19, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 19, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -230,7 +225,7 @@ static const struct software_node tink_gpio_keys_node = {
 static const struct property_entry tink_reset_key_props[] = {
 	PROPERTY_ENTRY_U32("linux,code", KEY_RESTART),
 	PROPERTY_ENTRY_STRING("label", "Reset"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 60, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 60, GPIO_ACTIVE_LOW),
 	PROPERTY_ENTRY_U32("linux,input-type", EV_KEY),
 	PROPERTY_ENTRY_U32("debounce-interval", 100),
 	{ }
@@ -243,7 +238,6 @@ static const struct software_node tink_reset_key_node = {
 };
 
 static const struct software_node *tink_swnodes[] = {
-	&gpio_ich_node,
 	/* LEDs nodes */
 	&tink_gpio_leds_node,
 	&tink_internet_led_node,
@@ -348,3 +342,4 @@ MODULE_AUTHOR("Chris Blake <chrisrblake93@gmail.com>");
 MODULE_DESCRIPTION("Cisco Meraki MX100 Platform Driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:meraki-mx100");
+MODULE_IMPORT_NS("LPC_ICH");

-- 
2.47.3

