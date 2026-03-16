Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E1E375F87
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650948; cv=none; b=GnchkQKWt6QVGEAEDetBgTNnzzpM21uuTkxyC2U963kIyLufSXbPoeaQfYiP6V3gbB9Q8CC4d7Tqryo/Y2mE7j2CZfcIY6QYkRv1//DMn0yUO/smOWxclZyO+A18ydEMJs8di2nZGgEUYrSe1Qszt9LYgN0mzyuRfW91ZJWNuEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650948; c=relaxed/simple;
	bh=zjfrUZSPL+Ey4vHVH9UICbhejUK5xf5XPs6ol+gLPDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IdxoC5mvPPtoE94veGABb7305VRqWgzY2hqbh2TFpNHIxKGezUoYvHH/chUu6T//swKw9KWs5AeN9XmkvMoLzG6prfps0NaDabT72qSJK7U+r3SEcSyARXabOlsAQ8j65y6aHo4J8HEnpBRToktZXj+XgaDVdUt/ZwqIXfNP4Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9x3T84Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNKUqQ+5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9x3T84Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNKUqQ+5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gXs1066906
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 08:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yeqe0BhDGyOYXSa1Lbdmgn
	FUL1DGKofYtLXOddnZDi4=; b=e9x3T84QNWyVzPcT+1odh/AeGV9KFnWUuhCGyc
	1isWAof5jUNEOWkdCOo9RzPzEJ6/MOoEUsDrBIqwWi3RHYgEf1F7ASMv9VqutTdb
	Cf+ocU8l+IpS1Ur57noOabyA2SOSwmazSyAo6xn6LbzLoVOZJj5PV94RVzKyO60P
	QISrL3iMLOMaszo6/2VdjKLJUi9SbZBCyCMzPZwHHrNAgDV8Gr8iqeaSV0I2rwUx
	8ThszAd+dXLx2LFt/MSrjt4b5Ud39o2fsWNVi39t6fP9sNuqgCO2J6bXYitQdiUv
	vtHjKgkYjL+dxJaYQE0YuCtmB6NySonkr5xyfddxtUL22+8w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw027cwsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 08:49:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c3f19d4faso103008756d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 01:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773650944; x=1774255744; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yeqe0BhDGyOYXSa1LbdmgnFUL1DGKofYtLXOddnZDi4=;
        b=QNKUqQ+5ylTG7BR0EKrMR9jyr0mgQberbBx2z/VCvPc+Xq0W7pAN74oVIgrMEK7lSX
         UbJ9PIWa0BVcVmlkMIZy2hzcgeyBKM4b7mnnCzOiIWo7X5n093NIjCbK5ZcO2psIaXKN
         pQ8aU59WSTGGTN/WQnaGdPPO5C9jjT1anWk1gBw37+lS/gQYMmRTaAAUzTxWA5jfxvkw
         tYuJkO8gJWUO6qfermwZ54xNeKKWrS3PZrb/HxWngSvWIDo58FZkocs8PJ9BxpkU0Cx0
         94AvLKQJA24u/3xuxudLyDNQ1w/k8Al9s0ad0U7FbI15a4h745d0Umz7MohA0CSWf5t+
         aibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650944; x=1774255744;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yeqe0BhDGyOYXSa1LbdmgnFUL1DGKofYtLXOddnZDi4=;
        b=NCGs4F52uTJwVtP48kZRfZ1+rnO//XMQ7eD20WYAP2m2MGUO0bqfDiJQ91zmRb7Tin
         B+Spj9duTfHvv3GzRkx7oVkwfpV0SKedpdV4jLhdd+RWrzYNSXJ6N5YW2YabfNeC9Wha
         qkj1V1/9yI2yusHgtuQJnnB5XkRI+6J5j8bymZhnkJDYya6mW0ZGCdnSeWW59YRhIr/x
         uD1aJBYYkNNaZNaImlS9hP++tViSfgrp4bYUPC/hcGTJezkeFz6YLa7ZVMYsG+WQ/BXm
         7KYVQW5aytMiwwgUJijqKjbOfny2am2+4lDm/h9WYxt8OU8cY2SUnt8kNJu2+k9bnzPu
         d8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5Eqqm8VcZ/qQvA8Yx/RQNF7Xe2O/Mkt3knLhaXEBNqTUwmMlVPk4UuvZuq1KYJfzQP9Ld79jB18/SoZSaki8k3SVE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9H6YS5hhNijE3+vLh8AxLwEfNV7HFs8mo9+8rsmTuNO0f+kBv
	0WRlpArBzCF/2VTCDoakv86r+9jssA3U5I3/qQP6dhNrBPn9pwRjTuTMDPoKK/ZwKh85zQ7hvvx
	HWKgYreF55TvuG5rHJJgKg2LrkSTafSafOjKp5hcZSjhqSNYDjj8w0lvvIsY0qWYNAfQIzb28IO
	h/
X-Gm-Gg: ATEYQzwddWsNlz1OlMWIvLrOCYCF8ReILevkvqN0IcehIA1JbxmNMba5hWwbU2B1ku7
	LnoN3gpzZ3iaQ2foecvjq0wDAIgbqXv2EzOSInjoTl4QxCmuqFu8n8E1+h/YSqILbG6Zrce35kO
	abLJI9CwIsjtwCG1b1db/Sg8mf3n/4Vaivm0n7445J3M6xSD6G7eEEe1stBecDPKTJEhzlRH684
	qd099+jAv1/SMpUgFazVq5vA0ZT3UbjfgGW4rj1UmAn24lDcpq9GksdTn4hUr3vy8ADA6nozvv8
	lLHjXPxku2ZIK18CJPu19DtaFc4rBE2IMjtLXqHk0eWXLZGx99NIRA20G/dFH3O6kRC99JrbmaP
	MU0q7/DTUpWb5psqkPSlKePgpX/cuWkoQYtpB20fg602s6FHQriQh
