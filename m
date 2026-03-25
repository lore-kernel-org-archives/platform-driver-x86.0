Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371583A452B
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432572; cv=none; b=Xm9LuqZK/YqGXSaNxFjgdGNNpqndXIOTQsPsEHdiUp+YR3KRMJ2wntAGsaoyYKYLJgoJZ49TRyMnfyjq72FliyANpir59Q2Ro2fqe0VLQwR9InilFD6a4+5M+4DXL0cicnkKmY+Tfi8PpwweWJHEbO8h8WjZVjVZcUewAxbMYos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432572; c=relaxed/simple;
	bh=4Eg81M5x1R6H6r5YsQ+9mUHboCkJ15/kK96XvhsF6Io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dYD28W3wfUWILcMTqM5lYqZkOLLJzYwF/ut+5OKQujGbSPQx+fvl2HXpPctAg/0izI3jz3AKpu32QW4myfVARwkuFpReAG8zSoOpR88o6nBpLRlsBVRetAIeTKU9mp60cnWzs4CyNYpbltkPt8OjgTzvHexD/UlxLSfnYjLkoYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g04kCEkm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imXsNJ14; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g04kCEkm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imXsNJ14"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4ToNV3110546
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 09:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=duM79h0JWnfcFxziyc8YvX
	BkP2AnCs0Ap0rGnfgmjKI=; b=g04kCEkmP/5+FT4NUNwF1Xp6llaUzStPYms96n
	4CN4Nq/uTY36QG0/jLF6nRL8zMrjoijR428e2iTtea5/gOmA099XlHMwDtKupABA
	fyHuVaMj1YklPJ4pl2SV4VIvp68R9FXRQSqbZqbDm/Jj/vAOEC8fXTqYf+fLxiG7
	oLSy4m53LafIbKUXVfSdkwuoIvyppqfmoQbz49wBltZ53OURE+qOSd0dbl8zt3gi
	7NLJnYNtm2cVB6ccI3dUTNIyoQZ1qEoo5O/2GsV/AR0mFcsZQFUlseg36aPz33js
	pl6X9r0SocoY5WYXlLIiNHFcdSwr69KEnIMSbyAAPBay0+Og==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvuumq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 09:56:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091782ab06so305118051cf.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 02:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774432567; x=1775037367; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=duM79h0JWnfcFxziyc8YvXBkP2AnCs0Ap0rGnfgmjKI=;
        b=imXsNJ148zR8hwqdiv8L5L/MUlaEZK7IJaCb1Con4ZBwzKcDQfiuz/mtRXtNiS4f4X
         ThzhzmwqSEn0SqeVNov2EKpfqrX7tIlCYeNMFY4tzd+TUgL8BZhk2v+O75MeGbGfdYxT
         fSFID3RCZscvO0eCQA2wUJsbSUPSUPhARVM1JqUadKn2nIZFi+3A4NcxDxGO6IqK73OU
         0Sc6th86ioWtXOzQosTPIH26CzY+EBQvW2CfciwixRy4puh5gy5cX8gm5jJzTy/THv40
         wrXhiUVAmzHW+w/OF8+Vg55hsZIhd9Lhp3gZQXIgY3vxBnFXt4L2cATOEzIm18Bsbsqi
         dkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432567; x=1775037367;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duM79h0JWnfcFxziyc8YvXBkP2AnCs0Ap0rGnfgmjKI=;
        b=l3NOGtkiG1GBmh0JseQq77zqQgxd3o0+G3pWRO8oj/T0K41bDz9Pxt6Q5ADVNdmMs1
         fuGeeUgHZmRiLMohaLS2O29MLtsczHQrG3kvOn7c9xjJ8KREF0KfrjaxxiRgvATUQCKj
         ej2TBhE1sC3YciNzKTKqaN5ZikdOshO0gTqBhhP/JNvzEFwVKLqVXln6n8X6cS8vs2L8
         TDNDyl0Uu9ssc7UDCjidNuMF07uUI3iDgGtETy72PFKNfcb1fCrE0S2qzUx3CjU36Wx6
         1w/RrOUVjfnG0pwPvpBTipOjVxhWyIhVWdZ2Vd1GowWygR2opaoh1WDhWolmR4rykHvc
         SvLg==
