Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CE933F385
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397913; cv=none; b=QNNkaOBGJkQTc2kotYqZev9p+j6fswoFKkLhY2p1KCgeThlneWu542roH7hmX8QqczyXmdpejWqFB738dsbKAg+C4xKHdjEUhS/dMB23DW5lYBQHCFyR5Boj6m0PcnBU4naO+JsCc45pSeLcZOLU2tDaHRG4aSdJIL11rL/tjHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397913; c=relaxed/simple;
	bh=ioU0R5DvWAxH3BbtVQW71w1R9pFivjF1xgNCOqTS+Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q2kLfzpiWZSa0sNWl87FZNRMwKUGafz4Xgvd3RJOashz6EciRkkgda90vpiK7T75Y9Jyi81Z7cssPAWBULRcYuAOuNU8a09sbCy6Da10RuAc1wdFR6JWIxmP+3ucBQdH5p0qlLXaygB0VFJJUkFx3IHUkaGT7rdagJNOG3vX4B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5RQfBbC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjYX2+Zh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5RQfBbC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjYX2+Zh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9TjHT1498959
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i9qisWVnXG0axSpKhRaWffp9loppOSeVL6k4KPV9VJM=; b=j5RQfBbCVBIxwVTi
	sC4swklYBDS5ka1kbFDUgR08DNZLssDAJ7s09tk1JIsimBPxJRzrtYRyd56P0qlK
	JArebeQIeTNPOYPxbpo/gIWxM/8NxXYKyHnngRW2+tj9H/gGlgIOb86aajkqqfvU
	pFWsjAZtPhGViS3n1O2+Al4Dwwb17s+RGvU+Eo89REIK+xUgkXCvTLMQkvUwXvrf
	DUaY8BIkCg5SviDM58/vbzCXPEd53kDcy0VvuHmB1cWWQ6GvAruVo42LhjHu8+69
	s2ciN7kk19wR5u8qdKxSo29l26uUuvJgmncnNVW7BXg4XTC4kEgg2v+vuj1iG6WN
	flW1EQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hg6vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35984ef203bso1952921a91.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 03:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397910; x=1774002710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9qisWVnXG0axSpKhRaWffp9loppOSeVL6k4KPV9VJM=;
        b=NjYX2+ZhznnIWa1g/Lv1yzIGqN+LHm6PEOx/wSg5BnHJRkaZdX4Y1M2NVYX35bKYXo
         EEOIA9IOYCmLf7vwwIeSMbllQFLC00c0Jw1S1kV3SfqQH40/FLYACmrsvDF4pNOgJ4xP
         ybcywr2phLeAWOIRvocw1DogqDgFzt8LlbXp/0MqxtIte68jDBzn+PV/TeKR01W59ud+
         r7hq50cdX86MebN0tiPOItYhLZ8weT7FgpR9q7Qv00sdeqrxsR0yorKNVfjGaJM6v2mn
         hXbfnfBstGudxzuDz1ZqCbBuFnoe4olGdtNqurMyvABp0UmpgZxOoyZmgd0RUuGWHrHx
         5ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397910; x=1774002710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i9qisWVnXG0axSpKhRaWffp9loppOSeVL6k4KPV9VJM=;
        b=RrfqXGG1oW0B3ePLCiQMKERvYfOddInOznDLFnDNistvlGgEnCCiofcXBFyL2HLO46
         20nWbzLh61jBMRbpf70wVM12XOjB8qxEZgawWmPSFLw+f+dbofFULGfEKb9fyDyMJcLT
         yqTxsxZN5mvwGNvIrswqu59pzYy6Ri78rIE4peAAzbBi6PSVsXgjwdZmmXCsBNqXJqzJ
         p88u85pKrV6ppYUG8oAXgxNI2YWULa8c7dWl7b8pPdZLk3RdDGCLnfpFuK78YKC4trtR
         8wFAQBXYa3myWbsXWBcQnh78kKOJUvXlJOiK8kr5oaMm+cGnBB0IsAn2B+wgYmtSE2Gd
         PfvA==
