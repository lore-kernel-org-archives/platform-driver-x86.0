Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3223A1E89
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503501; cv=none; b=fdnyprygXe7/kOU6eqpFnI1zhLgp1E43qOZDUD9eFoazCej6PZ8RXvGvVnIkkrpR3tfXgswGs/521fWq1DtcNzYwfrwm0+uo2c/KipS8oZkEEcR0+qAhkiJ3/DEs4UZOYlpfSyFudsmKx/p3Y65XLyNfxUlBw9K9ZzSPAS9JdWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503501; c=relaxed/simple;
	bh=nfUlgRiZuBNEE478C2TaHpdYARSv0jZSyoCpVTzZyeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQwCIisFG9BmnKYuj2DEP3KszsO67d/KIaAq/YIdT1mGzR4A//MfqChTO13EFFN94RDKJrzL9ZKNNQEpAEjFrEnxQIQpaVysj653CC3ZuaSmOryxfG8KuNoiWmLZlha2YDxRN/alVQCmJTjaqtBbqOLbBCnSkr0mnVTbSKUhYr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMOvHK4/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChEflrma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMOvHK4/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChEflrma"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BC4OL61106460
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=; b=FMOvHK4/0ofVaVTE
	J5bZOq7q3sE7VFS56VHHk8TPB3J1eqCL1+MMojdm63XbNb6wPhiDFCZDSpkyhg6t
	c6Y5a8Kzv1nO4NgSEldeZbiQWfIc/Uwq10a4AoFatfuHg9vCicQ9WI0IGFeAkiiY
	LZv6l+vFzAfCd6uJi/jao0lda7AS9dbX8RgfFFmDrgQzda0pNq/EhNkcivfj+Fg8
	zNsnTuoigbTrXJk5QI3KlNPr+SIl4gAMww+rE8DSUDif9CplsJ7kBoQGEwjDSQgV
	/WG4PRWGC7611I8qF4EDoxsup6NTUagzdtRhlJKkBFH5cDt0rZE2yQW+s3tQR53i
	n/7WkA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3esr83re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:44:59 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bd8cff196fso92713957b3.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 05:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503498; x=1779108298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=ChEflrmarreYSqMVgF/35qw1FvLa15QVxsakNVMNaE/Pq8WUEtrNNorU2aonZanJgV
         NR+AxQziAI03iXRymmVQZHkl8eorzlMrNrlfnMFgxY6SQBJkKrp4+h2xO3H4pzlSrgyZ
         KiaXigwbDMGFdrZ1nfBuPMSVc9wx94ivf6hNT2eOGG2/rYUSpjal3b1vkjSUxA+2UFaR
         whX4BKUSM3o5+a9+kODFu/wNruXfSMeQ7MUisKsWlbqSsXKFsspUhvCIZn9BMym1Rgeu
         UO6eB2UXF9SY9jUMaAG82UvMc9PdA9LyeOZIsKiOIgMKGLCUSIGs2E9CbNorFArBUKft
         kKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503498; x=1779108298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=ouN8y2iMc1YRJ5GwwAy77B/Z8HrPG6DdziwdOEqRm/UceSWgEYXFBJYmLcLp8SUtTg
         sY6yey+zLeMN+0cVB/P2PtGKPwnKfpC30ArondNx4UN+A3fsAevCmRh5Gy2Q2EszRCgb
         3JihJvWOmrkzz9JDxCKhjseVuoSGx49dQo2P5tI3qTH7/ewy/mDGhr9qqHwOH0Ln6F04
         wk6Q/vPX7TmxWVK6x3Vg/EO0qr0jDecO7qUaTEaojTbLyOv51vPswhRPXAbnFrRSudBu
         iU2EI5diqZCPgA3TqobucoubEIuWyQEQXJ0nFY4UEuxnnwWgOUXNf2dLDTmVPaOaK+YZ
         MJBw==
X-Forwarded-Encrypted: i=1; AFNElJ9cItokltqNf3m/AiQF3kcxvYzzIWRNWAAYP/5VBKfgV6GrAGVS1YsUvGe56dHfYCUgSmKshoF1QEqSRU6Xz/QwSuFB@vger.kernel.org
X-Gm-Message-State: AOJu0YzJDYniZTpY1kezfxad3JfrI/wxqSv4HbaA8xoB2K81VMO1iGma
	JM7NrHvaRwCC5vjKLIuDtRzsJkN63u8wFwWl8Bin+27PqAC8UI5gpwKsKphf5XOQIKpXnroCZ1O
	DsDOIGaJmQJo0/+hxnStbgWusQqsppNCryNE95d3H4d+D3FjzVc2vKoFaQwHKosRaAlGJZH6hnJ
	mK
