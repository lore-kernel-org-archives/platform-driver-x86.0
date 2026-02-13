Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E77D2D97A5
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971168; cv=none; b=P/yE2IOJ5T7DIPYGZ0lYwHhnOqHtc11o2vv9zKC6yrCNOKp/Dy/vv5J8U4X21GZlQJm9hQ0wQrcp78AphCZ1UrBG4Nhj6DV8Qtb3K5UIdWGafgtFSfQFQZxJS+L8Q6wGKGfoq+SGG7v31PqIlQeBLM1BggU3qxUpXv0eoBvYQM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971168; c=relaxed/simple;
	bh=5Q7SdkbTMle0m4+HfUBeV0NMkxzBwcTxtXfzJqxazXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJv2Y+aG9r1cSVu750Y8KpjssEWa2i6IHYa/Fs/b52Ym01rRMrNFtSEkT94XLE7H9Jkn1UiM4HUzOA3r/3iUofMFpC3rvdX6xAkBdF+iExBK+P0ZPHyIX9qH9i9T2b0bXYNmmrg0vsWQYXjm/yxPgLyqGOAjXFaur62D1kHKbwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7FTH0FY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZC6Xlbt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7FTH0FY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZC6Xlbt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D0BsnV2733859
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34wRrCzuqbK+ysVU9RW5vE+7z2lDW+77OV63uWI6j1M=; b=m7FTH0FYgyko00UA
	oEUhppje16+2/cz76Ac59/VxdeXAgB5FBLXPnvs5Fv8moO77zKIL/lk+f9Mq4KO3
	v6UFhs4xMSsk5muao6WxrJJt2BBv+jWUPESMvWHjiAoB3mS5WcLDdyGuexkcCTht
	MZFGiPSw2jdwuDm1yh4SAOnoJJga6J4nHcN3V5sGQktJq2GjOFY+X005Ycpi4t6+
	sVkUdHJ4ZSe1h0XtVNcZvnkPEeSeTc46hu8+HKRymz/e2nUAlZJpOjWg5UN/jmyC
	+w10D6iFM2tLbF4ibcZCdNiR++U1yMF3n1tnouLyVeTzuhBc+H9b78Qc8veHJ8uR
	0k7Stg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wsfg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:26:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3ad1b81aso284479285a.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 00:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770971165; x=1771575965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34wRrCzuqbK+ysVU9RW5vE+7z2lDW+77OV63uWI6j1M=;
        b=RZC6XlbtBR3a/5/eakQxKb90+7G2d2LiD2ZOQqwqJQAHQ3EwnKSV+G3Ar65NMS/+yV
         wC0gttSR51AETlG0RXG9NJFq9ifkjzS/awm4OVShykfCJzQBZar/4w5uYNSbHK4A0Cu0
         7Gl6QyejPnj6vB1bgi0sBQ+R3Zl932uynHbde/HEwvcMEF3yrxb8NUg0ggEozd1jdHsA
         objZG2gAajTPuQY4wi5C3zZywx0sxSNcqO8ht8vnPXJ1GLQGJZKUiYbTViaE6W+/AxUV
         m+cfZOnZJ1UH9yWNIpsUbwV+pNuKCwHLwG/12CnlEhwVVA1rzjIcm1kysAiHp2qfMh4G
         Janw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770971165; x=1771575965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34wRrCzuqbK+ysVU9RW5vE+7z2lDW+77OV63uWI6j1M=;
        b=cj1xRPWOArrov6M8wnNOjAmHGbxwtSdMjosggC9CoC95A6Cqd/l44BH6Yo1n5u5jJM
         kdb+WD6YcHwfe35ihV4nndKuQbZdhpNk4KvQBrKQBqkWMStSeGch4WfbTf4qQPSoh/49
         JTnQe/w6wovppuiKzu9lpuGDIyL5Vl3Fg+bgSz5jgbL1QaDhhcE1s8ebgNSnVp4Crl8T
         FoFf7unfG+I5Nv8K8Keass7AapdP5B1v5qocd/V4zbuROz7z8y9VGGUfN3Nu9jUdsQQk
         0JbU8WcT6Xq/quiF8znwYkgp4dOBEewjcfXxpp+lrhmDMVRIfI8ogSTu0xuu84PaCCfw
         CRbw==
X-Forwarded-Encrypted: i=1; AJvYcCXEbtqcR1sMhJ37UAKqPR9uAo4E/ilf4zwZjn3BIc3i6F8TlRf+0kIPK+1TDciW6ZiLfcMOJ8orXVULVSU/gglN7K1l@vger.kernel.org
X-Gm-Message-State: AOJu0YyJHUwhiUJboQB/NCoKQ44eY69oVEVQCBjO1bQj23qBW6QgkWLY
	+kRilx1uaLk1lJ8QTco4eZzHLGqslvlUoPTAtGgYnl9FpppL26Ww7emdDfwrRyaQoPgHUW0y1zN
	sfK/COinKNzF4HEiSUbx1egKzmCJBT/+XqLGcZILxGh3q9VsaVR0Q1elKKH5sp0uLDclnB8w3ua
	mp
