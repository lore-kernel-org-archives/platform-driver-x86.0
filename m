Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C447D93C
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946787; cv=none; b=UMymjgZsEJXRbi1fLaT0TN3B++rcWdDpKW2ARUlXkJLwLbxtjEdruBT7Pqm4JPzs+e8WZZaQw+2YBn72tMU1tSSxDIo3h4mAYeZfcSXZthyw2/l7hvnDri84QLWeBuDtYGzuEj0R4T32qPpwJ/9xX3KGyD1flzjvKax9HDnODFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946787; c=relaxed/simple;
	bh=IrhlDnu6UqVr6ZzUV11lZIiY71/Cbeg6Wqd7x/5D/8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ePnyN4G6XBf96akmxrLyz2T8LJYP25/ko9iUiGScHT8SfNPebeKyNs8okGgo9hiJbC2HIZx/14PIRhbV9GePKKdEusyDMGICDqG4/aeJ1oOAjr/PrzuMmfKDm2yrGLPcrErP4eokJGhTJLENw5zTRs2yjqQZ65MCKUvaMosWK00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQdA5dsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZD7C974; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQdA5dsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZD7C974"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6899SQAi3771184
	for <platform-driver-x86@vger.kernel.org>; Wed, 9 Sep 2026 09:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=23pCnDlotWgSDzZtGBECCQKx4TDiJuMFHwx
	4UVLT8O0=; b=MQdA5dsLmyug73OiXCBvXc0RBgK5rXAg8rpfqTXsw14auOEyaFz
	H6h6hGCqukQ0vS87e9LwvRD3uDEaXFh9/zLiNf8ZpFJVlqbq3yDKzucfr791xCzu
	t9Sp1BVVFZFxb2bhcgWqUKrbfbCN3RSrJ7euVgMPmr+4dgG4zklz1gnLTV3U097v
	8S0VohIb50ziU5BJbun6cRi67Otw33JPxRxHlFl5MzhK4csld5N1onavYCaFBm0A
	NTgwfIcFHAKocw2xnQPI7ievmuUC2cV6llAaRBIk6tNtRWGvySsEmQdzhHWr4nc2
	Nf6b2dirBPMLRn3rGOoZMTGtx9eHbip8Urw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1ah9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 09:39:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d8cdso1055844785a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788946781; x=1789551581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=23pCnDlotWgSDzZtGBECCQKx4TDiJuMFHwx4UVLT8O0=;
        b=CZD7C974pXt/mXL9KfTHBSDAbEXMKt9bDVGojM3kthyIQ4qWlIW9YH3Y0EsB8YgDYj
         P0bbZ4M4+pLU4IWWhttlJQhz6x8ds9/E2ewqZfaNrlnBGqy7NDB6AL/YgRiYA+kwkHNt
         QyheMaQkRRG5CiwRIV8N9gYeBs/KDyAIorlXqkKFIuUYrkAuCPvGqMJeNtXcb3VubtVM
         vQJm9U7CetgNVZNq2EF0moVymTswDX0WcfFkVSg14pidP2llVU5pcHsfc3sOE725WYr4
         3odLqZUbS5kecmzdqy5WjliUo+bUFtBDMwUSc1s8jfH7gBaRioBs9aTbbEcqSiliEfB8
         9FOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946781; x=1789551581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23pCnDlotWgSDzZtGBECCQKx4TDiJuMFHwx4UVLT8O0=;
        b=pNZyvgODmkSg3lnRG1vTdu59Og2L8wdCG18ShbS9tw+QC9/LMWSq3idfsQLX3UxIbj
         2SjgCQ5cXKOhcHZGKV32UufD9ZsZSF7hQ3aWZu8j2wzUhvhhB5C/LUWHX/M+aCYP1hEd
         zzpPJeouaSmGHMFPk7ZSS2aa33NHPTu2AMq5VhpLvvSj8mtZUO2C71t6nsaX/KJ/L1ro
         JSubiRMU0R+I0sMmMnrxGUHvLv82zDGe7KWtN628pa0qdQyoYJZXoV2KVz3GvAm+6R+4
         hTScE5Qftw5YsHteP6rcK4+ml342KcyuKwQM34cyRt68ulztATR5PmF7BRKQYNIkdFTN
         YRXA==
