Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250A63FD14F
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724400; cv=none; b=qvzH74eed+A3nachcQosYnuI8P7eSnKLfrpvDxk6VZkFFVqcF1nrEc4w5XibKGlvHQbmwjDUhOnbvQFp7E7gcz+ctM2DKVijz4SrtFCbauRz2WWedqLXLY7iJbuE8ksgjm8WJJS7ZICFZsu7tb5778MRIPGp3Eo3PUvZFgcYPJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724400; c=relaxed/simple;
	bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8d1NYQI2KhQ386ZUOEyL5Y5kxdo914etWk74xFo0Bsyv22JHVsQ36828w1yqrS6S6npq437r1uU9P1PD1mxfJ9dSkf/LL9x2q0U6YK68l3ejcjaVxTK1jmLk5cAKvgDJS8HmU3L7QFaaD58LdNnFVf1Ch8k8c144R+jUEx3F98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e49x9dge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axtjubuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e49x9dge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axtjubuS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6raHA2077441
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 09:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=; b=e49x9dgevQ3cG9iG
	Lkj/IXiDOCjyRPpFLYPYID7dhrpbk+iSA5taIkgY6Mlrk5ptpQhi2PCxrS++NyCr
	j7AIY+DUsDYgCvBLNbDdOX89qLG32+hXZcZDllrLWGMryBTHjnyqgNouP+DK9q8G
	A5+RTn3AlDL3xbGZEV7v4QPykHh9MOpwOzfBeycwCg/AQFQup+OivOuL5T2kudbr
	SR1C8Lsz7aiqSc1djzkUXOrSMEcAJgQgapxM6Hv0zohRVnHKFEus6/p/zWUMd9GZ
	NinwucbDLPW44K0sEoc/+mwMWA/J+LaGL4B5oMe1ojSSmc6BGaRJI4/cAH5OwyD4
	gQ7JYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gkjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 09:13:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e59b0e0f4so25598085a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724397; x=1783329197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=axtjubuStZjSZpJkwo2W+iTHPGtdyf4LCTg2PvutgDeNBNZ1ePI71cJggMbL7mwYbp
         BVltE5hOwEP2FyVs0qqGXD358kL3dRXMoMLRJcX//MlExPTrOaWBpYrjUau+PlZCvr7V
         vqOw/fv8pUuHBKiYJHfscvjcOj3SvHXUC0jcv3n6XMda04agvsiXvUBuw5kiJGa58J2E
         Naz9fYQ03sxXkaI27S9yJwF8GayM05I82tZeMR7azRaepmnSXzj80Sbm8VyJO7wpTdd4
         ruKMXdLCGW5C5dk46ygyvmxZGVxdrIzktvrHHEJCOuEFBeIH/q/vL/PuM1OL1VbC1T7r
         fyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724397; x=1783329197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=HQ5xt4Vx56LMzLJQ1Q0zl7O4m4/kLvzGYimCt4FylSnvOmyTTJ8+rs6SoqCIo1+SpJ
         VHsoS2daryvmENyebKKsu0k5yHw4ZNR+t1tsQTs/Qbdpmr3IT78EtrABK1GOhxmAeB5J
         km7d0UGrhgiMlEludU9+e3BJTy01vXJ0b312EeHgTjCRT3DtVphrfKqSO6FmvgTGrKdO
         ML5dJbAGTeH9S8MiR8hFu0PfwPsYWVzijyJgB1Z3glA+3mMywjRUGh7uIeNVUW10Hzd1
         rS1aNsOyxbGx3d5UAShodG6IzyYgMoVj+Ha7sLwH79YJ2PDqq1khVolInRtkDgKFNooI
         0zBw==
X-Forwarded-Encrypted: i=1; AFNElJ/5d6u3wOP0Y+X7SEi/CtR8iq9N+GZjc60UYgViaXgSmUAeKl7JEiWnDuI81zt8AXRSBEjW4s9EbIjzBCxN0+DON9f2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnj8vOqupSynM6v0PEJkciy3k9Xogq89+SwnBycZXLJL/BG+WP
	jXCVsC87+2ylQM+TOBk8lXVK0gZO2UMkWPCQr+kU7inVzGbyg0RMsqKgQmoyp8dE1IV372zPYfm
	k6bR8Bv/8qIbBH2zwKrYQz2xfNZnrxI8bVdUFa91mjsiauLWrZy3dkb2poIUgPrex/OxAv/XsvH
	+A
