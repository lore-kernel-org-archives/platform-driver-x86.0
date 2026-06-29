Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD9401A16
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 09:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724410; cv=none; b=TlOFf2WF69jSCL3Ajip1GGiEEXeALYNSDrV1o5P9yUnWKL1unXVMRi/Hs2qvTK8BAd7o2qTmTDhMOy+5whLVZ2wWu/v7IjuGipbnT5XklVw81QBUn0ii8FPruojZ7BxxMXLqAaCrtiFckcMT/75ttxoLermVrc92BgTgZYpIwCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724410; c=relaxed/simple;
	bh=6OXt4TN+oyzNJeMucuDRbXfo0ddns7kCLrcZYoYbhVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CjNSt5SUTOJuQ8EZCR72N8KQtg/UvgrsKSsOwk8vYeJfr3wx6zmEiKWJE75M1EIUkdshjFg+4IPBShCE+LFCX5yCbk9NXp5NygxTKFkRx02OfFmyCC0T/6FQz0n+keKIQ5XGQXHtUKCQMQm09MoncF7nz+hdRxUXlQGZKKzAw3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxATTOPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AW8KWzPj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxATTOPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AW8KWzPj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6qwUC2076275
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 09:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXAOBdXd+1ffOftB4RMKqDkV2t2QAsqWzgaXmcfa9Sc=; b=IxATTOPDsNWfM1w5
	9Lm2bZKmIqww2ual7Bo/WyUgK8HyaoF2qRAFIIopreJj2AvB/0rKOsvctFyIzuAW
	9JgB9/LsEBbIHOzfl+qNj5Q4p/TQObb/sILpwFHUfFDmeWKzRtQaMeCxrullAV9v
	RCAxZix9ZCKbdU/Zo5xq3OS6SQHSMXAb7Kq7xRAfzwNcskEBWXWtwsGxKF3OJHWZ
	wkGCy7pdqhNt/zo3AeqZeknkyQ0XliC3BX/ne5a9fH9EmaBoCLSIY6MUqqCS/XQs
	pLLcqWrmMpggVrZcksC0P/pR9TxyRlxaYj2xxnXRYVHQrrSwEKT5u3tTFnw/3s9u
	WmCNnA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gkma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 09:13:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91ed0e140c5so377177185a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 02:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724406; x=1783329206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXAOBdXd+1ffOftB4RMKqDkV2t2QAsqWzgaXmcfa9Sc=;
        b=AW8KWzPjLyougxBbyJTJBTno2YrnYib+n//2GDCE1cf6bG8Wimovyp9e6kem3SeVQk
         mkKeIP6rAs+uZMpZRjNhfw+HUBrdH3P9+7Y01LmV6lDJwQgcX9ve5e9SmP/BjhvSw4cY
         qK/FAnts7YlM4b1bMmUAN4PDndwUPNrlumUHcVGcfoMpac7PRxcsrXsErRMt3w6i9NRp
         xw+Pzlf2YjdmRA1Ki6mPD1jItx9zMsruY3hS3K5Fbga7KBOalNjWyy2+ouIeFiX/dBQO
         Vuq8sqRnV4saIkwJ/bQxHuOKsKT5qdbKf1NwhzPAK71XMf5pH5p41PCwArDitzGV9uPp
         1Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724406; x=1783329206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RXAOBdXd+1ffOftB4RMKqDkV2t2QAsqWzgaXmcfa9Sc=;
        b=Pzaf7GXvIIEml7ycEbwcNIseL6EXac6pBm+Adb0op+R3CKtbZ/DGDCux+Q9rypUocA
         UllXd6TBBW7JZDyDxWpeW9f5JgDeuIdKzXDhmPPdFRvNyukF1JFbYk9IrZ7o0Zt6Vt7n
         +uuAicMnVq0FI4OcpwwSa+36AxizZvsyYX4THShPwLpN/FUDTJv8woBZxFaJytZ8Qnan
         5OphOlT8sIWBavb2eGESREtEvY31386xPJIwLu/KYKCGGqbXIc0xXSvv303fJcF7JKsN
         lT+jpNpgCdUWhLv2AfwWC0FiJ/NMQ9jagTUzlc5f/JUfvv0WnO4DO9pYCPPVH9Yx6Cb+
         nEWA==
X-Forwarded-Encrypted: i=1; AFNElJ9+qvtrp5kNjK6xe4j9Wan7Ld9dGdk/gHPcFRb8a6s+epNuYJ5O+3nVTFbB2z28pHA5kIZ0xFTvoBmxqy9KghP2qZBX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4VLsQ4GCH2zvDSTPDL3CmSdz1pmzA9S4lBpbJWw55HfWDzorS
	obASqF8QvxzDRGnd+Zu5By+DlXmD/AqLlUcAAXQvDSWLPejMfZtvrCJjMBp6LhgS6uteVfh7y+W
	haydrfxqWv16XSlGgN1WFDTdGpUw5Ypo1LWoAeEiSPhCMJKyi3q63Hm2pKpcP1OLBJeoenlF7jb
	el
