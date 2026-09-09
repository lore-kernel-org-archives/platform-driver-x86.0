Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6879246C4CC
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944847; cv=none; b=HQQR9Br5jrSytN7XSSmOKnpadUgvb0PWPf9g+u05sH5Ihq7ToZI7gZAGXejwwEpMxMNjNOWiZpOHC09GKYJsAfCzVnoLQ5YTHEqBJtUnx4AyvyxvgEwVGG0y0uI8IJHoTCP8oumXfbPVyZ5YyKObJdFd0pnIzdoLN7kQRoCaXpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944847; c=relaxed/simple;
	bh=GEo+KLNuYWD470niKMt1m8IwniIXTQrURaOkhkXR58M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dVpUpYzyVdu0NziikMbz/GGQNENoYZ1QkYSP5N1yz8rXSLKldmxBqBWCJy1rZxliIk9VyZFdRuLoJRZjdTG5gerggimoMFJdND8g8ISDeLorldtPZyHvqjdOl8ntZ/E5pQbBNrikgSkrE2lK/MjPWEZ3bvqrvoiVY6aa4VlVz4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrCOgCma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbCjYaRF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrCOgCma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbCjYaRF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896Pp1o130682
	for <platform-driver-x86@vger.kernel.org>; Wed, 9 Sep 2026 09:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1GUsIpfmqVZXnIdvllICaLTdJvFQPvOL7hK
	5SbmLcew=; b=DrCOgCmatfzuKvdMutYS+sgTKbHHmQcwiNiJl9UK+K+vEq9nNJ3
	dakhjbGIzXOwDQMW44U0uTE3pmYZJ+Z2YUAfPlM94cuWLDZk5oq1Kfvs1uggonSd
	esRODBYW3qxsSKE2YYOsz//y+kJaKxTg9wCVhgJcyjRb4gjAyB1vMfWmjOkimQQu
	NBldgKrq4WXjEp0D89KKQvR+qEsBN1fG0YmrPu5uwerJ1JngR5rOTHdaB6JDgZLq
	hId5pdJ5njw6uiCucQ4DFRWS94Ocqzj2qQ8ox4SlgSyij7QFqqJinTBrlJHNn7QL
	soVMMqkpBXMP55/l/pGmGK8JdBuRlzuqmeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpkq4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 09:07:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso706990185a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 02:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788944844; x=1789549644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GUsIpfmqVZXnIdvllICaLTdJvFQPvOL7hK5SbmLcew=;
        b=GbCjYaRFRiUIuTTiv4i1beVi0Ayt4GBNEx8x9PuR2WyN2yqg0GlZG420OGQxwnty3N
         GKNuejM8iMbXKoTk7+maWe1dyZR7ntqjHCjanoeM9eBeE9JTrGt7lUp6gRZmMAKjV0G8
         aqGtxn20XpJCYOrnjs4K9h/f+hswIapjWIjCkUJJMYlEjBI8Ia6pzqXIBUBHuIch6m9h
         Rpw0X6zjORYTopKlXisBdvM13CAmgwLD0kG/R/7SaVodgelgQSttaYsYmIh8CdZ1NnFv
         3dg/nzfcU7YbKjo//ZOKeHvIiyMJ5tj4hxxKfXYREdpz9VlQdJvEOfQ4g+P/dD/nFTFe
         cG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944844; x=1789549644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1GUsIpfmqVZXnIdvllICaLTdJvFQPvOL7hK5SbmLcew=;
        b=avfDWeBB4/5ITJOHSawZ1Fndyn0Qf9+gtXTB6sGy9sGKZGSSnZfmYQSEDfISZ3RwMG
         18QpZD8UnsdoGYFyJm8imd2KzoOjOth7C1WDm5khQZKjd8peJZIrthnxS0DbjK52tFxe
         Rkc4S6S/GEKzl65TBVoE9xcPc3ZZSK/+jl8T49QGc5ZiYcOffJ9WnMvdareGuG3YJfHS
         Dc0Eg6BqScQ6eD4EWMoaTDiFHCX0b+wbBoBy8541P7x59LL10MEsGlhCanqnQ+tSppao
         Ur5G5ot1/PzUGppVl2B2bY0sYGzYZzJzuGETA+Sy2PTP1OD7iQ08KcSJPrLDlMI7yDJh
         0yEw==
