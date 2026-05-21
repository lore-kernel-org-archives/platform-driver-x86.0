Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABE73BB112
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352670; cv=none; b=GIH8O5CIuwbjvAeLC8jsHUXhAgkAifp6TRV1xfAD2LKI884Ac2IbI812mUpnl/a2QYkRZvelypiKAJ1WbnNaAyghS7hQkGvIIE7ugIh30c2XKDpzFmhKgb8Ljz+xfcdO/GMimq5faIlpss+sDqJsaKA9flZ4ABMACFjhuyRsoi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352670; c=relaxed/simple;
	bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOGReK5yoEAzKWXyFCm0onHgOupJr7YQNZodDtAv+4m2/T1cX4w/u1RrEU/ReTkhQoYy/WwzxQ97egdiXmJSjc8PQ/hjCje27TXQ8bYCAPdkKjuEHnxDtvdYUVCDrQRK7yv6FP5FmdORCdx8Z7syO07jfunFN9ebxUo5NKUKZ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRPupizu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAHnnt/8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRPupizu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAHnnt/8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6IdZT3680289
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=; b=oRPupizuUBUdYvM6
	C+TBRXWoDqeq04lMT5LC5gnHBmWkZFvkLch+YDhkUB+DEO4i2vSSrV1JDPGbqNxV
	t1PSwfXiomrcuy9ojdXSTxgyhkCwD2bRRvyT47pfH8NaYPZpchnAojnsmnyAb/+W
	A9AVuQTJ05rRYqB0I9TvxUhiIofA/ww3vBzm4nbKp/IcA2Do4b2fabK4nhXKfVMs
	d8YzfWA7c0utoGv21YBxZDEeqwtPVng42EXkDBjGOAQUrZBVJuMbbE24vFeuSdua
	kgqySIUA52PR235UhK2Ioc/mPp+u1RK/AYUpwZ3Do0aHFh3nUBh34KaaDeHFCVr4
	9JaSgA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j40yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:37:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ff0bef198so164811891cf.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352658; x=1779957458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=NAHnnt/82X2tENfrO9RS9rPgrDeHB4EmmlATrWY0fkgRAUDH/ZricgpQNyaExld1fX
         6qDt8Tzk9IRZTN8pBNZd5iFWu4xehHYzKRV5fPRvJKzp7wKdap3XScz7YMhCbmcxyfYt
         KJB34qGFLEg3SqzA3ywbH+Ybz8QPL8FqP7CJVE7jgHEmPv5t04VfgEXLEHtcsLjM72aw
         GRQE9LhgVSHlU/sPSLMgBg/+FQulK76gnHHPY08RWTQqXJX/ARidUnYuMI+J4kw23zFs
         K6R8Mkn7Dpo6iTz+MY3Q/l7+BtunIkUrhXVExnEYJkXnZf9MW9/mPVlqy60BgBVGu0mn
         UctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352658; x=1779957458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=b1mVrX8n0IRkAWq4CL8VDAcYKv7Yp0r97XBksQmN6Z+vVa+FioHofTxbCJ+oWevsS8
         tsKvU2FU+doGP3RDcCABtu6eqwZFrVWsDyn5mJ78b837qQMzuNtQUIRU+6wn1YHbsdFC
         EM3oTMMqyjgSunTjII/Wo5KSz1oE2HvneM0kokZwN/+9KdCAk9IAaaUKkmrig3PCLA4u
         Qd4ipel3EkAbBa7kUfFgqfQdkojDUP48i3z6X4jE5BWDbqBANyRht1XOFpjl1d1I8uH4
         4H7vFDA/ZdmtZbqHLYS6GsaJzqCUrpPHN4ZuJ2kGuIchjFkboPodEAsL4L7JWKHPhwXW
         UmWw==
X-Forwarded-Encrypted: i=1; AFNElJ9hLWpGKI9+EjPEx8NYaq+G9W0GglJMFIqK7bpg2S6Bgt6jsIoWmGZw0Yiv5MaICLLLaXnSGgnmgRmPqz01pYcubecO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1BMRFBpdmggol9dTOANYW4yox3n5sGss0qLFEQxFefGvtKeyf
	6ZSpt+WJx3wIfct/EUFseS4LPNe9OIs3xRDIWGaViXI1u5iWoy1dyyCBHh9BH7DlFtK/lyW5Lsf
	JnOZeIgy20HYol0Tb7RECvWdUL8v6xbpMnbBr3u5lIUF00b2NhJBdOm7WM8VTcCoqFFZyxBbpT7
	5F
