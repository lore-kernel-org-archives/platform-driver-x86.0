Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EBA4DA9BA
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160254; cv=none; b=Yfu7Bnh5791+LcMAAp7zS3DhsuKGjdeXLtetzQchV3Rmy/ynfVcilb/Cx1BY7tnb9TcLui4tNTOZNRblO/beD9Y14SRHsQGyLgJqqSUkoMXh+84jRwUKjK6oZ8w+1IezXD3DdVyi8onV08owoBgrSv/S2m1Y6KR/uOd0mQswrxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160254; c=relaxed/simple;
	bh=LVKOPRuCzVWnPVKOjlQ5krdoUfYQA26Ypuz73aH1I3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POVaHu95Nq9FPT4vBuds9L66U0P8Vib783b5ISVapUKL7Tt0SrOAc6XEW85j9f/UV1D4G9dQhwcQ+hoXajjP4O5CZGnB0Kylhi/C9mHrcuh+EaEf7FEtpt7lWafHJhiTWinPseww88W29NykAASU9UH+KgkRVfpxLxhVbd8xeg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhRgSH58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNkA7EbH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhRgSH58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNkA7EbH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5rwJ3577692
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K7c1cjWlvx7
	7hMthCUuJ59q+Owv075/iXXKxX2RilHc=; b=UhRgSH589gmMHkAZ8HiStbAmI10
	jodW7qFPILHaxasb8E0K+0PC/duCNdn0mJ2L9ctTz1I4IJiLY78pcKMzidhmnjsU
	ATbPpgC7lH/2PO8JMkPY1p8kp9/degNU6iz+vaq5aHCg16W8zCcwK/EtEheR4VqW
	MU71XPc2rC8xJa9tpx9/qlO8St+R54vrIWaGoroHwBMmS9UdjH08enYxH8y+taIw
	7CiYJDxp+GZNT5K7fskKvModY0IyMFIJBoD9UUSTfiKsMu04HnlAmnZi4jTlFsWS
	lU1KzPkFb7G+utMBofEaH9MK6wKQWegWOgpZaD7c4Kz8Q9i2nLXtkXJ3uOQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba262p52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:33 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5d6d5ea0757so7422147e0c.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160252; x=1792765052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7c1cjWlvx77hMthCUuJ59q+Owv075/iXXKxX2RilHc=;
        b=ZNkA7EbHZlDHs2fNjl19KrLnP4rsfZUNkeeDUkXnqpU6qgJHgpAr25REdBFThrjPMw
         H2RtDNgiFsvkXySez0pL6RdzBK/WzYK33cxdHfStfQwJ2GtX/sRJaFJg7y/Rz3JXmNs1
         syNjoObC7cQ8WA2l3w65agH4L/6N+IB271A1AmkQq3CW+AmXnVGrFXGpv46xeZEopr/E
         utZJMmSbt8XGn1aP8k512a2Zw602WySPR4MgIz2Pu1zNV0LPEZqeLmOgMLGogYZzmf4n
         x+SwMzbW5gx0/O/HVjF0nAuRrnxRUvcdyuHNl30OXK/zqto5Z4bbXjZ91T1wNPDCD0oL
         nM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160252; x=1792765052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7c1cjWlvx77hMthCUuJ59q+Owv075/iXXKxX2RilHc=;
        b=lmLhDO5bm82UbwhlfhPkHeyz4RH/oCPr0c9hSvpMeRsChMxvcavnhJYhZzYVnxicjH
         2846rhx/t7z8X4L6CTPR+pBPtUe14JfxMlvrAUcREF15mYQXpnNxkB08OPbgpKuiApYb
         w1hIUmrDTFUQYdGmtZC8Lpx7p77snQFob+9BTxe9IVVsylNd3pBCRoQ4C1QurxF82EYL
         BUsqvZX7F6BtlPvXUPvgy4kDGnHSteGAcAthi7qONjrOjJ+VEwbfv7YlZ7kq0peZ8irK
         fF3rDLOq7E5agTEVyPlNSMxHxsGSiOE1JJFknhkmQpc8RtuLYRYk9A8svZI4MfewS0HT
         SjMw==
