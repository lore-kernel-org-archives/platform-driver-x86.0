Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56414A1387
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 21:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903857; cv=none; b=LDztPqduQjHrOZFFH+bCHZ+0/WqSv8q6Lp80olpE3MH7x9atisvvEJ1ChyIXk+ZpWjzAU1uxYZNH6xbaHWHp75m+NYzRMAaUKtVRuMqtM/1hr55MyBdO073iUkYYg8qFbgys5nDKKOdHn1Z0afKVbQOI+EgKWFpEU+SrUciYnMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903857; c=relaxed/simple;
	bh=2dcs3QudVmcvMbdV29fKyRaEWun6j5+/AGxr5wEgT2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O8oeqhJhWhSvIcNcyycsPugt6Iy+ZAVEF+O5l39kyLkS7DdpwFkbCJ+m5g0TV81e2nU5GBlr1g4gLOWwG2trTYlWwTdNc4pfSg4aPHd3WkndQzLyA4TJ2c+p9G3hHea3TMBu8ItJmZpwtloJgH/R6D4DJGSeg3QkzreyHFnKW/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8JzIDGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFBvlxoE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8JzIDGP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFBvlxoE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688IBh6i3955673
	for <platform-driver-x86@vger.kernel.org>; Tue, 8 Sep 2026 21:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EE9LBvsMzOCWGBTgLFvH62d5vLdoOJlhdPF
	YwxqaNTY=; b=i8JzIDGPFw26GQlWlGOMIhsg/u+FiuRgWJ+WDG4eZU3CeTeaIGj
	QjHuwtSC5vqx21kA35E/mVR/auS3gL3JtDasjak5lkmsPgCtTTIlAzS99wRbiu3o
	K3kTo1pLi15Stsx+FpRK4Y2J3OXeml0AjP08GwNa80iN/RBdnbz6Ew+0ElIExEXs
	bRdFFyg/yTRIdIVTqm7jykBb3litHTszLSxx912S7hlLnfTqxn7298c3S1APzZRE
	eR5B8qbqeJnhWJ9QXcQbwRplUgrIze54rL9+jCWNsCxgWdPuDevw0dCrgS5PlmxQ
	bp2ZXlEkmynF/ayoqeSWJ67eQMzsbsVigeA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqe7gum0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 21:44:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-933023a5980so428668485a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 14:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788903854; x=1789508654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EE9LBvsMzOCWGBTgLFvH62d5vLdoOJlhdPFYwxqaNTY=;
        b=VFBvlxoEFM0OXa6pKt6XJSF6caqpCTn5gGw2RcW0j30BTVAbiuwqnX5Z0P0AFeHRa4
         qx50WWNExMoe5WRz35bekD8AiPYl7hmp3GEeM5TMR06DNlw7tAWyvJ6V0i6RPwkHGN7U
         YXGyZwqPatKJECizWrw/F9/6qG7TUmdwGS6A4erqGJsfeJsn+TA+X4iR6h8J+nseLTy6
         +RW1Sbjzcfn0K1uAckL7YB0237nihJ8mEusvFbogDJupmV9laFjA/yv+1/Ojw4JL+RSp
         z1MpWPkPDCYWN9vcuVBlJlSjesufpT6yIUjhYKKQxz/ghT/Uuar89upqMeB04klCYeKu
         DPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903854; x=1789508654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EE9LBvsMzOCWGBTgLFvH62d5vLdoOJlhdPFYwxqaNTY=;
        b=e/XJ1EJmbhkK4tU54vWp66j7QPdMUrvQW4QF0qjQcmB8TbF6iU/oR5APcEod+WhePl
         JN28x0StOYMTJOWgebi5eNQhp0QX13TXGdefTLjUOMxLBSaLL5EeRdjc3tok44UhhDFm
         thVRNdmvbxiNi4w4UwC+7jzUR59pQuj+gfGsV1Db27j/FzoDx/PeFIYGbCECOm2TdYmx
         geuZlEprTReZbf+z/WAQgZxVjpRI69+0fOmj1hyDUu1wArPQQTMPbctMvhfuc+ZJShpb
         8UDGZJh8eWN1eNljZdEFFkF7OYnMy9iTvF/ccYjGphJCOI8vCmvgHE8CfvtF/e8Vj7n3
         dGYA==
X-Forwarded-Encrypted: i=1; AKwUvBzlo4TesigC//pg+FQr0JPWii8X2/XEgwjxHcG1AfczSGUxHc+/ZS6Fh7jKlZVnMUR/JtZRGBpvtfQuayyG/F0pjHcA@vger.kernel.org
X-Gm-Message-State: AFuF++lex7rDjKLVVguYn/Gn5vS9p5yVBDDyqn5GfLGILl5OKwn2DqSS
	TcqSi+JzfzLVOy0B3x1gjsvsY/blPIvs+evo73vxjqhnHnEaYC3tGiGL3BzBhPf62IMaxnlA1vb
	e2VfHWNDD/8SLyR0Vaz59qZ6RX0fprxCEkE2VgnQKQZuIVJ6WuLjvxDUAzHD52pDccTt/r56+p9
	dgZcPz63j+