X-Forwarded-Encrypted: i=1; AJvYcCW9GvI6pXZc4xL/+TVsFlz3ekGMqJ5oVjdUY9w06AIAsv+i8BsYfjrlEcI8HHk+VEDjVv9b3XGdBDHpph2Hd9wM8cxq@vger.kernel.org
X-Gm-Message-State: AOJu0YzOryOJ/BSVsxtL1ZcMAtZDwURmkw+W6CWsu3YvoAeSKONoGXRS
	pNdZn6R7R3C6reuUfjjKVJQ+C18fC0Kx7Na2tDuNJeh3P/T3wWrS5mcjkLneotDJ8E3EyueAEDK
	TsgGX+bUCPPWbSCMNGVmBDg1Xfg2MXbv6MNeVu4g+GMg7EbFIAY71o3HKECylBCPKa6na3xPddj
	O+
X-Gm-Gg: ATEYQzwvDpA/3+fiPXZ8ugEr154Kv5CRnm2RimGk1OGNGTt097E6gcPRJompeqflLx8
	8DvRkb/YwItljwSBi7hQDVvRdJL3gF723CHz8sec0M9jQ8zmux+qAxWRNgJ+kOiiit6SNppYbVX
	ZvVgW+lWjtUl6wgJxiDMcgQmtljhfaAq18PdcrD/aFPGPfqUkotmPXc5f6QtRFeqwX4MUZdyqQD
	gyqOU9EeourifANxs05Bc5mtT7UTnz8G31SSWOajywT8N6E++scPh2WVshGRnooWzJzkzDLF/7l
	NnJDjM1TNocrpr+YKJls9WrcvLD63qkwDTjKXEpmN+iifwLGJC0atbYeQwuDfFmH+QtN7CzS+2D
	tlTpfP06vlJikOzzVIxwD8WjvkyOKYEafcs2jC+cdJzkAU+nRgiOu
X-Received: by 2002:a05:622a:6994:b0:50b:3e11:359d with SMTP id d75a77b69052e-50b80d191b9mr27821671cf.26.1774432567227;
        Wed, 25 Mar 2026 02:56:07 -0700 (PDT)
X-Received: by 2002:a05:622a:6994:b0:50b:3e11:359d with SMTP id d75a77b69052e-50b80d191b9mr27821501cf.26.1774432566745;
        Wed, 25 Mar 2026 02:56:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7116:95af:5a1a:58c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487172d495asm25389955e9.5.2026.03.25.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:56:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 10:55:58 +0100
Subject: [PATCH v4] platform/x86: meraki-mx100: use real software node
 references
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-meraki-swnodes-v4-1-3c6dde507e4a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC2xw2kC/3XMQQ6CMBCF4auQri3pTFsEV97DuKgwSqNQbRU1h
 Ltb2GiCbCb5J3lfzwJ5S4Ftkp556mywro2hVgkra9OeiNsqNkOBmUCQvCFvzpaHZ+sqClwpJUW
 Vwzo/KBZHV09H+5rA3T52bcPd+ffkdzB+F6kOuOA5CYlZIZXOyq0LIb09zKV0TZPGw0axw18ln
 ykYlQJLjVAZVLCkyK8iIZspkgMHrQUYjVII+qMMw/ABSDdelT8BAAA=
