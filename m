Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E2A3D1CB3
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438892; cv=none; b=sQVRXLEtR4kdD0sLfc1ka/NmdHKRym77XUp26fJsoUztc5jEM3O+jNum9CkypH6YcsdJe5MBhKUxI5PjGUKOTheR6+PqhUrTWejeyNWQNyRF4xmgh8ydptN2BCfn6bkmi5zHs6Iz6Q7hZy6SlXjfQ7zbAu6s5RrLy+cki2uaK4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438892; c=relaxed/simple;
	bh=CNOKzvn5kD0XReRJC8TJ6vbCACz1YNhnjP6JoO3Pr4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hgmql/kgnUHcVbCzrPAOc4v1GIR/QXjDU/LGO8UlfJiQsfYx+xnWMQO0uSQ0s3bg++4BqHUhQbJ7EQkBhv3nokUtrY+sPfKnFk4STKzf0I7M1HW9C4gxvFYRmoC65ikrEMjgzZGbLfqYsfsG4LjCJp+f0wBQHSFDE26kWqBUdWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUDs3rDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwC148n/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUDs3rDP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwC148n/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGX3x051741
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=; b=XUDs3rDP44Txpfc4
	vwM8bOgWr0JPHLz5sky4txQXdX6a6lwyjSpLafrF0yv8SLOQ4WiAK5+phi/PCiX3
	WRu+XpWIrCWWCsow2mX/WS4WQYAZGHPj/Jv5/hx48fiNrjH+a9jFnTSXplYO4WbW
	jT2DHuFmWNbu869EPCSOR3EQBoDiNilYNaMCdOV5GSSIcl2082AvVfiK6bt1gLlp
	Zs1mJCj38KMYRBl2mgk2+CXpBUTV2OJVc3wOhzEzG7x/KJvdfRjridFbOdsFPNRG
	/THN3hwRBRCfX/RD9rpfFrUavGiEx55trAOrBTX6Ag20VXvXvrlobZl2E5WUnj9b
	Fzc6AQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp1v2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b056b2f0cfso32236485ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 04:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438890; x=1775043690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=;
        b=EwC148n/7YiSpLocL9DFCFSdW+L+UIoWjFzu7IgcSsfFSh++Ez9lIp3OzNmVlK8Zyb
         ujaroL8JhFvd8ZRrYBPkS40N9dGjx1s62dFFu76Tp7aCSwf8tJQEihkrYK7WmnS0pOdZ
         gb3MZ4B1MvVs+zd7ckjf4hvXAlpNhWvnQhvvhcIhuNx+pe9216eQdyHgiYl2SrLbuFKK
         ymEi8Y4tMKh4hWMUbK1UGM9gDv4wgQxTr/HFVKGG5L+5h2mKhZoKR2nSjqkwajbRWM90
         3eqAgzabNdI//16rcZ0SXtU7D3dPHhuiN91ha0hd9vKHHeWYjZg1cwz3d+LSAi3tFDYJ
         IaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438890; x=1775043690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=;
        b=madP1bwTcjUKArs1Wq6wiAbIBo+OvCuLX+9pAE8Whsr1N/5qFWbFC8aw+sl+WUQ2+H
         EHXlF1N0UttTkOLTsGRT4M7yfSpebFvUETKaoruXXh8YnieIthGsrZ3P3wwcizZoJFBV
         K9/GGxaEIFE+sHD93Df1PP4AMUcBLDCzuMQ2+0sgh9/eVlhs1B1oWc+JDWoYmGYnadu6
         4TL5BBk7F4ATOPR6z5r4QbVXSAKvix6rJeeR4dlAzHhNtQ7J2lzlbILCnsSDcXKS3Mia
         LvLbRssSKLvOKRrtdbFJE5FhnXELCrScHJ9QdPz8RDPPfTB60FkBDtvCJ2BsKeI0CSST
         YMHw==
X-Forwarded-Encrypted: i=1; AJvYcCWNeCXfvctl6iUm4KptSdX4PFCdSiJ0L/bGwxjLONiPnUAAyxIh6INArliys90Puo+qQRMhl0CDEYHw1DcSDP0duWew@vger.kernel.org
X-Gm-Message-State: AOJu0Yysfv0lNthUKMLlGT6Ie4W1biKDjEcDL5bKGoTtSMQos4x7kgne
	mDGxofCFMt7V9zJmGQIiqLQE4doZfrQL1mDGH41O7jy/mqZeZzh7WgO3UcFJKtQZumf9b6shMbj
	1rnR40lbNT4X4y4ic0SwzCJpiP7eWBf2h19SdQ9Ay4ZFReIjg4rUVtXQ68f2E06gA2zHnnUoYMM
	oh
