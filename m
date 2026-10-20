Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506177;
	b=I1AAGAAY7nNww0EKhqTE68CHVxeExEQL1Cd0uFlPnGngM/GjXAuDz1CFyKY0z9ZEOz7P
	 yNEA2y/kVwH3+XsLQFovHQO6jR0ns8eKkRDmRbWnA+ZFBqgnomRKJUoIJrbwib0QPZiEV
	 5vUJlN7TAlfI12fmqUH4otod6f9uXKLVrUkb99ZLnv13ZU5dn+bu6tyffSxLVpGcNFg8i
	 zTLylwpKGYD6kOOE1Xt9+PmLP0un7wVZjFUt0cRBNmNeV8mMZGymDwqB3Q7kRNEze5KZu
	 NzVVi3lLSBOEFtm6bxnmkBMD3gC7nJqiOyeu9vymGIXKQz2jqNR5AuW5IIA+K6VWgZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fM3PLiGnnqUhaB0ZVpT3/vhaHjplzibrteXaHg1wWa8=;
	b=5t9z84v1ziGAbegE/rVKjejA8RZXz4fpq76K9ZeNdODGCWo8YSykHGIS6DJb18SpYt4I
	 x7taKsbAfOpSr9TURA3aoz+/vsFTN6ArqgVrrgUV/+xiSlWK36zwgHSA4mfQiDwmA2YHA
	 dL4R1sWrZsUWwhbwGi1Z8kgKkcctls0Piy4Gfdeymyirw61oSd4rc9AGNO2+fF1FnGBuy
	 uV06nWxVUDb3uCgQVUQoFEz6Wi6TmC8tbazI6Vf0LjdEm7PJtdkQx5yPpHQoanZbvznn2
	 WsVufqtoUdtSWamriA2V4ThxQfnTcCvhMYBa8ZrxB2hZAGc7qWnOmAIsa3tqz44uqlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6ezHx+Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XsfDH87C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1226606A33E
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1226606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6ezHx+Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XsfDH87C
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAK6r2214653
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fM3PLiGnnqU
	haB0ZVpT3/vhaHjplzibrteXaHg1wWa8=; b=W6ezHx+ZRV7aS1y2Lr5J1VDQ/px
	jx0sTtarpnCooQyzh1bRog8pnfx3R3jn+3yvuECXUcKCGCrKNwZBtw6iALxYwObE
	eTyU6bW2YsQxJYO8+OFv6DJM/95WT2GPekNRHiufEpNlyx8d/RqO2FCEmhIQ4bKt
	TRLE7P6eaI0WgGdYyewcbfVxzv5jPRr/NuroejFA3TvLFZAztTcZVGsoCgxjqWMy
	7AncWi/GmB6inhBUB8404mtaF2VVnK4qaHBCBSA46PP01Bn8j+hQST40iTrElIfa
	Iafzl7IJb6PEb05j620KSshtdgTqeXVihCGvSE4agFXeuxmxcE79ZSm0UQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntsyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso140199485a.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 07:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506175; x=1793110975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fM3PLiGnnqUhaB0ZVpT3/vhaHjplzibrteXaHg1wWa8=;
        b=XsfDH87CnkBy1iFNSIXVIDVb50lIdO0r4QT1OutpTWN2qPXt9m++lth16KYei64MbL
         rtksRkbjH/mQe41xtEgXuT/1p2CGrLnopBsd3IZgyVSNPJeckPKjVfm17+A3t8e0OrlC
         ecX1dP6MlWL3jMidNs0yIZy3zXXZymfQFPVe1wXujDEmtF551926XGXJVr85Qnkq7cfU
         TnH6KeSiLkn9oftAe4pSSbxeziq5EU6DbYXXNln7SO3azw8kTwfIpPpGGbzL/PBfdcdW
         GAl3A4WwdSCGKBHYeSff1hED62rEAO4hhbfPKw+rtQdHJOUWV20PYjrsTPDboMFuav4m
         +ysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506175; x=1793110975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fM3PLiGnnqUhaB0ZVpT3/vhaHjplzibrteXaHg1wWa8=;
        b=dyHrICjyY6b2Q0OeFcTqa+YBi8Zd+ThD3offAAlWMHdTGHgwGRwykXijADCaKICAPW
         saXdQaNBZZJlspmINRYWqkW+olSPY8BK91+hjUlZG2/2JrguGtTn+TwRn2mdTBtDmDoR
         Nh9OtOm9rlPGaX7nb4VHJZX3Hlu3rgM+W/wVVeKCIwfMvN6Sbc7VLCB8ZpBsqWuENksk
         iBPqcI+JY9bjmLrve2BLJcMDsxtoLyCJ7ZZlAA4qSFinTjRvO6DL1XL3YVUdRxb4qx73
         BjaMhZUaoFZpC92ZfS7EGJAY8RIbhEaksp4zzMyqyFhV4Xkg5y5C5hUU7YRfpuCsTLki
         RMpg==
