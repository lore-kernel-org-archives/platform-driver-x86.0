Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337623B2FD6
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282234; cv=none; b=rTBeZNTkTBsv3Rg9TfIt/m1QPgexlaWyMtIPsOZQa4g7g+wZwLE4FUDiCOcWmIKrYH2/R7UtJkbp4ndxweGVG+Gt4KEyNDjZGJ7cWM4QWZdzx7btyt6+D4aIGM8h8hufSKR+X6D4wuZxCZR9cxqvrLgnw0vEv3NmNLQIqG2TiKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282234; c=relaxed/simple;
	bh=9vOb225J5gkS9isDyKz0Tpk+ZdbklKGBa9to8cyjHOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IeFAuL8FWgx47+eT6dVxbbVz9zT6Ms5984JRUhRQL4Z/xhgoVyoisayojsO9dbKmOFmU5Iw7m1WoPXJ5lTyKTVc8zaNIsEV8J3N7OwHxUitQqmOYt+Kn5UZdcKoA4cMtYTwrI9m3dcXctTDEaXt5BHG+lY8qHIX4IEoHyiyBVZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1EzbAwq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMGaqr0L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1EzbAwq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMGaqr0L"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TCEx4054556
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 09:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/zXIWWCFv4sMQz3hssa2R0
	S5P8ne7MZ1ioYizGllLxo=; b=i1EzbAwqyk+ngSFabFLtbXiNUtgBqaitpTJmBj
	eHwicxC2jhC7NseW2oRt8XtJhoufXmoJZEdgp8xIArw5gu6Kq12I41FBWq5U97eD
	/IL732VpkkpXBlcZzPM5UoXRT0tr31PmXTOVsGLOKCCsgcjcpmYf81wlVZUIDZ3a
	9PrgvqC4PyXfM+wOYwx6eDWfPAOatpdLQOJQt7yAawl8edBfNqrdhAOiPg6RqHW0
	PCXU7VI/JZgQRsLKWVxIY5EcUFGk4YLjTjnCNOxAQe9dNJ2kynhIIdwlOma+8bj0
	a2q/fxTFXAwJKA2Nb69XqsYdcgfI/wPEnpWusKA2J1ksLMYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxdg2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 09:30:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ff0bef198so36039201cf.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 02:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777282229; x=1777887029; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zXIWWCFv4sMQz3hssa2R0S5P8ne7MZ1ioYizGllLxo=;
        b=kMGaqr0L2HbuMn1eOpsqTKnfqgvAc+gHMgnRX6LuZaHqcNCHSBVfFsd9rXj+7kXuLM
         rasYWsCsJ8CDxeA2dllkxf4SOiL3xBNfx6YVYTlUMZSweDHEKEyCP6vyS59X3LCk6tlG
         gt0K7RueVu0wHV48j3sXH5Vk73ZEI9Hdib9rwXv1ImQmXfYMlT3OJBj/ZEb1RT4oPB5M
         EzeaVRwIaOT9IfVhKe20OEPTybVPJ+OJA9KZ1egxoQKZtGASne7uPAXL4TjL0XeDmeVi
         SdsL7xedL5aSAgAn32+Gk0HjwADzmyCN9Fv9cKcGl4nFyiKXWwVJwWAlqk4jCxvykVdV
         RV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777282229; x=1777887029;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zXIWWCFv4sMQz3hssa2R0S5P8ne7MZ1ioYizGllLxo=;
        b=VJH623Z0eBxWZulGfNuB7t9N0c2O8CniCNbEb6kx1C7tzDixPaVQWDIQpPECkxzeFe
         qPa5DgC4keJoE7RsRzcTcildHloJXm+shVFvh7IpiJvknzqYLiOkKAefIL/ovya4izQj
         3gPyMPnrlTqF4xugoep9Qg/1cMSFfH/cGK2ZuCo4Pl4p7lZ+0KEcM/sWTYsTOg8F0A60
         P+sdfWk0qJwsilV+uPZcxfSkQk9gdfZuUyzMudEdmTo74uejvV0mPhFOiIEAi7xTJFvN
         V+BZxWiCDNjmQj35oMrpHvmlZUbhCAx9GVaq3FO8sNzjzZk7R+UeybEpteUr9FAZNm6d
         3m1A==