X-Gm-Gg: Acq92OHZnRM9JnPIlVz6gCgNFfSmkwNb5vK7Bo/Sz2cPdIuN4aEGMMoEeKW7UOS0Hv9
	86blhXmP6u4YuOrEN+nwESQVVzNh2gwHMVC7X0E7STuPAGeJ8i6W3tckUXEZeEA+wcwMFYM2gTs
	AVxZrZY9psyevEkYOERD73kpQ/wVg4JasDgFldMBNn/lgHJiLbtVL2ieShSdf5h9n5nC6y5bjg9
	Q97xVXkquMietbSBNTAwHJwMPXLAJxHsjhWrvXdQ2wHtd9/xzlw76JHyYypy/4ZAesCDrcT6QQ9
	1BDWio3FWOTZDt39MGoUvgmtpcm+/L6KS7cRw+gsEJtkeWaeJbUHkfzo03Q4uL7QTgvUo0VFjPS
	EJ+l1k0CXUFmzG7l6YyymxDxTQzV1pAEfu2YaagdRZUjo7JPvHXK6ahXlaO1fLvtV/ZMxmQqd9E
	jGXA848BNpViMUqFNvaeXDGyqOZ9WDtN8I5A==
X-Received: by 2002:a05:690c:e72c:b0:7af:6075:4e0e with SMTP id 00721157ae682-7bfb9aa6ffemr113490887b3.35.1778503498471;
        Mon, 11 May 2026 05:44:58 -0700 (PDT)
X-Received: by 2002:a05:690c:e72c:b0:7af:6075:4e0e with SMTP id 00721157ae682-7bfb9aa6ffemr113490587b3.35.1778503498035;
        Mon, 11 May 2026 05:44:58 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:44:57 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:22 +0530
Subject: [PATCH v9 4/6] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-4-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=1504;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=eCeG46QNcGH6Tou/jfnrUot8SRLcYov2KTKbb+oU9wQ=;
 b=0HSed/WiHQ7zpOBEPBiNGpSOHNmKQpL8HxpMlCo5AcFF5FH8pI56nLwQiaNKM2qcHQojCDmWQ
 nbFejxSKJJ4DMq0hmsEQE4CU27HMKF3rw/cfUVEvN2qZFBJXr1QDO70
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: ABQIiK9Ha38EdoNsHmZhaRewCuQtqWGd
X-Proofpoint-ORIG-GUID: ABQIiK9Ha38EdoNsHmZhaRewCuQtqWGd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfX3+2SRcc3Dagd
 7MUCAoq2PQocNABTP+CVltcuibL33QHnJJ1MdxPRVSbtk4W3TzX6rR0mIX6WH44H+fXpqXgEAia
 T6aZl3xUmChN3QIxHXUW5603Gv0uv4lUmlb3wMpq05VifX99M8si66r0vY0Dx3ywUlngWgML7NP
 Nk+4BNbRMrghmcVYspOO3DYmtr5mFPBGSbukNQbmnaydJNK9ufPPdMLOTiPY7444zIuQ1bZfcxQ
 G+FjYNVtOLtXltHBQDFJUCpEB1YlqGZCORbae2R8V8H38M6dCuizktVWLqpJDBXOPtiTeRN+t4D
 kF93ftwGuBHy/kt14b0CxdV2xQRNGZeP2mCuTnqm78QqzZrLELdQ6bMgtRU07QuDvTZS0ENGcqO
 PMdBWz1K8V7gWAYEEnr9MXkR70Bw8f+xiC4KaBtdhW/in4oOSNGscJ4b9mUfhR9SyF7KHUZ/ohN
 LPHLjfFgEwqbs72m7Kg==
X-Authority-Analysis: v=2.4 cv=G40s1dk5 c=1 sm=1 tr=0 ts=6a01cf4b cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110141

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
index a9c5c523575e..9602d65c8b3d 100644
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
@@ -1523,6 +1533,12 @@ &tlmm {
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