X-Forwarded-Encrypted: i=1; AJvYcCXfT643oH/fvS6r3l4eJypstVHvnRDj3t5VTQ5zVNjFvI/QgKxFcNu4GzMLoJrJI97FWv3ciT2TNl4NQbazYG33OiXw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyro0slGVoc8ViQCfs76l3cHs/m9pDqURyL9eEgN9dh93pxq+/
	Lj0PnRRinWE/YqMeN0fB9rNq5h96rohNzmougGy2700lttZObpQ+40r7X8M1zPnilYaTsdbAjDt
	uZWorIIA3eytE1cPKrK4YCTcWz+VDnyEmiJp1yXqEEbKKbS9GjuUI+b1x9bgl498fdq7o2tvji0
	xB
X-Gm-Gg: ATEYQzwGpqAAkxXdU/RH9YLV9KCEIE0W0djgR2f2QLB2S2kCA48duAbK/9tjv80gx+D
	uDnhVrK5ZPn1Ysif+8oWdxfPkEbWag3QdQa/oOuaNKOoY1Wv1z7gFZ6gO9pG8e7c5P0NFW5SSYc
	WOc2+nB+JCB7PSvV/GEgOQkPY8cCmsqgQq3A/ITkHUvHm3jCBOvQFFO3QpRgmeLDmjmOpLFzpDd
	hW5df7J8CNeO1de0UUVpCudw4cBjlWeBnmCbM89cSrR4zTpI0qllkdwRbgac5oIZ3wXjpHKQ/Ay
	eDbOs9pyap7bJGCyRQkKrdPc/p+1ivRTiopO0Yjb15wRqvI0bYc63gSy1PnAGDs0y/yW5XLE6j2
	DCpO46ey4ecmBbQHcg8yg70nHW/Mu5koAUz3b9qWxmjyrlWqfMeM8Gx9nVqVSdV963LZwTszRjU
	hGnb/ycgTrtl1iS5iA31jNCk7kl0OloPZPPg==
X-Received: by 2002:a17:90b:3e8c:b0:359:bb60:9b7e with SMTP id 98e67ed59e1d1-35a2200344dmr2521941a91.27.1773397909808;
        Fri, 13 Mar 2026 03:31:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8c:b0:359:bb60:9b7e with SMTP id 98e67ed59e1d1-35a2200344dmr2521907a91.27.1773397909300;
        Fri, 13 Mar 2026 03:31:49 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fc9454sm8604577a91.12.2026.03.13.03.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:31:48 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:59:54 +0530
Subject: [PATCH v4 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-v04-add-driver-for-ec-v4-4-ca9d0efd62aa@oss.qualcomm.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773397885; l=1323;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=MmynX+YUKCI48fsEMucxFayEj5jtotLLwXapIGwI67U=;
 b=Mp4Qx4HrGGfCTyYoK7rpV50UIVbEMWUtIiENNJVoqQI2UqgvOTMkzkgrIvvwypN/Nos6IzPY3
 pd+rOV/q41zAsRSClDmOmmE2FPbEgYlIbXWVVuE+oh3y5vk1q6EMWPY
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b3e796 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: mWvdfobwRlDbKF3Y4PXMB1Aa8x7QXFu1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX3CTO5K3hoCPR
 jciC+pGwMi4vE00Q+9TitCQeOfV9IvevdSBXeI0EtL2tAHCEKXadUmHqRlyAa/kImYEyMxZxQtk
 HlASDN5hT9BNhTguuCO10zUtoTbYxJLXzhE8Z7Hsq5fQiNu8IuYOi0RlSOCdw4gn/5/JZ4C4gBr
 7Zcybn37060zujxcOKG0R7fCmXZo55j9IAS5F532niZQxNIBCaRaDNyt3qWLrPUdHX4sNwxjOyl
 +F2PVMktUhXIEA5g0m7qtiVR7xn7bJH71eHeSxnfOoQ5k2oHvNLHRMiUekPQz90Qac9i4imQb9Q
 nIhYSOl7pAv/QBv3K+hvUJ4uGIoIJRKaQZKSsuSoy3oFi6nw6M6fw8Ac6Kpww2GoDQY1ZLDlljQ
 xVnTMuALuEe39PmoKsSgdy/9M6u3jNcGQ3mJSsOL/pGuxNeRKdzN9YGRZB+EtxGXa01KYQlX6+e
 Mx/EibOKYU7kt5e14Mw==
X-Proofpoint-GUID: mWvdfobwRlDbKF3Y4PXMB1Aa8x7QXFu1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index ded96fb43489..d523e7cea3ec 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1485,6 +1495,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

