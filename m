Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD99B3FBB72
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 09:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724618; cv=none; b=pA6Atvhzym4LaDWReCOPhHWWOUf0TKPcNLWdx/1fwf+v5MYE0hlypY7GbuNHyh39+tkvqLX/j+BnH3gK37gyhYvrIzpk/f2GNmBONoPVdny6FtMBylRmCP1lRJ+uNhOhmYyFd9cebynvh1IpSfXX+bL7aDaSTMQqm1vnGJ9A24I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724618; c=relaxed/simple;
	bh=neIRO5hRQLm2wv0OPnF2GzaSKUDpqoiH3VJg5+27lIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vmk6emWoDT37CGMv9BrJJLwObjU2Taj9QXwQvRJjAOFhn+RwfSiuqNIPwsVubq0yzJcQQt3TZN3Z1Z0wCFPf87Vux14x/wnv2dej8Vi+MPXZbFVH2NDytfnHFfbENSJBw7znlFPxRHLcPEt9OSAANUhl3tLmq/WudB1UVaF89/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggN+jRcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPTlFCpt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggN+jRcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPTlFCpt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aT2x2368206
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 09:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q34XTfcl0Xz7H6NHGylvZ+
	cLajZSFs0L0NYtvFlwbYo=; b=ggN+jRcSuzLqTTabHt9XOoMoL6DxdNuGLRY5kk
	USGEzmiCBjPKmH4J6qYndfH2dwhbbhf62U+zWYAGXTqGI+mkzDzBtrwgpS5jd8F6
	VJBmlIur4v+QiSGW/PgwzqlY5lQ41yiTuWe/jv4TLMDzHHYw0QmZ5YtY5p9ZaEUK
	wR4A4kt3rUp6C4KGYwwmWia8hLYjIANJ0E/TgvaypBbad0ESs4gd5d6Dnw3fWk6r
	kJMqcQCG2DSyZ132bkcnYlb3jTUtLKYaaaxAZyvj+UBpPlE8ZzPAekCvaHCT7ySM
	hD+iNmgaCnkv68r5BPaX254yyInAkr3myX4R3o0BmT6/JfpA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgr5f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 09:16:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478a1ec69fso539946b3a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 02:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724615; x=1783329415; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q34XTfcl0Xz7H6NHGylvZ+cLajZSFs0L0NYtvFlwbYo=;
        b=kPTlFCpt+NeZUeuQcusu2tlI+rE8TcddhQEOfx5Zyjsjqut2It+QQQTm1AGmEi4N61
         3L/5Ch0dN8zUyZ8mMq8yFVvVjVyb9VUc9Lrgew4au0zkeAj3jSw2w3ZymTIzrWX+kbgY
         0AejBRC0IxNxKt+zyJhWjRmWu9C3U9ajGk/s2/WtxJp/szwNJEF1322aOZ3VEZS2XA/1
         V7GO+UBuIWQdS1/nIV+BKqom2jacNEXvLJr7ahQb7KCn57x1zCeA++Vp1DfUi7A8eA0u
         DUhPlgZ1BYQjp41gDyc122YqAlyHc0oyI5vnbjtI2JSmPUUan7UqZIgmioMhxgrcY4op
         25tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724615; x=1783329415;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q34XTfcl0Xz7H6NHGylvZ+cLajZSFs0L0NYtvFlwbYo=;
        b=pb/OmjYzsQHnLboIPuZm155QzD7+CfWrGBcXhXO1bVin95xnO2UwT+tKZTblPaQsD6
         7VyQA8UDtW/h15XaLNbzhVgZ1c/lDYWV7j+5D4fz160QEUb8hNQat021IdSsS/xTej0s
         QjJ6S4x/P6ehtBuFg34PuRfpMmYoaHSSkAGr7j6C9LIvCwZQx3MAYN1wZtRbvBbM39Hl
         P3BDK0645fADdYKKw+NDLDmbX6hp5L2ARWLJnpTmCupmzmPvQROXQ97G5AO61REappaf
         g/loAQxz9r2ZUOCZ+lzsw2ppCSYKuPIslcgCUyaiaCOCOIlYphveBg8CsN2FQpMk9sIb
         K50g==
X-Forwarded-Encrypted: i=1; AHgh+Rp00KsZm1rz3W4FPvAPrz0PV5N4psUTFPHRsEOadH9ovGQayREw9ZeAaMUGsCqb8iu37a7qgv8CmxtkfP3BVZx9UzDr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx48UeP3wU73W8vptx+DJ/T8sFGwm0xYz4IP5pgfNejFaDV86+i
	P/EFphN0qLV/JL0aS+GoEbzqg2CKWUagXr+N9Fy4uN24PgKyr53RLK2h9kSzG1FgmYxak9hQOE2
	DCT8h6EQ6JcKau1z1xRYZOpsxww4d0aB6/5uosrpioOrtwxMjHrZOSASihk+Z4RQCIwd78k5f4D
	Qi