X-Gm-Gg: AZuq6aLIOKS9y/EnkG0eaeO/QU/TvzCOtJsYNy4KEXfLYg7w0JE2BxmFKP9RF6z7g8P
	NTkdVIG1dX1d6ByWGuitsDxjOWaEnLBIBWE/KevBukyy8O64E5jIXMuq+rncMtucXouDFxrsVwx
	zPzCbNRYtQAbv8IYEv2xbfrhwAw5ro/pdpxTNAx2a9EpIPbh50kOmQvddtRT2u7WEEcCVL5BOy2
	w5cW5GBgEis83buJm7GQx7mBG6wFOUEQ/PZSgW+yH4KxCFyzgywblrA/eQhk8WrB+YWZOLA/YDE
	dyiWmxhADOBu8za3/OwWDzyjZGzt6RbVmYGN5Mqyn7rhiIYtrpnBiPVo1tr1/f1Fsc64Bn+6b92
	eg9i1eHpEJkyI6lxRxDEobx1D/GTmKp63EnWf9cmNtJboUgdSi7PD
X-Received: by 2002:a05:620a:29c9:b0:8c7:10cc:758e with SMTP id af79cd13be357-8cb42407c6amr101488985a.45.1770971165254;
        Fri, 13 Feb 2026 00:26:05 -0800 (PST)
X-Received: by 2002:a05:620a:29c9:b0:8c7:10cc:758e with SMTP id af79cd13be357-8cb42407c6amr101487085a.45.1770971164793;
        Fri, 13 Feb 2026 00:26:04 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6de6:6c0f:d493:4a7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a78c89sm43075025e9.5.2026.02.13.00.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:26:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 09:25:25 +0100
Subject: [PATCH 2/2] platform/x86: meraki-mx100: use real software node
 references
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-meraki-swnodes-v1-2-8e032693456c@oss.qualcomm.com>
References: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
In-Reply-To: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7433;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Q7SdkbTMle0m4+HfUBeV0NMkxzBwcTxtXfzJqxazXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpjuAXxD1DU8alBGCuJx7ykvQhSIio1TF2shjcs
 r5ZMYdBnFSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaY7gFwAKCRAFnS7L/zaE
 w5z3D/9TpYaWS/nADb74kcMIB7kOdc5L4Y3SV+6/dqySZCyKIY95VxHOXJk0Dj3E+PpeWWOZwqF
 L3khYJRZ5pCz/jVIBnH0a8nNKf2K261i0ircpl9YyhqTsPWsPUAOHdpiqUK5QF8s+HIQNNNn/my
 BQJeZYFlDytJkoEl81ibhxiy0sEHASFJgyvWlGPe8EQH3Mh2clsRTomcpKNo/CcT4En7n5Swuj4
 ENIEKx2Dy8V+YoEf5py3kqJtuF2U3eCRZ5si2DwxkLlFsBnUrnNqQikFguah7XBMMp7UjAs8QIv
 95NyJuX7aaYKzqbxBFVY4wd0yB8gLX357qyNm37TiA7bCgzbvuP4VWbp7BCpV0aKCLiCls1YO0C
 iNQbEtFGsqzYXiAdAwPdDSkW83Ed+vmpR9YqiSk9AnBpIefJRb6IwHIp/AiQgvd8FIJ4nl9CVq5
 9irJHBhS2jeU67gB4Fmg11BOKt5TwguF9mEzocSOC2ptgBIGhHxr7CzmDokyGvqT8/8lBntvvod
 Pe21xpdj3zJEQBxi6Dqv13EF1DXukU9QcH361nQDasWss7QVCy45V3cORjOVCGx0ITpE9BQq8eJ
 McJLmssmDaIDg4jBqEaEwnILo8HddQWdrBXgueQnTvHy1U0PAfniSBhSuGzOo3lbbIDPoWsifd6
 I/L7b4l9cMlNo3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: hULDAEqBgm1C_NNIekj-o1iULan9M-qr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA2NCBTYWx0ZWRfXwfo/fe4VkbKn
 Q0M8W3zzdxEDWCVClJguLbNgEk6VJs8QuITjd2vAOGvi4XNUjjsWNBgiw5ZCoNfSYhHRbkSPcKV
 nQgQsOoczw20qFP2HpBcw5de1QftKvzsnOwOh7g3oDSHpzSM7LeqnUH1CPB8xmj9LyyFXlxOs9N
 TgFdpRAZYUmhEQYvn5rZ1lP555sD05ToRyPis/y2t2t18FSue3HBwAzSVBmn8A+g/Q8qV8ArWDu
 0OcFG8rvggjApuptLW5ckd9lPR1lRczh+84rZ6QK7v6f9n+GHedvus+3ChFNpSxSe6jSHDbbv5b
 4f72hu3UEQaLFjWVJqFg0Quqkk6sY6bxMur2mgyKoeZ8f+WMfkbwo0MMbLdgCQtFxPE8wrNxtLO
 JK57vdZaxPxbywoSW2pH5jeAOooPt+N94jwqY5yWgzhwdrikwl4vmKW32BwyYaYfFLarTBsuJ2p
 MBmQ6wehilg+Lf8bZ9A==
X-Proofpoint-GUID: hULDAEqBgm1C_NNIekj-o1iULan9M-qr
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698ee01e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=8uK6cGLCw7B09FO9iJsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130064

The lpc_ich MFD driver now exposes the software node associated with the
its GPIO controller cell. Remove the dummy software node from the
meraki-mx100 driver and reference the real one instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/x86/meraki-mx100.c | 40 ++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/meraki-mx100.c b/drivers/platform/x86/meraki-mx100.c
index 8c5276d98512390effcc9f2258a6061684420d11..170ae969bf014edb780fcbace16e50ead59dae71 100644
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

-- 
2.47.3