X-Forwarded-Encrypted: i=1; AFNElJ8duTuvjBMqP92tPJfbD4IjscQ142evfafF8Kza4yuoqlN+7pMKuYUAqWGb5QMlOO4HZAdqXjRNHzdAaPeBiZrc2vPV@vger.kernel.org
X-Gm-Message-State: AOJu0YwIKZn1ECKV7pHIZpkICVKpWUBk9nct1u4wFC7orLHFaszLtuIw
	ofSsWTQ/rnGC9Jpj1rcZOc0bJsJ+fxU1bKjtk4KZFso/0/woSIAMUGdruI4Kj292n/E6t7H6wQY
	cHlfu1W4FNCnFLs6eLxrg2pgXY8cKmtw0D0fv3m/C3QNdGzA9egU2/P39IzSHqnGlXK4nMdYWzq
	yF
X-Gm-Gg: AeBDieuC8oBaGYnwJvy1PHb0mMRHe+2Sx71C/NXfIFxxxX0rZ2yT6dc2RlP5SWpd6Dj
	1/0HqBz//Qy4+IG7TtUrKl25/hlneYC1GJuCtbtSYniT3A11V7jB3P6wCNrQRNSwliswHa8KSqq
	uByzc8Dkwi9MntrzaQXLBn8qPTitlAApWMiA1FiSwKyoh9hH1R8mB0DXp9eFhDIeeplo8mw4OT7
	Bxsy/9zKvNB51nAG7QHmpk39Z5O5Ok6VWTP6uzKNai+s/GWbUoc2ZPQb2vd3hohFqFzvyIqJFSj
	JxywDPdJFo05A94AVyE4qtAqLhp5TuAsGUOc/srIHZLbDYOFM58+4kHGYhAt2B2aIdFmeTbkl5D
	euwTvuv1I2m94xW1nTHt/IJLsBlLJnUQ9UHpiLAJCVdS3qyigtyWvOBnesgTNEg==
X-Received: by 2002:ac8:5a02:0:b0:50d:a6a0:8f04 with SMTP id d75a77b69052e-50e36c4189dmr614961751cf.42.1777282228977;
        Mon, 27 Apr 2026 02:30:28 -0700 (PDT)
X-Received: by 2002:ac8:5a02:0:b0:50d:a6a0:8f04 with SMTP id d75a77b69052e-50e36c4189dmr614961181cf.42.1777282228322;
        Mon, 27 Apr 2026 02:30:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm85176104f8f.24.2026.04.27.02.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:30:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:30:18 +0200
