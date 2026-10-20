Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506178;
	b=E0TsPsvxEQt8i+mGOzkPBE4wzcEGj6pkvGydZQIaHmbHXfBeNATm05wXmSIqp2zHTZRv
	 AQeRMlHUV0f0UnMLbYUJTJgQwYTp9X7LK+y0XMMJDj8p7yJznEOtIkw/GkJmvw8S1MAJO
	 +E1lPIlKq9pFCW9D118t6d8bhJLxMMT6eSM3ruzjzj0qfA6Fb40W5jEsy+CNiTLqqbrTX
	 17kBsH+Gu4eqMF6588t7XX9g/iItb4yi2eO8Iv/o/ywgcMNKASgcXnJex4xVY+vCIFAlA
	 ldDAES1Zz10qTACDqOVXrD8iu+DzlXRfV2+FWn1bZ3IKW3pPaT+biphxiZ4qeuYjm7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YRwYv0eC0+iPIM7Fh4ok36xGZCCJPDQEatB2sCGwZQI=;
	b=mWQ6ZBPPYbaUHolEFSds/uroOUp0wIIIsZuTSIjNL3pLyuOJrgQ6tc6CiOFt9lext0Rj
	 gUJ99mvsemiETVybdariUDshBZZ27w1EsY8yABIJm6ygdbclj9m+ZRQiAoVGebu6DAxo+
	 CLQv7sP0XkUWi9Gr1f84qwkPayfDXv649C8aSx78qyqHsw7yzEIoMmeAGMmUsK6AniFtz
	 zI6KeBTzfeL+A/Do1oChASBuAW4+bhzzl2uctc96JYM5uf440gUXpJs8CquaKrsEk4rUD
	 PshcJDAzlKhUGJr+Cy9exSvBj/FfA3xmQAzd2FOXT1d2EVhyR05tGE4eDXbCdYHo2Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U8T/6XgB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5N1xsL1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C8E60A2622
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13C8E60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U8T/6XgB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5N1xsL1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9vOW1731388
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YRwYv0eC0+i
	PIM7Fh4ok36xGZCCJPDQEatB2sCGwZQI=; b=U8T/6XgBZERzHClTz3nXp6rEjyy
	MNkbEdxki445QDqQ/6C+mbzHo9ohs+MNO1IZlMhhHQCiOuPK0cv5OB24/JFldDNq
	Xi09wQM8yWoJci0SyY+O1XxlPW6OgIOHYjGfY6qkNeLhmic6Yh7RvT3Oti19zf/0
	JylwSdUDD/efYBmHjSt6OU9/M6dRn0cav08XeNsAms4RqjhoIwXD6nqwNUsZURxg
	KHYjuW66OvUXdGa46VIQpjxVoIBsuBYDNmVR2/iCjrWyTByTE5qq5lQEiCwSOal+
	FwWuimmloCQemjX6VygQmYPfaEy3agOmpOivRlXVm0w7XmUHgPmAE7eWguA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2vrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5337f26ee19so54814701cf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 07:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506176; x=1793110976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRwYv0eC0+iPIM7Fh4ok36xGZCCJPDQEatB2sCGwZQI=;
        b=T5N1xsL1sNb775J1uuBHb/sMjE32iZxoBCrCwesibrwQGswCqUUSiAqOG21m9NXj+m
         0eGGYNfvW7yDlGXeIfRNWGebOZ+skYfk0qOIKiD0gm0dGlkpRcutz3mQT2A7RRMEQPfV
         Q+QVsPxvGnlRc+Sg9UfFhPxfj+gJFLYdaUQ1DAJSnflOF0tfFGOyDROChiKPBPaAWcuX
         CAFfLIQJ7cJmpGnnSMWXaaM6GlMq0Vje+DYZ+3sXCg9X0pimc5NWI7ScGIjE3rj8tI5k
         Hx43jA3GYR1j5ddHEHJ5wqey6uZviE6aFtjgpGNjZMKk931tYiQYJZBIAyvriasn/aF7
         XZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506176; x=1793110976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YRwYv0eC0+iPIM7Fh4ok36xGZCCJPDQEatB2sCGwZQI=;
        b=yj7S9y6U5Y2Dcd03uDZan1jzX2Rv3JSgXJ4pePH1aCA0B/+Y9fqpewxgWNvYqSi1Hn
         ItYxluyk6x2T41LrSXdXlyxGvvOJUV3mqiREwIyFN6lUFuhp/DnPqFMJReT99UDdWsKL
         D2ZZW995GVRx49UhWs0ow/wBC8PB93QTOO9ns3XEmpa4JQuIAFJdJcFWcY+CQnVf2mlF
         LlflgFo3/j1txoMz/PxMnms5ZzBgmO8vPOy2q2fDJv3xhR88w9/JnmF1EDJZe5Gz1vft
         WUk37b2P+UwRqgicSr/IeYSPv484S/iad2vB8vjcT7ubvcRHpCZr8zmGR/Fn4vp4f7ju
         G+gg==