X-Received: by 2002:ad4:4dca:0:b0:89a:8434:108c with SMTP id 6a1803df08f44-89a84341260mr108559666d6.15.1773650944214;
        Mon, 16 Mar 2026 01:49:04 -0700 (PDT)
X-Received: by 2002:ad4:4dca:0:b0:89a:8434:108c with SMTP id 6a1803df08f44-89a84341260mr108559536d6.15.1773650943714;
        Mon, 16 Mar 2026 01:49:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48558fd09d8sm249358115e9.7.2026.03.16.01.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:49:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 09:48:56 +0100
Subject: [PATCH v3] platform/x86: meraki-mx100: use real software node
 references
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-meraki-swnodes-v3-1-15501a52300e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPfDt2kC/3XMQQ7CIBCF4as0rKWBgdbqynsYFwijJdqijKKm6
 d2lXZmom0n+Sd43MMLokdi6GFjE5MmHPodaFMy2pj8i9y43AwG1AKl4h9GcPKdHHxwS11or4Rq
 5bPaa5dEl4sE/Z3C7y916uoX4mv0kp+9fKkkueINCQb1SuqrtJhCV17s529B1ZT5sEhN8Ks2XA
 llZga1AOgNa/lLGcXwDGNVpGvkAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9186;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zjfrUZSPL+Ey4vHVH9UICbhejUK5xf5XPs6ol+gLPDU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt8P5gku1yvjsKRplBx7qA/OCFv+Mnb8thAvfL
 pRcpOEEbOqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfD+QAKCRAFnS7L/zaE
 w87wEACoFhhdidb3hPUc30m1tjxlGicoKvEYi11XtM0b4RJ6trcs54eKLlFOzUz3PZH+burzcFy
 g9eMMjqrsYRmKsxYMn1vbhmNS901ALnbZd5NMl077ZEroDVlvPDAyClIOgy+V8okz6Qs9zNJrhT
 /avi9Kw5goQ8bpojUofWR0k+hKpbc4H+dQ8iF0MioSOjrdVONm3mhvNDCB/yhkD84Shc9loxdek
 +kphygb6z0OeNlo8BTa4+uF3Wsd8Pg2KRQa5H7ol8nuBMG0Kw9h/BKVHO8ifwhZl6/5dV+tB7Ak
 c+sLuXgKvQskE4h4cRwMLbsOLPisaLuftr92bkRg91XcvS50IA9NjsuCI/Z4IdBZuyCNCMTy+in
 8tNR0PYtFK2bHnk1a4LWJIzn7IoXeeLQJx38F7jle+iDXN4rerwwnJ6uKS3wfEf/1md0BV8AwiX
 jhlNMQsoCIv2Gzebrr5pc1W+fPD8WwyRB7rwWCXsrj4GuOh8oKL4ViDWtjyqjmR3y+SMkVW3UqY
 4+cddlfQL7b8itsesCOi3i5wrralh3np6Jp8pJ/47O0ztg8DraM9RsoudcQJKdy5KRUS4LGUdHj
 lH500VYIc9hD4I8yKZ41D76ENJf9ZyqgnXbYyO5gbilkQtCBZXEi8O4gtN7xg90I71f9i4XAkWi
 RZVSosbxF+lYE7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 9pmYMjQrqQr45MLFPIvydHvhjXfdiW_p
X-Proofpoint-ORIG-GUID: 9pmYMjQrqQr45MLFPIvydHvhjXfdiW_p
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b7c400 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=9mnYZnbXW9C0Qs4GJNoA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2NSBTYWx0ZWRfX6CrmyiD6jzXt
 oKCwIKDK4KADZRYmUNrtMLM1ceNfSuecwHB1yHmb4nSyq0kzFs4z8iZdqEtkAYcTlaYR3Y8mu2Y
 1/VFxUHALfRYpYGF4LOeWvThUgp4moqPp4qFfllp8KQvgTLw6nLBcJNVeZGrjcarFNoaS6K1z3C
 gDlqeIKfVrSSlMzP+sgCouIZpF2+PBdPiYSvkY6e75pnalKayoUCdsqP93C/ZeMCTv2xRdTNoD+
 fw9WVGIXCc5SwYfrqUodUOBSJb7FvtDarvowKy0QL1RejFaPlCOQDXUNLP/586My9PMtwJHYv2V
 Pv3D8nljoBY4j2Zk7RY19QBizOVU/EXpaEQVKX4rxo+gOXVVFvIBqk8tl1HQgZYO5/YGa4i7ELF
 DYjKzDRzDjU99ysarieJOMpMQm3rf/k6fgNNzcJsJckpsvuZZcA2MGGwpVfWBfaa4JjNNEzi8hu
 0ks3cMs518lSEBfiBTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160065

The lpc_ich MFD driver now exposes the software node associated with the
its GPIO controller cell. Remove the dummy software node from the
meraki-mx100 driver and reference the real one instead.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
I'm resending it as it seems patch 2/2 fell though the cracks.

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
Changes in v3:
- Drop patch 1/2 which got queued in the MFD tree
- Link to v2: https://patch.msgid.link/20260218-meraki-swnodes-v2-0-92c521da241c@oss.qualcomm.com

Changes in v2:
- Use a namespace for the exported software node
- Link to v1: https://patch.msgid.link/20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com
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

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260213-meraki-swnodes-44430d8178b4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

