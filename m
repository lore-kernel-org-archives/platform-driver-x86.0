Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB233C3C07
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352697; cv=none; b=R6SKPj0D5apWj9pIKYaOVz4nZDb5gB0KTwXbxEu3CNqkNhrDtHf9lVcmWJq8thYKNxsoThf7zfDeHcplypjV+Itm06kQhkNw2N9uGwMPzelVqy/7dWGyOI1utJUL09uTkaPsUKSfdS34K78OFGJpQiuEzngXXL/hzqhIRrEF9FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352697; c=relaxed/simple;
	bh=q0BBrKwJivsx1U3q4//iRRQAZdK4Wb2RemSiR718+X0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nwear8RGUq9YCwYavf6nJOSWlOV6FRkR6QcFDIzLGMpc7VJ2Jy83USWZQeogZfc2U3y/NeCc4ae3yjSe9bdOC9fLLUTyxy5uK5oDuOzRt5WWy6sp2yd9a3fno2SpiRE2jnIisuOCmdvAaMWCx4z+KKPsK35Hv1krSRa8ZAvEsi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaiPPQxC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMGKlDLJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaiPPQxC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMGKlDLJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L62Qq3119071
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3mrpSj7hYO1R358xz6evwVlbQEFwGLz67PRgSKvrF+g=; b=NaiPPQxCTakR9xCQ
	HAOnGWPoSIKRz2a7X0Blbt4DOnPGLT7hgydJRIRPTgOaArMCtJc5nh/f3Q5eL/J4
	tI9pdv0cWJrKRHJPhw8L+NEYjuTpoShPhmDAdtXAfE03RwRURDbROZmSrb0pRogX
	VbKnBSGXer8Hd+VZiTc6auJ2BrxihPdrwhSkImE2aqQzkdT/DXL753GnnCLG2QV2
	xwQ2gNKcpvN4eLDQpn42k9LQ8aujLUEil3XZz9hAfWs7c7nINyrRU3FsJ/ftxhkQ
	phQjh+3NoTmquC3mhpKSUHCxxRQcu994GDZ82TYWHEimad4JRMnRY7kIlz1O6Hk7
	7ef01A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8c1gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:38:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514551d5f2aso231337291cf.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352684; x=1779957484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mrpSj7hYO1R358xz6evwVlbQEFwGLz67PRgSKvrF+g=;
        b=XMGKlDLJL7TutusidGc0maGwLfVC6JyZl6+alL3nIGcPTmiV1m8Q0DoAX+cbQ8Xa+g
         vZ/YHz4F5me25gRGO68dOM9NGhhlwBGzPKdiNlK845LgfGAuzbBfbQCuxCKKbZPXBfRx
         epFqwsFNErXY2cnQO7pQY6k9NDovebZHt45CCzWveuPFc2icoET0dguz4c3LQ3EbKgnR
         CUmygbuyBo3tmUl58ZP9SL7BD0EpI67y/NB+ASE3w7msjrFi7O3QeGB3WXaybOeRws11
         NHytksehEOM8p4kk/k6rg5jZQGlC7LFspXbPzeTejldri4/w3sbCzbjZVKJVyse6X2TL
         VBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352684; x=1779957484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3mrpSj7hYO1R358xz6evwVlbQEFwGLz67PRgSKvrF+g=;
        b=W4O/FAprnXfoEc5L7dvcUdXXS2wWAkTRRshd+bCzmeZkPQ65Xf2tuh5ktoUb7pnvAs
         JHwL2MsI+Ah6m1iTZVZfzYFt8P0f7YXv7E+bQ/o4QIswaTi62sglLCF67ImSzNHyX1ZK
         0esg2Xeckoc+83rIC6KuyQ90C1l8LPxGq19Bdiu08eYroFti5E6RqfqVEfq9j4E4GROe
         L6TOfoFBTxtFXbCd5lyIyA0DV8RZMz5HCCZI4zbKBqJTiLDykmJHGCkuQIXI08wIefa8
         E55+byFsw0Pq3SxIohdCHP9vRTFUdtbeZMqjGbweqFK/llx2Gh9MWnnoqmBVzptOZiAP
         d/cQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9m0PBkgQaGl4FHfZFpWP5pXdMVgCim33Cr34NJOjuOEY59rFsEgHERFqeGwhioTBmQvC/0krtF24n0ngtQcPc5M+a@vger.kernel.org
X-Gm-Message-State: AOJu0YzPOOtJdSbLT3a33DN+HcF6DnvBc6ZeTgJDjVfwNcaABsq+ZJms
	JpcPCP4WNkNzV9fciBvHlpcNcQidmtovRSV8i8OlM2RJ/+IrvOEMtnEqWUCs996pTUBgmubCOIa
	b14KvfbQ9Ay8ZKQVtCfwsubPke/uXL1Vy2ptLgd0DaPJIKYi/YnsfMoAXKvM8vOidtF9BYG0vqw
	rQ