X-Gm-Gg: AfdE7cn7XkbaxJzRRnPSI7TjJYVofmXKALgxXdOkWQEogk5o3MOvdtIC+k7Bc/THEmU
	yVLFI6vQBRN4KNpKe0hVMRP/f9HmX+Qtdu6PvHhTH8ggPUwBQbHU1dEqqzvroiveSw8BcVMmJ67
	DsmLiaYGYlU2ls7iMmYLj9OOmWswvlctz+K6s9dY9bNCYCtjMpvN8JlRPJWc3cN1kz3kRebKzC9
	bIRKIKbEWaunEk3Pr31TZWI8HxDv0rwkwZMXXPH5XvhQ3k730l/jeH3M3YTUfWeBNUfSSlq0Tom
	fho17oqy830BZJThMA3ZIUDdfROVSL2g/FUYSAdA/PZ/hp4OZ/kbFDkyHNPsDLQbc/ifW/PqXQU
	pVvMmlPe++PHrZVRchQnzuNUPRBoCK0jUhM7Jnxo+xK3CyLLJVLItIkESUEp0z7/sa8CVfj9C+8
	M+/vy6+Dxfc88r5jtj58idM/s=
X-Received: by 2002:a05:6a00:9086:b0:845:d274:bf92 with SMTP id d2e1a72fcca58-845d274e47emr8639781b3a.59.1782724614817;
        Mon, 29 Jun 2026 02:16:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:9086:b0:845:d274:bf92 with SMTP id d2e1a72fcca58-845d274e47emr8639750b3a.59.1782724614253;
        Mon, 29 Jun 2026 02:16:54 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fedaefsm12193848b3a.23.2026.06.29.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:16:53 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:46:19 +0530
Subject: [PATCH] platform: arm64: qcom-hamoa-ec: Register cooling devices
 with their name
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOI3QmoC/x2MWwqEMAwAryL5tlDrA92riBSJaQ1Iu6TLIoh3N
 /g5MDMXFBKmAp/qAqE/F85JoakrwH1NkQxvyuCsG+zgJhP49JjzwSn6TQMkLxS5/EgM4mrbMYT
 eYgd6+Aqp/t7n5b4fsbZiP20AAAA=
X-Change-ID: 20260629-fix_cooling_device_register-cca038ff50c4
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782724610; l=1851;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=neIRO5hRQLm2wv0OPnF2GzaSKUDpqoiH3VJg5+27lIk=;
 b=CWmg8IL+xaXqYXuKti+46W4GxCsK/DpvjK/4V6jRda4Vpx4SmWGNRJxnbGXHBlspGUw1NMfTb
 oDfs7a66KF2DdNOiw29N6i5Uv5qYXznXboXqbS299khbWmq+cH+0fZG
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: Bsm58np776FxN2_MNT0PLXQtAh-emZCZ
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a423807 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WxJZI26rGmMZWz_SfakA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX9v5AQu+ctSlr
 n2pK3RcQBxX7z5664yKJg+ehH+wQkNRwLIaHHCPoeWMxPqh23mn3cZlvd35dRJ1KsvFKKOnPJOU
 5ZmZtMvVrxuvQgbtWlbiPRXXrtPKV6E=
X-Proofpoint-GUID: Bsm58np776FxN2_MNT0PLXQtAh-emZCZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX4S00vQP6WEnQ
 UhNpME8qK6211Jnsh35uTxoTrhiuxJXFxl46JLic3mlxZzJT91p8WRxggodrllOeBWDZ3pVQq0Z
 xXEZSVc9Bcmao2xMXl5Pun2bDsVcpnuOrSW4p/c9WIpej1cHoMEO2/bULxgV0f7eWxHMZMtMLeK
 GPip64ELKB19KDfSIeoxHbW4Bid6Er2g1BNQL4yby3vU8xcpVt99lfS2WyXWpwSyqiK9XF6sBKm
 BiOfb96Yq0HlieY+unzTujUQXyb0iePvc15EzqQmqpnNYugNYxjY5jRAwuON+60qClJCr3IrrgJ
 reSjl5fnZuJdQ6VQBFrbrsMN+K0O/tFTXvieILCkrTl5BKx0d6Yzc/7ms1HJkgf8GyjMS3idEe8
 AQ28+RAYZT2cANnv+sqs6g/qQg7jov4BoNHxTCnbBrGIVDzQMr8weju99uP4qJMX59xsYlfJouJ
 PnuiZHQkhhhTdvm7q2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290074

Each fan is registered as a thermal cooling device using
devm_thermal_of_cooling_device_register(). When the thermal core gained
cooling device ID support, the helper's prototype changed: its second
argument became a 'u32 cdev_id' and its third a 'const char *type',
replacing the previous 'struct device_node *np'.

The resulting semantic conflict between the EC driver and the reworked
thermal helper was resolved while merging the drivers-x86 tree into
linux-next by passing NULL as the 'type' argument, dropping the per-fan
'name' string. As a result every fan is registered as a cooling device
with an empty name.

Pass 'name' as the 'type' argument so the cooling devices are registered
with their intended "qcom_ec_fan_<n>" names.

Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 45829f2786b7..12196d56b60e 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -391,7 +391,7 @@ static int qcom_ec_probe(struct i2c_client *client)
 		ec_cdev->fan_id = i + 1;
 		ec_cdev->parent_dev = dev;
 
-		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, NULL, ec_cdev,
+		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, name, ec_cdev,
 									&qcom_ec_thermal_ops);
 		if (IS_ERR(ec_cdev->cdev)) {
 			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),

---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260629-fix_cooling_device_register-cca038ff50c4

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