X-Forwarded-Encrypted: i=1; AKwUvBwtIZuoeeQkcNQRy/m6+JP/Iu12eAq31lCvgTmLV1/Xjbof+6wRruN7K3x3shyIvXpfgqdFKQQd+kEdfJYRC0ghbkUP@vger.kernel.org
X-Gm-Message-State: AFuF++m0KvcNAO5GNZwcrj553O4aMzY5hvVzXJMwg5coslLPSxmxMj0Y
	6+HRF42iSnPrgbshTy5zEqTteeCe8SVC5CGscxkSB1yCfyCESUOpZECL13wE0YC6+Ss7i3Uxc3y
	obMXEcZkRK1GIb+anb3VQRa4gw1R1M6vX2PAU0vGdOwCCpOWYHMHWL2eJDffXWU5WGSYNNlHFID
	J6
X-Gm-Gg: AYBFou1/ecCmet9WTD7Iti3umvAGjpURA9r/Y3h257jtmesSGfF73YmJFvRlQbL2qA4
	v+2EV8NotgbjplYSYXYZHkrv2NA63CduAaRDLf6nKCYasQIQx3L1XCwVt4Gjj3t+T30Jrf8lilu
	Zp9JlNYDGpAORZzs8nLlI1xn6Oe1XW6qQzKR9r3J/4Kqa1GM9LA9lnIWY6NV9DXQxKlGB0KVvVl
	8oPMC1TOIPsTgZWIeBtsO5wqohMjGBQNuTJAgoZBNFjjY4V845sA0LlGg9u86A0tIHTQ4ZVEcJh
	EUZ+wxr3oYsxVtDBybeEC0Ky0ybG58aw11HUhJO3k9imvccUtgxJMJqlroe1Ry9JBhph8qyWMZv
	KL6SEG6PgW66HgCyAk6qmgpX/o/lqBiJPODFGT/yyvIL5U2FCIhHmT7JbDtJbzA5bOn7vcOsAIj
	EHnUoT9ZB5OZzDuxw=
X-Received: by 2002:a05:620a:3199:b0:939:7f6c:fdf with SMTP id af79cd13be357-939805e9ed3mr3740260785a.15.1788946776673;
        Wed, 09 Sep 2026 02:39:36 -0700 (PDT)
X-Received: by 2002:a05:620a:3199:b0:939:7f6c:fdf with SMTP id af79cd13be357-939805e9ed3mr3740257885a.15.1788946776288;
        Wed, 09 Sep 2026 02:39:36 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6e19sm6387800a12.10.2026.09.09.02.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:39:35 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        stable@vger.kernel.org, Sergey Lebedev <lsa.uz@pm.me>
Subject: [PATCH v3 1/2] Input: soc_button_array - fix MS Surface Pro 11 probe failure
Date: Wed,  9 Sep 2026 11:39:33 +0200
Message-ID: <20260909093934.29411-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa1295e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wgnLJeN4XU_MoIAHw-4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfXyyUyzEOrfniS
 KuOgbcopsg5rUCt27bjU87YwuXtbWE81sfnQDm6vWEDyNpcUDMHE+g1OTPcwmYgOQhb5vwXI2S4
 s+IVbFReHNZlWATBh/lS/27/vHtmvYMcGGn7jAywLMCxQubnVbjS16uIRIK0HxTEXokXgEQtrQp
 KaWyjNoJ3+XppF6sEZAJ6toxvUAZ8PFe1FLl6PRYvHmKwz4CFAga22xV+4nyNBwkt7DiuHoOwkt
 Yj0ZpZzoDW7jJWescj4NKgjBHqwO/K6HRL4qC4bELayvrp5kyACbnhCD/btkxUD3Pi5lP36gE9L
 +ubthd9QdAWFAv17Md5eRgDqq/OQmsVfe5sN2Xh5QC9kP2iFka09qSbUrCsOn18aglCNrVY0YOt
 z6k+K55ADNL8WtrQlfRUIRxjVcrhLPaKd+DR86nTRfz/JpXinInrLd/aDwOS4J9S9g8RJy6JW+x
 o+a4nk9Q9zT47YsIjPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfXyO7HxMaclWgi
 qlQrtPQ8v2wLWIlrcOLCIVMzhvcuzUvAyObh3NBGsvFPzsfVQx32iP0edm22Lq91ZEQM/pBYwUG
 anhkNNCsf/FxUOH2tjjUr5Wz11AOGBk=