X-Forwarded-Encrypted: i=1; AKwUvBzwhXTKpyVYliSf0YKvBbtcravEg9q4UIwDUxHhraHT/B6D57mwQUjnzg/ufq7UC6XTziLZ9/3qvUqUSOaIlChvoC3e@vger.kernel.org
X-Gm-Message-State: AFq9FYIc4WQNXO0d9i0gpQskfgpfwHkjr9IEAWtxv4FSb5Ui9/iQ02WE
	8SOJrO8JeLVy9v4LiJLUSBQx2QRHzTHb2BS/Lg5ErSwfddwZavrP0Vde8HgSmn5TiYqPlZcg7En
	UithI8hLp3XYw7WSt4Kzxl4pWhfKdN6HixGHjbLVfz7fBtemZdnJJCP3yZT8AWxgyigWmH80nq9
	ET
X-Gm-Gg: AYBFou2ZzgW8UqDdKzNxNSrD2IiDL1N+aATmyCFRZIn+4+LwbLS5w/gjFONFo92L64U
	k6WQiNGLJGj8ZPRRP3/npQnwPEc3Y0ygeobEdZ4QBS0nsnE/WOw8PncaSXxVE9C8oSXc2w6xJWF
	55zwTugLvoBrDT5rXndGCX2nPp4dkd2ze0yqKMWzzPGEgNlZNfQ9cBoWHhS+9/n4z5CzQs0B/NG
	H8tLJAfiwtwpIHgkUtoPyFlUUUU1V0+w5qiuSv7TovUqcBTLj6AvNXiACdPUGfYrtf2hVGg+Ai0
	t2nPJ/9OksfuU1MLLugiVPd/4qBxbvzfw/9/p5oLg5hzq1+LIAArhs2KpAhzsBFvNPtZaJ/Fk5O
	iV0wOBtRBO9SLIMW1dlsnSg8SGLrYV7X7N4n/7thPMb0VG0bFOQQLpYIYxV8ixJ19m88Oxf/MsI
	5/viQadk6HD0U/RZA=
X-Received: by 2002:a05:620a:178e:b0:93c:5952:5765 with SMTP id af79cd13be357-93f4c197083mr341324085a.6.1792506174815;
        Tue, 20 Oct 2026 07:22:54 -0700 (PDT)
X-Received: by 2002:a05:620a:178e:b0:93c:5952:5765 with SMTP id af79cd13be357-93f4c197083mr341317985a.6.1792506174109;
        Tue, 20 Oct 2026 07:22:54 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm5185084a12.10.2026.10.20.07.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:53 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 4/5] platform/x86: int3472: Rename avdd_second_sensor to power_enable_second_sensor
