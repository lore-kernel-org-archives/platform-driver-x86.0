Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F4D4A5C55
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160257; cv=none; b=V0T8RLuvCLst9LM8MECo6FNCNMrdYqU6F1ALKw06MyydW6YoABAebKt71kluLcZigJ7eb+whIOGu+KXH40Ru0IyHXo43xRkHTDAsz6sxLerVgBYRcPjvPWMPm5tlNINPjxMDC0Fojf91pju/reSlb/7km+r8iDImwb/FTxuhIj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160257; c=relaxed/simple;
	bh=nR6q11yVXe4DzbBSxPuHOSK2XMFRda3vBZ/LFIrOLww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbNIgU26N3XlStcwKB6oQTEv2M1s9lHtNZLcFYnCw5cy/S5Kcy/v4b4AStm6Y9XoVKCRw6c0awOQQElrnmgZoEavoqbPWQC8F/QxjsFhKdRIgCNvy6iaS/vU/i85W1cHMOKeEkMqWPK/LjzRrtXJrXoz6zS1kcOzy/irB9BC7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPlbsyJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbKSf2ac; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPlbsyJk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbKSf2ac"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE67xr2455244
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vKNOe0cdphA
	dqWUhHZ5D0zyLeGSDu4B8M/M4D2EdGGs=; b=PPlbsyJkxdI0AU2hWutC5MIjKqX
	H5I6V7+rtcQVc+V6pNN8rlBOhUrTOvoKRMJsfU/U6wkkLh3UAXemkpmXdmy6orID
	wXqkLtCNv02cC2Q9epYyHmMYe6ybBPRLRcuAVnHYQu0Hk9gVjLzdbIPsCfuLx4V9
	xCdZf43mh17N7+DAsaUaiGdEDmRHCV2lKtRXN/RkZO6o4DFs32f5MMR3+YrVKIfP
	fysStS22dsDj218JT84+OrcMNmOgtT/WMiswg8TE+YACA7dhRRqsL46hbi0POxwg
	rTGUqaa4hfIaxKkpM1HPm49AnjX8vKTYUr45JdIJFBPlG9Z+H9dk2sx4WJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5ysbe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso197193085a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160254; x=1792765054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKNOe0cdphAdqWUhHZ5D0zyLeGSDu4B8M/M4D2EdGGs=;
        b=bbKSf2acW382dJOK5zCeybV9Lwx8SksazJiexxM0i+c/zcu3MkEJLdV3eZVJ99/GTK
         dPC7fDrXgFisETdHss4Ijbanfeseqe8nurTvYTHfXkJlh7ybLj7y0lFkn8excFBwdKl9
         ioDwMbWKau78PJKkBG/JfiPg8fGNd9vum+i3QTdPP6fNTQ4eoinDlxe+WEW5N5YXltEy
         YUssaLXEpLKngY0Q+HovbJtIn7k3pwwIoXpo//xi0C+e4vKG7XC1NcE3mQT2fQbUYpDW
         6fOd+xTYkGxi8bOWVdrRsXUEkKdiTALqE9n3wygZxUelBcCwa0ZZsEvP5e2uK28XLGde
         gzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160254; x=1792765054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKNOe0cdphAdqWUhHZ5D0zyLeGSDu4B8M/M4D2EdGGs=;
        b=1hhYfDmF3304RD5r4UHR9OIAaurnP+XEaxFLCsy5RSSs01wYq15ug1KfiDfNiSPgL4
         ivX0QuVd9VG7XrTsdO0vNUKvz7yy/ncp4Mx6Y44LJtZKC5xv5Np+GEYZlNebaMfwd3Wg
         7xImwe3LRXu6jbPuPp44Z0fvau3peOmdKBv92UFOMV1zSYjpQoigEPm/ux4mIq75NNnj
         PYFCG+lHZlRZzl6P9a3ThMmpV01XTCgR7U5BF9VNIEN5TJrH9W7Q+cPHycCUaHYfufZe
         75sME5gMWzq5Hrhi4USokpxEl9TB9WZ+7e7oJsZdfexvQk9vDguEUKhvn32Tyq+/vHOx
         1jFw==
X-Forwarded-Encrypted: i=1; AKwUvBy2Q/7WTlPLC5Yz9xhq6W4OAW00Mln5hJox0Owj3Afj9QGA+mAwMHdYFMJJUXJhqS5c9ycEsLR/su9O9jjsiQHA7KSf@vger.kernel.org
X-Gm-Message-State: AFq9FYLqDTaAUhJ8ckZimlwFuHWxcdDXi1F7j5I7pgL6T+Kt9ZY0ZI+k
	+571nELSUFE0CubrWXk2eIBRXUXD0bl/g+JcxJ96x/TXJ01e+8BlUmrberMCPphTaXPfO3xknD5
	Q475DgIgt2G7sEaltAPeNSZx52OM4yvOW+64LN1/H0BuKwEtzEx0hMcXNDjEJptGP6Hf10HCTx8
	od