X-Gm-Gg: Acq92OH2L3IzKQpHuMrpYGlrJPDAdZRCD5uJ7g9yoZ6h5gU34uKy3+hV/1JpXb/QPgn
	5TFDD7wgaLMWI7aeUCWx2KiE3S0qNf37/YTktN1c0juNq1Gi1gfD/irejsoobiIgzInyHvIYWgt
	vPzo4jBnz3lcAU+A8bHHAX/XzSUIk0Nt5Icq3KrhMA24e/ZDQlEiS8W1rGP3T3LKEwVZ/aH1meV
	qS8dtQLFB1ru0BVbKYEuHI6UWdeuIkPUwz7hje8rhslOYlhC4JMRir+oINVPtj4yfX6y5+p8HqP
	2y+JlNuLisWzwI48y/SDAEx0CTEnnGxz5Iyz/MeRtLaNECSNJ3/ilPyd+cLjqffMTUHSYqbYEmj
	WWg55bm1djn3k20x5QV5PvTxoBnCmkQmIF+YM5rZqYZjpP9y9Rtw=
X-Received: by 2002:a05:622a:9:b0:50e:60b8:347e with SMTP id d75a77b69052e-516c56016abmr24588821cf.59.1779352683726;
        Thu, 21 May 2026 01:38:03 -0700 (PDT)
X-Received: by 2002:a05:622a:9:b0:50e:60b8:347e with SMTP id d75a77b69052e-516c56016abmr24588411cf.59.1779352683250;
        Thu, 21 May 2026 01:38:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:38:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:42 +0200
Subject: [PATCH 19/23] platform/surface: gpe: use
 platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-19-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=890;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q0BBrKwJivsx1U3q4//iRRQAZdK4Wb2RemSiR718+X0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQt0KUa/w8xmB04PUNyuE7AG92a7NaZhaUnP
 mJj39PwRpOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7ELQAKCRAFnS7L/zaE
 w6UQD/4rfUM5cMoT5JyGjLafVOFuEAMOc90j4vuFKnQJU0FBGgfkBhxUzbYOhzKrncHxTg6Zkte
 mhYpnojOkwe7oqrccWEFE+o7dOAFDjcWoL0XCGF45N65gk3++u0Yx4L1yZeRX+1/MxFwbvOLw7t
 FwKBQcWM/DFEoUfCz+aXTRNszmzJ4Zj6xYPDsAKrn0IwrPangabw6sMw6uzkisg8PvVArLUnLkg
 4vNKnff31zVgEoVGWoY8esEvtxLgp0RsbEXIiotSTubVLEI21pr4/gKwWV38zgpd6yPPqnTpJoy
 dmxTUwCFDJkpoT3Idq+TVNWcIyn02UHZrRwsDlCVYmVQ51wfypaNz5tTOpMvEgeDcVkvxUIAZ2i
 yULGhW95dkUtEPV0VFi5jg3X1A2b+Vbvd+ViGB+7pn4K8qQVHVRni4OB4DXw0rYFTrU9L6XirXh
 QsuSw7uOuSVF+n2JUZdDkeR4qL6AyLuLXOzO5yrdhEijTNjDhRzOMN0tyEe4gt6eOhkNE8jVJWn
 o61cKiG3FXHChYk9gR+qsT7eb5EbBOtXwgO1X13FwAGQ7Z1KvzlA4EmmqMEwLsauLqOHl/azGVS
 V1aYTijMW3c/SYhdXa4jacKaO5oqpdlh8hIAaLEQB5V98OZNElzsuX53XKqZWBrYixFuWj8HYas
 UtG1L4x3L3xmxqQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: p63r0bUsJy2rKW-JWNKxs1hJqRWuZtvf
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ec46c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PjYnKYjuuXkzxcC25kYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXwK5TP7Cd0bvY
 aqUTm37TEwmwQc7B3xRfT0JvSTmvdpm5ZsQNgwQAuTeWlnDQkq2NKEDqtQ6YfXHuuAZMzwGvY1T
 MoU2nLAM2kfFaxZnMFOw/gYM33JxVMBCqIu187XTefkL3Ak9XBSm/bbaUIV5ElF8zPYQ+3K58d9
 EwfKbOycapACkwMzwWONjn3ib+Ikvu6etCd69UUMBy30Gc6/hZNj175ZW0+s1B/jPtsjnJ+gMQ3
 g8MVXYzcKmaiTIe6Igru6Ls4HKZ550sJ3Fw1bsOl1M1nqfgIhGnuOdqfXxJig6EhUWrGEGbJKbr
 C3CYOwzEEEW1bvsk4pInc4nKmzXr92uGUzs3WQDMTxnSszfRAFg94/miSLIlgD5t6QAqd/38jLk
 GwaY6hSBBzOiElYaR/ZI9wYxdqekbbuVYyLensAFNGIJrcnjJKJyOE/D5iGuCtk29AAiXTl3CuX
 hSarT2HAS98EB6vRW9g==
X-Proofpoint-GUID: p63r0bUsJy2rKW-JWNKxs1hJqRWuZtvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the firmware node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index b359413903b13c4f8e8b284ef7ae6f6db3f47d72..40896a8544b0a4da4261ea881b1eaed62d93b32b 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -317,7 +317,7 @@ static int __init surface_gpe_init(void)
 		goto err_alloc;
 	}
 
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 
 	status = platform_device_add(pdev);
 	if (status)

-- 
2.47.3