X-Forwarded-Encrypted: i=1; AKwUvBxVB8sulJzjsf6Cm5iRmDxne72WHXjbyz1SFmONpgJZZC+PokLvn0J0C09B47INByc836ZNsdY/j4JSZomRL194GNI+@vger.kernel.org
X-Gm-Message-State: AFuF++nIsnwgUnnMP+3i78KJIRqLS6FkDJMf0rxsGeMOsvW2Ctq2PXn/
	wA8FrKa31XL8rfiNeiBopoJAQnw2rZJriIlQdQOOj87NDBUy5a6A1K4kZZPmJgReBFOBTcMazJm
	r8ZSMVarpPTuMz40e0G/WVLgvAvzSetb5Jpcj/HxA0vd1r26fWIPRepVd8LYocXB9lAqgTFpdvL
	G0
X-Gm-Gg: AYBFou0QHuYDFopnrE/EZJJ+DjTOxUIW9gFu0IpXOLIBedZFN9dfFJzpaxtBJb1VPHB
	YcDifrLDc1ae1ccvUv9N2Jehi5mARMJGBhl9caZPUiCKRKM1i+h4t34zCd0uRJA2YnUHlVhl/KD
	VncAWeln1j/xcLoDiV/qPW8pS69WHg4Q+UVnUA1oJUYigFX49QmKwO5vEEGyelG469UgAZgJEk7
	6jZXEvS2wEw4ueyyNC3gHt7eIt8jEdGYBgJqv6+vC1P6uGMaFt6qC0lLSseEdbdrGPjhp+OCqCM
	axcs4oXMijq6GrUnVP+c7bb2Bv9kL/tW+8E8BSwN28rs1a+bZdekelOBPYYa6WBLMjvv5DqEk84
	9hUb4C+VxsEyqtkbhO1cWeljDYjVBYSjmtsbxXrl9F8E3FkqlgJpHwYsDE0pQqGIQZiNZsykY0g
	nnGI/Ov9n5hf6qxDQ=
X-Received: by 2002:a05:620a:280e:b0:937:6d2e:d023 with SMTP id af79cd13be357-939c94a6e84mr596491785a.30.1788944844117;
        Wed, 09 Sep 2026 02:07:24 -0700 (PDT)
X-Received: by 2002:a05:620a:280e:b0:937:6d2e:d023 with SMTP id af79cd13be357-939c94a6e84mr596488085a.30.1788944843654;
        Wed, 09 Sep 2026 02:07:23 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa166sm722851466b.16.2026.09.09.02.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:07:22 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Sergey Lebedev <lsa.uz@pm.me>
Subject: [PATCH v2] Input: soc_button_array - fix MS Surface Pro 11 probe failure
Date: Wed,  9 Sep 2026 11:07:21 +0200
Message-ID: <20260909090721.20869-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfX5a+y1hjbdxiz
 uxKneoJOhdSWDgB+epVhzQDMxasa9PThEBgljqGvN1aUIac76p62q+fhKOtfzlZGARxTr50CbRq
 lFoswU0+70lX5g4jkpcYYVsM5ULo5rymCnb324djgtavr6fAezgLjiS33Ihdmor6d0nJfKgDU5c
 ugi2F5pmLj2IohKpm02QCkaQiiouj8nQzdCSqdqdMdIClLa/SWx/Mktd60H9xmEHnZcg68BH5KL
 dzC6lOmeIMR+frBQ1a73l6xmGm4PLbuEm67vyW9uz0njzSUvfP/lKJyIBnIRNH2KcEDx3ULGk+r
 lHpfraN4rSrBuXtK33lHQbsWHvFVebLTy5qY4+vBdBe9XN5AKWXH1zNrwFUs+4aRPOu3HNeZ0ji
 GOeeuYr+/xMqQB/n3dANY0aDtZAsabArxA2w1VCD44SzWtdaS4Vjz2QxucS1rjC4pb9HdpL7o+v
 qcTVtjGOFY+iLEUOY6g==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa121cc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=icoHmF83wIaDLuXB8S8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: rxJfCka8Dq-tVxV-ENyoIz4Cg7s-55Qc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfX425wfEojqOzQ
 XTCNrt/GZujclJZ9jutgMbl+6Ovr5EHujbs3Bld36Jyf2T0cXbw/YQL0KKMpDkhVznzgCo2LSk2
 kdvK57hyyvLdUJ24za1PiOS/OwN+H+M=
X-Proofpoint-GUID: rxJfCka8Dq-tVxV-ENyoIz4Cg7s-55Qc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090101

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
Changes in v2:
- Also check for irq == -EPROBE_DEFER (Shashiko)
- Drop #ifdef X86-ified soc_intel_is_byt_or_cht() helper,
  linux/platform_data/x86/soc.h already contains non x86 stubs (Shashiko)
---
 drivers/input/misc/soc_button_array.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index b8cad415c62c..f838b7d72e49 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -16,6 +16,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio_keys.h>
 #include <linux/gpio.h>
+#include <linux/platform_data/x86/soc.h>
 #include <linux/platform_device.h>
 
 static bool use_low_level_irq;
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