Date: Tue, 20 Oct 2026 16:22:42 +0200
Message-ID: <20261020142243.25072-5-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
References: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX98bYj2jqd7YY
 t5aSYQwhxot0Nh50qsLti8qMbL4Q/T5aaQ1crV+MPJFgyiifI7DiTqHhm10FU6YzmL/eCAVX2/R
 i6MDYjhVu9vnDSps+TaXT+n9yt71iMM=
X-Proofpoint-GUID: qRr8zGwN5BTj9ddmdWn29D7tWuB6_NlA
X-Proofpoint-ORIG-GUID: qRr8zGwN5BTj9ddmdWn29D7tWuB6_NlA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX3knb6Mw2xSkj
 1vqJvqjHv4Brq8xl6gEGbnzMcGKJ/DMJcAX+c5uCCh5NZBh+UGrgTSRA4Pju5LZLPmwuuQ6AJd8
 Ffv7pqffO8YVKBVX56li/MMYP99d25X3WfSASNpDerv8ER0YrVuAmLSkHS7XyudRc3ZwhrLIGhd
 GAeHUP7reuXiF02SRJK/GL75ekzvKFtz5tfuK1JlFAzQnxPhWc4XeAuy84HL82rANKMOurNMUsS
 XQo2ibZTL5eeNr8Q7i2uFWJQAYt6tKD9+lHptcn1iFM9tB1tZ4LmmbR8qZUz6JMYQD6W49GDCyI
 +k8oDKFR9kp6DU080swbQ1bubbdTT9QGvxoiMC9Q2zVf5NokjNCWQZZUdKnCYlIBJLxgiiCYRA9
 CUvkbfpzH62AOH1S2zxDL4zYCmFhiAk7+LEGD+wsx/qSX78VRdnKSSMBR7hPqYh1giDHUEY2Nh4
 Vu/mgkawHeBtijVOC2g==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7793f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=QyXUC8HyAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=m6U5Mi7_xXUadIKIrwgA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200057

The avdd_second_sensor quirk is for when a GPIO with the power-enable type
is shared between sensors. Sofar power-enable happened to be mapped to
a "avdd" regulator. But that is going to change in future patches, rename
the quirk to better reflect what it actually is for.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c        | 2 +-
 drivers/platform/x86/intel/int3472/discrete_quirks.c | 2 +-
 include/linux/platform_data/x86/int3472.h            | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 046f93ed1c9f..18649ee448a4 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -437,7 +437,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
-			second_sensor = int3472->quirks.avdd_second_sensor;
+			second_sensor = int3472->quirks.power_enable_second_sensor;
 			fallthrough;
 		case INT3472_GPIO_TYPE_POWER1:
 		case INT3472_GPIO_TYPE_DOVDD:
diff --git a/drivers/platform/x86/intel/int3472/discrete_quirks.c b/drivers/platform/x86/intel/int3472/discrete_quirks.c
index 552869ef91ab..4e57d3f73111 100644
--- a/drivers/platform/x86/intel/int3472/discrete_quirks.c
+++ b/drivers/platform/x86/intel/int3472/discrete_quirks.c
@@ -5,7 +5,7 @@
 #include <linux/platform_data/x86/int3472.h>
 
 static const struct int3472_discrete_quirks lenovo_miix_510_quirks = {
-	.avdd_second_sensor = "i2c-OVTI2680:00",
+	.power_enable_second_sensor = "i2c-OVTI2680:00",
 };
 
 const struct dmi_system_id skl_int3472_discrete_quirks[] = {
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index f0ec2e7c68fa..86b7510d5a45 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -98,8 +98,8 @@ struct int3472_cldb {
 };
 
 struct int3472_discrete_quirks {
-	/* For models where AVDD GPIO is shared between sensors */
-	const char *avdd_second_sensor;
+	/* For models where power-enable GPIO is shared between sensors */
+	const char *power_enable_second_sensor;
 };
 
 struct int3472_gpio_regulator {
-- 
2.55.0