X-Change-ID: 20260213-meraki-swnodes-44430d8178b4
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9804;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Eg81M5x1R6H6r5YsQ+9mUHboCkJ15/kK96XvhsF6Io=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpw7EwTRQjAetG0QcQAkNJY9sU+VY//RKqKKthQ
 CRQLIrDrGKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacOxMAAKCRAFnS7L/zaE
 w8NsD/9onvw4v0q7WTXqO1XjX9w8HiQH4ZdqRzeAPPphUKixedU4v4Oo3AGSEkJsBbQIKlD0zRZ
 H+NnKrrOrqWQbFWXFQkLtsHTYaEP/nGTNryW0Kbo4+v1jSWwugf6X+8tWjMpL93Lw9wkXQDgMqF
 C6srJzbFoZ0KyHAtvR0mlieC0cR/5QG6WzNBZgy4loMko1GciURoGDFksHT8I5rbsmCSQpepk9s
 IQ1FSnrQjAQa05r0OyqMacsQiPTz2nn7OL5LfCpAgfYIchWQemZGk9R6Zar1lNIQw8GsjYqbntW
 5+FWLdZ7ajJlgdVD0zz8ZVwFKXvgZFZPU2BkN3+N4dD8Co6x2n7RtpgktIFuHjUjLA2qzCX/Bl+
 Q3Eq+jrfLTBba9LGGg4qr2nUYX3gyxeOHWGXzi72JZWyzQ01nEBCJthCnO7lmR6QgyMBzXp/gYk
 wObx/uVN6tNr4ZAqKXJ9Yl8SVwlmO4237//JAFJuxgCayuDOhjqmvf/rCL1kpxydpzuCN7RGUIL
 icptwcrADks5cXQvIJvu08vmD1WlZvtS+T9wtO46/Wlw6WadtjYAOm8BHSnLKXdWs2iz7rFmx1F
 zQ8otoHWcPZNiRb8zUieYDOFP4HRqR+rzvTN8vzAxltUt4tSudiHKtpDeQYo1wdyXrrc9Zl2t4P
 LEIx2ninlP/kuoQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3MCBTYWx0ZWRfX5DtOibLOQjOS
 S9CqLoMgJ1+KyjS9VTG2qjW9x2UeukNsK9WB8dlwzpKRlejz3NKNiG/zct0qcXLu49YJnPohGSj
 s5cjveXMn1++gMWTTdfSmbadmySGL+jkh+8uCFgNrY0okBnxhaCn/yqcsHNjH1XjisZaDkgZXF1
 KZuTLQiu0Sb2Du64CDT7Ro1b2inEYHQhAZLg5rMWH80J4J6yuvtrzfTJzNk+QMAsaT5K3FxyiS6
 7YKu+/3k4fKlpG3nAxxP7V8m+XsDIxwIgWD9Zcv2r+kfvrEKwLnjPk8gS/Napl2woNvlRpeDxRQ
 wBk12W1Pm96YSE8Ze+/BTV3uQfGYHgx45K4OFENLJR4BNuuxgtHzJcfnzlwU+JisuOJtFdkOm8H
 feewG+30cIXh0g2FXVWDC/mWtJTWO54rQXpr7BXxvOPYurX6sXOLViPg0dFmx2jDPOVV7VRkXKE
 RFis6jg6LQS7C/Lp1Zw==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c3b138 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=NLydQ8AUt5SsdTx8TNgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 31jBr2IdkjTlRSNrgjWoUhaXlSzVVJfD
X-Proofpoint-GUID: 31jBr2IdkjTlRSNrgjWoUhaXlSzVVJfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250070

The lpc_ich MFD driver now exposes the software node associated with the
its GPIO controller cell. Remove the dummy software node from the
meraki-mx100 driver and reference the real one instead.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Lee: could you please take this through the MFD tree for v7.1?

===

Meraki-mx100 is one of the GPIOLIB users that abuses the software node
API by setting up a dummy software node without any logical link to the
GPIO controller it wants to use and uses the fact that the GPIO core
matches the controller's label against the swnode's name to make the
lookup work.

We want to remove this behavior from GPIOLIB in favor of actual matching
of firmware nodes but that would break this user. This series creates
a real software node in the MFD driver and references it from the meraki
driver.

This can be done in two patches and stay bisectable as the software
nodes, despite having the same name, will have different parents so
there are no kobject issues.

Merging: this should probably be acked by Hans or Ilpo and go through
the MFD tree for v7.1.
---
Changes in v4:
- Add Kconfig dependency on the core MFD LPC_ICH driver
- Link to v3: https://patch.msgid.link/20260316-meraki-swnodes-v3-1-15501a52300e@oss.qualcomm.com

Changes in v3:
- Drop patch 1/2 which got queued in the MFD tree
- Link to v2: https://patch.msgid.link/20260218-meraki-swnodes-v2-0-92c521da241c@oss.qualcomm.com

Changes in v2:
- Use a namespace for the exported software node
- Link to v1: https://patch.msgid.link/20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com
---
 drivers/platform/x86/Kconfig        |  1 +
 drivers/platform/x86/meraki-mx100.c | 41 ++++++++++++++++---------------------
 2 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4cb7d97a9fcc8edbaa555050a0210c4070846f49..c9896e89f9b6378b95c6d4ffd627144bacc9829e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -327,6 +327,7 @@ config AYANEO_EC
 config MERAKI_MX100
 	tristate "Cisco Meraki MX100 Platform Driver"
 	depends on GPIOLIB
+	depends on LPC_ICH
 	depends on GPIO_ICH
 	depends on LEDS_CLASS
 	select LEDS_GPIO
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

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260213-meraki-swnodes-44430d8178b4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

