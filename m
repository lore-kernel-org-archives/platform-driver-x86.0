Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D4C3644C9
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 06:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577437; cv=none; b=OQKyJQmqXimQU5EXjMqm/BObkrtXcur/+NM9+Jhq71niBKck4Y2AyHQ3+tYRh8jB814HET3VrepGXxbbsqhWanyQSTND8+iPz0Wyjne0NFBgGjh6O9D9pnrFGwStolDhx1NBwK284EWutRm4AzXTk2rDKN/EUHjLL+j1Ge6rjcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577437; c=relaxed/simple;
	bh=ZvfNexsX5Cqvdxj3Vy+av/oLoVCsdXqDXsj3RFn10Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=klLGTtsk8RENp9K8FtlOHmtWg/T1QmIA30n6nBvEiQ3k4IRX/pQqTN4cy9ptwgs0Xxdmc+RtXz7lldsQA5ChJNjYtCOzNZlOzzMZdjadE6tAX5aTmPfHyzg/GNz6Kr+DQkhE+79F/ErhHFVeb4P7bPKbznPVX6aUC9uHBGGQP6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7cHNXQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoD1CEHc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7cHNXQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoD1CEHc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1BMKQ3456088
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 06:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	srxqTQBK+zwaPAssFeQan2gCNJo8bXf94ZcM17bxUUI=; b=L7cHNXQ7Q9IWNiV1
	ilYRl4Uu9LZikD+17pCDTLbQTHLQh91/pY3GC7BiQhxcl6JeideClX+PzeSBfwGf
	i48hlsITceQhBjhhrzFVyT4FKwysbNKbMwOGDLbTI8fD6ifx4DlMclwGNZ5tdF1L
	EH5wcHZ+biQwG/rgXTdofSiUse1junirQvtnj4d+ZBM0cVNReKVYb3ECrVlqXhGk
	E7aqWKQCfZLylkCe0+NCfwazbPTMHk4tY4/rK0LAi35W2gIpyiht1bl9Q9XEm1qF
	SrVeRl1SL/xJDak4QXjYTfaRrU7tAmaoxWy4xvUJSQyVauGD9tfroxl+qd7aXK4f
	zcO5Og==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq0u53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 06:37:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so44672275ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Sep 2026 23:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790577434; x=1791182234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srxqTQBK+zwaPAssFeQan2gCNJo8bXf94ZcM17bxUUI=;
        b=NoD1CEHcAqSVCu5vXX0mmczBgRpxyQyc4FG1EUkGEQhWepU3LLawMEFtofotaZk8zp
         PTRu27r2oZxvbS7s5vDi6EJ4aDmgFDn5Awvw7bXxgKGZUJGEKrZRdAltbcJJiEb0ihZE
         aVaRCwqJSNzqQ24FXUmS8agow5Nd3NU+pp2SU8ULJvajedevQYBEmpVOsW4+g1OA56Hw
         fsyV1Yc4UZUMgfZPTDhqq/bVJz3Se5viY4z82KCAwGXAi9ODSaZ4xvHOt5IP/rTEFpAa
         +hgQq4DxtMndkr00Fxtls9qpdPCHZ//OfeQYmovD0tDF6iXBHA0f5y6j5935lo5ufXU6
         O6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577434; x=1791182234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srxqTQBK+zwaPAssFeQan2gCNJo8bXf94ZcM17bxUUI=;
        b=2d/WSoiLJ21X4MCkn/kI7KpT/15mTywoIHxKZtuQqOQKhbwSv+2zDKcw7IKDOEeZxs
         L3K1V+yVwx6LtIJdfS9ohU9tvPzzQ8wJxfnLBXyE2wtteuMWh2BuJXPo7nQ4Rqoeyqbn
         s/p7b7xZmbEMl0hLC8TviQInhIBcQnOcOMc/RyAhd7OX7IY4chtZ/L1/B919yywsJk0h
         efS71Fi/iTS9j1lmvSasoA8aSq4S2Fl0eF3o8FN30Kys9qrDpA4/bmqDrwNBbgyWuzRt
         vzqkcLA6drVa4GGcT5FAzlq6I+H0Gd9U4Gojb2TBEotCOhadEcQrza5piVJ8nHy746kC
         5Ufw==
X-Forwarded-Encrypted: i=1; AKwUvBwl6nyMJaanDCmk6TyqfmlbSyZh2I5IIqBFnxOH/mjC2Q70VuCNc4Z4DBJngo/n5Hu5f7EYdKSsrMBI9B2kLLWZ3Cd5@vger.kernel.org
X-Gm-Message-State: AFq9FYL2YNR95OJ+6WBhHc3e+Og7Z+UX0hB/RVq0s/1c3lWugEAU8a2a
	Qg1I0b+SX/Y6qG2pUrSftxzAZWptSRYCAytezfSPmlz2eqeivfaKErUwMdCnl7ks1Th+0PCPB+4
	/nJRNdbSd6CZDKA42mjk+OrCvY6hDOcsbAqXuulnSAneqFeFUt3ekTOY4uKcvEc8lQDzMUkJ0k8
	QP