X-Gm-Gg: AYBFou0oVaPj5cmgHhlfcUEw467Nu0W76/tS00SPnLLRZcWcUPAK3bFiHHDbn4vqRdt
	+XM7Q45CVqF5MUrCgIfsPxHXgrApCaRXMDuDIsmZyYPLqv+WW5tHkpPYTYeWsTAJ2o/u4yWAmZz
	CcQtblgx/f23kfuzvDi32RTE16ict5vAa/a/3a/DgjNA/+UKWLXocpCTC9wgmQigm1udx+He7Nh
	GaPfZ4JrDSl+y8UgdDCkU58/M+IvlRIMiEnD+8pjVee6xPwNnuo8dACK/8xGy4yRd41pDw0jT43
	L0vVslbfRzmR0sx2AsZy+k0VSNODFb030Vrr5f0/W/7/a0f2juGUh9MWFeRyzdztHUjx+2VDWhK
	//81Kf17YtXire+IlvK42dXOQegZE0OoBT+bEAhmfk5WtErwGf6wgiG4FO6tTDpyYblYdSBGi4N
	hwpxD3wEzEZJ/PGw==
X-Received: by 2002:a05:620a:2550:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f17d6716dmr560086885a.2.1792160254381;
        Fri, 16 Oct 2026 07:17:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2550:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f17d6716dmr560079385a.2.1792160253740;
        Fri, 16 Oct 2026 07:17:33 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm71144166b.64.2026.10.16.07.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:17:31 -0700 (PDT)
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
Subject: [PATCH 5/5] platform/x86: int3472: Properly map the AVDD GPIO type to a "avdd" regulator
Date: Fri, 16 Oct 2026 16:17:16 +0200
Message-ID: <20261016141716.130220-6-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 29fO51RBRHCmh5bVgjmP4MnEJk8cymGw
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad231ff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=m9nago8T1PDHLpcCI9oA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX8Bi0TuyKtkkX
 7ymiejJ64fo0m3ffhyqVFLEnGfdRK9kVWSvt2SclDcV6z2xUC2XBrGoOoAP1IZAOTsFwtSU7k/i
 Yb5ENsnLIPM4L8T1Hm3BSGKVlcaUUy4=
X-Proofpoint-GUID: 29fO51RBRHCmh5bVgjmP4MnEJk8cymGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX7lzHVlFea8xZ
 Q4xk/Rqsud3r2s56UT4K60lW76Nimm1WvfTt+L6rcsB4gj2U93yqK6baCrk0zEmHa/kwdHqOsX9
 Fweuewo2mTEobWt7QQSnzZ+5wmtnQRS/KQmxrJNnq56K1PZdtEMMAriywmx/GAT9DV7ILs7plpc
 enw8KQwbrjpxWdqBY71Vz8UayIvY5aZa7y1QADXfLZK+oEE0CL3m4NlMnAkOXvAODwGSrsVO4cE
 /j8QzxwL4J1Q72h4IdhNSzhqrcB1ogyT3gpIyIq3nriW2O24FSJBVvsgJ74gbKdiNIdP+FiE5Wd
 j2KRX5etR6NsTsA0sfWiaRyWSoGCuLy0Llu56A9TjtxCgfAF3Rdt3QgqMvSIR0tG1N8mz2CMh8x
 wM2G0bUVj9nogOgdq8AlQ+Sl6nczu/Kh1Ck76loDE1piqVCjSCES5a8IiyT6ZoiBsMr+R0IzTZZ
 +e90yUAtPK2ZZz/+rvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

Before commit 34e31390a3b9 ("platform/x86: int3472: support the POWER1 GPIO
type") the int3472/discrete.c code mapped 3 GPIO types to regulators:

0x0b INT3472_GPIO_TYPE_POWER_ENABLE -> avdd
0x10 INT3472_GPIO_TYPE_AVDD         -> dovdd
0x12 INT3472_GPIO_TYPE_HANDSHAKE    -> dvdd

(with the INT3472_GPIO_TYPE_AVDD define wrongly being named
INT3472_GPIO_TYPE_DOVDD in the past)

The OV5678 front camera of the Lenovo Yoga Duet 7 13ITL6 uses the following
GPIO types:

0x0f INT3472_GPIO_TYPE_DOVDD
0x10 INT3472_GPIO_TYPE_AVDD
0x11 INT3472_GPIO_TYPE_DVDD

A previous patch in this series maps the DOVDD and DVDD types to "dovdd"
resp. "dvdd" regulators. This creates a regulator naming conflict on this
laptop for the old AVDD to "dovdd" mapping.

This patch fixes this by changing the unfortunate mapping of the AVDD type
to a "dovdd" regulator by swapping the POWER_ENABLE and AVDD mappings,
mapping POWER_ENABLE to "dovdd" and AVDD to "avdd".

This is safe to do because all sensors which may be used with the INT3472
code are listed in drivers/media/pci/intel/ipu-bridge.c and a manual check
of all drivers for sensors listed there in current media-committers/next
has found that all drivers either support all 3 of "dovdd", "avdd" and
"dvdd" or none of them and enable all 3 of them at the same time. So this
swap ends up being a no-op.

With the exception being the new in -next ov05c10 driver which only
supports "avdd", this is fixed by an earlier patch in this series.

Note this change does not impact the recent adding of mapping POWER1 to
a "dvdd" regulator since it does not touch any "dvdd" mappings.

Reported-by: Alexander Patrakov <patrakov@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com/
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 18649ee448a4..ff94dc2ad8a1 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -270,7 +270,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
-		*con_id = "avdd";
+		*con_id = "dovdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_POWER1:
@@ -282,8 +282,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_AVDD:
-		/* Should be avdd kept as dovdd for now to avoid regressions */
-		*con_id = "dovdd";
+		*con_id = "avdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_DVDD:
-- 
2.55.0