X-Forwarded-Encrypted: i=1; AKwUvBz+8Nu2v6Upk5tlXXcxt49mWR3x6KqCSz+Y6p5NkO9qzh3seQWcCnWXywWo2MeW0+20U21ZHWfy19SUeueS0pGuhPsr@vger.kernel.org
X-Gm-Message-State: AFq9FYLb4dzpjt9PftLhkqkMQqQ1HDYMVsJ7TrJSct2h8ZSlQ3GtzGnQ
	LK0tMKv0oyZOjJU/hJikhdPqG80k/ADtJWWngZxWliUT5CKgWHh8QS5ZN1+h6nX7YdWRzbCYRki
	I2OsTmMx0wgYgif8A+8EPtMjfUfL0n3j1sh5JUa9GYhAddyIkmAb4tQiOrFob3pFmpIu5JMt7ym
	oH
X-Gm-Gg: AYBFou34Ma6Zv1/bVhn4vuOKHTgG8pKOZilMW0GBj8ug7Rw6odO2aFMsokRb/vMZ7Gg
	sfz8zhjR8eN6kviljQjaS0ck4spdz/P7Ae6ILpFGB9WWIg3MBwpecf4gwc6y/rttEFSjRYg8VXx
	craUHJboHfjF/p26H4QkB33+V+hNZRuDDMRfTpTWsvj7FamUuysGQGq3mUx5I/oOv+NR3+u9wyT
	Z1hkjQ4oxaYWpsO1cdYg6GtdmCrTeYmaNQ1BJApKyuXnT9y4JSLe06d4oqgkMjIOxTr5xhmR9jO
	1b1dX3L8fPijuxswc/DI6VH8ZvVmYyxjDCCQl1Vi4lStaSpByKGdgeKemn28+DR4B4aRygrIaJw
	mfTq6C9bbDWy1RkmHt5grBU+QtkMG/Byp+aWZDKI4uU6g4apeTNX0kkk+RNDEg+dCPWpGCpDC+L
	rDcg+SPtul++GWYWo=
X-Received: by 2002:a05:620a:6081:b0:93c:6738:c2c1 with SMTP id af79cd13be357-93f29b7348emr1815569085a.2.1792506176321;
        Tue, 20 Oct 2026 07:22:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6081:b0:93c:6738:c2c1 with SMTP id af79cd13be357-93f29b7348emr1815565985a.2.1792506175888;
        Tue, 20 Oct 2026 07:22:55 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm5185084a12.10.2026.10.20.07.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:54 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Alexander Patrakov <patrakov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 5/5] platform/x86: int3472: Properly map the AVDD GPIO type to a "avdd" regulator
Date: Tue, 20 Oct 2026 16:22:43 +0200
Message-ID: <20261020142243.25072-6-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-GUID: PwBlZ9j3MOBsHiMtqYy9nQP3XLlYhDDC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXzoNVwK4v+G2P
 lnmXc1bvw6hi3zhr2sA1YGutRG6uItJ2Q70Ywj/T6CiMbLBmO0M8lEln04wjiFiIUzT+80eMLWj
 FfElnhMs17HPklTJBXqyPutJekaqtls=
X-Proofpoint-ORIG-GUID: PwBlZ9j3MOBsHiMtqYy9nQP3XLlYhDDC
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad77941 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=QxxHkoVCA9QCKdrcC6kA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXyNUjrioLhbeU
 /raJ7CAmsSQx/aoDDVYfxtUtoDNM75DCRurGEZ9lhjppb3OsIHVz9ioz9M52HwL4AFU6vllBq03
 a0wgu/6P0KmnG+2pV0wB7LsRC7Jc+qMGTlXgYZMioSyo37/f0dctC4uJapO6hQKWhimDLS3k/6c
 Kc/UU13otRYvZ5iQiiR/k1YZavgnWzQec2qGzTOjUUOFvp/ukMkE9mc3rRI7dyBMR86/ck2jN5k
 FTANeSkCKvJWMM6RKnPxzEeWhLIIMpCdIiAnwr4Kxjx4eppBh9yrUzBmncQI7q47arzKJP3rpO2
 cXKjCxa+zTUrrwwyctJjvBAyK84iaCyFJa2+pg2JpZdpWGcRjm6ODeoXYB43TQp0noruFvTUxsS
 R8SfCdWINpbmwnb9MCGMu/w1sW2e3yJygFyc9qg9UnqQvmOBBUfOHCg3k9TVJ4a8uQeOMkg650S
 49n+7BTu+0BTtpTRgVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200057

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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
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