X-Gm-Gg: AYBFou3dOz5f7ZLgDUHD/blOd5Nhy1IPLITNO2FFwwyxT4rbulcj5kz9WD4rDOXvVWi
	JunasSkUKZVnpxYbZ3tpZuP2WbnV6uF5EtQFDkeHA0q9gSCtjq7b9IWP8A0Bi5xOZUPMa2R4fjI
	raqetrfxL98boYAUC0fkEVf3eSWCGcPvE7d3tdbNnKLLLe/+XqQIKoYRCk3+xoWO4z677vHtA/9
	o0U5gW50bRAjcWaruY8+MLF3XRRjiQ1PKHLeoSuoWHPW7gZfmdQ4pHTiOSa75SAgXEQ7Gpmcj7T
	g6IJ2Gh5UN4nx0Z80eMsH/YhHnmNUHF/nCgYyLEubSmhmhEwlyGz/Dd4+mP0KUBRm0bPspPLk11
	v0aXGifMuTLcHy7v8oLaabaPoDMcxcuQgfLXGMEXLu3LSA2wd3mApjj107SIrDdAVnbo6Phdbx3
	mIqPZJ+QNDBxXo
X-Received: by 2002:a17:903:2408:b0:2dd:c100:9435 with SMTP id d9443c01a7336-2df94c1bc19mr59631465ad.51.1790577433612;
        Sun, 27 Sep 2026 23:37:13 -0700 (PDT)
X-Received: by 2002:a17:903:2408:b0:2dd:c100:9435 with SMTP id d9443c01a7336-2df94c1bc19mr59631215ad.51.1790577433128;
        Sun, 27 Sep 2026 23:37:13 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91468978sm35292685ad.79.2026.09.27.23.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:37:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:06:37 +0530
Subject: [PATCH 1/3] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add thermal sensors
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-ec_thermistor_support-v1-1-d9c1bae4cd0d@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
In-Reply-To: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790577422; l=1724;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=ZvfNexsX5Cqvdxj3Vy+av/oLoVCsdXqDXsj3RFn10Js=;
 b=xYdcz72tTsuUB3zatuTTdzn67OLfEme3Jki9qjGNkar6ms/AjKcIxzouA9EK7DAaDTvEJ5yn4
 fiuZyuUnW5YBN3oqH+2lkHvtJ/H7DmlHVAtwLQ+IvpWyYZ9pV5kMgj3
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: thXioj_GDE7E_9k2J0veZWnVlHf6KnpJ
X-Proofpoint-GUID: thXioj_GDE7E_9k2J0veZWnVlHf6KnpJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX1oUFeehelwAM
 tjgQH8n4G9FjXdC0MJ8CUzvnQkPzrdsiyJVEjOs9c+riXAevofDPePRBBubH6daw1pibRfD48FU
 yvyGVZ3EBtJCLMhcmuxrU6gftn2KEqE=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba0b1a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=E-ebOgB6S8F8S_20uhkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX41TcDmWZLVYz
 +a25UvafM8GhFaZFQhScjkPVUfM04z7o6wjW1edkLpnqwqjiA+jesy4weXuhN4DQw1vv/TTosLa
 z4QOAB0Y0CfWyY5pSiPxwFh8rkkN+J1V6wI/jpI5vw4fGG5CoGbxzQS8LmyYWipqv2+87jjCFJY
 A423hOA3cYLJEmYrixuTuyD2zzZ4Llfk5g7ccSbrm+HKdmoZINQSWmmRf/jjz5yWNQEUmtV8J+O
 5hnS4yWbfFSU4IFFFsVKMh3r+L+NdpxCfheMqQg/u/8cH36+cXWskPypuHddGwWSgOvTGecegB1
 ZNxY/cIEHg+spzFJJVRR/WwE0KrFX7C0nMAVnnFiw2paUnamchjIhFsPsxJeugGqmpcnb3HY05x
 E54ZLQiGGyORqV61rUfW35YIiQyc/iwu0BabQFn6gmx2U4MdX//V6mEl4x0r3ELxNI/L6mJ3+xP
 qddYOhKuqMZU2En39iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280026

Describe the Hamoa embedded controller as a thermal-sensor provider for
firmware-reported thermistors. The populated channels are discovered from
the EC firmware capability response.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..13de6bed8129 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -15,6 +15,9 @@ description:
   EC running on different MCU chips. The EC handles things like fan control,
   temperature sensors, access to EC internal state changes.
 
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -32,6 +35,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#thermal-sensor-cells":
+    description:
+      The EC exposes up to 7 onboard thermistors (indices 0-6). Which
+      indices are physically populated on a given board is discovered at
+      runtime from EC firmware capabilities; a board may reference any index
+      0-6.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -49,6 +60,7 @@ examples:
         embedded-controller@76 {
             compatible = "qcom,hamoa-crd-ec";
             reg = <0x76>;
+            #thermal-sensor-cells = <1>;
 
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
         };

-- 
2.34.1