Subject: [PATCH v5] platform/x86: meraki-mx100: use real software node
 references
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-meraki-swnodes-v5-1-ad91cd306472@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKks72kC/3XMTW7CMBCG4asgr2vk+bEJXXEP1IVrT4vVJi42T
 Vuh3B3DBqQ0m5Hekb7nrKqUJFU9r86qyJhqykML+7RS4eCHd9EptlZo0BkE0r0U/5F0/RlylKq
 ZmUzsYNO9smqjryJv6fcG7l9aH1I95fJ380e4fhepEbTRnRhCtyW2Luxyrevjt/8Mue/X7airO
 OKj0s0UbMoWg0WIHhmWFLorBG6mkAYN1hrwFskYWVD4QUE7U7gpFFyMYs1G2P+jTNN0AUAa3Ai
 FAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9884;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9vOb225J5gkS9isDyKz0Tpk+ZdbklKGBa9to8cyjHOA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7yytDjyQElbDGmEORwZgm/DTsST6VFXLqzBds
 YZsPI5xBJKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8srQAKCRAFnS7L/zaE
 w48NEAC4Fo0ZYHHgIXM6Oebn8anrXGm8+PSUUMPXAE+8nTz9RyqQ7rBPPTTDReT0368YeJfPTKw
 Whjj8CVfH23qtN/kjR8tUIm6i1Zl6swIOPYWtKEA3FBTNBGlxyI2C5hukhV3/nI3A0l3rl6qjXt
 569lrSjxDxHbJXr9wluvo+VvoxVjqrdXjbiCHjBcY4v6Lb188R27fS4XdqKObjJr3s6Xwg2ydgJ
 YDmJi8OnED98PtTs+/g/CgSUWX3U8MIYZ8oz4xmbsAHMR2gxXXyTBHlpekEUxgeYsNqesrL8D9w
 jKgzS6Ok+44SOv7jYtYqyL/6K/RIszr5z0iJxZHBo1VwgZ4QsL/ErITZWNyEPYwAN6kGB/FwebV
 /6NwwvjhV2Tv4AEE943pY+VA+XZ6wXWPYpOMFMqIvvgYAuFr4ERXr6Y0MUA/fZKcH9c6Q33Do6S
 2TyUjHJIa8cAVEZf34ORvU+GCcpEyKn1auVUP3xL8i/jeWCAS/zOPLQJ+ECivz805Fcp8ubeFVK
 nEhnDl/aS0BqvnbQMgwKDeqbN8wkhj8LKJ1/wb3r19RzurOrch7LVFX5Wmoh8LhOcEv+KCafwBA
 I0ZFbH4yPvrOcIZSmNP0urBz6WkQXMs92As2NplXKfIKZ7CduEmgWfKo3yRKrcBHJ8D1SP1LuL4
 oUHuCol9hac5KGA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 9KL-RTOf9vGtcJIgc6edculys1WkuuQH
X-Proofpoint-ORIG-GUID: 9KL-RTOf9vGtcJIgc6edculys1WkuuQH
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ef2cb5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=NLydQ8AUt5SsdTx8TNgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwMCBTYWx0ZWRfX44tqLRiET+V8
 QbM52LgMlVOchALe/C2mihLezkbWIZPiS/99e4e5nYaIrArEL6e+qAj9F5NsmoJERlH757YE+HE
 ZhbHurDNc66Knq7K7lM+LrJuN4tsVJs3BzdqZhM3908wqultADkV5bdHdrCJ43Zh7GpL6a+Jpy1
 aqbJYbvOf9Bslwv8traooGn5ERCOYpHjBOxiQ3c6ie41g7ZKxd/oQlCrmlwNnM6e6mZ7IHuM79w
 EAoPtypSopMqpTFqo1GZ4Myx0Ucnuuy+Pzx2t03asWag8YSxeBShsbSYWRZrgkgVPASodo+oIeo
 5AyTg8ZrmXIaW8i8Aek402MNYyUTp3n1PoB2Yj/7BrHMwdXeYYAbliXJJRGpmB0JxRbCWdTpoIT
 /F6jf4mu7/76cjFpUnGSKtUldN/GgNYtCTc6LK3/ziVQzI/q41m5G2QTdmx9PggwIA0eCQJlHQI
 YdDEI8UySrrX10Jv2mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270100

The lpc_ich MFD driver now exposes the software node associated with the
its GPIO controller cell. Remove the dummy software node from the
meraki-mx100 driver and reference the real one instead.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Ilpo: this patch never ended up in the MFD tree for v7.1 alongside the
prerequisite lpc_ich patch which is now upstream so please pick it up
for v7.2 into the x86 platform tree.

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
---
Changes in v5:
- Drop the MFD prerequisite patch that's now upstream
- Link to v4: https://patch.msgid.link/20260325-meraki-swnodes-v4-1-3c6dde507e4a@oss.qualcomm.com

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
index 2ffa4ecf65b0387caf9b4536291a33c927273097..2f3e554264a48640176f9e61eeba80bc45f1192a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -345,6 +345,7 @@ config AYANEO_EC
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
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260213-meraki-swnodes-44430d8178b4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