X-Gm-Gg: AYBFou1bwcPtbcD62s4NeZ0ZhRcPHSQ526DpXPWYXP88XyMw34fXNG+1CWTVZb73N2B
	rfi075Z94xkqzNaFfRdEjdslE1FdEb3K06M8gtciRScB4HlvNMuu2wmlaP90ACnqyySf/waFDnX
	T2nmBbiMUoAl9IXJlNG0RKGO3/2jntomeukCcEmNsXnegnTjde41+Gav65X2O9/QBVabdG5MlfX
	4vxheZahTrdGF+tsSWoc+j+aI0sQfEekBzTMks5B5Kl+qMQkgQiQtk6JYeyBxVLP2Oa56QmF3ed
	ojk4E/+xZPuWtNZE+IUKruh4LRv8eG7Z728ICWveAp4XCtrKypoX/SG2QsBQhBh+xfWe85KEkkn
	vDrYJdllo6L4zMzEFz3BAEwocApmRJ4kXLHNDpFp0bs09btRYux6wP90Zya9Ru/Imp9ZakXp/a+
	g8YhsCg6eMdVI7Pd4=
X-Received: by 2002:a05:620a:454c:b0:939:6dee:4b09 with SMTP id af79cd13be357-939804ec4demr3330030185a.51.1788903853984;
        Tue, 08 Sep 2026 14:44:13 -0700 (PDT)
X-Received: by 2002:a05:620a:454c:b0:939:6dee:4b09 with SMTP id af79cd13be357-939804ec4demr3330025785a.51.1788903853442;
        Tue, 08 Sep 2026 14:44:13 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm673546466b.63.2026.09.08.14.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:44:12 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Sergey Lebedev <lsa.uz@pm.me>
Subject: [PATCH] Input: soc_button_array - fix MS Surface Pro 11 probe failure
Date: Tue,  8 Sep 2026 23:44:10 +0200
Message-ID: <20260908214410.70422-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIzNiBTYWx0ZWRfX/D8Ud5Cd7THa
 91/Gy/s671id9E6GU8Q7yZ+V6+oRFF6hg8VpcdyLNxDNm6WkcHi1y73tZorXD4PKL8O6u+WVFAu
 un+1sViEGp5Gvu7g4rL7gSd0Q9qBiLc=
X-Proofpoint-ORIG-GUID: mAkEo9GRhBDz8feFqulgFNjzOTDyRGLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIzNiBTYWx0ZWRfX8YbjgGcIAbKx
 7k5qoXRFHC8q5O+zpI78xqnlhYq3ZcuiYmEYpASdQJUb0ZdpRx6Gc1rtnvZ11SagzRc5LdgP+8v
 /XO0gFev9KJSvUlTlvLURpHygMT3RYbUqka3uMrr9CW6vEdV6cCmJSH3ujGtaRQLepl7gei5Mqo
 pCEYlajU4ptQ9T2FEJ5Uz4o6vLHW58SXWW4xRyHFxIIhDGj3ydwsTNnUgT+Prk0RaoMDqV6gddi
 4SWZTjPV3uE8vfjSSjUW3piAbR3AOAar4SSj4lPVLmnUDjtqIv4KYqiWPhjSUUH6jrp9v+Tm9LG
 0ORQcpHHZO9lGim5ohGptWbqGzCa58TqElNjKE+VrvsLxGLzaRXMs/UZQ17T0btbKzaQ/gZ9Kcn
 402g01ep+Bzt62byuhbcGpoAzKFryikBo1dQe9mL99zdhyO1fmHpaBaLEva1Z0YWS1aLIyYLeHy
 nAXYRAafJYhshn6ZAWw==
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6aa081ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=icoHmF83wIaDLuXB8S8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: mAkEo9GRhBDz8feFqulgFNjzOTDyRGLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080236

On the MS Surface Pro 11 soc_button_array probing races with the GPIO
driver probing. If soc_button_array wins the race then gpiod_get() returns
EPROBE_DEFER, which should normally take care of retrying later, but
the soc_button_array code deliberately ignores EPROBE_DEFER causing it
to fail its probe() which causes the volume and power buttons to now work.

The ignoring of EPROBE_DEFER is there to deal with a problem specific to
older Bay Trail (BYT) and Cherry Trail (CHT) tablets which often use this
driver. Modify the error handling to only ignore EPROBE_DEFER on BYT and
CHT platforms and propagate EPROBE_DEFER normally on other platforms.

Reported-by: Sergey Lebedev <lsa.uz@pm.me>
Closes: https://lore.kernel.org/lkml/20260830141355.55898-1-lsa.uz@pm.me/
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/input/misc/soc_button_array.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index b8cad415c62c..6ed32c622d53 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -149,6 +149,16 @@ static int soc_button_lookup_gpio(struct device *dev, int acpi_index,
 	return 0;
 }
 
+#ifdef CONFIG_X86
+#include <linux/platform_data/x86/soc.h>
+static bool soc_intel_is_byt_or_cht(void)
+{
+	return soc_intel_is_byt() || soc_intel_is_cht();
+}
+#else
+static bool soc_intel_is_byt_or_cht(void) { return false; }
+#endif
+
 static struct platform_device *
 soc_button_device_create(struct platform_device *pdev,
 			 const struct soc_button_info *button_info,
@@ -191,8 +201,9 @@ soc_button_device_create(struct platform_device *pdev,
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
@@ -201,6 +212,9 @@ soc_button_device_create(struct platform_device *pdev,
 			 * we do not have a driver for these so they will never
 			 * show up, therefore we ignore -EPROBE_DEFER.
 			 */
+			if (error == -EPROBE_DEFER && !soc_intel_is_byt_or_cht())
+				goto err_free_mem;
+
 			continue;
 		}
 
-- 
2.55.0