X-Forwarded-Encrypted: i=1; AKwUvBxjAv5lLQKn+MtSerl6wL13kewxau6ZYtekVVp0X+kUrJqP626nYcTKq0Su28U/Xw10E6jX8yABMBdZNcVjJko/DonS@vger.kernel.org
X-Gm-Message-State: AFq9FYKRAR4wtWtGuHIBvhmL0r1IRNg7aVX3s7t+KPf9FLbaE2IEDf93
	YwM81AqoomwMo9hz4OQ63bWEQhlAo8TYMfd2zjqtKL2NmwVK7sGh9VQ+t0AlbfzctVWRA5yJJNL
	rEWbWS/FXOcrsj8Jg1IfKbvmPXl21UhOZTK0o8n+CcYy5RbeRE1TXTvlWSyJEo+DBrXlAqGL84F
	7/
X-Gm-Gg: AYBFou0Xve5CUUq4kV2nyKJzMx1NATb5qPyJmKlej8jqYJ3HSwdUhFB+syJw3a+zxCM
	qUtCaQBqBtduYh2HRh5E6S5hu0okM4fxehr5VmEvoEO9BvOa5l5H3ZHFrVdY2phVII3L2Nl0C2s
	aiDeSdE+IrQtHPbhyPCF0Cdjk+qIfQnRQDkVezTxhGhfm485czlH6EVwKVD3opItVXoHpjG6JOV
	usSrkw/Xl4XXfQrdrh/R1iL5ZsRdbf64UtIRSapIZjjUtTPTQx38oY3j+17FYgJLvChaAfu96lU
	eUDRtp3+Bga9lB3pibvixy39kBTPpQUovVcmTqsLjPfnRj22P/Lxhnb/e/yd9zRxH3nxAJfPU4y
	2zzpvNsjJ55Gb//mzCik/F4bTcSXBDhLHxHehMTlPBF818Q0t8gY2uPNMMiarR6vP/9zTGHhAM2
	hhQVsmSusarozZBQ==
X-Received: by 2002:a05:6122:35c9:b0:5e0:7a01:c83 with SMTP id 71dfb90a1353d-5eaaa627408mr62787e0c.14.1792160252143;
        Fri, 16 Oct 2026 07:17:32 -0700 (PDT)
X-Received: by 2002:a05:6122:35c9:b0:5e0:7a01:c83 with SMTP id 71dfb90a1353d-5eaaa627408mr62747e0c.14.1792160250315;
        Fri, 16 Oct 2026 07:17:30 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm71144166b.64.2026.10.16.07.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:17:23 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Alexander Patrakov <patrakov@gmail.com>,
        Leif Skunberg <diamondback@cohunt.app>,
        Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/5] platform/x86: int3472: Rename avdd_second_sensor to power_enable_second_sensor
Date: Fri, 16 Oct 2026 16:17:15 +0200
Message-ID: <20261016141716.130220-5-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad231fd cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=m6U5Mi7_xXUadIKIrwgA:9
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX+zZ7GUX441gT
 GnEBVCbdHNsSsxf/LLkIQAPQ5jnFlIp/jUbKJj2hz9YjvASIm+bc9pRS8QlGyTetHolnRfsHIB8
 P1XgMOLIsPFeZ9wYWhW+90jXyHx16HsM4Dj0Z936a7XOhs4xpNbcFpjz23DlzVinT4Gdc5xWVJT
 5N22ugRbuSFEfY76xhDuEjzYO1I75dugWcTTrNi8p+km72rDS1b+3aCSIQHADLsK2sFm7ChvxH8
 qqlsp4TkBYXFWLTvcY/FnsUMLmAu6Fd3oKb0QXn0N78rkch312mmbsvPTk8JpW4tJ3Fo8XyrNnI
 kqn64KsxcUJ6JaIEKb8eL6U0SO2wCONCcFaHseJN1D4Pf6pK7Dt+TFYUvCwVONIs4DutTAQ9jhG
 a8CpzjP9ldNZJtetUum6HTgPPivjY7c2SBtP7yXBgzd9mgDIdne9XKXmkN5WeSSdI9l0Wj6Aebw
 C9I7rz3m1HAeur2II+Q==
X-Proofpoint-ORIG-GUID: F-bCdC1BsFKqW9zmNGUTVYWYY2vwcZQE
X-Proofpoint-GUID: F-bCdC1BsFKqW9zmNGUTVYWYY2vwcZQE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX80yEol8hrOXh
 8hmv2J6ma1lNQf8jzgjVPhk9BwLXrlz/6ZKrZA7cefYloNbG4dWPi1qK0cb/K8WH2zI5dFFZ50q
 o4enR9U5A5I/z8r8yjJVf+Dc4lF+iYo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

The avdd_second_sensor quirk is for when a GPIO with the power-enable type
is shared between sensors. Sofar power-enable happened to be mapped to
a "avdd" regulator. But that is going to change in future patches, rename
the quirk to better reflect what it actually is for.

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