X-Gm-Gg: AfdE7ckG69I7CEhPPqeWJqVN0L3osrpvcwJXOGKSf3i2Na09cqBFOWeyZ319HAmmuVW
	mdAAA7wx0GYfO7MiDdKDOSQ1fcbOfaFmuqg+2c685VBHy99kHCK/4M0eT1FpS7vacTxSef30ds1
	du3L0+GOPtnEO4bPfYIRA0jnVrqYsDF1eM5t1VVekPI7RMGj9zQJdR4Itf+2ikPo3dMmUv2bjuF
	u3dUx2hpvJcUsyOeUPQhYSRZAYFcKVjswbCTjJ86xIAIeyGmcb1eU9K+HJ8diDXT+vLuGxRPZUD
	ktQNsYGQ+MQK4KVxjjl7b13ECVW5zAvbe5MMLuEj+NGjC3mmeXI5X08SJNAyk9H5rPWRoGKCYaW
	zhEhJ44KAhhpyHVronJzT5cjRnvVwFZc4EMUwc8Og
X-Received: by 2002:a05:620a:2611:b0:92e:5554:a80e with SMTP id af79cd13be357-92e5554ade6mr210124085a.39.1782724406609;
        Mon, 29 Jun 2026 02:13:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2611:b0:92e:5554:a80e with SMTP id af79cd13be357-92e5554ade6mr210119985a.39.1782724406150;
        Mon, 29 Jun 2026 02:13:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:32 +0200
Subject: [PATCH v2 09/19] net: bcmgenet: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-9-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6OXt4TN+oyzNJeMucuDRbXfo0ddns7kCLrcZYoYbhVE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcPi8u6RDiDExgcO0jHLU6ko4GFAYWUMb1Ut
 WtM6/fX5P6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3DwAKCRAFnS7L/zaE
 w8RYD/46lV+0Hzns8J26Syo44iocOUu05qY2fPdPuC8prnE4zfS92GVnMhoqtkvlPY7sGH4KNn2
 Ibwj6Wg321rdUn2dZZp+d/zO13w+cxd32X+8z1xhJxQz1rivungGh1GEp1C5cIj2eRVIaov7cHQ
 ARah2+b1gMOmlOdtTcfyxsW5CRYQ0K7CC05tKmKkXOWKyi2BALmIDUCOc2podn/5LvSK9U8Ck3t
 E9yxSgLb9H78kRhhHSpbziUPZrrIjXQG9mAlBfePXv7ljvsmx/5Bjv/iUxHVCr53QEgzZdgeWrM
 TO6EOWGZGNiUNEUOD311a6wk2XDVzjQSCKiWxUw3xWaOu23XEQzRxKL5HcAVNzLKSFgEAqMGYQF
 1i+FFtc1SkiUv8YwoBDU351b54WTSo/ucPjrfje0V1mwfBZtcXOptbgCUCpGVXdq4YrWfrJthpE
 KiRDcixBoTXo7SKLrwrdWCwY3KaAl++WrP2zbz2WQIgtBc2o8fhnGclCRFQyH7syB0WoVe9UnGp
 EGMD49EykyK4KeeIj+XL8GllWKEK/O2hHpu6vRE8GgU6foQhj0vXB/4ROIlnFsoFmIm6sWqxh1P
 TIaPvgSRlrbXNW9J6k3tMiQKv6DOZeCtH31ELMaXpJZlXaw1Ks+u1Gh35Qb/Hay8l3nvD+fpVaq
 rNfTpzNjv7R/6Aw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX3dRsIGaeW4Ce
 ZIQAdGwgrHUxWT73sz1sMBk88mHbPl0tCeq87ppSwloTIsjJlYluC/nVDCBrAEp7FlNMhVWQ2mt
 /dYf+yYIwVdj0dxdXM3oLv9Ybr4snYY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5qUO/w2CCIQS
 6SdzA8Fuw0pX2n3I07FpccMpa05iIUUjGEf4COEqd3IGYDtUMHUARxd/N3bdiQz55XXberuYF8e
 1W5PJfYuC9tgm+N+s2YQSEdl0L2DM//ZojgZrNd1QpwwORB8ghIFSDqly9i8p3iv8ASfnDa47Ue
 eaE277iGgXaG8esENzppG3mUi9Fm6QRvq1xJQGnfA8LvwAoAIeu+DCsuuHVSxP04d3kAz8twTR/
 hxDFQQhvd86xzHnvLYLLGB18QJmDaX5Cj1ElCBXYR/VSs8r/xWuO/tq1bRp14h4AG0dIUp5yoDJ
 0QbBYZYKgztSvXH54r0jCXwegfDGbzt3tzp5oeeQLukDnEXJBbsTk+jDTpsVjHWEooWFD0LD4ys
 27oT2Pzln0afyNq+PjXlIh+D7STf1UtfTXF/F6KJW9UkRVu8KrkRhXNhk60XrEDeuIPKuWbyCB8
 BRwnai71hDyCVZNCZzA==
X-Proofpoint-ORIG-GUID: jqg60curFsatJnzlAw4HYIkmZudI3m5N
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a423737 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_l4veLwUkFW-k-pZneUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jqg60curFsatJnzlAw4HYIkmZudI3m5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/broadcom/genet/bcmmii.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index a4e0d5a682687533a1b034ccf56cdb363d6b7786..451b23a039cebb777f356f64924838230052dc45 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -490,10 +490,14 @@ static int bcmgenet_mii_register(struct bcmgenet_priv *priv)
 	/* Retain this platform_device pointer for later cleanup */
 	priv->mii_pdev = ppdev;
 	ppdev->dev.parent = &pdev->dev;
-	if (dn)
-		ppdev->dev.of_node = bcmgenet_mii_of_find_mdio(priv);
-	else
+
+	if (dn) {
+		struct device_node *np __free(device_node) = bcmgenet_mii_of_find_mdio(priv);
+
+		platform_device_set_of_node(ppdev, np);
+	} else {
 		ppd.phy_mask = ~0;
+	}
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3