X-Gm-Gg: Acq92OFeAoCD6QQrlmU5RKz2X7iOHEt6g0y3ysna50GT3T88SzGB97C4517u/5dC7Xh
	KFCT4MvI2ykVKPMGHtQdj+0ZrsRV0FLQ8eK0+uFypX8VFnZ3R9Y5eGRPUnlqgnVI52yl1iLq4ai
	ct+mkJW97DwW/2g1d1QaeJT2d+FYsX0i5n/dw1j/e60DKi2UKHc424YmToBWBcmeYLAxDa6SYv0
	JsbGzafISEaJKvJefClZuhha+p4R1C9L76LVkzMz1c0bWTu2CdxJYo7hB4vP+3cvy2+zRLxv77f
	D3GKOGsPw24SE59Tj/Jx1/6drQqdJvXAskhL/Z988JQ63NoS4GIPImy5LvfVc4oDQimsvy3fhxt
	TDSENZswVHY7elzGNJHmLqXBm/mU/nlQT5eVB21RlWSdIls27YGw=
X-Received: by 2002:a05:622a:8d17:b0:516:ccbd:b65d with SMTP id d75a77b69052e-516ccbdbce7mr3052281cf.11.1779352657801;
        Thu, 21 May 2026 01:37:37 -0700 (PDT)
X-Received: by 2002:a05:622a:8d17:b0:516:ccbd:b65d with SMTP id d75a77b69052e-516ccbdbce7mr3051531cf.11.1779352657364;
        Thu, 21 May 2026 01:37:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:33 +0200
Subject: [PATCH 10/23] powerpc/powermac: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-10-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQnEHwHhZxOm6og5sHfREaEn3pVgemHlMmE2
 Ln462RL3PWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EJwAKCRAFnS7L/zaE
 w4YED/4iHLiHraTFNT8eTjPSn8I3ryTe/Zd4SzuN5PRYsUIg9SHspeWL8niwLubp8yoGgz1/xIH
 mgqX+8k3YyBoruzZHfbfsU97pVxIqztUPt/J3U/ND/wGvVjm02llmMqEulqZ1EgJ6G+LANtbEYj
 rMysNF197bf7mmSPH2FODOw4W9Gsl4Yq3+ICTVsgy7RDyTu4l1hebLzYJhxDn4dgUR2z1NK9W4l
 qzPmq4YDWFZhPumNaH3HaXzTt9NFXDJPIvCe5d7YHkngQELPf6MIO4nn+c5XXG+DqsX+8iTJLP+
 dtYp3uSsjNalAli1B+mULXlt6uzCo8M59zrPN01SPKz8oFPkGUdu0+gTOlYw0tlfJKNfwExn7Ku
 XjHd1mfDAehACci7mB3Pi644ZwR6730q24pIE/1mY05HKUHjU1nOghP/dDxGjeFKkmE842FNzv2
 CZTZqE3yiWV3bEh7BKyGcskYnVOGJv0JhDMdj1CiXCtSPerZVQuw/tvG90ahwqlUQ6U3u8WR9zM
 0uJaaumx3vqqkKd8NOyBRhGEoPlNbxoAJyiegjzu17lKqTb+jCLA5EO98/dJq3EfI8lgxWpL9Bv
 MeOYehAQ7eitsh9mBaZwqpKU97dJTWkzP4HCc4KLZm1PFyGSdHodKBldbDujP9SsX5EnRFjTN4l
 fU+hp0jLFamhxfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ec452 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: z2WbijgIF-FcbyAq0yk4jvYtvvW3W_VU
X-Proofpoint-ORIG-GUID: z2WbijgIF-FcbyAq0yk4jvYtvvW3W_VU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX+E68NIPNXBzU
 5CZ3Ku8rWUB8dQ9aTPxKOIQ05w965SFd/qMFIacF8k9OhYBQ2k+VRNFZv0BkXm2bgk6e8lMZ/kb
 wSnPZex2ou5y0JRsYBnyh3m+t9JKTTMh4XbMWXcfGPUv02vv+yJ13klHByKaLP96ET42yDiD+a7
 OjH01hlEUzyaPrLzBUo/NUAWCTymgQgC0sDVlwibgeeJQLIE7od7Um2KhD9iWQflkIarVA5Cc4W
 pDr6JTCV++i06k1RU4xuZrGsE4pl+wDF+8TaZOuMLh/lZ0d7Y9tJB4inuddTkpMIY0GXXZY5vQW
 czc7Eqghw5t00EKDrpQAt7XgI1SQwYvkaXk3ulDszh942hB+nOb8BUrIzW3KTMw22A2Er416s0X
 YzeeTnbFqB9Ulqmv6KLVbZYzugLtKpbhCXCcZPhoqRpW0y9Z62C75dnsBvheiYqxV/PEP5pukaP
 IJvHih0Slpn9F2A531g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index 973f58771d9636605ed5d3e91b45008543b584d3..a175a32a222bab4cc7400f6ab6071f5630db2cb8 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1471,7 +1471,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 		if (bus->platform_dev == NULL)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
-		bus->platform_dev->dev.of_node = of_node_get(bus->busnode);
+		platform_device_set_of_node(bus->platform_dev, bus->busnode);
 		platform_device_add(bus->platform_dev);
 	}
 

-- 
2.47.3