X-Proofpoint-ORIG-GUID: wx9Uy7wXAmKakWKAWBLnBDtpZloU14NN
X-Proofpoint-GUID: wx9Uy7wXAmKakWKAWBLnBDtpZloU14NN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1011 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090107

On the MS Surface Pro 11 soc_button_array probing races with the GPIO
driver probing. If soc_button_array wins the race then gpiod_get() returns
EPROBE_DEFER, which should normally take care of retrying later, but
the soc_button_array code deliberately ignores EPROBE_DEFER causing it
to fail its probe() which causes the volume and power buttons to now work.

The ignoring of EPROBE_DEFER is there to deal with a problem specific to
older Bay Trail (BYT) and Cherry Trail (CHT) tablets which often use this
driver. Modify the error handling to only ignore EPROBE_DEFER on BYT and
CHT platforms and propagate EPROBE_DEFER normally on other platforms.

Fixes: bcf059578980 ("Input: soc_button_array - partial revert of support for newer surface devices")
Cc: stable@vger.kernel.org
Reported-by: Sergey Lebedev <lsa.uz@pm.me>
Closes: https://lore.kernel.org/lkml/20260830141355.55898-1-lsa.uz@pm.me/
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
This series has been tested on a Bay Trail tablet which needs the ignore
EPROBE_DEFER on BYT workaround because of a PMIC virtual GPIO.
---
Changes in v3:
- Add Fixes: tag
- Initialize irq to 0 (invalid IRQ) so that the new irq == -EPROBE_DEFER
  check does not potentially check an uninitialized variable (Shashiko)

Changes in v2:
- Also check for irq == -EPROBE_DEFER (Shashiko)
- Drop #ifdef X86-ified soc_intel_is_byt_or_cht() helper,
  linux/platform_data/x86/soc.h already contains non x86 stubs (Shashiko)
---
 drivers/input/misc/soc_button_array.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index b8cad415c62c..264c41f80d2b 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -16,6 +16,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio_keys.h>
 #include <linux/gpio.h>
+#include <linux/platform_data/x86/soc.h>
 #include <linux/platform_device.h>
 
 static bool use_low_level_irq;
@@ -160,7 +161,7 @@ soc_button_device_create(struct platform_device *pdev,
 	struct gpio_keys_platform_data *gpio_keys_pdata;
 	const struct dmi_system_id *dmi_id;
 	int invalid_acpi_index = -1;
-	int error, gpio, irq;
+	int error, gpio, irq = 0;
 	int n_buttons = 0;
 
 	for (info = button_info; info->name; info++)
@@ -191,8 +192,9 @@ soc_button_device_create(struct platform_device *pdev,
 		error = soc_button_lookup_gpio(&pdev->dev, info->acpi_index, &gpio, &irq);
 		if (error || irq < 0) {
 			/*
-			 * Skip GPIO if not present. Note we deliberately
-			 * ignore -EPROBE_DEFER errors here. On some devices
+			 * Propagate -EPROBE_DEFER, skip button on other errors.
+			 *
+			 * -EPROBE_DEFER is ignored on Bay & Cherry Trail. Here
 			 * Intel is using so called virtual GPIOs which are not
 			 * GPIOs at all but some way for AML code to check some
 			 * random status bits without need a custom opregion.
@@ -201,6 +203,12 @@ soc_button_device_create(struct platform_device *pdev,
 			 * we do not have a driver for these so they will never
 			 * show up, therefore we ignore -EPROBE_DEFER.
 			 */
+			if ((error == -EPROBE_DEFER || irq == -EPROBE_DEFER) &&
+			    !(soc_intel_is_byt() || soc_intel_is_cht())) {
+				error = -EPROBE_DEFER;
+				goto err_free_mem;
+			}
+
 			continue;
 		}
 
-- 
2.55.0