X-Gm-Gg: ATEYQzy6QA70n92EdbXpb7ffFMQQQ9xR3WMLLMsAsW7EOyFxcptSX0ZazPn8BJK9TDl
	mNP3Zl/POOm9/l+ut7vRa5/qStwa9wivANux93tw2HM2wXr4i6kqaDHsn+t+IVwoyJhHz0Jk7eD
	8wj8tUgzMRXV9cr2OLJaC3ImrwoVHZ+J5uFlyp5hfukpJ/0Q5wBirn+OHiFsC1y8Aq6EXTUCvJy
	+Gd0Z1+40VLz+7vynP9W5bnex13OwEtOFJnwafrntrRKXkB0+fp/+G4Ce4IAOtbHtN5En6RUchw
	vcp5N9/iJjql+Y7glKgJYybb7AXAxLmsgxuj03QVu4hBhHcii/JqrvG664Tdf7M9SvzW/6GVPFR
	kSvYtvOoGJFkwSVgTpJ+Bs7aahXbOU5q8RVhd3+LrdMtaCKJ0V26qhzm4HxZAI3M0+iV3/UuJo6
	7tsm91fxmexMexR5Z0zeSasLM5aj7Nw7m14w==
X-Received: by 2002:a17:902:db01:b0:2b0:6a22:5159 with SMTP id d9443c01a7336-2b0b0989b2fmr36294915ad.1.1774438889864;
        Wed, 25 Mar 2026 04:41:29 -0700 (PDT)
X-Received: by 2002:a17:902:db01:b0:2b0:6a22:5159 with SMTP id d9443c01a7336-2b0b0989b2fmr36294555ad.1.1774438889345;
        Wed, 25 Mar 2026 04:41:29 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm38152015ad.16.2026.03.25.04.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:28 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:09:54 +0530
Subject: [PATCH v6 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-add-driver-for-ec-v6-4-a8e888d09f0f@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
In-Reply-To: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438862; l=1504;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=pXx3AWCW1rDtKny9OmTAQa5CSZy7BRS7KSH0ZkBzrwE=;
 b=CRxsbAgVHTVXROBEtardS/vqoi+9PCeiFI3Gvfw1jGrDpki5TSiFwziEf23VnZdNopzVrl2xG
 mKp6t92goKbCHGiSpapZ1+PNi6eXPBHK3uitfTiPpOVdc1LbbJ+xMDX
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: JMP3UrvackQAeEOlanEIBCKeS6k-ZFEi
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3c9ea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: JMP3UrvackQAeEOlanEIBCKeS6k-ZFEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfX/2yOu/fdL43u
 ETetfzme2vKP6EEqSVHoy1lmckt6qLawBT+5/kbk49nTaQSM9yr9GT7az7Zz2QTsKKyoJc3MArf
 2V6X+l1sPXcoCnCsq3bPjnjzx1FCKpZ6dw1s+s2u9zKS7FsrGsqJH1BDMoQi5oI9qKXPGMtknrx
 3SQkyAy7z9D/gJtRQ2zzmR6wFVJRXlNzZWjJMY6r2BjFOKurCxtZtBKSmHtkj84orXq7HACq0dX
 JByok97PL7foXplIb05vILnom31hs8hPwm3ccds8KKtdXR+BX+iPi+yZhuWrWFWoPRShCoVSnyc
 fUFYXu4gwNE25MC9/58MTAkJ9EatUNhKYYD09tglifPsAarvMIggYHdK/3hj6xXXlmUBBcI0ahU
 SzdmyWzspXnnLog6d7cOzXT+aPTQ9XRwH9klNOGaY5hTsTCMhrRnO3rEasAR5DT8Igvu0wPei+w
 OOwv4cp2mfdFj3LIfuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250083

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 485dcd946757..1184169f49cc 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1074,6 +1074,16 @@ eusb6_repeater: redriver@4f {
 
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
@@ -1517,6 +1527,12 @@ &tlmm {
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