X-Gm-Gg: AfdE7clMbJpE4zX+a5b7TwtIlVjAjTdI3+pFzLy00FTRD1+uCtCF/JnR6niuoC0dcB3
	ub0vYf3Ll3FS8dTVhenbitFtf22rJ6tgSlvyFv+p8XMx9t3AWP8eYlijPBwEg7+DDRlFY3uYZj5
	mLktnUklSiWWrEgyYuyw4fSjxLvbxpJk4V6E5vsTg4emDJpd7PCmCLozxtQsoGlKqSGLGYPpAch
	c8oCC7dRe1zsNhE1S86euhTlsfTHkU9rqTFrwFKHSqGb7d/t1/a2niR4xYtqkvMHsX8lAQ1B+AG
	cw0SbmOt1ehMIf6maX815MAVk7SUafwl0ZZDQeaHFRlY2CLrMLgkvx3ACik5gtBVEndBt4IgRHf
	Y2JdZ1ieHIiWGggmEeqMPkY64QdtzEDKJaLVQMyV+
X-Received: by 2002:a05:620a:2601:b0:915:fad5:90a5 with SMTP id af79cd13be357-9293e5df82cmr2398876885a.54.1782724397493;
        Mon, 29 Jun 2026 02:13:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2601:b0:915:fad5:90a5 with SMTP id af79cd13be357-9293e5df82cmr2398869885a.54.1782724397008;
        Mon, 29 Jun 2026 02:13:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:29 +0200
Subject: [PATCH v2 06/19] powerpc/powermac: use
 platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-6-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcMDhYRt4vSVXRm8SXMUBqWTN4fu9NU0CYjk
 RvsANfN67iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3DAAKCRAFnS7L/zaE
 w2NXD/9lRtVJg19v8VXQmSDry17OwgjxIADNStd90IU3BJymBaFn6uKZlSDyZNAN61Sv1vUpYbt
 gBiZxsoOwplweM8GutmD/BJ4zH6IEJMTok8pVeRaVr95QvimqKpAltLt7gILbF61IqVety3vnd1
 ij3JBKhpmDwxAakI65pteui/qIS4c+gzd4hTRcSMc6FP6wrIWgiA8PU4iQRn1O8jrO2fwKeIl0G
 g1X+9ujm60pPVnP2M0Hyk4UOS959i0RZuvrm5p6C6bsrc13KQmbqakL75sPmziGIKPRumLqWUCc
 ppKaIrOem114J+vdybIf2FJZbNg1RE4C+ZWaCjRdpimkp39y0fLLliI2lv7zGYEBvBnGgHglZ0H
 mE2dakd3ROg3q5D7/wKq7kzPGL9CuaHiniuR6jmAjxDDb/uLkQ2gSzR4LmrwyOrh2gMcRACavuO
 cAI/1JjBnuWS1rfCL3Av1cRlzGu7kl49WviXJV+CuP2Jt8roh9+0MyDDotAzxC6TP6k9C0iGw/Q
 HeTDr2r1C6sTpUzIoWxW0F2LlnG7VPkEfDmf/M09bcfa27HdRql+A54QzgbdrR3Y9gHdrDMQL9X
 Rdbqm4kG80vtQFKa8yhYV4YHJkNd+sPtTieuhhmR+XGDVwv15BymMtt4OytoRz6kns0PQy+M5Sm
 K9bZdIkgQUPvSxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX96mjRKzRSVlK
 7IRFiD9h3PX1bsnO1w3w2h9289OW9zn95+wE14nHG+KqXe2QiVHPxrsXMb0scZMLM84IE+LecIO
 ttNlzpTIo/PJbKOTv0UVSWyWXCFpcaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfXzAienWEZEhLC
 ruI7JZbJO/pXEFzwe92GF0ln/2rE0FKOPzu3P/oOS8iZ0oJJV5bgi/wGBPGXDvdCUgCBF169gQx
 6ts0lGcou2TtimN129m+4t4GAW7NwS/NSHMM2oiJEhb++kArHEGNmlVji38FefEuVlNBSECkoQ4
 /G2RxrHbL9EskcGAFWDWF0vsIdHKjS7wIlWAWQhHsFXGbaWaMg1Os//BAOpYOibQs3Wl0qYiXbl
 MYmoi1iDrZG9/saJbioHSfL/1t3RHICz44WYRlZd7I7jVbzCQvDTq1fsk/wI07ATWT9RJlIlFPg
 IHcs8uxtjpxF5fCvpqrIR7Ni8aqdiLJpnSvPdkhsCQUSrYxXXg/BW+7gUwD89L1JYgJsme2TTSl
 Yll7mO3w2ZBS2UbDBw1vJR5I71wflwlHzLoZ0RG8GPx47KaOgmxwKc93ccehCFrvA/L2zQ3s4NC
 kKa+jb51NuJrHrj5ULw==
X-Proofpoint-ORIG-GUID: S3QHhGfvI9K1FWl_iSTDV4jsGsGV9vBc
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42372e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: S3QHhGfvI9K1FWl_iSTDV4jsGsGV9vBc
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

